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
@RequestMapping("/")
public class LoginController extends GenericController{

	@Autowired
	private LoginService service;
	
	@RequestMapping(value = "/inicio", method = RequestMethod.POST)
    public ModelAndView enter(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) { 
		
		try {
				User user = service.verify(email, password);
			
				if(user == null) {
					model.addAttribute("message", loadMessage("message.login.incorrect"));
					return new ModelAndView("login");
				}
			
				session.setAttribute("user", user);
				return new ModelAndView("inicio");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.login.error"));
			return new ModelAndView("message");
		}
    }
	
	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public ModelAndView exit(HttpSession session) {
		session.removeAttribute("user");
		return new ModelAndView("welcome");
	}
}