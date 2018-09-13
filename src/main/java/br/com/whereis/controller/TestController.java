package br.com.whereis.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.service.TestService;
import br.com.whereis.service.UserService;
import br.com.whereis.util.FileUtil;

@Controller
@RequestMapping("/test")
public class TestController extends GenericController{
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(Model model) {
		
		try {
				if(!userIsConnected()){
					return new ModelAndView("/login");				
				}
				
				return new ModelAndView("test/create");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", "Erro ao carregar!");
			return new ModelAndView("message");
		}
    }
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView generate(Model model) {	
		
		try {
				if(!userIsConnected()){
					return new ModelAndView("/login");				
				}
			
				model.addAttribute("test", testService.loadTestRandom());			
				return new ModelAndView("test/detail");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", "Erro ao carregar!");
			return new ModelAndView("message");
		}
    }
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView upload(HttpServletRequest request, @RequestParam("test") String test,  Model model) {
		
		try {			
				if(!userIsConnected()){
					return new ModelAndView("/login");				
				}
			
				User user = userService.load(loadLoggedUser());
				
				File file = FileUtil.saveFileIntoDirectory(request, user.getEmail());
				
				if(user.getTests() == null) {
					user.setTests(new ArrayList<UserTest>());
				}
				
				user.getTests().add(UserTestFactory.create(test, 2, UserTestStatus.OK, file.getAbsolutePath()));

				userService.update(user);
	
				model.addAttribute("message", "Registrado com sucesso!");
				return new ModelAndView("message");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", "Erro ao registrar!");
			return new ModelAndView("message");
		}
    }
}