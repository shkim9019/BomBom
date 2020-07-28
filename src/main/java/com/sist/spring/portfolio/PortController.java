package com.sist.spring.portfolio;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.spring.portfolio.license.LicenseService;
import com.sist.spring.portfolio.license.LicenseVO;
import com.sist.spring.portfolio.member.MemberService;
import com.sist.spring.portfolio.member.MemberVO;
import com.sist.spring.portfolio.member.file.FileMemberService;
import com.sist.spring.portfolio.member.file.FileMemberVO;
import com.sist.spring.portfolio.project.PjtFileService;
import com.sist.spring.portfolio.project.ProjectService;
import com.sist.spring.portfolio.project.ProjectVO;
import com.sist.spring.portfolio.skill.SkillService;
import com.sist.spring.portfolio.skill.SkillVO;

@Controller
public class PortController {

	private final Logger LOG=LoggerFactory.getLogger(PortController.class);
	
	@Autowired
	SkillService skillService;
	
	@Autowired
	ProjectService pjtService;
	
	@Autowired
	PjtFileService pjtFileService;
	
	@Autowired
	LicenseService licService;
	
	@Autowired
	MemberService memService;
	
	@Autowired
	FileMemberService fileMemService;

	public PortController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/portfolio/mypage_retrieve.spring",method=RequestMethod.GET)
	public String mypageRetrieve(HttpServletRequest req,SkillVO skill,LicenseVO license,ProjectVO project, Model model) {
		
		HttpSession session=req.getSession();
		MemberVO sessionVO=(MemberVO) session.getAttribute("member");
		
		skill.setMemberId(sessionVO.getMemberId());
		license.setMemberId(sessionVO.getMemberId());
		project.setMemberId(sessionVO.getMemberId());
		
		model.addAttribute("param", skill);
		model.addAttribute("param", license);
		model.addAttribute("param", project);
		
		List<SkillVO> skillList =(List<SkillVO>) skillService.doRetrieve(skill);
		LOG.debug("1.3===================");
		for(SkillVO vo :skillList) {
			LOG.debug("vo="+vo);
		}
		List<LicenseVO> licenseList =(List<LicenseVO>) licService.doRetrieve(license);
		LOG.debug("1.3===================");
		for(LicenseVO vo :licenseList) {
			LOG.debug("vo="+vo);
		}
		List<ProjectVO> projectList =(List<ProjectVO>) pjtService.doRetrieve(project);
		LOG.debug("1.3===================");
		for(ProjectVO vo :projectList) {
			LOG.debug("vo="+vo);
		}
		LOG.debug("1.3===================");
		model.addAttribute("list1", skillList);
		model.addAttribute("list2", licenseList);
		model.addAttribute("list3", projectList);
		model.addAttribute("sessionVO", sessionVO);
		
		
		return "portfolio/member/member_mypage_check";
	}
	
	@RequestMapping(value="/portfolio/total_retrieve.spring",method=RequestMethod.GET)
		public String doRetrieve(HttpServletRequest req, Model model) {
		ProjectVO pjtVO=new ProjectVO();
		LicenseVO licVO=new LicenseVO();
		MemberVO memVO=new MemberVO();
		FileMemberVO fileMemberInVO=new FileMemberVO();
		SkillVO skillVO = new SkillVO();
		
		skillVO.setMemberId("iod1124");
		pjtVO.setMemberId("iod1124");
		licVO.setMemberId("iod1124");
		memVO.setMemberId("iod1124");
		fileMemberInVO.setMemberId("iod1124");
		
		LOG.debug("==========================");
		LOG.debug("==ProjectService/doRetrieve");
		LOG.debug("==========================");
		
		List<SkillVO> skillList=(List<SkillVO>)skillService.doRetrieve(skillVO);
		List<ProjectVO> pjtList=(List<ProjectVO>)pjtService.doRetrieve(pjtVO);
		List<LicenseVO> licList=(List<LicenseVO>)licService.doRetrieve(licVO);
		FileMemberVO fileMemberVO=(FileMemberVO)fileMemService.doSelectOne(fileMemberInVO);
		
		for(LicenseVO vo:licList) {
			LOG.debug("===================================");
			LOG.debug("License VO");
			LOG.debug(vo.toString());
			LOG.debug("===================================");
		}
		MemberVO memOutVO=(MemberVO)memService.doSelectOne(memVO);
		
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
      
 
        System.out.println("============================================================");
 
        //Iterator을 사용하여 하나씩 값 가져오기
        //덩어리안에서 필요한부분만 선택하여 가져올 수 있다.
        Iterator<Element> ie1 = element.select("a.title").iterator();
        
        
        while (ie1.hasNext()) {
 
            System.out.println(ie1.next().text());
            out.append(ie1.next().text()+",");
            companyList.add(ie1.next().text());
        }
        model.addAttribute("companyList",companyList);
        model.addAttribute("pjtList",pjtList);
        model.addAttribute("licList", licList);
        model.addAttribute("memberVO", memOutVO);
        model.addAttribute("fileVO", fileMemberVO);
        model.addAttribute("skillList", skillList);

		
		return "portfolio/index";
		}

	
}
