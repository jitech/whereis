package br.com.whereis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {

	@RequestMapping("/")
	@ResponseBody
	private String home() {
		return "Welcome!";
	}
	
	@RequestMapping(value = "/{feature}", method = RequestMethod.GET)
    public ModelAndView load(@PathVariable("feature") String feature, Model model) {         
		return new ModelAndView(feature);
    }
}