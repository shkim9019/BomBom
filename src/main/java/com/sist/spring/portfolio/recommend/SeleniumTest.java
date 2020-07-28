package com.sist.spring.portfolio.recommend;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumTest {
	 public static void main(String[] args) {
		 
	        SeleniumTest selTest = new SeleniumTest();
	        selTest.crawl();
	        
	    }
	 
	    
	    //WebDriver
	    private WebDriver driver;
	    
	    //Properties
	    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	    public static final String WEB_DRIVER_PATH = "C:/Users/sist/git/springPro/springPro/src/main/webapp/selenium/chromedriver_win32/chromedriver.exe";
	       
	    //크롤링 할 URL
	    private String base_url;
	    
	    public SeleniumTest() {
	        super();
	 
	        //System Property SetUp
	        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	        
	        //Driver SetUp
	        driver = new ChromeDriver();
	        base_url = "http://www.jobkorea.co.kr/Search/?stext=java";
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

