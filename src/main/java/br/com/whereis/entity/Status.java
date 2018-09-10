package br.com.whereis.entity;

public enum Status {
	ACTIVE("ACTIVE"),INACTIVE("INACTIVE");
	 
    public String value;
    Status(String value) {
    	this.value = value;
    }
}
