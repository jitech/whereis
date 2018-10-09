package br.com.whereis.entity;

public class TestCase{
	 
	private String className;
	private String methodName;
	private String[] typeParameters;
	private Object[] parameters;
	private Object expected;
	 						
	public TestCase() {
		super();
	}

	public TestCase(String className, String methodName, String[] typeParameters, Object[] parameters, Object expected) {
		super();
		this.className = className;
		this.methodName = methodName;
		this.typeParameters = typeParameters;
		this.parameters = parameters;
		this.expected = expected;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String[] getTypeParameters() {
		return typeParameters;
	}

	public void setTypeParameters(String[] typeParameters) {
		this.typeParameters = typeParameters;
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
