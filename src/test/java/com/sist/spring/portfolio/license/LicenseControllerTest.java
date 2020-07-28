/**
 *<pre>
 * com.sist.spring.portfolio.license
 * Class Name : LicenseControllerTest.java
 * Description : 
 * Modification Information
 * 
 *   수정일      수정자              수정내용
 *  ---------   ---------   -------------------------------
 *  2020-05-17           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2020-05-17 
 * @version 1.0
 * 
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 * </pre>
 */
package com.sist.spring.portfolio.license;

import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.sist.spring.cmn.MessageVO;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

/**
 * @author 82107
 *
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",	//파일의 물리적인 위치를 상대경로로
								   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
								  })
public class LicenseControllerTest {
	
private final Logger LOG = LoggerFactory.getLogger(LicenseControllerTest.class);
	
	@Autowired
	WebApplicationContext webApplicationContext;
	
	private List<LicenseVO> lics;
	
	@Autowired
	LicenseService licService;
	
	private MockMvc mockMvc;
	
	
	@Before
	public void setUp() {
		LOG.debug("=============================");
		LOG.debug("======setUp()========");
		LOG.debug("=============================");
		
		lics = Arrays.asList(
				 new LicenseVO("정보처리기사","국가기술자격","기사","12345678910A","20200506","서울대학교발전기금TEPS관리위원회","iod1124")  
				,new LicenseVO("TOEIC","외국","기능사","12345678910A","20200505","서울대학교발전기금TEPS관리위원회","iod1124")      
				,new LicenseVO("컴활","자격","1급","12345678910A","20200504","서울대학교발전기금TEPS관리위원회","iod1124")          
				,new LicenseVO("자격증","민간","기사","987654321b","20200503","큐넷","iod1124")
				,new LicenseVO("자격증이다만","허허","기사따자","213adf","20200403","기관","iod1124")
				);
		
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		
		LOG.debug("=====================================");
		LOG.debug("webApplicationContext="+webApplicationContext);
		LOG.debug("mockMvc="+mockMvc);
		LOG.debug("licService="+licService);
		LOG.debug("=====================================");
	}
	
	@Test
	public void add() throws Exception {
		
		for(LicenseVO lic:lics) {
			add(lic);
		}
	}
	
	@Test
	@Ignore
	public void doDeleteLicense() throws Exception {
		for(LicenseVO lic:lics) {
			doDeleteLicense(lic);
		}	
		
	}
	
	
//	@Test
//	public void doUpdate() throws Exception{
//		LOG.debug("==============================");
//		LOG.debug("1. 삭제");
//		LOG.debug("==============================");
//		
//		for(LicenseVO lic:lics) {
//			doDeleteLicense(lic);
//		}
//		
//		LOG.debug("==============================");
//		LOG.debug("2. 등록");
//		LOG.debug("==============================");
//		
//		for(LicenseVO lic:lics) {
//			add(lic);
//		}
//		
//		LOG.debug("==============================");
//		LOG.debug("3. 수정");
//		LOG.debug("==============================");
//		
//		for(LicenseVO lic:lics) {
//			String one = doUpdate(lic);
//			assertThat(one, is("1"));
//		}
//		
//	}
	
	//단건조회
	@Test
	@Ignore
	public void doSelectOne() throws Exception {
		//url+param
		MockHttpServletRequestBuilder  createMesage 
		           = MockMvcRequestBuilders.get("/portfolio/go_update.spring")
		             .param("memberId", lics.get(0).getMemberId());		
		
		//MediaType.APPLICATION_JSON_UTF8 ==application/json;charset=UTF-8
		ResultActions  resultActions = mockMvc.perform(createMesage)
			.andExpect(status().is2xxSuccessful())	
		    ;
				
		String result = resultActions.andDo(print())
				.andReturn()
				.getResponse().getContentAsString();
		LOG.debug("=====================");
		LOG.debug("=result="+result);
		LOG.debug("=====================");  		
		
		
	}
	
	
	private String add(LicenseVO lic) throws Exception {
		MockHttpServletRequestBuilder createMessage = 
				MockMvcRequestBuilders.post("/portfolio/license_insert_test.spring")
				.param("memberId", lic.getMemberId())
				.param("lName", lic.getlName())
				.param("lGroup", lic.getlGroup())
				.param("lGrade", lic.getlGrade())
				.param("lDate", lic.getlDate())
				.param("lNum", lic.getlNum())
				.param("lOrgan", lic.getlOrgan())
				;
		
		ResultActions  resultActions =mockMvc.perform(createMessage)
				       .andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
				       .andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is("1")))
				;
		String result = resultActions.andDo(print())
						.andReturn()
						.getResponse().getContentAsString();
		//Json String to UserVO
		Gson gson=new Gson();
		MessageVO outVO =gson.fromJson(result, MessageVO.class);
		
		LOG.debug("=====================");
		LOG.debug("=outVO="+outVO);
		LOG.debug("=====================");			
		LOG.debug("=====================");
		LOG.debug("=result="+result);
		LOG.debug("=====================");  
		
		return outVO.getMsgId();
	}
	
	
//	private String doUpdate(LicenseVO lic) throws Exception{
//		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/portfolio/do_update.spring")
//														.param("memberId", lics.get(0).getMemberId())
//														.param("lName", lics.get(0).getlName())
//														.param("lGroup", lics.get(0).getlGroup()+"_u")
//														.param("lGrade", lics.get(0).getlGrade()+"_u")
//														.param("lDate", lics.get(0).getlDate()+"_u")
//														.param("lNum", lics.get(0).getlNum()+"_u")
//														.param("lOrgan", lics.get(0).getlOrgan()+"_u")
//														;
//				
//		
//		//결과값
//		ResultActions resultActions=mockMvc.perform(createMessage)
//		.andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
//		.andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is("1")));	//msgId=1이면 성공
//		
//		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
//		
//		//Json String to UserVO
//        Gson gson=new Gson();
//        MessageVO outVO =gson.fromJson(result, MessageVO.class);
//        
//		LOG.debug("=========================");
//		LOG.debug("outVO="+outVO);
//		LOG.debug("=========================");
//		
//		LOG.debug("=========================");
//		LOG.debug("result="+result);
//		LOG.debug("=========================");
//		
//		return outVO.getMsgId();
//	}
	
	private void doDeleteLicense(LicenseVO lic) throws Exception{
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/portfolio/do_delete_license.spring")
														.param("memberId", lic.getMemberId())
														.param("lName", lic.getlName());
				
		
		//결과값
		ResultActions resultActions=mockMvc.perform(createMessage)
				.andExpect(MockMvcResultMatchers.content().contentType("application/json; charset=UTF-8"))
				.andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is("1")));	//msgId=1이면 성공
		
		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		
		LOG.debug("=========================");
		LOG.debug("result="+result);
		LOG.debug("=========================");
		
	}
	

}
