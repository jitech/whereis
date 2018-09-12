package br.com.whereis.controller;

import javax.servlet.http.HttpSession;

import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import br.com.whereis.entity.User;

@EnableMongoRepositories({"br.com.whereis.repository"})
public class GenericController {

	public User loadLoggedUser() throws Exception{
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		return (User) session.getAttribute("user");
	}
	
	public boolean userIsConnected() throws Exception{
		
		if(loadLoggedUser() == null) {
			return false;
		}
		
		return true;
	}
}