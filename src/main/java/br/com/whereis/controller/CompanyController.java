package br.com.whereis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.repository.CompanyRepository;

@Controller
@RequestMapping("/company")
public class CompanyController extends GenericController{

	@Autowired
	private CompanyRepository companyRepo;
	
	@RequestMapping(value = "/{document}", method = RequestMethod.GET)
    public ModelAndView load(@PathVariable("document") String document, Model model) {   
		model.addAttribute(companyRepo.findByDocument(document));
		return new ModelAndView("company");
    }
}