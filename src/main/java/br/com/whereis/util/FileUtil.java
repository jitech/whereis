package br.com.whereis.util;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtil {
		
	public static File saveFileIntoDirectory(HttpServletRequest request, String fileName) throws Exception{		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
		MultipartFile multipart = multipartRequest.getFile("file");
		MessageDigest m = MessageDigest.getInstance("MD5");
		m.update(fileName.getBytes(),0,fileName.length());				
		String name = new BigInteger(1,m.digest()).toString(16);				
	    File convFile = new File("/export/"+name+".jar");
	    multipart.transferTo(convFile);
	    return convFile;
	}
}