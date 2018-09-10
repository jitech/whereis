package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import br.com.whereis.entity.Company;

public interface CompanyRepository extends MongoRepository<Company, String>{
	public Company findByDocument(String document);
}