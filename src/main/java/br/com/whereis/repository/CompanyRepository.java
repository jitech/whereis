package br.com.whereis.repository;

import java.util.ArrayList;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import br.com.whereis.entity.Company;
import br.com.whereis.entity.User;

public interface CompanyRepository extends MongoRepository<Company, String>{
	
	@Query("{'document':?0}")
	public Company findByDocument(String document);
	
	@Query("{'users':{$elemMatch:{'email':?0}}}")
	public Company findByContainsUser(String email);
	
	public default boolean addUser(Company company, User user) {
		try {
				if(company.getUsers() == null) {
					company.setUsers(new ArrayList<User>());
				}
				company.getUsers().add(user);			
				save(company);			
				return true;
			
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}