package br.com.whereis.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.UserFactory;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
	public User register(String name, String email, String password) throws Exception{
		
		User user = userRepo.findByEmail(email);
		
		if(user == null) {
			user = UserFactory.create(email, password, name, null);		
		
		}else {
			return null;
		}
		
		return userRepo.save(user);
	}
	
	public User createForTest(String email, String testCode) throws Exception{
		
		User user = userRepo.findByEmail(email);
		
		if(user == null) {
			user = UserFactory.create(email, null, null, null);		
		}
		
		if(user.getTests() == null) {
			user.setTests(new ArrayList<UserTest>());
		}
		
		user.getTests().add(UserTestFactory.create(testCode, null, UserTestStatus.WAIT, null));		
		userRepo.save(user);		
		return load(user);
	}
	
	public User load(User user) throws Exception{	
		return userRepo.findByEmail(user.getEmail());
	}
	
	public void update(User user) throws Exception{	
		userRepo.save(user);
	}
	
	public List<User> list() throws Exception{	
		return userRepo.findAll();
	}
}