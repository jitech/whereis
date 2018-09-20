package br.com.whereis.test;

import java.util.ArrayList;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import br.com.whereis.controller.Application;
import br.com.whereis.entity.Company;
import br.com.whereis.entity.Language;
import br.com.whereis.entity.Status;
import br.com.whereis.entity.User;
import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;
import br.com.whereis.factory.CompanyFactory;
import br.com.whereis.factory.UserFactory;
import br.com.whereis.factory.UserTestFactory;
import br.com.whereis.repository.CompanyRepository;
import br.com.whereis.repository.TestRepository;
import br.com.whereis.repository.UserRepository;
import br.com.whereis.service.UserService;
import br.com.whereis.util.ParameterUtil;
import br.com.whereis.util.PasswordUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {Application.class})
public class WhereisTest {

	@Autowired
	private CompanyRepository companyRepo;
	
	@Autowired
	private TestRepository testRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UserService userService;
	
	@Before
	public void before() throws Exception {
		companyRepo.deleteAll();
		testRepo.deleteAll();
		userRepo.deleteAll();
		
		Assert.assertNotNull(companyRepo.save(CompanyFactory.create("123456789", "UOL Diveo")));
		Assert.assertNotNull(companyRepo.save(CompanyFactory.create("123456790", "UOL Portal")));
		
		Company company = companyRepo.findByDocument("123456789");
		//company.setUsers(Arrays.asList(UserFactory.create("jgm.melo@gmail.com", "123", "Jonas"), UserFactory.create("jgm.melo@uol.com.br", "123", "Jonas G.")));
		Assert.assertNotNull(companyRepo.save(company));
		
		br.com.whereis.entity.Test test = new br.com.whereis.entity.Test(PasswordUtil.encripty("X"),"Test name", "Test describe", Language.JAVA, Status.ACTIVE);	
		Object[] testCaseOneparameters = {ParameterUtil.generateByRange100(), ParameterUtil.generateByRange100()};
		test.addTestCase("sum", testCaseOneparameters, (Integer.parseInt(testCaseOneparameters[0].toString()) + Integer.parseInt(testCaseOneparameters[1].toString())));				
		Object[] testCaseTwoparameters = {ParameterUtil.generateByRange100(), ParameterUtil.generateByRange100()};
		test.addTestCase("sum", testCaseTwoparameters, (Integer.parseInt(testCaseTwoparameters[0].toString()) + Integer.parseInt(testCaseTwoparameters[1].toString())));	
		testRepo.save(test);
		Assert.assertNotNull(testRepo.findByName("Test name"));
		
		userRepo.save(UserFactory.create("jgm", "123", "Jonas", company));
	}
	
	@Test
	public void load() throws Exception {		
		User user = userRepo.findByEmail("jgm");
		
		user.setTests(new ArrayList<UserTest>());
		user.getTests().add(UserTestFactory.create(PasswordUtil.encripty("X"), 2, UserTestStatus.WAIT, ""));
		
		userService.update(user);
		
		user = userRepo.findByEmail("jgm");
		Assert.assertNotNull(user);
	}
}
