package br.com.whereis.entity;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Document(collection="test")
public class Test {

	private String name;
	private String describe;
	private List<Feature> features = new ArrayList<Feature>();
	private Language language;
	private Status status;
	 
	public Test() {
		super();
	}
	
	public Test(String name, String describe, Language language, Status status) {
		super();
		this.name = name;
		this.describe = describe;
		this.language = language;
		this.status = status;	
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

	public List<Feature> getFeatures() {
		return features;
	}

	public void setFeatures(List<Feature> features) {
		this.features = features;
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

	public void addFeature(String name, String describe) {		
		this.getFeatures().add(new Feature(name, describe));
	}

	public void addTestCase(String featureName, String methodToTest, Object[] parameters, Object expected) {
		
		for(Feature feature : getFeatures()) {			
			if(feature.getName().equals(featureName)) {						
				feature.getTestCases().add(new TestCase(methodToTest, parameters, expected));
				break;
			}
		}	
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