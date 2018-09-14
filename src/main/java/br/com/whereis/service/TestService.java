package br.com.whereis.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.Test;
import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.repository.TestRepository;
import br.com.whereis.util.FileUtil;

@Service
public class TestService {

	@Autowired
	private TestRepository testRepo;
	
	@Autowired
	private UserService userService;
	
	public Test loadByCode(String code) throws Exception{		
		return testRepo.findByCode(code);
	}
	
	public Test loadTestRandom() throws Exception{		
		List<Test> tests = testRepo.findAll();							
		return tests.get(new Random().nextInt(tests.size()));
	}
	
	public boolean registerUserTest(HttpServletRequest request, User user, String test) throws Exception{
		File file = FileUtil.saveFileIntoDirectory(request, user+test);
		
		if(user.getTests() == null) {
			user.setTests(new ArrayList<UserTest>());
		}
		
		user.getTests().add(UserTestFactory.create(test, 2, UserTestStatus.OK, file.getAbsolutePath()));
		userService.update(user);	
		return true;
	}
}