package com.sist.spring.portfolio.license;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.spring.cmn.MessageVO;
import com.sist.spring.portfolio.member.MemberVO;
import com.sist.spring.portfolio.skill.SkillVO;

@Controller
public class LicenseController {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public LicenseController() {	
	}
	
	@Autowired
	LicenseService licenseService;
	
	//to update
	@RequestMapping(value="/portfolio/go_update.spring",method =RequestMethod.GET
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String goUpdate(LicenseVO license) {
	LOG.debug("1===========================");
	LOG.debug("1 license = "+license);
	LOG.debug("1===========================");	
	
	LicenseVO outVO=(LicenseVO) licenseService.doSelectOneLic(license);
	LOG.debug("1.2===========================");
	LOG.debug("1.2 outVO = "+outVO);
	LOG.debug("1.2===========================");		
	
	Gson gson = new Gson();
	String json = gson.toJson(outVO);
	LOG.debug("1.3===========================");
	LOG.debug("1.3 json = "+json);
	LOG.debug("1.3===========================");
	
	return json;
	}
	
	//다건조회
	@RequestMapping(value="/portfolio/do_retrieve_lic.spring",method = RequestMethod.GET)
	public String doRetrieve(HttpServletRequest req, Model model) {
	
	LicenseVO inVO=new LicenseVO();
	inVO.setMemberId(inVO.getMemberId());
	
	List<LicenseVO> list = (List<LicenseVO>) licenseService.doRetrieve(inVO);
	LOG.debug("1.3===========================");
	for(LicenseVO vo:list) {
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
	
	
	//삭제
	@RequestMapping(value = "portfolio/do_delete_license.spring",method=RequestMethod.POST
		,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doDeleteLicense(LicenseVO license) {
	LOG.debug("1===========================");
	LOG.debug("1 user = "+license);
	LOG.debug("1===========================");	
	
	int flag = licenseService.doDeleteLicense(license);
	LOG.debug("1.2===========================");
	LOG.debug("1.2 flag = "+flag);
	LOG.debug("1.2===========================");
	
	MessageVO message = new MessageVO();
	message.setMsgId(String.valueOf(flag));
	
	if(flag==1) {
		message.setMsgMsg(license.getlName()+"이(가) 삭제되었습니다.");
	}else {
		message.setMsgMsg(license.getlName()+"의 삭제 실패했습니다.");
	}
	
	Gson gson = new Gson();
	String json = gson.toJson(message);
	LOG.debug("1.3===========================");
	LOG.debug("1.3 json = "+json);
	LOG.debug("1.3===========================");
	
	return json;
	
	}	
	
	//전체삭제
	@RequestMapping(value = "portfolio/do_delete_all.spring",method=RequestMethod.POST
		,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doDeleteAll(LicenseVO license) {
	LOG.debug("1===========================");
	LOG.debug("1 user = "+license);
	LOG.debug("1===========================");	
	
	int flag = licenseService.doDelete(license);
	LOG.debug("1.2===========================");
	LOG.debug("1.2 flag = "+flag);
	LOG.debug("1.2===========================");
	
	MessageVO message = new MessageVO();
	message.setMsgId(String.valueOf(flag));
	
	if(flag==1) {
		message.setMsgMsg(license.getMemberId()+"의 정보가 삭제되었습니다.");
	}else {
		message.setMsgMsg(license.getMemberId()+"의 정보가 삭제 실패했습니다.");
	}
	
	Gson gson = new Gson();
	String json = gson.toJson(message);
	LOG.debug("1.3===========================");
	LOG.debug("1.3 json = "+json);
	LOG.debug("1.3===========================");
	
	return json;
	
	}	
	
	//수정
	@RequestMapping(value ="portfolio/do_update.spring",method=RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doUpdate(LicenseVO license) {
		
		LOG.debug("1=================");
		LOG.debug("1=param="+license);
		LOG.debug("1=================");
		
		int flag = this.licenseService.doUpdate(license);
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");

		//메시지 처리
		MessageVO message=new MessageVO();

		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(license.getlName()+"이(가) 수정 되었습니다.");
		//실패	
		}else {
			message.setMsgMsg(license.getlName()+"의 수정 실패.");			
		}		

		//JSON
		Gson gson=new Gson();
		String json = gson.toJson(message);

		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");		

		return json;
	
		
	}
	
		
	
	
	//등록
	@RequestMapping(value = "portfolio/license_insert_test.spring",method=RequestMethod.POST
				,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(LicenseVO lic) {
		LOG.debug("1=================");
		LOG.debug("1=param="+lic);
		LOG.debug("1=================");
	
		int flag = this.licenseService.doInsert(lic);
		
		MessageVO message=new MessageVO();
		
		if(flag>0) {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("등록 성공.");
		}else {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("등록 실패.");			
		}
		
		Gson gson=new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("1.2=================");
		LOG.debug("1.2=jsonStr="+jsonStr);
		LOG.debug("1.2=================");		
		return jsonStr;
	}	
	//등록
	@RequestMapping(value = "portfolio/license_insert.spring",method=RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(LicenseVO licenseVO, HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		MemberVO sessionVO=(MemberVO)session.getAttribute("member");
		List<LicenseVO> list = licenseVO.getLicenseList();
		
		for(int i=0;i<list.size(); i++) {
			
			list.get(i).setMemberId(sessionVO.getMemberId());
			
			LOG.debug("1111 : " + list.get(i).getlName());
			LOG.debug("2222 : " + list.get(i).getlGroup());
			LOG.debug("3333 : " + list.get(i).getlGrade());
			LOG.debug("4444 : " + list.get(i).getlNum());
			LOG.debug("5555 : " + list.get(i).getlDate());
			LOG.debug("6666 : " + list.get(i).getlOrgan());
			LOG.debug("7777 : " + list.get(i).getMemberId());
			
		}
		
		int  flag=0;
	      for(int i=0; i<list.size(); i++) {
	      	flag = licenseService.doInsert(list.get(i));
	      	LOG.debug("1.2===================");
			LOG.debug("1.2=flag="+flag); 
			LOG.debug("1.2===================");
	    }
	
		//메시지 처리  
		MessageVO message=new MessageVO();
	
		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(sessionVO.getMemberId()+"님의 자격증이 등록 되었습니다.");
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
