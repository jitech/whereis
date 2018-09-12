package br.com.whereis.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.Test;
import br.com.whereis.repository.TestRepository;

@Service
public class TestService {

	@Autowired
	private TestRepository testRepo;
	
	public Test loadByCode(String code) {
		
		try {			
				return testRepo.findByCode(code);
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public Test loadTestRandom() {
		
		try {
				List<Test> tests = testRepo.findAll();							
				int value = new Random().nextInt(tests.size()); 			
				return tests.get(value); 
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}