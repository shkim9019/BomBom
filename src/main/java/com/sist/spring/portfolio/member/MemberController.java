package com.sist.spring.portfolio.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.sist.spring.cmn.FileVO;
import com.sist.spring.cmn.MessageVO;
import com.sist.spring.cmn.SearchVO;
import com.sist.spring.cmn.StringUtil;
import com.sist.spring.portfolio.comment.CommentService;
import com.sist.spring.portfolio.comment.CommentVO;
import com.sist.spring.portfolio.license.LicenseService;
import com.sist.spring.portfolio.license.LicenseVO;
import com.sist.spring.portfolio.member.file.FileMemberService;
import com.sist.spring.portfolio.member.file.FileMemberVO;
import com.sist.spring.portfolio.project.PjtFileService;
import com.sist.spring.portfolio.project.PjtFileVO;
import com.sist.spring.portfolio.project.ProjectService;
import com.sist.spring.portfolio.project.ProjectVO;
import com.sist.spring.portfolio.skill.SkillService;
import com.sist.spring.portfolio.skill.SkillVO;

@Controller
public class MemberController {
	private final Logger LOG = LoggerFactory.getLogger(MemberController.class);
	//Window 경로
	//private final String UPLOAD_FILE="C:\\Users\\sist\\git\\springPro\\springPro\\src\\main\\webapp\\resources\\images";  
	
	//노트북
	//private final String UPLOAD_FILE="C:\\Users\\82104\\git\\springPro\\springPro\\src\\main\\webapp\\resources\\images";
	
	//Linux 경로
	private final String UPLOAD_FILE= "/var/lib/tomcat9/webapps/springPro/resources/images";
	
	//@Qualifier("dummyMailSender") : root-context.xml bean id
	@Autowired
	MemberService memberService;
	
	@Autowired
	FileMemberService fmService;
	
	@Autowired
	SkillService skillService;
	
	@Autowired
	ProjectService pjtService;
	
	@Autowired
	PjtFileService pjtFileService;
	
