package br.com.whereis.factory;

import java.util.Date;

import br.com.whereis.entity.Company;
import br.com.whereis.entity.Status;
import br.com.whereis.entity.User;

public class UserFactory {
	
	public static User create(String email, String password, String name, Company company) throws Exception{
		
		if(company != null) {
			return new User(email, password, name, Status.ACTIVE, company.getDocument(), new Date());
		}else {
			return new User(email, password, name, Status.INACTIVE, null, new Date());
		}	
	}
}