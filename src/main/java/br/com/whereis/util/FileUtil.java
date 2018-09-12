package br.com.whereis.util;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
		
	public static File saveFileIntoDirectory(MultipartFile multipart, String fileName) throws Exception{      
		MessageDigest m = MessageDigest.getInstance("MD5");
		m.update(fileName.getBytes(),0,fileName.length());				
		String name = new BigInteger(1,m.digest()).toString(16);				
	    File convFile = new File("/export/"+name+".jar");
	    multipart.transferTo(convFile);
	    return convFile;
	}
}