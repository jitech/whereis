package br.com.whereis.entity;

public class TestCase{
	 
	private String method;
	private Object[] parameters;
	private Object expected;
	 						
	public TestCase() {
		super();
	}

	public TestCase(String method, Object[] parameters, Object expected) {
		super();
		this.method = method;
		this.parameters = parameters;
		this.expected = expected;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Object[] getParameters() {
		return parameters;
	}

	public void setParameters(Object[] parameters) {
		this.parameters = parameters;
	}

	public Object getExpected() {
		return expected;
	}

	public void setExpected(Object expected) {
		this.expected = expected;
	} 
 }
