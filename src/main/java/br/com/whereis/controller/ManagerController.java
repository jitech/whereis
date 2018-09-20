package br.com.whereis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController extends GenericController{

	@RequestMapping("/")
	private ModelAndView index(Model model) throws Exception {
		model.addAttribute("feature", "index");
		return new ModelAndView("/page");
	}
	
	@RequestMapping(value = "/{feature}", method = RequestMethod.GET)
    public ModelAndView load(@PathVariable("feature") String feature, Model model) {         
		model.addAttribute("feature", feature);
		return new ModelAndView("/page");
    }
}