package br.com.whereis.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.Status;
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
			MailUtil.sendEmail(
					MailFactory.create(email, environment.getProperty("email.register.active.to"), environment.getProperty("email.register.active.subject"), 
							environment.getProperty("email.register.active.content").replace("<URL>",environment.getProperty("email.register.active.url")+user.getId())));
			return user;
		}
		
		return null;
	}
	
	public boolean activeUser(User user) {
		
		try {
				user.setStatus(Status.ACTIVE);

				if(userRepo.save(user).getStatus().equals(Status.ACTIVE)) {
					return true;
				}
				
				return false;
				
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
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
		return loadByEmail(user.getEmail());
	}
	
	public User loadByEmail(String email) throws Exception{	
		return userRepo.findByEmail(email);
	}
	
	public User loadByNameProfile(String profile) throws Exception{	
		return userRepo.findByNameProfile(profile);
	}
	
	public User loadById(String id) throws Exception{				
		Optional<User> user = userRepo.findById(id);
		return user.get();
	}
	
	public void update(User user) throws Exception{	
		userRepo.save(user);
	}
	
	public List<User> list() throws Exception{	
		return userRepo.findAll();
	}
}