package br.com.whereis.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.service.TestService;
import br.com.whereis.service.UserService;
import br.com.whereis.util.FileUtil;
import br.com.whereis.util.TestUtil;

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
	
	@RequestMapping(value = "/generate", method = RequestMethod.POST)
    public ModelAndView generate(@RequestParam("email") String email, Model model) {	
		
		try {
				if(!userIsConnected()){
					return new ModelAndView("/login");				
				}
			
				String testCode = testService.loadTestRandom().getCode();
				
				userService.createForTest(email, testCode);	
				model.addAttribute("message", "Teste criado com sucesso! Envie o link para o candidato <br/> "+TestUtil.createTestURL(testCode));
				return new ModelAndView("message");
				
		}catch(Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", "Erro ao carregar!");
			return new ModelAndView("message");
		}
    }
	
	@RequestMapping(value = "/make/{code}", method = RequestMethod.GET)
    public ModelAndView load(@PathVariable("code") String code, Model model) {  
		
		try {
				if(!userIsConnected()){
					return new ModelAndView("/login");				
				}
			
				model.addAttribute("test", testService.loadByCode(code));
				return new ModelAndView("detail");
				
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
				
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    	
				File file = FileUtil.saveFileIntoDirectory(multipartRequest.getFile("file"), user.getEmail());
				
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