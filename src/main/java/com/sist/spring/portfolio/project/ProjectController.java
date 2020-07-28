package com.sist.spring.portfolio.project;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.google.gson.Gson;
import com.sist.spring.cmn.FileVO;
import com.sist.spring.cmn.MessageVO;
import com.sist.spring.cmn.SearchVO;
import com.sist.spring.cmn.StringUtil;
import com.sist.spring.portfolio.comment.CommentService;
import com.sist.spring.portfolio.license.LicenseService;
import com.sist.spring.portfolio.license.LicenseVO;
import com.sist.spring.portfolio.member.MemberService;
import com.sist.spring.portfolio.member.MemberVO;
import com.sist.spring.portfolio.member.file.FileMemberService;
import com.sist.spring.portfolio.member.file.FileMemberVO;
import com.sist.spring.portfolio.skill.SkillService;
import com.sist.spring.portfolio.skill.SkillVO;

@Controller
public class ProjectController {    
   
   private final Logger LOG = LoggerFactory.getLogger(this.getClass());
   //Window 경로
   //private final String UPLOAD_FILE="C:\\Users\\sist\\git\\springPro\\springPro\\src\\main\\webapp\\resources\\video";   
   
   //노트북
   //private final String UPLOAD_FILE="C:\\Users\\82104\\git\\springPro\\springPro\\src\\main\\webapp\\resources\\video";
   
   //Linux 경로
   private final String UPLOAD_FILE="/var/lib/tomcat9/webapps/springPro/resources/video";
 
   
   public ProjectController() {   
   }
   
   
   @Autowired
   ProjectService pjtService;
   
   @Autowired
   PjtFileService pjtFileService;
   
   
	@Autowired
	MemberService memberService;
	
	@Autowired
	FileMemberService fmService;
	
	@Autowired
	SkillService skillService;
	
	@Autowired
	LicenseService licService;
	
