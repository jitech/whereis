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
	
	public Test loadByCode(String code) throws Exception{		
		return testRepo.findByCode(code);
	}
	
	public Test loadTestRandom() throws Exception{		
		List<Test> tests = testRepo.findAll();							
		return tests.get(new Random().nextInt(tests.size()));
	}
}