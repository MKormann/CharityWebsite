package main.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import user.model.UserLoginForm;

/*
 * Controller class for basic navigation not involving anything from a user account
 */

@Controller
public class NavController {

	private static final Logger logger = Logger.getLogger(UserController.class);

	/*
	 * Mapping for main welcome page
	 */
	@RequestMapping(value= { "/", "welcome"}, method = RequestMethod.GET)
	public String viewWelcome(Map<String, Object> model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
		  System.out.println(((UserDetails)principal).getUsername());
		} 
		else { System.out.println("No user currently"); };
		
		return "welcome";
	}

	/* 
	 * Mapping for about page
	 */
	@RequestMapping(value= "about", method = RequestMethod.GET)
	public String viewAbout(Map<String, Object> model) {
		return "about";
	}
	
	/* 
	 * Mapping for donations page
	 */
	@RequestMapping(value= "partners", method = RequestMethod.GET)
	public String viewDonations(Map<String, Object> model) {
		return "partners";
	}

	/* 
	 * Mapping for contact page
	 */
	@RequestMapping(value= "contact", method = RequestMethod.GET)
	public String viewContact(Map<String, Object> model) {
		return "contact";
	}
	
}