	@Autowired
	CommentService commentService;
	
   
   @RequestMapping(value="/upload.spring",method=RequestMethod.POST)
   public ModelAndView doUpload(MultipartHttpServletRequest mReg, ModelAndView model) throws IllegalStateException, IOException {
	   HttpSession session= mReg.getSession();
	   MemberVO sessionVO=(MemberVO)session.getAttribute("member");
		
	   LOG.debug("doUpload 확인");
         ProjectVO inVO=new ProjectVO();
      //RootDir생성
         List<PjtFileVO> fileList =new ArrayList<PjtFileVO>();
         List<ProjectVO> pjtList=new ArrayList<ProjectVO>();
            File fileRootDir =new File(this.UPLOAD_FILE);
            if(fileRootDir.isDirectory() ==false) {
               boolean flag = fileRootDir.mkdirs();
               LOG.debug("=flag="+flag);
            }
            
            String datePath = this.UPLOAD_FILE;
            PjtFileVO dbInVO=new PjtFileVO();
            
            //fileRead
            Iterator<String> files =mReg.getFileNames();
            while(files.hasNext()) {
               FileVO  fileVO=new FileVO();
               String upFileNm = files.next();
               LOG.debug("=upFileNm="+upFileNm);
               
               MultipartFile mFile = mReg.getFile(upFileNm);
               String orgFileName = mFile.getOriginalFilename();
               //File 입력이 안된 경우 
               if(null == orgFileName || "".equals(orgFileName) )continue;
               
               LOG.debug("=^^^^^^=");
               fileVO.setOrgFileNm(orgFileName);//원본파일명
               fileVO.setFileSize(mFile.getSize());//파일사이즈
               
               //저장파일명: yyyyMMddHHmmss
               String saveFileName = StringUtil.getDate("yyyyMMddHHmmss")+"_"+StringUtil.getUUID();
               LOG.debug("saveFileName="+saveFileName);
               
               String ext = "";
               //확장자:.
               if(orgFileName.indexOf(".")>-1) {
                  ext = orgFileName.substring(orgFileName.indexOf(".")+1);
               }
               saveFileName+="."+ext;
               //Rename
               File renameFile=new File(datePath,saveFileName);
               
               
               fileVO.setSaveFileNm(renameFile.getAbsolutePath());
               fileVO.setExt(ext);
               dbInVO.setExt(ext);
               dbInVO.setDivFile(1);//1이면 동영상 2이면 사진
               dbInVO.setFileSize(mFile.getSize());
               dbInVO.setOrgNm(orgFileName);
               dbInVO.setSavePNm(saveFileName);
               
//               list.add(fileVO);
               mFile.transferTo(new File(renameFile.getAbsolutePath()));
            }
            
            int hiddenCnt=Integer.parseInt(mReg.getParameter("hiddenCnt"));
                  
            for(int i=1; i<=hiddenCnt; i++) {
               
            dbInVO.setMemberId(sessionVO.getMemberId());
            inVO.setMemberId(sessionVO.getMemberId());
            dbInVO.setGitAddress(mReg.getParameter("gitAddress"+i+""));
            inVO.setPjtName(mReg.getParameter("pjtName"+i+""));
            inVO.setPjtInfo(mReg.getParameter("pjtInfo"+i+""));
            inVO.setPjtStart(mReg.getParameter("pjtStart"+i+""));
            inVO.setPjtEnd(mReg.getParameter("pjtEnd"+i+""));
            inVO.setGitAddress(mReg.getParameter("gitAddress"+i+""));
            
            int flag=pjtFileService.doInsert(dbInVO);
            int flag2=pjtService.doInsert(inVO);
            
            LOG.debug("=====================================");
            LOG.debug("File DB flag"+flag);
            LOG.debug("Project DB flag"+flag2);
            LOG.debug("File Name: "+dbInVO.toString());
            LOG.debug("Project Info: "+inVO.toString());
            LOG.debug("=====================================");
            }
            
            model.addObject("videoFile",dbInVO);
            model.addObject("projectDb",inVO);
            model.setViewName("portfolio/SignUp/projectSignUp");// /file/file.jsp
            return model;
         }   
   
   
   @RequestMapping(value="/do_retrieve.spring"
               ,method=RequestMethod.GET
               ,produces ="application/json; charset=UTF-8")
   public String doRetrieve(HttpServletRequest req, ProjectVO search, Model model) {
      
      LOG.debug("==========================");
      LOG.debug("==ProjectService/doRetrieve");
      LOG.debug("==========================");
      
      search.setMemberId("iod1125");
      
      List<ProjectVO> list=(List<ProjectVO>)pjtService.doRetrieve(search);
      
      
      LOG.debug("==================================");
      LOG.debug("scrapping Method");
      LOG.debug("==================================");
      StringBuilder out=new StringBuilder();
        List<String> companyList=new ArrayList<String>();
      String url = "http://www.jobkorea.co.kr/Search/?stext=웹개발";    //크롤링할 url지정
        Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
 
    try {
 
            doc = Jsoup.connect(url).get();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        }
    
        //select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
        //                               ==>원하는 값들이 들어있는 덩어리를 가져온다
        Elements element = doc.select("div.post-list-info"); 
      
 
        LOG.debug("============================================================");
 
        //Iterator을 사용하여 하나씩 값 가져오기
        //덩어리안에서 필요한부분만 선택하여 가져올 수 있다.
        Iterator<Element> ie1 = element.select("a.title").iterator();
        
        
        while (ie1.hasNext()) {
 
            LOG.debug(ie1.next().text());
            out.append(ie1.next().text()+",");
            companyList.add(ie1.next().text());
        }
        model.addAttribute("companyList",companyList);
        model.addAttribute("pjtList", list);
      

      return "portfolio/index";
   }
   
