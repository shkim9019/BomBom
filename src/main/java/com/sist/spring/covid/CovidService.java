/**
 *<pre>
 * com.sist.spring.covid
 * Class Name : CovidService.java
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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import com.sist.spring.cmn.DTO;
import com.sist.spring.cmn.Service;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * @author 82104
 *
 */
@org.springframework.stereotype.Service
public class CovidService implements Service {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	public CovidService() {}
	
	@Autowired
	private CovidDao covidDao;
	
	@Autowired						//id값을 넣어주면 이객체가 들어온다. 같은 인터페이스 참조할때
	@Qualifier("mailSender")		//root-context.xml의 bean의 id값을 주면 그 객체 사용하는것임(dummyMailSender주면 그거 작동)
	private MailSender mailSender;
	
	
	
	public DTO doSelectOneUser(DTO dto) {
		return covidDao.doSelectOneUser(dto);
	}
	
	public int doRxInsert(DTO dto) {
		return covidDao.doRxInsert(dto);
	}
	
	@Override
	public int doInsert(DTO dto) {
		return covidDao.doInsert(dto);
	}
	
	@Override
	public int doUpdate(DTO dto) {
		return covidDao.doUpdate(dto);
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		return covidDao.doSelectOne(dto);
	}

	@Override
	public int doDelete(DTO dto) {
		return covidDao.doDelete(dto);
	}

	public int doDeleteUser(DTO dto) {
		return covidDao.doDeleteUser(dto);
	}
	
	@Override
	public List<?> doRetrieve(DTO dto) {
		return covidDao.doRetrieve(dto);
	}
	
	//Json URL 호출 
	public String readAll(Reader rd) throws IOException {
      StringBuilder sb = new StringBuilder();
      int cp;
      while ((cp = rd.read()) != -1) {
        sb.append((char) cp);
      }
      return sb.toString();
    }
		
	//호출할 json URL 입력(시작메소드)
    public JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
      InputStream is = new URL(url).openStream();
      try {
        BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
        String jsonText = readAll(rd);
        JSONObject json = new JSONObject(jsonText);
        return json;
      } finally {
        is.close();
      }
    }
    
    
	public String sendEmail(RxJoinVO vo) {
		String message = "";
		
		String recipient = vo.getEmail();//받는사람
		String title = vo.getMemberId() + "님의 관심약국으로 선정하신 것에 약국에 대해 안내드립니다."; //제목
		String contents = vo.getMemberId() + "님의 관심약국으로 선정하신 \n"+vo.getpName()+"의 수량 상태는 " + vo.getpRemainStat()+" 입니다.";//내용 
		
		//-----------------------------------
		//Message에 받는사람,제목,내용,인증 세팅 후 전송
		//전송: Java
		//-----------------------------------
		
		SimpleMailMessage mimeMessage = new SimpleMailMessage();//세션이 없음, xml에서 만듬
	
		mimeMessage.setFrom("wog20@naver.com");//보내는 사람  ex(관리자)
		mimeMessage.setTo(recipient);//받는사람
		mimeMessage.setSubject(title);//제목
		mimeMessage.setText(contents);//내용
		
		
		//전송
		mailSender.send(mimeMessage);
		
		
		
		message = mimeMessage.getText();
		
		return message;
		
	}
    

}
