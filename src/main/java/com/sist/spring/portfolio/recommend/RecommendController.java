package com.sist.spring.portfolio.recommend;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


public class RecommendController {
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:/Users/user/git/springPro/springPro/src/main/webapp/selenium/chromedriver_win32/chromedriver.exe";
    
    private String base_url;
	

    //WebDriver
    private WebDriver driver;
    
	@RequestMapping(value="portfolio/recommend.spring", method=RequestMethod.GET)
	public String scrappingMethod(Model model) {
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        
        //Driver SetUp
        driver = new ChromeDriver();
        base_url = "http://www.jobkorea.co.kr/Search/?stext=웹개발";
        
	    
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
