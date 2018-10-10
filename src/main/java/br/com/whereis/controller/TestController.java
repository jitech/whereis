package br.com.whereis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.entity.Test;
import br.com.whereis.service.TestService;

@Controller
public class TestController extends GenericController{
	
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
    public ModelAndView startOrLoadTest(Model model, HttpSession session) { 
		
		try {
				if(session.getAttribute("test") != null) {
					model.addAttribute("feature", "test");
					return new ModelAndView("/page");	
				}
								
				if(loadLoggedUser() != null) {
					
					Test test = testService.loadTestRandom(loadLoggedUser());
					
					if(test != null) {
						session.setAttribute("test", test);
						model.addAttribute("feature", "test");	
					}else {
						model.addAttribute("message", loadMessage("message.test.not-found"));
						model.addAttribute("feature", "home");
					}				
								
				}else {
					model.addAttribute("feature", "login");			
				}
		
				return new ModelAndView("/page");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("feature", "login");	
			return new ModelAndView("/page");
		}
    }
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
    public ModelAndView sendJar(HttpServletRequest request, Model model, HttpSession session) {
		
		try {			
				if(loadLoggedUser() == null){
					model.addAttribute("feature", "login");			
				}
				
				Test test = (Test) session.getAttribute("test");
				
				if(testService.registerUserTest(request, loadLoggedUser(), test.getCode())) {
					model.addAttribute("feature", "home");
					model.addAttribute("message", loadMessage("message.test.sucess"));
					session.removeAttribute("test");
				}
				
				return new ModelAndView("/page");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("feature", "test");
			model.addAttribute("message", loadMessage("message.test.error"));
			return new ModelAndView("/page");
		}
    }
}