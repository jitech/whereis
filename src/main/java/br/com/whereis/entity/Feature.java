package br.com.whereis.entity;

import java.util.ArrayList;
import java.util.List;

public class Feature{
	 
	private String name;
	private String describe;
	private List<TestCase> testCases = new ArrayList<TestCase>();
	 	 
	public Feature() {
		super();
	}
	 
	public Feature(String name, String describe) {
		super();
		this.name = name;
		this.describe = describe;
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
 }