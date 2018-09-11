package br.com.whereis.entity;

public class User {

	private String email;
	private String password;
	private String name;
	private Status status;
	
	public User(String email, String password, String name, Status status) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.status = status;
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
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", name=" + name + ", status=" + status + "]";
	}
}