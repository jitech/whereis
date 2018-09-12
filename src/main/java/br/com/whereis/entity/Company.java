package br.com.whereis.entity;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Document(collection="company")
public class Company {

	@Id
	private ObjectId id;
    private String document;
    private String name;
    private Status status;    
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date include;
       
	public Company() {
		super();
	}

	public Company(String document, String name, Status status, Date include) {
		super();
		this.document = document;
		this.name = name;
		this.status = status;
		this.include = include;
	}
		
	public ObjectId getId() {
		return id;
	}
	
	public void setId(ObjectId id) {
		this.id = id;
	}
	
	public String getDocument() {
		return document;
	}
	
	public void setDocument(String document) {
		this.document = document;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
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
}