package br.com.whereis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("password") String password, Model model) {
		
		try {
				if(loadLoggedUser() != null){
					model.addAttribute("feature", "home");
					return new ModelAndView("/page");	
					
				}
				
				User user = userService.register(name, email, password);
				
				if(user != null) {					
					model.addAttribute("message", loadMessage("message.register.sucess"));
				}
				
				model.addAttribute("feature", "register");
				return new ModelAndView("/page");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("feature", "register");
			model.addAttribute("message", loadMessage("message.load.error"));
			return new ModelAndView("/page");
		}
    }
	
	
	@RequestMapping(value="/in/{profile}", method = RequestMethod.GET)
    public ModelAndView search(@PathVariable("profile") String profile, Model model) {
		
		try {
				User user = userService.loadByNameProfile(profile);
			
				if(user != null) {
					model.addAttribute("in", user);	
					model.addAttribute("feature", "in");
				}
													
				return new ModelAndView("/page");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("feature", "login");
			return new ModelAndView("/page");
		}
	}
	
	@RequestMapping(value="/active/{id}", method = RequestMethod.GET)
    public ModelAndView active(@PathVariable("id") String id, Model model, HttpSession session) {
		
		try {
				User user = userService.loadById(id);
			
				if(user != null && userService.activeUser(user)) {
					model.addAttribute("feature", "login");
				}
													
				return new ModelAndView("/page");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			return new ModelAndView("/page");
		}
	}
}