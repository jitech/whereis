package br.com.whereis.entity;

import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Document(collection="user")
public class User {

	@Id
	private ObjectId id;
	private String email;
	private String password;
	private String name;
	private Status status;
	private String company;
	private List<UserTest> tests;
	private Date include;
		
	public User() {
		super();
	}

	public User(String email, String password, String name, Status status, String company, Date include) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.status = status;
		this.company = company;
		this.include = include;
	}

	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public List<UserTest> getTests() {
		return tests;
	}

	public void setTests(List<UserTest> tests) {
		this.tests = tests;
	}
	
	public Date getInclude() {
		return include;
	}

	public void setInclude(Date include) {
		this.include = include;
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
	
	public Integer loadTotalComplexity() {
		
		Integer totalComplexity = 0;
		
		for(UserTest userTest : getTests()) {
			
			totalComplexity = totalComplexity + userTest.getComplexity();
		}
		
		if(totalComplexity > 0) {
			return totalComplexity/getTests().size();
		}
		
		return null;
	}
	
	public Integer loadTestNOK() {
		
		Integer total = 0;
		
		for(UserTest userTest : getTests()) {
			
			if(userTest.getStatus().equals(UserTestStatus.NOK)) {
				total++;
			}
		}
			
		return total;
	}
}