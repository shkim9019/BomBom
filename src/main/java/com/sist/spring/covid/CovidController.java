/**
 *<pre>
 * com.sist.spring.covid
 * Class Name : CovidController.java
 * Description : 
 * Modification Information
 * 
 *   수정일      수정자              수정내용
 *  ---------   ---------   -------------------------------
 *  2020-04-26           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2020-04-26 
 * @version 1.0
 * 
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 * </pre>
 */
package com.sist.spring.covid;

import java.io.IOException;
import java.util.ArrayList;
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
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sist.spring.cmn.MessageVO;
import com.sist.spring.cmn.StringUtil;

import org.json.JSONException;
import org.json.JSONObject;
/**
 * @author 82104
 *
 */
@Controller
public class CovidController {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CovidService covidService;
	
	private List<CovidParmVO> list;
	
	@RequestMapping(value = "covid/do_login.spring", method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doLogin(HttpServletRequest req, CovidUserVO vo, Model model) {
		//String url = "covid/covid_login";
		String memberId = req.getParameter("memberId");
		String password = req.getParameter("password");
		//session아이디 값 wogns 가정
		vo = new CovidUserVO();
		vo.setMemberId(memberId);
		vo.setPassWord(password);
		
		int flag = 0;
		CovidUserVO sessionVO = (CovidUserVO) covidService.doSelectOneUser(vo);
		
		if(sessionVO == null || sessionVO.equals("")) {
			flag = 0;
		} else {
			if(sessionVO.getMemberId().equals(memberId) && sessionVO.getPassWord().equals(password)) {
				HttpSession session = req.getSession();
				session.setAttribute("login", sessionVO.getMemberId());
				flag = 1;
			} 
		}
		//메시지 처리
		MessageVO message = new MessageVO();
		message.setMsgId(flag+""); 	//String으로 변환		msgId아이디에는 flag값만 넣음 
		//성공
		if(flag ==1) {
			message.setMsgMsg("로그인에 성공하였습니다.");
			LOG.debug(vo+"ssss");
			model.addAttribute("vo", vo);
		//실패
		} else {
			message.setMsgMsg("로그인에 실패하였습니다.");
		}
		
		//Json은 결국 toString을 형식에 맞게 변환시킨것(라이브러리는 로직이 검증된것임)
		//JSON:자바스크립트 오브젝트 생성규칙		(자기페이지에서 변화시키기 위한것임 @ResponseBody produces = "application/json; charset=UTF-8" 필요)
		Gson gson = new Gson();
		String json =gson.toJson(message);
		
		LOG.debug("1.3===============");
		LOG.debug("1.3=json=" + json);
		LOG.debug("1.3===============");
		
		return json;
	}
	
	@RequestMapping(value = "covid/go_login.spring", method = RequestMethod.GET)
	public String doLoginPage(HttpServletRequest req, CovidUserVO vo, Model model) {
		HttpSession session=req.getSession();
		String id = (String) session.getAttribute("login");
		
		String url = "covid/covid_index";
		
		//session아이디 값 wogns 가정
		vo = new CovidUserVO();
		vo.setMemberId(id);
		CovidUserVO memberVO = (CovidUserVO) covidService.doSelectOneUser(vo);
		
		model.addAttribute("memberVO", memberVO);
		
		return url;
	}
	
	@RequestMapping(value = "covid/logout.spring",method = RequestMethod.GET)
	public String doLogout(HttpSession session) {
		session.removeAttribute("user");

        return "covid/covid_login";
	}
	
	
	@RequestMapping(value = "covid/do_sign_up.spring", method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doSignUp(HttpServletRequest req, CovidUserVO vo, Model model) {
		//String url = "covid/covid_login";
		String memberId = req.getParameter("memberId");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		//session아이디 값 wogns 가정
		vo = new CovidUserVO();
		vo.setMemberId(memberId);
		vo.setPassWord(password);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		int flag = covidService.doInsert(vo);
		
		//메시지 처리
		MessageVO message = new MessageVO();
		message.setMsgId(flag+""); 	//String으로 변환		msgId아이디에는 flag값만 넣음 
		//성공
		if(flag ==1) {
			message.setMsgMsg("회원가입에 성공하였습니다.");
		//실패
		} else {
			message.setMsgMsg("회원가입에 실패하였습니다.");
		}
		
		//Json은 결국 toString을 형식에 맞게 변환시킨것(라이브러리는 로직이 검증된것임)
		//JSON:자바스크립트 오브젝트 생성규칙		(자기페이지에서 변화시키기 위한것임 @ResponseBody produces = "application/json; charset=UTF-8" 필요)
		Gson gson = new Gson();
		String json =gson.toJson(message);
		
		LOG.debug("1.3===============");
		LOG.debug("1.3=json=" + json);
		LOG.debug("1.3===============");
		
		return json;
	}
	
	@RequestMapping(value = "covid/do_delete.spring", method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doDelete(HttpServletRequest req, CovidParmVO vo, Model model) {
		HttpSession session=req.getSession();
		String id = (String) session.getAttribute("login");
		
		String deleteName = req.getParameter("deleteName");
		String deleteCode= req.getParameter("deleteCode");
		//session아이디 값 wogns 가정, pcode필요
		
		LOG.debug("====" + deleteName);
		LOG.debug("====" + deleteCode);
		vo = new CovidParmVO();
		vo.setMemberId(id);
		vo.setpName(deleteName);
		vo.setpCode(deleteCode);
		
		int flag = covidService.doDelete(vo);
		
		LOG.debug("vvvvvvvvvvv");
		//메시지 처리
		MessageVO message = new MessageVO();
		message.setMsgId(flag+""); 	//String으로 변환		msgId아이디에는 flag값만 넣음 
		//성공
		if(flag ==1) {
			message.setMsgMsg(vo.getpName() + "이 삭제되었습니다.");
		//실패
		} else {
			message.setMsgMsg(vo.getpName() + "이 삭제실패하였습니다.");
		}
		
		//Json은 결국 toString을 형식에 맞게 변환시킨것(라이브러리는 로직이 검증된것임)
		//JSON:자바스크립트 오브젝트 생성규칙		(자기페이지에서 변화시키기 위한것임 @ResponseBody produces = "application/json; charset=UTF-8" 필요)
		Gson gson = new Gson();
		String json =gson.toJson(message);
		
		LOG.debug("1.3===============");
		LOG.debug("1.3=json=" + json);
		LOG.debug("1.3===============");
		
		return json;
		
	}
	
	@RequestMapping(value = "covid/do_mail.spring", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doMail(HttpServletRequest req, RxJoinVO vo, Model model) {
		HttpSession session=req.getSession();
		String id = (String) session.getAttribute("login");
		
		String parmName = req.getParameter("parmName");
		String parmCode= req.getParameter("parmCode");
		//session아이디 값 wogns 가정, pcode필요
		
//		LOG.debug("1111111111111" + parmName);
//		LOG.debug("1111111111111" + parmCode);
		vo = new RxJoinVO();
		vo.setMemberId(id);
		vo.setpName(parmName);
		vo.setpCode(parmCode);
		
		RxJoinVO mailVO = (RxJoinVO) covidService.doSelectOne(vo);
		LOG.debug("list-----"+ list);
		LOG.debug("mailVO--"+ mailVO);

//		//api에서 remain stat을 찾아야함
		//개인이 등록한 약국이므로 중복될수 없음
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getpName().equals(mailVO.getpName())) {
				mailVO.setMemberId(list.get(i).getMemberId());
				mailVO.setpCode(list.get(i).getpCode());
				mailVO.setpName(list.get(i).getpName());
				mailVO.setpAddr(list.get(i).getpAddr());
				mailVO.setpLng(list.get(i).getpLng());
				mailVO.setpLat(list.get(i).getpLat());
				mailVO.setpRemainStat(list.get(i).getpRemainStat());
			}
		}
		
		LOG.debug("mailVO" + mailVO);
		//mail send
		String mailMessage = covidService.sendEmail(mailVO);
		LOG.debug("ssss"+mailMessage);
		
		int index = mailMessage.indexOf("님");
		String mailId = mailMessage.substring(0, index);
		LOG.debug(mailId);
		
		
		int flag = 0;
		//약국에게서 메일을 제대로 받은경우
		if(mailId.equals(mailVO.getMemberId())) {
			flag = 1;
		} 
		
		//메시지 처리
		MessageVO message = new MessageVO();
		message.setMsgId(flag+""); 	//String으로 변환		msgId아이디에는 flag값만 넣음 
		//성공
		if(flag ==1) {
			message.setMsgMsg(vo.getMemberId() +"님 메일로 " + vo.getpName() + "의 재고 현황을 전송했습니다.");
		//실패
		} else {
			message.setMsgMsg(vo.getMemberId() +"님메일로 " + vo.getpName() + "의 재고 현황을  전송실패했습니다.");
		}
		
		//Json은 결국 toString을 형식에 맞게 변환시킨것(라이브러리는 로직이 검증된것임)
		//JSON:자바스크립트 오브젝트 생성규칙		(자기페이지에서 변화시키기 위한것임 @ResponseBody produces = "application/json; charset=UTF-8" 필요)
		Gson gson = new Gson();
		String json =gson.toJson(message);
		
		LOG.debug("1.3===============");
		LOG.debug("1.3=json=" + json);
		LOG.debug("1.3===============");
		
		return json;
		
	}
	
	@RequestMapping(value = "covid/go_mypage.spring", method = RequestMethod.POST)
	public String goMypage(HttpServletRequest req, RxJoinVO vo, Model model) {
		HttpSession session=req.getSession();
		String id = (String) session.getAttribute("login");
		
		String url = "covid/covid_mypage";
		
		//session아이디 값 wogns 가정
		vo = new RxJoinVO();
		vo.setMemberId(id);
		List<RxJoinVO> pList = (List<RxJoinVO>) covidService.doRetrieve(vo);
		
		CovidUserVO memberVO = new CovidUserVO();
		memberVO.setMemberId(id);
		memberVO = (CovidUserVO) covidService.doSelectOneUser(memberVO);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("pList", pList);
		
		return url;
	}
	
	
	/**
	 * email 보내기전 약국 검색기능
	 * @param req
	 * @param vo
	 * @param model
	 * @return
	 * @throws JSONException
	 * @throws IOException
	 */
	@RequestMapping(value = "covid/do_retrieve.spring",method = RequestMethod.GET)
	public String doRetrieve(HttpServletRequest req, CovidParmVO vo, Model model) throws JSONException, IOException {
		HttpSession session=req.getSession();
		String id = (String) session.getAttribute("login");
		
		String url = "covid/covid_index";
		
		String currentLng = req.getParameter("lng");
		String currentLat = req.getParameter("lat");
	
//		String currentLat="37.544169";	//나중에 주소 api검색시 값을 받아 저장 default=쌍용 
//		String currentLng="127.049948";
		JSONObject json1 = covidService.readJsonFromUrl("https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat="+currentLat+"&lng="+currentLng+"&m=10000");
		JsonParser parser=new JsonParser();
        JsonObject jsonObj=(JsonObject)parser.parse(json1.toString());
        JsonArray memberArray=(JsonArray)jsonObj.get("stores");
        
        
        
        list = new ArrayList<CovidParmVO>();
        for(int i=0; i<memberArray.size(); i++) {
        	vo = new CovidParmVO();
        	JsonObject object=(JsonObject)memberArray.get(i);
        
        	//null을 문자로 만들어서 check용
        	String remainStatNull = String.valueOf(object.get("remain_stat"));//현재 null들어옴
        	String stockAtNull =  String.valueOf(object.get("stock_at"));//현재 null들어옴
        	String codeNull = String.valueOf(object.get("code"));
        	String nameNull = String.valueOf(object.get("name"));
        	String addrNull = String.valueOf(object.get("addr"));
        	String lngNull = String.valueOf(object.get("lng"));
        	String latNull = String.valueOf(object.get("lat"));
        	
        	if(remainStatNull.equals("null") || stockAtNull.equals("null") || codeNull.equals("null") || nameNull.equals("null") ||
        			addrNull.equals("null") || lngNull.equals("null") || latNull.equals("null") ){
        		String getCode ="";
        		if(String.valueOf(object.get("code").toString().charAt(0)).equals("\"")) {
        			int codeEndpoint= object.get("code").toString().lastIndexOf("\"");
        				getCode = object.get("code").toString().substring(1, codeEndpoint);
        		} else {
        				getCode = object.get("code").toString();
        		}
        		
            	int nameEndpoint= object.get("name").toString().lastIndexOf("\"");//api 뿌려지는 value값이  ""로 싸여있므로 짜름
            	int addrEndpoint= object.get("addr").toString().lastIndexOf("\"");
            	int typeEndpoint= object.get("type").toString().lastIndexOf("\"");
            	String getName = object.get("name").toString().substring(1, nameEndpoint);
            	String getAddr = object.get("addr").toString().substring(1, addrEndpoint);
            	//String getType = object.get("type").toString().substring(1, typeEndpoint); 약국이면 "01"

            	double getLng = Double.valueOf(object.get("lng").toString());
            	double getLat = Double.valueOf(object.get("lat").toString());
            	
             	//임의로 한명 회원아아디 setting
            	vo.setMemberId(id);
            	vo.setpCode(getCode);
            	vo.setpName(getName);
            	vo.setpAddr(getAddr);
            	vo.setpLng(getLng);
            	vo.setpLat(getLat);
            	vo.setpRemainStat("empty");		//또는 empty로 변경, break를 empty로 변경(어차피 없는것이므로
        	} else {
        		//api에서 뿌려주는 code값이 ""으로 쌓여있을때도 있고 아닐때도 있으므로 null check
        		String getCode ="";
        		if(String.valueOf(object.get("code").toString().charAt(0)).equals("\"")) {
        			int codeEndpoint= object.get("code").toString().lastIndexOf("\"");
        				getCode = object.get("code").toString().substring(1, codeEndpoint);
        		} else {
        				getCode = object.get("code").toString();
        		}
            	int nameEndpoint= object.get("name").toString().lastIndexOf("\"");
            	
            	//나중에 필요하면 null체크하고 쓰면됨
//            	int stockAtEndpoint= object.get("stock_at").toString().lastIndexOf("\"");
//            	int createdAtEndpoint= object.get("created_at").toString().lastIndexOf("\"");
            	int addrEndpoint= object.get("addr").toString().lastIndexOf("\"");
            	//int typeEndpoint= object.get("type").toString().lastIndexOf("\""); 
            	int remainStatEndpoint= object.get("remain_stat").toString().lastIndexOf("\"");
            	
            	
            	String getName = object.get("name").toString().substring(1, nameEndpoint);
//            	String getStockAt = object.get("stock_at").toString().substring(1, stockAtEndpoint);
//            	String getCreatedAt = object.get("created_at").toString().substring(1, createdAtEndpoint);
            	String getAddr = object.get("addr").toString().substring(1, addrEndpoint);
            	//String getType = object.get("type").toString().substring(1, typeEndpoint);
            	String getRemainStat = object.get("remain_stat").toString().substring(1, remainStatEndpoint);
            	double getLng = Double.valueOf(object.get("lng").toString());
            	double getLat = Double.valueOf(object.get("lat").toString());
            	//임의로 한명 회원아아디 setting
            	vo.setMemberId(id);
            	vo.setpCode(getCode);
            	vo.setpName(getName);
            	vo.setpAddr(getAddr);
            	vo.setpLng(getLng);
            	vo.setpLat(getLat);
            	vo.setpRemainStat(getRemainStat);
        	}
        	
        	System.out.println("출력값확인 "+vo);
        	list.add(vo);
        	
        }
        
        CovidUserVO memberVO = new CovidUserVO();
		memberVO.setMemberId(id);
		memberVO = (CovidUserVO) covidService.doSelectOneUser(memberVO);
		
		model.addAttribute("memberVO", memberVO);
        
        //System.out.println(list);
        model.addAttribute("currentLng", currentLng);
        model.addAttribute("currentLat", currentLat);
        model.addAttribute("list",list);
		
		return url;
	}
	
	@RequestMapping(value = "covid/do_insert.spring",method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doSelectOne(HttpServletRequest req, RxJoinVO vo, Model model) {
		
		String searchlng = req.getParameter("searchlng");
		String searchlat = req.getParameter("searchlat");
		Double lng = Double.valueOf(searchlng);
		Double lat = Double.valueOf(searchlat);
		
		
		LOG.debug("1===============");
		LOG.debug("1==============="+ list);
		LOG.debug("1==============="+ lng);
		LOG.debug("1==============="+ lat);
		LOG.debug("1===============");
		
		vo = new RxJoinVO();
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getpLng() == lng &&  list.get(i).getpLat() == lat) {
				LOG.debug("관심약국"+list.get(i));
				vo.setMemberId(list.get(i).getMemberId());
				vo.setpCode(list.get(i).getpCode());
				vo.setpName(list.get(i).getpName());
				vo.setpAddr(list.get(i).getpAddr());
				vo.setpLng(list.get(i).getpLng());
				vo.setpLat(list.get(i).getpLat());
				vo.setpRemainStat(list.get(i).getpRemainStat());
			}
		}
		//ID가 wogns이라는 가정하에 진행, 
		List<RxJoinVO> checkCntList= (List<RxJoinVO>) covidService.doRetrieve(vo);

		int cnt = 0;			//제한횟수 count
		boolean bool = false;	//등록여부확인 
		for(int i=0; i<checkCntList.size();i++) {
			//널은 나중에 제외(회원가입을 하고 들어올것이므로)
			if((vo.getMemberId() == null || "".equals(vo.getMemberId())) ||
					(checkCntList.get(i).getMemberId().equals(vo.getMemberId()) && checkCntList.get(i).getpCode().equals(vo.getpCode()))) {
				bool = true;
				break;
			} else if(checkCntList.get(i).getMemberId().equals(vo.getMemberId())) {
				cnt++;
			}
		}
		
		int flag = 0;
		if(cnt<6 && bool == false) {
			flag = covidService.doRxInsert(vo);
		} 
		
		LOG.debug("1.2===============");
		LOG.debug("1.2=flag=" + flag);
		LOG.debug("1.2===============");
		
		//메시지 처리
		MessageVO message = new MessageVO();
		message.setMsgId(flag+""); 	//String으로 변환		msgId아이디에는 flag값만 넣음 
		//성공
		if(flag ==1) {
			message.setMsgMsg(vo.getpName() + "이 관심약국으로 등록되었습니다.");
		//실패
		} else if(bool == true && cnt<6){
			message.setMsgMsg("이미 등록되어 있는 관심약국입니다.");
		} else if(cnt>=6){
			message.setMsgMsg("관심약국등록 제한횟수를 초과했습니다.");
		} 
		
		
		Gson gson = new Gson();
		String json =gson.toJson(message);
		
		LOG.debug("1.3===============");
		LOG.debug("1.3=json=" + json);
		LOG.debug("1.3===============");
		
		return json;
	}
	
	
}
