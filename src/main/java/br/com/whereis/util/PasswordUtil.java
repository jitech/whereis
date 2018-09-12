package br.com.whereis.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class PasswordUtil {

	public static String encripty(String text) throws Exception{
		MessageDigest m=MessageDigest.getInstance("MD5");
		m.update(text.getBytes(),0,text.length());
		return new BigInteger(1,m.digest()).toString(16);
	}
}