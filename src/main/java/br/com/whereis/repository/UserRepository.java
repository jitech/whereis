package br.com.whereis.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import br.com.whereis.entity.Status;
import br.com.whereis.entity.User;

public interface UserRepository extends MongoRepository<User, String>{
	
	@Query("{'email':?0}")
	public User findByEmail(String email);
	
	@Query("{'email':?0, 'password':?1, 'status':?2}")
	public User findByEmail(String email, String password, Status status);
	
	@Query("{'nameProfile':?0}")
	public User findByNameProfile(String nameProfile);
}