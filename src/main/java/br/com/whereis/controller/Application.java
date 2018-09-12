package br.com.whereis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import br.com.whereis.entity.Company;
import br.com.whereis.entity.Language;
import br.com.whereis.entity.Status;
import br.com.whereis.entity.Test;
import br.com.whereis.factory.CompanyFactory;
import br.com.whereis.factory.UserFactory;
import br.com.whereis.repository.CompanyRepository;
import br.com.whereis.repository.TestRepository;
import br.com.whereis.repository.UserRepository;
import br.com.whereis.util.ParameterUtil;
import br.com.whereis.util.PasswordUtil;

@SpringBootApplication(scanBasePackages={"br.com.whereis.service", "br.com.whereis.controller"})
@EnableMongoRepositories({"br.com.whereis.repository"})
public class Application implements CommandLineRunner{
	
	@Autowired
	private CompanyRepository companyRepo;
	
	@Autowired
	private TestRepository testRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println(">> Limpando base...");
		companyRepo.deleteAll();
		testRepo.deleteAll();
		userRepo.deleteAll();
		
		System.out.println(">> Base limpa com sucesso!");
		
		System.out.println(">>> Populando base com dados iniciais...");
		companyRepo.save(CompanyFactory.create("123456789", "UOL Diveo"));
		companyRepo.save(CompanyFactory.create("123456790", "UOL Portal"));
		
		Company company = companyRepo.findByDocument("123456789");
		
		userRepo.save(UserFactory.create("jgm.melo@gmail.com", null, null, null));
		userRepo.save(UserFactory.create("jgm.melo@uol.com.br", PasswordUtil.encripty("123"), "Jonas", company));
		
		for(int x = 1 ; x < 100 ; x++) {
			Test test = new Test(PasswordUtil.encripty(x+"X"),"Test "+x, "Test describe", Language.JAVA, Status.ACTIVE);	
			Object[] testCaseOneparameters = {ParameterUtil.generateByRange100(), ParameterUtil.generateByRange100()};
			test.addTestCase("sum", testCaseOneparameters, (Integer.parseInt(testCaseOneparameters[0].toString()) + Integer.parseInt(testCaseOneparameters[1].toString())));			
			Object[] testCaseTwoparameters = {ParameterUtil.generateByRange100(), ParameterUtil.generateByRange100()};
			test.addTestCase("sum", testCaseTwoparameters, (Integer.parseInt(testCaseTwoparameters[0].toString()) + Integer.parseInt(testCaseTwoparameters[1].toString())));
			testRepo.save(test);
		}
		
		System.out.println(">>> Base populada com sucesso!");
	}
}