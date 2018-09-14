package br.com.whereis.entity;

public enum Complexity {
	LOW("LOW"), MEDIUM("MEDIUM"), HIGH("HIGH"), VERY_HIGH("VERY HIGH");
	 
    public String value;
    Complexity(String value) {
    	this.value = value;
    }
}
