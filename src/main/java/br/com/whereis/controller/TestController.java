package br.com.whereis.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.service.TestService;

@Controller
public class TestController extends GenericController{
	
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/create-user-test", method = RequestMethod.GET)
    public ModelAndView loadPageCreateUserTest(Model model) {
		
		try {
				if(loadLoggedUser() == null){
					return new ModelAndView("/login");				
				}
				
				return new ModelAndView("/create-user-test");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.load.error"));
			return new ModelAndView("/message");
		}
    }
	
	@RequestMapping(value = "/create-user-test", method = RequestMethod.POST)
    public ModelAndView loadUserTest(Model model) {	
		
		try {
				if(loadLoggedUser() == null){
					return new ModelAndView("/login");				
				}
			
				model.addAttribute("test", testService.loadTestRandom());			
				return new ModelAndView("/user-test");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.load.error"));
			return new ModelAndView("/message");
		}
    }
	
	@RequestMapping(value = "/update-user-test", method = RequestMethod.POST)
    public ModelAndView upload(HttpServletRequest request, @RequestParam("test") String test,  Model model) {
		
		try {			
				if(loadLoggedUser() == null){
					return new ModelAndView("/login");				
				}
				
				if(testService.registerUserTest(request, loadLoggedUser(), test)) {
					model.addAttribute("message", loadMessage("message.test.sucess"));
				}
	
				return new ModelAndView("/message");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.test.error"));
			return new ModelAndView("/message");
		}
    }
}