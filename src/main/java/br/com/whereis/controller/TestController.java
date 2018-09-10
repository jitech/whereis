package br.com.whereis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.form.GenerateTestForm;
import br.com.whereis.repository.TestRepository;

@Controller
@RequestMapping("/test")
public class TestController extends GenericController{
	
	@Autowired
	private TestRepository testRepo;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(Model model) {
		model.addAttribute("form", new GenerateTestForm());
		return new ModelAndView("test/create");
    }
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView generate(@ModelAttribute("form") GenerateTestForm form, Model model) {
		
		System.out.println("Selecionando teste e enviando...");
		System.out.println("Teste: "+testRepo.findByName("Test name"));
		System.out.println("Enviando para: "+form.getEmail());
		
		return new ModelAndView("test/create");
    }
}