   @RequestMapping(value="/recommend.spring", method=RequestMethod.GET
                     ,produces ="application/json; charset=UTF-8")
   public String scrappingMethod(HttpServletRequest req,Model model) {
      LOG.debug("==================================");
      LOG.debug("scrapping Method");
      LOG.debug("==================================");
         StringBuilder out=new StringBuilder();
        List<String> companyList=new ArrayList<String>();
      String url = "http://www.jobkorea.co.kr/Search/?stext=웹개발";    //크롤링할 url지정
        Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
 
    try {
 
            doc = Jsoup.connect(url).get();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        }
    
        //select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
        //                               ==>원하는 값들이 들어있는 덩어리를 가져온다
        Elements element = doc.select("div.post-list-info"); 
      
 
        LOG.debug("============================================================");
 
        //Iterator을 사용하여 하나씩 값 가져오기
        //덩어리안에서 필요한부분만 선택하여 가져올 수 있다.
        Iterator<Element> ie1 = element.select("a.title").iterator();
        
        
        while (ie1.hasNext()) {
 
            LOG.debug(ie1.next().text());
            out.append(ie1.next().text()+",");
            companyList.add(ie1.next().text());
        }
        model.addAttribute("companyList",companyList);
 
        LOG.debug("============================================================");
 
      return "portfolio/recommendJob/recommendJob";
   }

