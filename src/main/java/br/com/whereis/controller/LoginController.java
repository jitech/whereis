package br.com.whereis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.entity.User;
import br.com.whereis.service.LoginService;

@Controller
public class LoginController extends GenericController{

	@Autowired
	private LoginService service;
	
	@RequestMapping(value = "/home", method = RequestMethod.POST)
    public ModelAndView enter(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) { 
		
		try {
				User user = service.verify(email, password);
			
				if(user == null) {
					model.addAttribute("feature", "login");
					model.addAttribute("message", loadMessage("message.login.incorrect"));									
				}else {
					model.addAttribute("feature", "home");	
					session.setAttribute("user", user);
				}
						
				return new ModelAndView("/page");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("feature", "login");
			model.addAttribute("message", loadMessage("message.login.error"));
			return new ModelAndView("/page");
		}
    }
	
	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public ModelAndView exit(HttpSession session, Model model) {
		session.removeAttribute("user");
		model.addAttribute("feature", "index");
		return new ModelAndView("/page");
	}
}