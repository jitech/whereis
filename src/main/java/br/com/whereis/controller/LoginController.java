package br.com.whereis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.whereis.factory.UserFactory;
import br.com.whereis.repository.CompanyRepository;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	private static CompanyRepository companyRepo;
	
	@RequestMapping(value = "/enter", method = RequestMethod.POST)
    public ModelAndView load(@PathVariable("email") String email, @PathVariable("password") String password, Model model) {   
		model.addAttribute("user", UserFactory.create(email, password, companyRepo.findByContainsUser(email)));
		return new ModelAndView("inicio");
    }
}
