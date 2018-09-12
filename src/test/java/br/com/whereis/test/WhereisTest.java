package br.com.whereis.test;

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
import br.com.whereis.factory.CompanyFactory;
import br.com.whereis.repository.CompanyRepository;
import br.com.whereis.repository.TestRepository;
import br.com.whereis.util.ParameterUtil;
import br.com.whereis.util.PasswordUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {Application.class})
public class WhereisTest {

	@Autowired
	private CompanyRepository companyRepo;
	
	@Autowired
	private TestRepository testRepo;
	
	@Before
	public void before() throws Exception {
		companyRepo.deleteAll();
		testRepo.deleteAll();
		
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
	}
	
	@Test
	public void loadCompany() {		
		Company company = companyRepo.findByDocument("123456789");
		Assert.assertEquals("UOL Diveo", company.getName());
	}
	
	@Test
	public void updateCompany() {	
		Company company = companyRepo.findByDocument("123456789");
		company.setName("UOL");
		companyRepo.save(company);
		Assert.assertEquals("UOL", companyRepo.findByDocument("123456789").getName());
	}
	
	@Test
	public void addUserInCompany() {
		//Company company = companyRepo.findByDocument("123456789");
		//Assert.assertTrue(companyRepo.addUser(company, UserFactory.create("jgm.melo@gmail.com", "123456789", "Jonas")));
	}
}
