package br.com.whereis.entity;

import java.util.Date;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

public class UserTest {

	private String test;
	private Integer complexity;
	private UserTestStatus status;
	private String file;
	private Date date;
	
	public UserTest() {
		super();
	}

	public UserTest(String test, Integer complexity, UserTestStatus status, String file, Date date) {
		super();
		this.test = test;
		this.complexity = complexity;
		this.status = status;
		this.file = file;
		this.date = date;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public Integer getComplexity() {
		return complexity;
	}

	public void setComplexity(Integer complexity) {
		this.complexity = complexity;
	}

	public UserTestStatus getStatus() {
		return status;
	}

	public void setStatus(UserTestStatus status) {
		this.status = status;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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