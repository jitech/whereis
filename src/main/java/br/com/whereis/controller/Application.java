package br.com.whereis.controller;

import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import br.com.whereis.entity.Company;
import br.com.whereis.entity.Language;
import br.com.whereis.entity.Status;
import br.com.whereis.entity.Test;
import br.com.whereis.entity.User;
import br.com.whereis.repository.CompanyRepository;
import br.com.whereis.repository.TestRepository;
import br.com.whereis.repository.UserRepository;
import br.com.whereis.util.ParameterUtil;

@SpringBootApplication
@EnableMongoRepositories({"br.com.whereis.repository"})
public class Application implements CommandLineRunner{
	
	@Autowired
	private CompanyRepository companyRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private TestRepository testRepo;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		System.out.println(">>> Limpando base...");
		companyRepo.deleteAll();
		testRepo.deleteAll();
		
		System.out.println(">>> Criando dados iniciais");
		
		System.out.println(">> Criando Companies e usuários");
		companyRepo.save(new Company("123456789", "UOL Diveo", Arrays.asList(
				new User("jgm.melogmail.com", "***", "Jonas Goulart", Status.ACTIVE),
				new User("jgm.meloogmail.com", "***", "Jonas Goulart", Status.ACTIVE)
				), Status.ACTIVE, new Date()
			)
		);	
		
		
		Test test = new Test("Test name", "Test describe", Language.JAVA, Status.ACTIVE);
						
		Object[] testCaseOneparameters = {ParameterUtil.generateByRange100(), ParameterUtil.generateByRange100()};
		test.addTestCase("sum", testCaseOneparameters, (Integer.parseInt(testCaseOneparameters[0].toString()) + Integer.parseInt(testCaseOneparameters[1].toString())));
				
		Object[] testCaseTwoparameters = {ParameterUtil.generateByRange100(), ParameterUtil.generateByRange100()};
		test.addTestCase("sum", testCaseTwoparameters, (Integer.parseInt(testCaseTwoparameters[0].toString()) + Integer.parseInt(testCaseTwoparameters[1].toString())));
		
		
		System.out.println(">> Criando Teste");
		testRepo.save(test);
		
		System.out.println(testRepo.findByName("Test name"));
		
		System.out.println(userRepo.findByEmail("jgm.melo@gmail.com"));
	}
}
