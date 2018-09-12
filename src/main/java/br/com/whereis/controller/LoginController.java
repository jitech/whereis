package br.com.whereis.controller;

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
public class LoginController {

	@Autowired
	private LoginService service;
	
	@RequestMapping(value = "/enter", method = RequestMethod.POST)
    public ModelAndView enter(@RequestParam("email") String email, @RequestParam("password") String password, Model model) { 
		
		User user = service.verify(email, password);
		
		if(user == null) {
			return new ModelAndView("login");
		}
		
		model.addAttribute("user", user);
		return new ModelAndView("inicio");
    }
}