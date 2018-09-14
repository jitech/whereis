package br.com.whereis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends GenericController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(Model model) {
		
		try {
				if(loadLoggedUser() == null){
					return new ModelAndView("/login");	
					
				}
				model.addAttribute("users", userService.list());
				return new ModelAndView("inicio");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.load.error"));
			return new ModelAndView("message");
		}
    }
}