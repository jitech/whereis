package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import br.com.whereis.entity.Company;

public interface CompanyRepository extends MongoRepository<Company, String>{
	
	@Query("{'document':?0}")
	public Company findByDocument(String document);
}