package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.whereis.entity.User;

public interface UserRepository extends MongoRepository<User, String>{
	
	@Query("select c.users from Company c where u.email = :email")
	@Query(value = "{ 'userId' : ?0, 'questions.questionID' : ?1 }", fields = "{ 'questions.questionID' : 1 }")
	public User findByEmail(@Param("email") String email);
}