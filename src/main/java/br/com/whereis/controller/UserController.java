package br.com.whereis.controller;

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
    public ModelAndView search(@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("password") String password, Model model) {
		
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
	
	
	@RequestMapping(value="/user/{email}", method = RequestMethod.GET)
    public ModelAndView search(@PathVariable("email") String email, Model model) {
		
		try {
				User user = userService.load(email);
			
				System.out.println("User: "+user.getName());
				
				model.addAttribute("userDetail", user);
				model.addAttribute("feature", "user");
				return new ModelAndView("/page");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("feature", "login");
			return new ModelAndView("/page");
		}
	}
}