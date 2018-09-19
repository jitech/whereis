package br.com.whereis.util;

public class TestUtil {
		
	public static String createTestURL(String code) throws Exception{
		return "http://localhost:8080/test/make/"+code;
	}
}