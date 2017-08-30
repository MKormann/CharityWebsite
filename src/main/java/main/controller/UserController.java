package main.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import user.dao.UserDAO;
import user.model.User;
import user.model.UserLoginForm;
import user.model.UserPasswordForm;
import user.model.UserRegForm;
import donations.dao.DonationDAO;

@Controller
@SessionAttributes("user")
public class UserController {
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private DonationDAO donationDao;
	
	@Autowired
	private User user;

	/*
	 * Mapping for login page
	 */
	@RequestMapping(value= "login", method = RequestMethod.GET)
	public String viewLogin(Map<String, Object> model, @RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "registered", required = false) String registered) {
		model.put("loginForm", new UserLoginForm());
		if (error != null) model.put("message", "Invalid username or password.");
		else if (registered != null) model.put("message", "Registration successful.");
		else model.put("message", " ");
		return "login";	
	}
	
	/*
	 * Mapping for account overview page
	 */
	
	@RequestMapping(value = "overview", method = RequestMethod.GET)
	public String viewOverview(Map<String, Object> model) {	
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
		  user = userDao.getUserByUsername(((UserDetails) principal).getUsername());
		} 
		if (user != null) {
			model.put("user", user);
			model.put("teamDonations", donationDao.getTeamDonations(user.getTeamId()));
			model.put("teamTotals", donationDao.getTopTeams());
			return "overview";
		}
		else return "redirect:/login";
	}
	
	/*
	 * Mapping for password change page
	 */
	@RequestMapping(value = "changepass", method = RequestMethod.GET)
	public String viewChangePass(Map<String, Object> model) {
		model.put("userPasswordForm", new UserPasswordForm());
		return "changepass";
	}
	
	
	/*
	 * Mapping for registration page
	 */
	@RequestMapping(value = "register", method = RequestMethod.GET) 
	public String viewRegister(Map<String, Object> model) {
		model.put("userRegForm", new UserRegForm());
		return "register";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public ModelAndView processRegistration(@ModelAttribute("userRegForm") UserRegForm userRegForm, 
														Map <String, Object> model, RedirectAttributes redir){
		if (userDao.addUser(userRegForm)) {
			ModelAndView modelAndView = new ModelAndView("redirect:/login?registered");
			redir.addFlashAttribute("loginForm", new UserLoginForm());
			return modelAndView;
		}
		else {
			model.put("message", "That username or email is already registered.");
			return new ModelAndView("register");
		}
	}
	
	/*
	 * Mapping for log out
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logUserOut(Map<String, Object> model, SessionStatus status) {
		status.setComplete();
		user = null;
		return "redirect:/welcome";
	}
	
} 