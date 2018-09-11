package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import br.com.whereis.entity.User;

public interface UserRepository extends MongoRepository<User, String>{
	
	
}