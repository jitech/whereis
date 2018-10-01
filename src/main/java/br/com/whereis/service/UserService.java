package br.com.whereis.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.MailFactory;
import br.com.whereis.factory.UserFactory;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.repository.UserRepository;
import br.com.whereis.util.MailUtil;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
    public Environment environment;
	
	public User register(String name, String email, String password) throws Exception{
		
		User user = userRepo.findByEmail(email);
		
		if(user == null) {
			user = UserFactory.create(email, password, name, null);		
		
		}else {
			return null;
		}
		
		user = userRepo.save(user);
		
		if(user != null) {
			MailUtil.sendEmail(MailFactory.create(email, environment.getProperty("email.register.welcome.to"), environment.getProperty("email.register.welcome.subject"), environment.getProperty("email.register.welcome.content")));
			return user;
		}
		
		return null;
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
		return load(user.getEmail());
	}
	
	public User load(String email) throws Exception{	
		return userRepo.findByEmail(email);
	}
	
	public User loadByNameProfile(String nameProfile) throws Exception{	
		return userRepo.findByNameProfile(nameProfile);
	}
	
	public void update(User user) throws Exception{	
		userRepo.save(user);
	}
	
	public List<User> list() throws Exception{	
		return userRepo.findAll();
	}
}