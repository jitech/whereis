package br.com.whereis.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.Test;
import br.com.whereis.entity.TestCase;
import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.repository.TestRepository;
import br.com.whereis.util.CodeAnalyze;
import br.com.whereis.util.CodeAnalyzer;
import br.com.whereis.util.FileUtil;
import br.com.whereis.util.MethodUtil;

@Service
public class TestService {

	@Autowired
	private TestRepository testRepo;
	
	@Autowired
	private UserService userService;
	
	@Autowired
    public Environment environment;
	
	public Test loadByCode(String code) throws Exception{		
		return testRepo.findByCode(code);
	}
	
	public Test loadTestRandom(User user) throws Exception{		
		List<Test> tests = testRepo.findAll();	
		
		if(user.getTests() != null) {
			for(UserTest userTest : user.getTests()) {	
				for(Test test : tests) {
					if(test.getCode().equals(userTest.getTest())) {
						tests.remove(test);
						break;
					}
				}
			}
		}
		
		if(tests.isEmpty()) {
			return null;
		}
		
		return tests.get(new Random().nextInt(tests.size()));
	}
	
	public boolean registerUserTest(HttpServletRequest request, User user, String test) throws Exception{
		String path = FileUtil.saveFileIntoDirectory(request, user+test, environment.getProperty("repository.jar"));
		
		Test t = testRepo.findByCode(test);
		
		if(user.getTests() == null) {
			user.setTests(new ArrayList<UserTest>());
		}
		
		CodeAnalyzer code = new CodeAnalyzer();
		
		UserTestStatus status = UserTestStatus.OK;
		
		Integer complexity = 0;
		
		List<CodeAnalyze> codes = code.loadReport(path).getAnalyzes();
		
		for(CodeAnalyze c : codes) {		
			complexity = complexity + c.getComplexity();
		}
		
		for(TestCase testCase : t.getTestCases()) {				
			if(!MethodUtil.isCorrectMethod(path, testCase)) {
				status = UserTestStatus.NOK;
				break;
			}	
		}						
		
		user.getTests().add(UserTestFactory.create(test, complexity/codes.size(), status, path));
		userService.update(user);				
		return true;
	}
}