package com.sist.spring.portfolio.recommend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class RecommendControllerJsoup {
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:/Users/user/git/springPro/springPro/src/main/webapp/selenium/chromedriver_win32/chromedriver.exe";
    
    private String base_url;
	

    //WebDriver
    private WebDriver driver;
    
	public String scrappingMethod(Model model) {
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
 
        System.out.println("============================================================");
 
		return "recommendJob/recommendJob";
	}
    public void crawl() {
   	 
        try {
            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
            driver.get(base_url);
            System.out.println(driver.getPageSource());
    
        } catch (Exception e) {
            
            e.printStackTrace();
        
        } finally {
 
            driver.close();
        }
 
    }
}
