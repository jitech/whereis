package br.com.whereis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.entity.Test;
import br.com.whereis.form.GenerateTestForm;
import br.com.whereis.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController extends GenericController{
	
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(Model model) {
		model.addAttribute("form", new GenerateTestForm());
		return new ModelAndView("test/create");
    }
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView generate(@ModelAttribute("form") GenerateTestForm form, Model model) {			
		Test test = testService.loadTestRandom();	
		System.out.println("Teste selecionado: "+test.getName());
		return new ModelAndView("test/create");
    }
	
	@RequestMapping(value = "/{code}", method = RequestMethod.GET)
    public ModelAndView load(@PathVariable("code") String code, Model model) {   
		model.addAttribute("test", testService.loadByCode(code));
		return new ModelAndView("detail");
    }
}