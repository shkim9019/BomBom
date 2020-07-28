package com.sist.spring.portfolio.license;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.List;

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

import com.sist.spring.cmn.SearchVO;



@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
									"file:src/main/webapp/WEB-INF/spring/root-context.xml",
									"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class LicenseDaoTest {
	private final Logger LOG = LoggerFactory.getLogger(LicenseDaoTest.class);

	@Autowired
	WebApplicationContext webApplicationContext;
	
	LicenseVO lic01;
	LicenseVO lic02;
	LicenseVO lic03;
	
	@Autowired
	LicenseDao dao;
	
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		LOG.debug("webApplicationContext= "+webApplicationContext);
		LOG.debug("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		
		lic01 = new LicenseVO("정보처리기사","국가기술자격","기사","12345678910A","20200506","서울대학교발전기금TEPS관리위원회","iod1124");
		lic02 = new LicenseVO("TOEIC","외국","기능사","12345678910A","20200505","서울대학교발전기금TEPS관리위원회","iod1124");
		lic03 = new LicenseVO("컴활","자격","1급","12345678910A","20200504","서울대학교발전기금TEPS관리위원회","iod1124");
		
		LOG.debug("===========================");
		LOG.debug("LicenseDao=" +dao);
		LOG.debug("===========================");
		
	}
	
	@Test
	@Ignore
	public void doInsert() {
		//삭제
		dao.doDelete(this.lic01);
//		dao.doDeleteLicense(lic01);
//		dao.doDeleteLicense(lic02);
//		dao.doDeleteLicense(lic03);
		
		//3건추가
		int flag = dao.doInsert(lic01);
		flag+=dao.doInsert(lic02);
		flag+=dao.doInsert(lic03);
		
	}
	
	
	@Test
	@Ignore
	public void doUpdate() {
		dao.doDelete(this.lic01);
		
		int flag = dao.doInsert(lic01);
		assertThat(flag, is(1));	
		
		lic01.setlGrade(lic01.getlGrade()+"_u");
		lic01.setlGroup(lic01.getlGroup()+"_u");
		
		flag = dao.doUpdate(lic01);
		assertThat(flag,is(1));
		
		LicenseVO vsVO = (LicenseVO) dao.doSelectOne(lic01);
		
		LOG.debug("===========================");
		LOG.debug("vsVO ="+vsVO);
		LOG.debug("===========================");
	}
	
	@Test
	public void doRetrieve() {
		//삭제
		//---------------------------------------
		//-삭제
		//---------------------------------------		
		dao.doDelete(this.lic01);		
		//3건 추가
		int flag = dao.doInsert(lic01);
		flag+=dao.doInsert(lic02);
		flag+=dao.doInsert(lic03);
		
		assertThat(flag, is(3));		
		//검색
		List<LicenseVO>  list = (List<LicenseVO>) dao.doRetrieve(lic01);
		
		for(LicenseVO outVO:list) {
			LOG.debug(outVO.toString());
		}
		
		assertThat(list.size(), is(3));
		
	}
}
