package br.com.whereis.entity;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Document(collection="test")
public class Test {

	private String code;
	private String name;
	private String describe;
	private List<TestCase> testCases = new ArrayList<TestCase>();
	private Language language;
	private Status status;
	 
	public Test() {
		super();
	}
	
	public Test(String code, String name, String describe, Language language, Status status) {
		super();
		this.code = code;
		this.name = name;
		this.describe = describe;
		this.language = language;
		this.status = status;	
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public List<TestCase> getTestCases() {
		return testCases;
	}

	public void setTestCases(List<TestCase> testCases) {
		this.testCases = testCases;
	}

	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public void addTestCase(String className, String methodName, String[] typeParameters, Object[] parameters, Object expected) {							
		getTestCases().add(new TestCase(className, methodName, typeParameters, parameters, expected));
	}
	
	@Override
	public String toString() {
	    	ObjectMapper mapper = new ObjectMapper();
	    	
	    	String jsonString = "";
			try {
				mapper.enable(SerializationFeature.INDENT_OUTPUT);
				jsonString = mapper.writeValueAsString(this);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
	    	return jsonString;
	}
}