package com.sist.spring.covid;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import com.sist.spring.cmn.DTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
								   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
									})
public class CovidDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	WebApplicationContext webApplicationContext;
	
	@Autowired
	CovidDao covidDao;
	
	CovidUserVO user01;
	CovidUserVO user02;
	CovidUserVO user03;
	
	CovidParmVO parm01;
	CovidParmVO parm02;
	CovidParmVO parm03;
	
	RxJoinVO join01;
	RxJoinVO join02;
	RxJoinVO join03;
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("===================");
		LOG.debug("=webApplicationContext=" + webApplicationContext);
		LOG.debug("===================");
		
		user01 = new CovidUserVO("wogns01","1234","wogns_01@naver.com","010-4348-3314");
		user02 = new CovidUserVO("wogns02","1234","wogns_02@naver.com","010-4348-3314");
		user03 = new CovidUserVO("wogns03","1234","wogns_03@naver.com","010-4348-3314");
		
		parm01 = new CovidParmVO("wogns01", "111111", "1약국", "서울시 성동구1", 127.4845, 38.484, "plenty");
		parm02 = new CovidParmVO("wogns01", "222222", "2약국", "서울시 성동구1", 127.4845, 38.484, "plenty");
		parm03 = new CovidParmVO("wogns01", "333333", "3약국", "서울시 성동구1", 127.4845, 38.484, "plenty");
		
		join01 = new RxJoinVO("wogns01", "111111", "1약국", "서울시 성동구1", 127.4845, 38.484, "plenty", "wogns_01@naver.com");
		join02 = new RxJoinVO("wogns01", "222222", "2약국", "서울시 성동구1", 127.4845, 38.484, "plenty", "wogns_01@naver.com");
		join03 = new RxJoinVO("wogns01", "333333", "3약국", "서울시 성동구1", 127.4845, 38.484, "plenty", "wogns_01@naver.com");
		
	}

	@After
	public void tearDown() throws Exception {
		LOG.debug("===================");
		LOG.debug("tearDown()");
		LOG.debug("===================");
	}

	@Test
//	@Ignore
	public void doInsert() {
		//Covid User 회원가입
		
		covidDao.doDeleteUser(user01);
		covidDao.doDeleteUser(user02);
		covidDao.doDeleteUser(user03);
		
		int flag = covidDao.doInsert(user01);
		flag += covidDao.doInsert(user02);
		flag += covidDao.doInsert(user03);
		
		assertThat(flag, is(3));
	}
	
	@Test
//	@Ignore
	public void doRxInsert() {
		covidDao.doDelete(parm01);
		covidDao.doDelete(parm02);
		covidDao.doDelete(parm03);
		//약국 등록
		int flag = covidDao.doRxInsert(join01);
		flag += covidDao.doRxInsert(join02);
		flag += covidDao.doRxInsert(join03);
		
		assertThat(flag, is(3));
	}
	
	@Test
//	@Ignore
	public void doDelete() {
		int flag =covidDao.doDelete(parm01);
		flag += covidDao.doDelete(parm02);
		flag += covidDao.doDelete(parm03);
		
		assertThat(flag, is(3));
	}
	
	@Test
//	@Ignore
	public void doSelectOne() {
		covidDao.doDelete(parm01);
		int flag = covidDao.doRxInsert(join01);
		assertThat(flag, is(1));
		
		RxJoinVO vsVO = (RxJoinVO) covidDao.doSelectOne(join01);
		
		CheckSameUser(vsVO.getMemberId(), join01.getMemberId());
		
	}
	
	@Test
	public void doSelectOneUser() {
		covidDao.doSelectOneUser(user01);
		
		CheckSameUser("wogns01", user01.getMemberId());
		
	}
	
	
	@Test
//	@Ignore
	public void doRetrieve() {
		covidDao.doDelete(parm01);
		covidDao.doDelete(parm02);
		covidDao.doDelete(parm03);
		
		int flag = covidDao.doRxInsert(join01);
		flag += covidDao.doRxInsert(join02);
		flag += covidDao.doRxInsert(join03);
		
		assertThat(flag, is(3));
		
		//wogns이 01이 관심약국으로 선택한 리스트
		List<RxJoinVO> list = (List<RxJoinVO>) covidDao.doRetrieve(join01);
		
		for(RxJoinVO vo :list) {
			LOG.debug(vo+"");
		}
		
		assertThat(list.size(), is(3));
		
	}
	
	
	public void CheckSameUser(String orgVO, String vsVO) {
		assertTrue(orgVO.equals(vsVO));
	}
	
	@Test
//	@Ignore
	public void test() {
		LOG.debug("===================");
		LOG.debug("test()");
		LOG.debug("===================");
	}

}
