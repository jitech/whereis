package br.com.whereis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
    public ModelAndView startOrLoadTest(Model model, HttpSession session) { 
		
		try {
				if(session.getAttribute("test") != null) {
					model.addAttribute("feature", "test");
					return new ModelAndView("/page");	
				}
								
				if(loadLoggedUser() != null) {
					session.setAttribute("test", testService.loadTestRandom());
					model.addAttribute("feature", "test");				
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
    public ModelAndView sendTest(Model model, HttpSession session) { 
		session.removeAttribute("test");
		model.addAttribute("feature", "home");
		return new ModelAndView("/page");
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView upload(HttpServletRequest request, @RequestParam("test") String test,  Model model, HttpSession session) {
		
		try {			
				if(loadLoggedUser() == null){
					model.addAttribute("feature", "login");			
				}
				
				if(testService.registerUserTest(request, loadLoggedUser(), test)) {
					model.addAttribute("feature", "home");
					model.addAttribute("message", loadMessage("message.test.sucess"));
				}
				
				return new ModelAndView("/page");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", loadMessage("message.test.error"));
			return new ModelAndView("/page");
		}
    }
}