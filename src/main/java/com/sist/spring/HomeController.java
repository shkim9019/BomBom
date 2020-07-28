
package com.sist.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * 재훈 Commit + 진우 Commit
	 */
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "portfolio/start.spring", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! What Ignore hsgadjhgasdjg{}.", locale); 
		
		
		
		
		
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//Test
		// SJ Commit Test 소현 commit Test5 + 승종커밋2         
		//mj Commit mjcommit22
		//gyu commit 16:14
		//555555544444444gfdgfdgfdgfd
		//666666666666666
		//성연 Commit
		
		return "portfolio/single";
		
		
		
		
	}
	
	@RequestMapping(value = "covid/start.spring", method = RequestMethod.GET)
	public String covid(Locale locale, Model model) {
		logger.info("Welcome home! What Ignore hsgadjhgasdjg{}.", locale); 
		
		
		
		
		
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//Test
		// SJ Commit Test 소현 commit Test5 + 승종커밋2         
		//mj Commit mjcommit22
		//gyu commit 16:14
		//555555544444444gfdgfdgfdgfd
		//666666666666666
		//성연 Commit
		
		return "covid/index";
		
		
		
		
	}
	
}
