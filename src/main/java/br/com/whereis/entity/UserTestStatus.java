package br.com.whereis.entity;

public enum UserTestStatus {
	OK("OK"), NOK("NOK"), WAIT("WAIT");
	 
    public String value;
    UserTestStatus(String value) {
    	this.value = value;
    }
}