	@Autowired
	LicenseService licService;
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value = "/portfolio/do_retrieve.spring", method = RequestMethod.GET)
	public String doRetrieve(HttpServletRequest req, SearchVO search, Model model){
		HttpSession session= req.getSession();
		MemberVO sessionVO=(MemberVO)session.getAttribute("member");
		
		LOG.debug("1===================");
		LOG.debug("1=search="+search);
		LOG.debug("1===================");
		   
		//페이지 사이즈
		if(search.getPageSize()==0) {
			search.setPageSize(10);
		}
		//페이지 num
		if(search.getPageNum()==0) {
			search.setPageNum(1);
		}
		
		//검색구분
		search.setSearchDiv(StringUtil.nvl(search.getSearchDiv()));
		
		//검색어
		search.setSearchWord(StringUtil.nvl(search.getSearchWord()));
		model.addAttribute("param",search);
		
		LOG.debug("1.2===================");
		LOG.debug("1.2=search="+search);
		LOG.debug("1.2===================");
		
		List<MemberVO> list = (List<MemberVO>) memberService.doRetrieve(search);
		List<FileMemberVO> fileList=new ArrayList();
		LOG.debug("1.3===================");
		for(MemberVO vo :list) {
			
			FileMemberVO inVO=new FileMemberVO();
			LOG.debug("vo="+vo);
			inVO.setMemberId(vo.getMemberId());
			
			fileList.add((FileMemberVO) fmService.doSelectOne(inVO));
			
		}
		LOG.debug("1.3===================");
		
		
		model.addAttribute("list", list);
		model.addAttribute("fileList", fileList);
        
		//총글수
		int totalCnt = 0;
		if(null != list && list.size() >0) {
			totalCnt = list.get(0).getTotalCnt();
		}
		model.addAttribute("totalCnt", totalCnt);
		int maxPageNo = ((totalCnt - 1) / 10) + 1;
		model.addAttribute("maxPageNo",maxPageNo);
		model.addAttribute("sessionVO",sessionVO);
		session.setAttribute("member", sessionVO);

		
		
//		member/member_mng -> /+member/member_mng+.jsp
		return "portfolio/member/member_list";
	}


	@RequestMapping(value="/portfolio/logout.spring", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, Model model) {
		
		HttpSession session=req.getSession();
		session.invalidate();
		
		return "portfolio/member/login";
	}
	
	@RequestMapping(value="/portfolio/searchVideo.spring", method = RequestMethod.GET)
	public String searchVideo(HttpServletRequest req, Model model) {
		LOG.debug("========================================================");
		LOG.debug("searchVideo");
		LOG.debug("param"+req.getParameter("gitAddress"));
		LOG.debug("========================================================");
		
		PjtFileVO inVO=new PjtFileVO();
		inVO.setGitAddress(req.getParameter("gitAddress"));
		try {
			PjtFileVO outVO=(PjtFileVO)pjtFileService.doSearchVideo(inVO);
			model.addAttribute("pjtFileVO",outVO);
		}catch(EmptyResultDataAccessException e) {
			model.addAttribute("EmptyData","비디오 파일을 입력해주세요");
		}
		
		return "portfolio/videoPopup";
	}
	
	@RequestMapping(value="/portfolio/toHome.spring",method=RequestMethod.GET)
	public String toHome(HttpServletRequest req, Model model) {
		
		LOG.debug("=======================================");
		LOG.debug("=toHome/param");
		HttpSession session=req.getSession();
		MemberVO outVO=(MemberVO)session.getAttribute("member");
		
			PjtFileVO pjtFileVO=new PjtFileVO();
			ProjectVO pjtVO=new ProjectVO();
			LicenseVO licVO=new LicenseVO();
			MemberVO memVO=new MemberVO();
			FileMemberVO fileMemberInVO=new FileMemberVO();
			SkillVO skillVO = new SkillVO();
			CommentVO commentVO=new CommentVO();
			
			pjtFileVO.setMemberId(outVO.getMemberId());
			skillVO.setMemberId(outVO.getMemberId());
			pjtVO.setMemberId(outVO.getMemberId());
			licVO.setMemberId(outVO.getMemberId());
			memVO.setMemberId(outVO.getMemberId());
			fileMemberInVO.setMemberId(outVO.getMemberId());
			commentVO.setPortfolioId(outVO.getMemberId());
			
			LOG.debug("==========================");
			LOG.debug("==ProjectService/doRetrieve");
			LOG.debug("==========================");
			
			List<SkillVO> skillList=(List<SkillVO>)skillService.doRetrieve(skillVO);
			List<ProjectVO> pjtList=(List<ProjectVO>)pjtService.doRetrieve(pjtVO);
			List<LicenseVO> licList=(List<LicenseVO>)licService.doRetrieve(licVO);
			FileMemberVO fileMemberVO=(FileMemberVO)fmService.doSelectOne(fileMemberInVO);
			List<PjtFileVO> pjtFileList =(List<PjtFileVO>)pjtFileService.doRetrieve(pjtFileVO);
			List<CommentVO> commentList =(List<CommentVO>)commentService.doRetrieve(commentVO);
			
			
			
			
			StringBuilder out=new StringBuilder();
			List<String> companyList=new ArrayList<String>();
			List<String> recommendList=new ArrayList<String>();
			List<String> urlList=new ArrayList<String>();
			String url = "http://www.jobkorea.co.kr/Search/?stext="+outVO.getInterestOption();    //크롤링할 url지정
	        Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
	 
	    try {
	 
	            doc = Jsoup.connect(url).get();//해당 페이지안에 있는 전체 소스
	 
	        } catch (IOException e) {
	 
	            e.printStackTrace();
	 
	        }
	    
	        //select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
	        //                               ==>원하는 값들이 들어있는 덩어리를 가져온다
	    Elements element = doc.select("div.post-list-info"); 
	    Elements element2 = doc.select("div.post-list-corp"); 
	     
	        System.out.println("============================================================");
	 
	        //Iterator을 사용하여 하나씩 값 가져오기
	        //덩어리안에서 필요한부분만 선택하여 가져올 수 있다.
	        Iterator<Element> ie1 = element.select("a.title").iterator();
	        Iterator<Element> ie2 = element2.select("a.name").iterator();
	        Iterator<Element> ie3 = element2.select("a.name").iterator();
	        LOG.debug("Crawling test1href ");
	        while (ie1.hasNext()) {	
	        	out.append(ie1.next().text()+",");
	            recommendList.add(ie1.next().text());
	        }
	        while (ie2.hasNext()) {
	        	String temp=ie2.next().attr("abs:href");
	            urlList.add(temp);
	        }
	        while (ie3.hasNext()) {
	        	companyList.add(ie3.next().text());
	        }
	       
	        model.addAttribute("memberVO", outVO);
			model.addAttribute("recommendList",recommendList);
			model.addAttribute("companyList",companyList);
	        model.addAttribute("pjtList",pjtList);
	        model.addAttribute("licList", licList);
	        model.addAttribute("fileVO", fileMemberVO);
	        model.addAttribute("skillList", skillList);
	        model.addAttribute("urlList", urlList);
	        model.addAttribute("pjtFileList", pjtFileList);
	        model.addAttribute("list", commentList);
	        model.addAttribute("sessionVO",outVO);
		       
	        session.setAttribute("member", outVO);
	        
	     
	return "portfolio/index";
	 
	}
	
	
	
	@RequestMapping(value="portfolio/doLogin.spring",method = RequestMethod.POST)
	public String doLogin(HttpServletRequest req, Model model) {
		LOG.debug("=======================================");
		LOG.debug("=doLogin/param");
		LOG.debug("=doLogin/memberId:"+req.getParameter("memberId"));
		LOG.debug("=doLogin/password:"+req.getParameter("password"));
		LOG.debug("=======================================");
		
		MemberVO inVO=new MemberVO();
		inVO.setMemberId(req.getParameter("memberId"));
		inVO.setPassword(req.getParameter("password"));
		
		MemberVO outVO=(MemberVO)this.memberService.doLogin(inVO);
		if(outVO.getMemberId()==null || "".equals(outVO.getMemberId())) {
			model.addAttribute("loginFailure","아이디와 비밀번호를 확인해주세요.");
			return "portfolio/member/login";
		}else {
			PjtFileVO pjtFileVO=new PjtFileVO();
			ProjectVO pjtVO=new ProjectVO();
			LicenseVO licVO=new LicenseVO();
			MemberVO memVO=new MemberVO();
			FileMemberVO fileMemberInVO=new FileMemberVO();
			SkillVO skillVO = new SkillVO();
			CommentVO commentVO=new CommentVO();
			
			pjtFileVO.setMemberId(outVO.getMemberId());
			skillVO.setMemberId(outVO.getMemberId());
			pjtVO.setMemberId(outVO.getMemberId());
			licVO.setMemberId(outVO.getMemberId());
			memVO.setMemberId(outVO.getMemberId());
			fileMemberInVO.setMemberId(outVO.getMemberId());
			commentVO.setPortfolioId(outVO.getMemberId());
			
			LOG.debug("==========================");
			LOG.debug("==ProjectService/doRetrieve");
			LOG.debug("==========================");
			
			List<SkillVO> skillList=(List<SkillVO>)skillService.doRetrieve(skillVO);
			List<ProjectVO> pjtList=(List<ProjectVO>)pjtService.doRetrieve(pjtVO);
			List<LicenseVO> licList=(List<LicenseVO>)licService.doRetrieve(licVO);
			FileMemberVO fileMemberVO=(FileMemberVO)fmService.doSelectOne(fileMemberInVO);
			List<PjtFileVO> pjtFileList =(List<PjtFileVO>)pjtFileService.doRetrieve(pjtFileVO);
			List<CommentVO> commentList =(List<CommentVO>)commentService.doRetrieve(commentVO);
			
			
			
			HttpSession session=req.getSession();
			
			StringBuilder out=new StringBuilder();
			List<String> companyList=new ArrayList<String>();
			List<String> recommendList=new ArrayList<String>();
			List<String> urlList=new ArrayList<String>();
			String url = "http://www.jobkorea.co.kr/Search/?stext="+outVO.getInterestOption();    //크롤링할 url지정
	        Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
	 
	    try {
	 
	            doc = Jsoup.connect(url).get();//해당 페이지안에 있는 전체 소스
	 
	        } catch (IOException e) {
	 
	            e.printStackTrace();
	 
	        }
	    
	        //select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
	        //                               ==>원하는 값들이 들어있는 덩어리를 가져온다
	    Elements element = doc.select("div.post-list-info"); 
	    Elements element2 = doc.select("div.post-list-corp"); 
	     
	        System.out.println("============================================================");
	 
	        //Iterator을 사용하여 하나씩 값 가져오기
	        //덩어리안에서 필요한부분만 선택하여 가져올 수 있다.
	        Iterator<Element> ie1 = element.select("a.title").iterator();
	        Iterator<Element> ie2 = element2.select("a.name").iterator();
	        Iterator<Element> ie3 = element2.select("a.name").iterator();
	        LOG.debug("Crawling test1href ");
	        while (ie1.hasNext()) {	
	        	out.append(ie1.next().text()+",");
	            recommendList.add(ie1.next().text());
	        }
	        while (ie2.hasNext()) {
	        	String temp=ie2.next().attr("abs:href");
	            urlList.add(temp);
	        }
	        while (ie3.hasNext()) {
	        	companyList.add(ie3.next().text());
	        }
	       
	        model.addAttribute("memberVO", outVO);
			model.addAttribute("recommendList",recommendList);
			model.addAttribute("companyList",companyList);
	        model.addAttribute("pjtList",pjtList);
	        model.addAttribute("licList", licList);
	        model.addAttribute("fileVO", fileMemberVO);
	        model.addAttribute("skillList", skillList);
	        model.addAttribute("urlList", urlList);
	        model.addAttribute("pjtFileList", pjtFileList);
	        model.addAttribute("list", commentList);
	        model.addAttribute("sessionVO",outVO);
	        
	        session.setAttribute("member", outVO);
	        
	        //----댓글-----------------------------------------------
	        
//	        SearchVO search =new SearchVO();
//	        CommentVO cmtVO = new CommentVO();
//	        cmtVO.setPortfolioId(outVO.getMemberId());
//	        
//	        LOG.debug("1===================");
//			LOG.debug("1=search="+search);
//			LOG.debug("1=portfolioId="+outVO.getMemberId());
//			LOG.debug("1===================");
//			   
//			//페이지 사이즈
//			if(search.getPageSize()==0) {
//				search.setPageSize(20);
//			}
//			//페이지 num
//			if(search.getPageNum()==0) {
//				search.setPageNum(1);
//			}
//			
//			//검색구분
//			search.setSearchDiv(StringUtil.nvl(search.getSearchDiv()));
//			
//			//검색어
//			search.setSearchWord(StringUtil.nvl(search.getSearchWord()));
//			
//			model.addAttribute("param",search);
//			
//			LOG.debug("1.2===================");
//			LOG.debug("1.2=search="+search);
//			LOG.debug("1.2===================");
//			
//			List<CommentVO> list = (List<CommentVO>) commentService.doRetrieve(search);
//			LOG.debug("1.3===================");
//			for(CommentVO vo :list) {
//				LOG.debug("vo="+vo);
//			}
//			LOG.debug("1.3===================");
//			
//			model.addAttribute("list", list);
//			
//			//총글수
//			int totalCnt = 0;
//			if(null != list && list.size() >0) {
//				totalCnt = list.get(0).getTotalCnt();
//			}
//			model.addAttribute("totalCnt", totalCnt);
//			int maxPageNo = ((totalCnt - 1) / 10) + 1;
//			model.addAttribute("maxPageNo",maxPageNo);
  
	        
	        
			return "portfolio/index";

		}
	}
	
	@RequestMapping(value = "member/do_update.do",method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(MemberVO user) {
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("1===================");

		int  flag = memberService.doUpdate(user);
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");

		//메시지 처리
		MessageVO message=new MessageVO();

		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(user.getName()+"님이 수정 되었습니다.");
		//실패	
		}else {
			message.setMsgMsg(user.getName()+"님 등록 실패.");			
		}		

		//JSON
		Gson gson=new Gson();
		String json = gson.toJson(message);

		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");		

		return json;
		
	}
	@RequestMapping(value = "/portfolio/do_mem_Comment.spring",method = RequestMethod.GET)
	public String doMemComment(HttpServletRequest req ,MemberVO user,CommentVO cmt, Model model) {
		HttpSession session =req.getSession();
		MemberVO sessionVO=(MemberVO) session.getAttribute("member");
		user.setMemberId(req.getParameter("portfolioId"));
		cmt.setRegId(sessionVO.getMemberId());
		
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("2=sssesion="+sessionVO.getMemberId());
		LOG.debug("1===================");
		
		MemberVO outVO = (MemberVO) memberService.doSelectOne(user); //selectOne해서 한줄 뽑아옴
		LOG.debug("1.2===================");
		LOG.debug("1.2=outVO="+outVO);
		LOG.debug("1.2===================");
		
		FileMemberVO inVO = new FileMemberVO(); //객체생성
		inVO.setMemberId(user.getMemberId()); //
		
		FileMemberVO fileVO= (FileMemberVO) fmService.doSelectOne(inVO);
		
		model.addAttribute("fileVO",fileVO);
		model.addAttribute("memberVO",outVO);
		
		CommentVO commentVO=new CommentVO();
		commentVO.setPortfolioId(req.getParameter("portfolioId"));
		
		
		List<CommentVO> list = (List<CommentVO>) commentService.doRetrieve(commentVO);
		LOG.debug("1.3===================");
		for(CommentVO vo :list) {
			LOG.debug("vo="+vo);
		}
		LOG.debug("1.3===================");
		
		
		//총글수
		int totalCnt = 0;
		if(null != list && list.size() >0) {
			totalCnt = list.get(0).getTotalCnt();
		}
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		int maxPageNo = ((totalCnt - 1) / 10) + 1;
		model.addAttribute("maxPageNo",maxPageNo);
		model.addAttribute("sessionVO",sessionVO);
		
		return "portfolio/index";
	}
	
	@RequestMapping(value = "/portfolio/do_select_one.spring",method = RequestMethod.GET)
	public String doSelectOne(HttpServletRequest req ,MemberVO user,SearchVO search, Model model) {
		HttpSession session =req.getSession();
		MemberVO sessionVO=(MemberVO) session.getAttribute("member");
		user.setMemberId(req.getParameter("hiddenId")); //frm의 hiddenId 값들 가져와서 set
		
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("2=sssesion="+sessionVO.getMemberId());
		LOG.debug("1===================");
		
		MemberVO outVO = (MemberVO) memberService.doSelectOne(user); //selectOne해서 한줄 뽑아옴
		LOG.debug("1.2===================");
		LOG.debug("1.2=outVO="+outVO);
		LOG.debug("1.2===================");
		
		PjtFileVO pjtFileVO=new PjtFileVO();
		ProjectVO pjtVO=new ProjectVO();
		LicenseVO licVO=new LicenseVO();
		MemberVO memVO=new MemberVO();
		FileMemberVO fileMemberInVO=new FileMemberVO();
		SkillVO skillVO = new SkillVO();
		
		pjtFileVO.setMemberId(outVO.getMemberId());
		skillVO.setMemberId(outVO.getMemberId());
		pjtVO.setMemberId(outVO.getMemberId());
		licVO.setMemberId(outVO.getMemberId());
		memVO.setMemberId(outVO.getMemberId());
		fileMemberInVO.setMemberId(outVO.getMemberId());
		
		LOG.debug("==========================");
		LOG.debug("==ProjectService/doRetrieve");
		LOG.debug("==========================");
		
		List<SkillVO> skillList=(List<SkillVO>)skillService.doRetrieve(skillVO);
		List<ProjectVO> pjtList=(List<ProjectVO>)pjtService.doRetrieve(pjtVO);
		List<LicenseVO> licList=(List<LicenseVO>)licService.doRetrieve(licVO);
		FileMemberVO fileMemberVO=(FileMemberVO)fmService.doSelectOne(fileMemberInVO);
		List<PjtFileVO> pjtFileList =(List<PjtFileVO>)pjtFileService.doRetrieve(pjtFileVO);
		
		StringBuilder out=new StringBuilder();
		List<String> companyList=new ArrayList<String>();
		List<String> recommendList=new ArrayList<String>();
		List<String> urlList=new ArrayList<String>();
		String url = "http://www.jobkorea.co.kr/Search/?stext="+outVO.getInterestOption();    //크롤링할 url지정
        Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
 
	    try {
	 
            doc = Jsoup.connect(url).get();//해당 페이지안에 있는 전체 소스
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        }
    
        //select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
        //                               ==>원하는 값들이 들어있는 덩어리를 가져온다
	    Elements element = doc.select("div.post-list-info"); 
	    Elements element2 = doc.select("div.post-list-corp"); 
     
        System.out.println("============================================================");
 
        //Iterator을 사용하여 하나씩 값 가져오기
        //덩어리안에서 필요한부분만 선택하여 가져올 수 있다.
        Iterator<Element> ie1 = element.select("a.title").iterator();
        Iterator<Element> ie2 = element2.select("a.name").iterator();
        Iterator<Element> ie3 = element2.select("a.name").iterator();
        LOG.debug("Crawling test1href ");
        while (ie1.hasNext()) {	
        	out.append(ie1.next().text()+",");
            recommendList.add(ie1.next().text());
        }
        while (ie2.hasNext()) {
        	String temp=ie2.next().attr("abs:href");
            urlList.add(temp);
        }
        while (ie3.hasNext()) {
        	companyList.add(ie3.next().text());
        }
       
        model.addAttribute("memberVO", outVO);
		model.addAttribute("recommendList",recommendList);
		model.addAttribute("companyList",companyList);
        model.addAttribute("pjtList",pjtList);
        model.addAttribute("licList", licList);
        model.addAttribute("fileVO", fileMemberVO);
        model.addAttribute("skillList", skillList);
        model.addAttribute("urlList", urlList);
        model.addAttribute("pjtFileList", pjtFileList);
        model.addAttribute("sessionVO",outVO);
	       
       
		//----------------------------------------------------------------------------댓글기능 시작
		
		
        CommentVO cmt = new CommentVO();
        cmt.setPortfolioId(req.getParameter("hiddenId"));
//        cmt.setRegId(sessionVO.getMemberId());
//        LOG.debug("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//        LOG.debug("!cmt.setRegId!"+sessionVO.getMemberId());
//        LOG.debug("!cmt.setPortfolioId!!"+req.getParameter("hiddenId"));
//        LOG.debug("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        
        
		List<CommentVO> list = (List<CommentVO>) commentService.doRetrieve(cmt);
		LOG.debug("1.3===================");
		for(CommentVO vo :list) {
			LOG.debug("vo="+vo);
		}
		LOG.debug("1.3===================");
		
		model.addAttribute("list", list);
		
		//총글수
		int totalCnt = 0;
		if(null != list && list.size() >0) {
			totalCnt = list.get(0).getTotalCnt();
		}
		model.addAttribute("totalCnt", totalCnt);
		int maxPageNo = ((totalCnt - 1) / 10) + 1;
		model.addAttribute("maxPageNo",maxPageNo);
		model.addAttribute("sessionVO",sessionVO);
		 session.setAttribute("member", sessionVO);
			
		return "portfolio/index";
		//return "portfolio/index";
	}
	
	
	@RequestMapping(value = "member/do_delete.do",method = RequestMethod.POST
					,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doDelete(MemberVO user) {
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("1===================");
		
		int flag = 0;
		flag = memberService.doDelete(user);
		
		MessageVO message = new MessageVO();
		message.setMsgId(String.valueOf(flag));
		
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");
		//성공
		if(flag == 1) {
			message.setMsgMsg(user.getMemberId()+"님이 삭제 되었습니다.");
		//실패
		}else {
			message.setMsgMsg(user.getMemberId()+"삭제 실패.");
		}
		
		//JSON
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");
		
		
		return json;
		
	}
	
		@RequestMapping(value = "portfolio/SignUp/doInsertMember.spring", method = RequestMethod.POST
					,produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String doInsert(MultipartHttpServletRequest mReg,HttpServletRequest req, MemberVO user) {
		FileMemberVO fmVO=new FileMemberVO();
		String datePath = this.UPLOAD_FILE;
		String phone=req.getParameter("phone1")+"-"+req.getParameter("phone2")+"-"+req.getParameter("phone3");
		String birth=req.getParameter("birth3")+"/"+req.getParameter("birth2")+"/"+req.getParameter("birth1");
		user.setPhone(phone);
		user.setBirth(birth);
		
		Iterator<String> files=mReg.getFileNames();
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
            
            
            fmVO.setExt(ext);
            fmVO.setFileSize(mFile.getSize());
            fmVO.setOrgNm(orgFileName);
            fmVO.setSaveNm(saveFileName);
            fmVO.setMemberId(user.getMemberId());
            fmService.doInsert(fmVO);
            saveFileName+="."+ext;
            //Rename
            File renameFile=new File(datePath,saveFileName);
            fileVO.setSaveFileNm(renameFile.getAbsolutePath());
            fileVO.setExt(ext);
           
            
//            list.add(fileVO);
            try {
            	
				mFile.transferTo(new File(renameFile.getAbsolutePath()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("1===================");
		LOG.debug(req.getParameter("birth1"));
		LOG.debug(req.getParameter("birth2"));
		LOG.debug(req.getParameter("birth3"));
		int  flag = memberService.doInsert(user);
		
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");
		
		//메시지 처리
		MessageVO message=new MessageVO();
		
		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(user.getName()+"님이 등록 되었습니다.");
		//실패	
		}else {
			message.setMsgMsg(user.getName()+"님 등록 실패.");			
		}
		
		//JSON
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");
		
		
		return json;
		}
	
	
}
