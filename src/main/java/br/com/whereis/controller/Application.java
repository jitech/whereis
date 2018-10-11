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
		
		//userRepo.save(UserFactory.create("jgm.melo@gmail.com", null, null, null));
		userRepo.save(UserFactory.create("esc_jmelo@uoldiveo.com", "123", "Jonas Goulart", company));
		
		for(int x = 1 ; x < 2 ; x++) {
			Test test = new Test(PasswordUtil.encripty("ICMS and IPI calculator algorithm"),"ICMS and IPI calculator algorithm", "Create a tax calculator algorithm for the Market ABC. The user put the value of product and tax name (ICMS and IPI). The algorithm calcules the value of final tax to market pay. The aliquots ICMS and IPI are 3% and 2.5% respectively.", Language.JAVA, Status.ACTIVE);	
			String[] typeParameters = {"double", "String"};
			Object[] parameters1 = {1000.0, "ICMS"};
			test.addTestCase("TaxManager", "calc", typeParameters, parameters1, 30.0);			
			Object[] parameters2 = {2000.0, "ICMS"};
			test.addTestCase("TaxManager","calc", typeParameters, parameters2, 60.0);
			Object[] parameters3 = {1000.0, "IPI"};
			test.addTestCase("TaxManager","calc", typeParameters, parameters3, 25.0);
			testRepo.save(test);
		}
		
		System.out.println(">>> Base populada com sucesso!");
	}
}