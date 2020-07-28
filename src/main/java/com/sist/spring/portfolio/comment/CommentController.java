package com.sist.spring.portfolio.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.net.HttpHeaders;
import com.google.gson.Gson;
import com.sist.spring.cmn.MessageVO;
import com.sist.spring.cmn.SearchVO;
import com.sist.spring.cmn.StringUtil;
import com.sist.spring.portfolio.member.MemberService;
import com.sist.spring.portfolio.member.MemberVO;
import com.sist.spring.portfolio.member.file.FileMemberVO;


@Controller
public class CommentController {
	private final Logger LOG = LoggerFactory.getLogger(CommentController.class);
	
	//@Qualifier("dummyMailSender") : root-context.xml bean id
	@Autowired
	CommentService commentService;
	
	@Autowired
	MemberService memberService;
	
	
	
	@RequestMapping(value = "comment/do_delete.spring",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doDelete(CommentVO user) {
	String url ="member/index_test";
	LOG.debug("1===================");
	LOG.debug("1=user="+user);
	LOG.debug("1===================");
	
	int flag = 0;
	flag = commentService.doDelete(user);
	
	MessageVO message = new MessageVO();
	message.setMsgId(String.valueOf(flag));
	
	LOG.debug("1.2===================");
	LOG.debug("1.2=flag="+flag); 
	LOG.debug("1.2===================");
	//성공
	if(flag == 1) {
		message.setMsgMsg("삭제 되었습니다.");
	//실패
	}else {
		message.setMsgMsg("삭제 실패.");
	}
	
	//JSON
	Gson gson = new Gson();
	String json = gson.toJson(message);
	LOG.debug("1.3===================");
	LOG.debug("1.3=json="+json); 
	LOG.debug("1.3===================");
	
	
	return json;
	
	}
	
	
	@RequestMapping(value = "comment/do_update.spring",method = RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(CommentVO user) {
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("1===================");

		int  flag = commentService.doUpdate(user);
		LOG.debug("1.2===================");
		LOG.debug("1.2=flag="+flag); 
		LOG.debug("1.2===================");

		//메시지 처리
		MessageVO message=new MessageVO();

		message.setMsgId(flag+"");
		//성공
		if(flag ==1) {
			message.setMsgMsg(user.getcNo()+"번이 수정버튼이 클릭되었습니다.");
		//실패	
		}else {
			message.setMsgMsg(user.getcNo()+"님 클릭 실패.");			
		}		

		//JSON
		Gson gson=new Gson();
		String json = gson.toJson(message);

		LOG.debug("1.3===================");
		LOG.debug("1.3=json="+json); 
		LOG.debug("1.3===================");		
		
		return json;

	}
	
	
	
	@RequestMapping(value = "/comment/do_select_one.spring",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doSelectOne(CommentVO user) {
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("1===================");
		
		CommentVO outVO = (CommentVO) commentService.doSelectOne(user);
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
	
	
	
	
	@RequestMapping(value ="comment/do_insert.spring", method = RequestMethod.GET
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(HttpServletRequest req, CommentVO user) {
	HttpSession session=req.getSession();
	MemberVO sessionVO=(MemberVO)session.getAttribute("member");
		
	user.setRegId(sessionVO.getMemberId());
	user.setPortfolioId(req.getParameter("portfolioId")); 		
	LOG.debug("1===================");
	LOG.debug("1=user="+user);
	LOG.debug("1===================");
	
	int  flag = commentService.doInsert(user);
	
	LOG.debug("1.2===================");
	LOG.debug("1.2=flag="+flag); 
	LOG.debug("1.2===================");
	
	//메시지 처리
	MessageVO message=new MessageVO();
	
	message.setMsgId(flag+"");
	//성공
	if(flag ==1) {
		message.setMsgMsg(user.getcContent()+"등록 되었습니다.");
	//실패	
	}else {
		message.setMsgMsg(user.getcContent()+"등록 실패.");			
	}
	
	//JSON
	Gson gson = new Gson();
	String json = gson.toJson(message);
	LOG.debug("1.3===================");
	LOG.debug("1.3=json="+json); 
	LOG.debug("1.3===================");
	
	
	return json;
	}
	
	
	
	@RequestMapping(value = "/comment/do_retrieve.spring", method = RequestMethod.GET)
	public String doRetrieve(HttpServletRequest req, SearchVO search,CommentVO cmtuser, MemberVO user, Model model){
		
		HttpSession session =req.getSession();
		MemberVO sessionVO=(MemberVO) session.getAttribute("member");
		cmtuser.setPortfolioId(req.getParameter("portfolioId"));
	
		
		
		
		LOG.debug("1===================");
		LOG.debug("1=search="+search);
		LOG.debug("1===================");
		   
		//페이지 사이즈
		if(search.getPageSize()==0) {
			search.setPageSize(20);
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
		
		List<CommentVO> list = (List<CommentVO>) commentService.doRetrieve(search);
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
		
//		member/member_mng -> /+member/member_mng+.jsp
		return "portfolio/member/index_test";
	}
	
	
	
//	/**
//     * 게시물 댓글 불러오기(Ajax)
//     * @param boardVO
//     * @param request
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value="/portfolio/commentList.do", produces="application/json; charset=utf8")
//    @ResponseBody
//    public ResponseEntity ajax_commentList(@ModelAttribute("CommentVO") CommentVO commentVO, HttpServletRequest request) throws Exception{
//       
//        HttpHeaders responseHeaders = new HttpHeaders();
//        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
//        
//        // 해당 게시물 댓글
//        List<CommentVO> listCommentVO = (List<CommentVO>) commentService.doRetrieve(commentVO);
//        if(listCommentVO.size() > 0){
//            for(int i=0; i<listCommentVO.size(); i++){
//                HashMap hm = new HashMap();
//                hm.put("c_no", listCommentVO.get(i).getcNo());
//                hm.put("content", listCommentVO.get(i).getcContent());
//                hm.put("member_id", listCommentVO.get(i).getMemberId());
//                
//                hmlist.add(hm);
//            }
//            
//        }
//        
//        JSONArray json = new JSONArray(hmlist);        
//        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
//        
//    }

}
