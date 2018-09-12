package br.com.whereis.factory;

import java.util.Date;

import br.com.whereis.entity.UserTest;
import br.com.whereis.entity.UserTestStatus;

public class UserTestFactory {
	
	public static UserTest create(String code, Integer complexity, UserTestStatus status, String file) throws Exception{
		return new UserTest(code, complexity, status, file, new Date());
	}
}