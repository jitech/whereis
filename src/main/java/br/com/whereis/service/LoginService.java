package br.com.whereis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.Status;
import br.com.whereis.entity.User;
import br.com.whereis.repository.UserRepository;
import br.com.whereis.util.PasswordUtil;

@Service
public class LoginService {

	@Autowired
	private UserRepository userRepo;
	
	public User verify(String email, String password) throws Exception{
		
		User user = userRepo.findByEmail(email, PasswordUtil.encripty(password), Status.ACTIVE);
				
		if(user != null) {
			return user;	
		}
			
		return null;
	}
}