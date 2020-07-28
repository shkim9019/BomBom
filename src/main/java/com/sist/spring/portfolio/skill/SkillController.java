package com.sist.spring.portfolio.skill;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.spring.cmn.MessageVO;
import com.sist.spring.cmn.SearchVO;
import com.sist.spring.cmn.StringUtil;
import com.sist.spring.covid.CovidUserVO;
import com.sist.spring.portfolio.license.LicenseVO;
import com.sist.spring.portfolio.member.MemberVO;

@Controller
public class SkillController {
	private final Logger LOG = LoggerFactory.getLogger(SkillController.class);
	
	public SkillController() {}
	
	
	@Autowired
	SkillService skillService;
	
	
	@RequestMapping(value="/portfolio/skill/do_retrieve.spring",method = RequestMethod.GET)
	public String doRetrieve(HttpServletRequest req,SkillVO skill,Model model) {
		
		SkillVO inVO=new SkillVO();
		inVO.setMemberId(inVO.getMemberId());
		
		LOG.debug("1===================");
		LOG.debug("1=skill="+skill);
		LOG.debug("1===================");

		List<SkillVO>  list = (List<SkillVO>) skillService.doRetrieve(inVO);
		LOG.debug("1.3===========================");
		for(SkillVO vo:list) {
			LOG.debug("1.3 vo = "+vo);
		}

		LOG.debug("1.3===========================");		
		model.addAttribute("list",list);
		//총글수
		int totalCnt = 0;
		if(list!=null && list.size()>0) {
			totalCnt =list.get(0).getTotalCnt();
		}
		model.addAttribute("totalCnt",totalCnt);		

		return "portfolio/index";
	}

	
	@RequestMapping(value = "skill/do_update.spring",method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(SkillVO skill) {
		LOG.debug("1===================");
		LOG.debug("1=skill="+skill);
		LOG.debug("1===================");

		int  flag = skillService.doUpdate(skill);
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");

		//메시지 처리
		MessageVO message=new MessageVO();

		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(skill.getsName()+"의 Skill이 수정 되었습니다.");
		//실패	
		}else {
			message.setMsgMsg(skill.getsName()+"Skill의 수정 실패.");			
		}		

		//JSON
		Gson gson=new Gson();
		String json = gson.toJson(message);

		
		System.out.println("1231232");
		System.out.println("1231232");
		System.out.println("1231232");
		
		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");		

		return json;

	}
	
	
	@RequestMapping(value = "skill/do_select_one.spring",method = RequestMethod.GET
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doSelectOne(SkillVO skill) {
		LOG.debug("1===================");
		LOG.debug("1=skill="+skill);
		LOG.debug("1===================");
		
		SkillVO outVO = (SkillVO) skillService.doSelectOne(skill);
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
	
	
	
	@RequestMapping(value = "skill/do_delete.spring",method = RequestMethod.POST
					,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doDelete(SkillVO skill) {
		LOG.debug("1===================");
		LOG.debug("1=skill="+skill);
		LOG.debug("1===================");
		
		int flag = 0;
		flag = skillService.doDelete(skill);
		
		MessageVO message = new MessageVO();
		message.setMsgId(String.valueOf(flag));
		
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");
		//성공
		if(flag == 1) {
			message.setMsgMsg(skill.getsName()+"의 SkillList가 삭제 되었습니다.");
		//실패
		}else {
			message.setMsgMsg(skill.getMemberId()+"SkillList의 삭제 실패.");
		}
		
		//JSON
		Gson gson = new Gson();
		String json = gson.toJson(message);
		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");
		
		
		return json;
		
	}
	
	@RequestMapping(value = "skill/do_insert.spring",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(SkillVO skillVO, HttpServletRequest req, Model model) {
		HttpSession session= req.getSession();
		MemberVO sessionVO=(MemberVO)session.getAttribute("member");
		List<SkillVO> list = skillVO.getSkillList();
		
		for(int i=0;i<list.size(); i++) {
			
			list.get(i).setMemberId(sessionVO.getMemberId());
			
			LOG.debug("1111 : " + list.get(i).getsName());
			LOG.debug("2222 : " + list.get(i).getMemberId());
			LOG.debug("3333 : " + list.get(i).getsMarstery());
			LOG.debug("4444 : " + list.get(i).getsContent());
			
			
		}
		
		int  flag=0;
	      for(int i=0; i<list.size(); i++) {
	      	flag = skillService.doInsert(list.get(i));
	      	LOG.debug("1.2===================");
			LOG.debug("1.2=flag="+flag); 
			LOG.debug("1.2===================");
	    }
		
		//메시지 처리
		MessageVO message=new MessageVO();

		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {  
			message.setMsgMsg(sessionVO.getMemberId()+"님의 스킬이 등록 되었습니다.");
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