	   @RequestMapping(value = "project/do_update.spring",method = RequestMethod.POST
				,produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String doUpdate(ProjectVO project) {
			LOG.debug("1===================");
			LOG.debug("1=project="+project);
			LOG.debug("1===================");
	
			int  flag = pjtService.doUpdate(project);
			LOG.debug("1.2===================");
			LOG.debug("1.2=flag="+flag); 
			LOG.debug("1.2===================");
	
			//메시지 처리
			MessageVO message=new MessageVO();
	
			message.setMsgId(flag+"");
			//성공
			if(flag ==1) {
				message.setMsgMsg(project.getPjtName()+"의 Project가 수정 되었습니다.");
			//실패	
			}else {
				message.setMsgMsg(project.getPjtName()+"Project의 등록 실패.");			
			}		
	
			//JSON
			Gson gson=new Gson();
			String json = gson.toJson(message);
	
			LOG.debug("1.3===================");
			LOG.debug("1.3=json="+json); 
			LOG.debug("1.3===================");		
	
			return json;
	
		}
	   
	   @RequestMapping(value = "project/do_select_one.spring",method = RequestMethod.GET
				,produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String doSelectOne(ProjectVO project) {
			LOG.debug("1===================");
			LOG.debug("1=project="+project);
			LOG.debug("1===================");
			
			ProjectVO outVO = (ProjectVO) pjtService.doSelectOne(project);
			LOG.debug("1.2===================");
			LOG.debug("1.2=outVO="+outVO);
			LOG.debug("1.2===================");
			
			Gson gson = new Gson();
			String json = gson.toJson(outVO);
			
			LOG.debug("1.3===================");
			LOG.debug("1.3=json="+json);
			LOG.debug("1.3===================");
			
			return json;
		}
	   
	   @RequestMapping(value = "project/do_delete.spring",method = RequestMethod.POST
				,produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String doDelete(ProjectVO project) {
			LOG.debug("1===================");
			LOG.debug("1=project="+project);
			LOG.debug("1===================");
			
			int flag = 0;
			flag = pjtService.doDelete(project);
			
			MessageVO message = new MessageVO();
			message.setMsgId(String.valueOf(flag));
			
			LOG.debug("1.2===================");
			LOG.debug("1.2=flag="+flag); 
			LOG.debug("1.2===================");
			//성공
			if(flag == 1) {
				message.setMsgMsg(project.getGitAddress()+"의 ProjectList가 삭제 되었습니다.");
			//실패
			}else {
				message.setMsgMsg(project.getGitAddress()+"ProjectList의 삭제 실패.");
			}
			
			//JSON
			Gson gson = new Gson();
			String json = gson.toJson(message);
			LOG.debug("1.3===================");
			LOG.debug("1.3=json="+json); 
			LOG.debug("1.3===================");
			
			
			return json;
			
		}
   
   
   @RequestMapping(value="portfolio/do_insert.spring", method=RequestMethod.POST
		   ,produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String do_insert(MultipartHttpServletRequest mReg,ProjectVO projectVO ,  HttpServletRequest req, Model model) {
	   HttpSession session= req.getSession();
	   MemberVO sessionVO=(MemberVO)session.getAttribute("member");
	   List<ProjectVO> list = projectVO.getProjectList();
	       
	   String datePath = this.UPLOAD_FILE;
       PjtFileVO dbInVO=new PjtFileVO();
       LOG.debug("정진우"+String.valueOf(mReg.getFileNames()));
	   Iterator<String> files =mReg.getFileNames();
	   LOG.debug("files.hasNext()"+files.hasNext());
	   int j=0;
       while(files.hasNext()) {
		    FileVO  fileVO=new FileVO();
            String upFileNm = files.next();
            LOG.debug("=upFileNm="+upFileNm);
            
            MultipartFile mFile = mReg.getFile(upFileNm);
            String orgFileName = mFile.getOriginalFilename();
            //File 입력이 안된 경우 
            if(null == orgFileName || "".equals(orgFileName) )continue;
            
            LOG.debug("=^^^^^^=");
            fileVO.setOrgFileNm(orgFileName);//원본파일명
            fileVO.setFileSize(mFile.getSize());//파일사이즈
            
            //저장파일명: yyyyMMddHHmmss
            String saveFileName = StringUtil.getDate("yyyyMMddHHmmss")+"_"+StringUtil.getUUID();
            LOG.debug("saveFileName="+saveFileName);
            
            String ext = "";
            //확장자:.
            if(orgFileName.indexOf(".")>-1) {
               ext = orgFileName.substring(orgFileName.indexOf(".")+1);
            }
            
            
            dbInVO.setExt(ext);
            dbInVO.setDivFile(1);//1이면 동영상 2이면 사진
            dbInVO.setFileSize(mFile.getSize());
            dbInVO.setOrgNm(orgFileName);
            dbInVO.setSavePNm(saveFileName);
            dbInVO.setMemberId(sessionVO.getMemberId());
            dbInVO.setGitAddress(list.get(j).getGitAddress());
            LOG.debug("Test!: "+list.get(j).getGitAddress());
            j+=1;
            pjtFileService.doInsert(dbInVO);
            
            
            saveFileName+="."+ext;
            //Rename
            File renameFile=new File(datePath,saveFileName);
            fileVO.setSaveFileNm(renameFile.getAbsolutePath());
            fileVO.setExt(ext);
            
            try {
				mFile.transferTo(new File(renameFile.getAbsolutePath()));
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
         }
         
      
      for(int i=0; i<list.size(); i++) {
           
    	  list.get(i).setMemberId(sessionVO.getMemberId());
    	  
         LOG.debug("1111 : " + list.get(i).getPjtName());
         LOG.debug("2222 : " + list.get(i).getPjtInfo());
         LOG.debug("3333 : " + list.get(i).getPjtStart());
         LOG.debug("4444 : " + list.get(i).getPjtEnd());
         LOG.debug("5555 : " + list.get(i).getGitAddress());
         LOG.debug("9999 : " + list.get(i).getMemberId());
    
          }
      
      int  flag=0;
      for(int i=0; i<list.size(); i++) {
    	list.get(i).setMemberId(sessionVO.getMemberId());
     	flag = pjtService.springInsert(list.get(i));
      	LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");
      }
      
      	MessageVO message=new MessageVO();
  	
		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(sessionVO.getMemberId()+"님의 프로젝트가  등록 되었습니다.");
		//실패	
		}else {
			message.setMsgMsg(sessionVO.getMemberId()+"님 등록 실패.");			
		}
      	Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");
		
		return json;
      }
      
   }