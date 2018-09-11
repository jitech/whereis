package br.com.whereis.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import br.com.whereis.entity.Company;
import br.com.whereis.factory.CompanyFactory;
import br.com.whereis.factory.UserFactory;
import br.com.whereis.repository.CompanyRepository;
import br.com.whereis.repository.TestRepository;

@SpringBootApplication(scanBasePackages={"br.com.whereis.service", "br.com.whereis.controller"})
@EnableMongoRepositories({"br.com.whereis.repository"})
public class Application implements CommandLineRunner{
	
	@Autowired
	private CompanyRepository companyRepo;
	
	@Autowired
	private TestRepository testRepo;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		companyRepo.deleteAll();
		testRepo.deleteAll();
		
		companyRepo.save(CompanyFactory.create("123456789", "UOL Diveo"));
		companyRepo.save(CompanyFactory.create("123456790", "UOL Portal"));
		
		Company company = companyRepo.findByDocument("123456789");
		company.setUsers(Arrays.asList(UserFactory.create("jgm.melo@gmail.com", "123", "Jonas"), UserFactory.create("jgm.melo@uol.com.br", "123", "Jonas G.")));
		companyRepo.save(company);
	}
}