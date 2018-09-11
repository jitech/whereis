package br.com.whereis.factory;

import br.com.whereis.entity.Company;
import br.com.whereis.entity.Status;
import br.com.whereis.entity.User;
import br.com.whereis.util.PasswordUtil;

public class UserFactory {
	public static User create(String email, String password, String name) {
		return new User(email, PasswordUtil.encripty(password), name, Status.ACTIVE);
	}
	public static User create(String email, String password, Company company) {
		
		try {
				for(User user : company.getUsers()) {
					if(user.getEmail().equals(email) && user.getPassword().equals(PasswordUtil.encripty(password))) {
						return user;
					}
				}
				
				return null;
				
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}