package br.com.whereis.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.entity.User;
import br.com.whereis.service.UserService;

@Controller
public class UserController extends GenericController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/search-user", method = RequestMethod.POST)
    public ModelAndView search(@RequestParam("email") String email, Model model) {
		
		try {
				if(loadLoggedUser() == null){
					return new ModelAndView("/login");	
					
				}
				List<User> users = new ArrayList<User>();
				users.add(userService.load(email));
				model.addAttribute("users", users);
				return new ModelAndView("/index");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.load.error"));
			return new ModelAndView("message");
		}
    }
}