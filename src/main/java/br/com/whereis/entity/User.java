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
	private String nameProfile;
	private Status status;
	private String company;
	private List<UserTest> tests;
	private Date include;
	private String codePasswordReset;
		
	public User() {
		super();
	}

	public User(String email, String password, String name, String nameProfile, Status status, String company, Date include) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.nameProfile = nameProfile;
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

	public String getNameProfile() {
		return nameProfile;
	}

	public void setNameProfile(String nameProfile) {
		this.nameProfile = nameProfile;
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

	public String getCodePasswordReset() {
		return codePasswordReset;
	}

	public void setCodePasswordReset(String codePasswordReset) {
		this.codePasswordReset = codePasswordReset;
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
		Integer count = 0;
		
		for(UserTest userTest : getTests()) {	
			if(userTest.getStatus().equals(UserTestStatus.OK)) {
				totalComplexity = totalComplexity + userTest.getComplexity();
				count++;
			}		
		}
		
		if(totalComplexity > 0) {
			return totalComplexity/count;
		}
		
		return null;
	}
	
	public double loadPercentCodeOK() {
		
		double total = 0;
		
		for(UserTest userTest : getTests()) {			
			if(userTest.getStatus().equals(UserTestStatus.OK)) {
				total++;
			}
		}
			
		return ((total/(double)getTests().size()));
	}
}