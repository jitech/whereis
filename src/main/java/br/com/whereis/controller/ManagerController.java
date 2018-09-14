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
	private ModelAndView welcome() throws Exception {
		if(loadLoggedUser() != null){
			return new ModelAndView("/inicio");				
		}
		
		return new ModelAndView("/welcome");
	}
	
	@RequestMapping(value = "/{feature}", method = RequestMethod.GET)
    public ModelAndView load(@PathVariable("feature") String feature, Model model) {         
		return new ModelAndView(feature);
    }
	
	@RequestMapping(value = {"/test/generate", "/message", "/test/upload"}, method = RequestMethod.GET)
    public ModelAndView load() {         
		return new ModelAndView("inicio");
    }
}