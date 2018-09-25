package br.com.whereis.service;

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
import br.com.whereis.util.CodeAnalyze;
import br.com.whereis.util.CodeAnalyzer;
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
		String path = FileUtil.saveFileIntoDirectory(request, user+test);
		
		Test t = testRepo.findByCode(test);
		
		if(user.getTests() == null) {
			user.setTests(new ArrayList<UserTest>());
		}
		
		CodeAnalyzer code = new CodeAnalyzer();
		
		for(CodeAnalyze c : code.loadReport(path).getAnalyzes()) {
			System.out.println("# Classe: "+c.getClassName());
			System.out.println("# Complexidade Ciclomática: "+c.getComplexity());
			System.out.println("# Status do método fatorar(): funcionando = "+code.isCorrectMethod(path, "fatorar", 5, 120));
			
			UserTestStatus status = UserTestStatus.NOK;
			
			if(code.isCorrectMethod(path, "fatorar", 5, 120)) {
				status = UserTestStatus.OK;
			}
			
			user.getTests().add(UserTestFactory.create(test, c.getComplexity(), status, path));
			userService.update(user);
		}
		
			
		return true;
	}
}