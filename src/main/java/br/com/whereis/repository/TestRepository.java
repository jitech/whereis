package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import br.com.whereis.entity.Test;

public interface TestRepository extends MongoRepository<Test, String>{
	public Test findByName(String name);
}