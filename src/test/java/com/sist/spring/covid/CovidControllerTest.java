package com.sist.spring.covid;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
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
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
								   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
									})
public class CovidControllerTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	WebApplicationContext webApplicationContext;
	
	private List<CovidParmVO> parmList;
	
	private List<CovidUserVO> userList;
	
	@Autowired
	CovidService covidService;
	
	@Autowired
	MockHttpSession mockSession;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("===================");
		LOG.debug("test()");
		LOG.debug("===================");
		
		parmList = Arrays.asList(
					new CovidParmVO("wogns01", "111111", "1약국", "서울시 성동구1", 127.4845, 38.484, "plenty")
					,new CovidParmVO("wogns01", "222222", "2약국", "서울시 성동구1", 127.4845, 38.484, "plenty")
					,new CovidParmVO("wogns01", "333333", "3약국", "서울시 성동구1", 127.4845, 38.484, "plenty")
				); 
		LOG.debug("parmList" + parmList);
		userList = Arrays.asList(
					new CovidUserVO("wogns01","1234","wogns_01@naver.com","010-4348-3314")
					,new CovidUserVO("wogns02","1234","wogns_02@naver.com","010-4348-3314")
					,new CovidUserVO("wogns03","1234","wogns_03@naver.com","010-4348-3314")
			); 
		
		
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		LOG.debug("===============");
		LOG.debug("=webApplicationContext=" + webApplicationContext);
		LOG.debug("mockMvc=" + mockMvc);
		LOG.debug("=covidService="+covidService);
		LOG.debug("===============");
	
	}

	@Test
	@Ignore
	public void doDelete() throws Exception {
		mockSession.setAttribute("id", parmList.get(0).getMemberId());
		
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/covid/do_delete.spring")
				.param("deleteCode", parmList.get(0).getpCode())
				//세션 ID는 Controller에서 받을 것이므로 이 테스트 코드는 Dao에서 오류 - 약국 코드만 넘어가는것 확인
				;
		ResultActions resultActions = mockMvc.perform(createMessage)
				.andExpect(status().is2xxSuccessful())
				.andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
				.andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is(1)))
				;
		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		
		LOG.debug("===============");
		LOG.debug("=resultActions=" + resultActions);
		LOG.debug("=result=" + result);
		LOG.debug("===============");
		
	}
	
	@Test
//	@Ignore
	public void doLogin() throws Exception {
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/covid/do_login.spring")
				.param("memberId", userList.get(0).getMemberId())
				.param("password", userList.get(0).getPassWord())
				;
		ResultActions resultActions = mockMvc.perform(createMessage)
				.andExpect(status().is2xxSuccessful())
				.andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
				.andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is("1")))
				;
		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		
		LOG.debug("===============");
		LOG.debug("=resultActions=" + resultActions);
		LOG.debug("=result=" + result);
		LOG.debug("===============");
		
	}
	
	@Test
//	@Ignore
	public void doSignUp() throws Exception {
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/covid/do_sign_up.spring")
				.param("memberId", userList.get(0).getMemberId())
				.param("password", userList.get(0).getPassWord())
				.param("email", userList.get(0).getEmail())
				.param("phone1", userList.get(0).getPhone().substring(0, 3))
				.param("phone2", userList.get(0).getPhone().substring(4, 8))
				.param("phone3", userList.get(0).getPhone().substring(9, 13))
				;
		ResultActions resultActions = mockMvc.perform(createMessage)
				.andExpect(status().is2xxSuccessful())
				.andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
				.andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is("1")))
				;
		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		
		LOG.debug("===============");
		LOG.debug("=resultActions=" + resultActions);
		LOG.debug("=result=" + result);
		LOG.debug("===============");
		
	}
	
	@Test
	@Ignore
	public void doMail() throws Exception {
		MockHttpServletRequestBuilder createMessage = MockMvcRequestBuilders.post("/covid/do_mail.spring")
				.param("parmName", String.valueOf(parmList.get(0).getpName()))
				.param("parmCode", String.valueOf(parmList.get(0).getpCode()))
				//세션 ID는 Controller에서 받을 것이므로 이 테스트 코드는 Dao에서 오류 - 약국 코드와 약국이름만 넘어가는것 확인
				;
		ResultActions resultActions = mockMvc.perform(createMessage)
				.andExpect(status().is2xxSuccessful())
				.andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
				.andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is(1)))
				;
		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		
		LOG.debug("===============");
		LOG.debug("=resultActions=" + resultActions);
		LOG.debug("=result=" + result);
		LOG.debug("===============");
		
	}
	
	
	@After
	public void tearDown() throws Exception {
		LOG.debug("===================");
		LOG.debug("tearDown()");
		LOG.debug("===================");
	}

	@Test
	@Ignore
	public void test() {
		LOG.debug("===================");
		LOG.debug("test()");
		LOG.debug("===================");
	}

}
