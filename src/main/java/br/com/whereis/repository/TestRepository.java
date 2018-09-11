package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import br.com.whereis.entity.Test;

public interface TestRepository extends MongoRepository<Test, String>{
	
	@Query("{'name':?0}")
	public Test findByName(String name);
}