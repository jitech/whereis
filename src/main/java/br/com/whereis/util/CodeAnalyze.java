package br.com.whereis.util;

public class CodeAnalyze {
	
	private String className;
	private Integer complexity;
	
	public CodeAnalyze() {
		super();
	}
	
	public CodeAnalyze(String className, Integer complexity) {
		super();
		this.className = className;
		this.complexity = complexity;
	}

	public String getClassName() {
		return className;
	}
	
	public void setClassName(String className) {
		this.className = className;
	}
	
	public Integer getComplexity() {
		return complexity;
	}
	
	public void setComplexity(Integer complexity) {
		this.complexity = complexity;
	}
}