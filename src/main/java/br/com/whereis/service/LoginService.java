package br.com.whereis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.whereis.entity.User;
import br.com.whereis.factory.UserFactory;
import br.com.whereis.repository.CompanyRepository;

@Service
public class LoginService {

	@Autowired
	private CompanyRepository companyRepo;
	
	public User verify(String email, String password) {
		return UserFactory.create(email, password, companyRepo.findByContainsUser(email));
	}
}
