package br.com.whereis.factory;

import java.util.Date;

import br.com.whereis.entity.Company;
import br.com.whereis.entity.Status;

public class CompanyFactory {
	public static Company create(String document, String name) {
		return new Company(document, name, Status.ACTIVE, new Date());
	}
}