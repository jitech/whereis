package br.com.whereis.util;

import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;

import org.jacoco.core.analysis.IClassCoverage;

public class MethodAnalyzer {

	private IClassCoverage classCoverage;
	
	public MethodAnalyzer(IClassCoverage cc) {
		this.classCoverage = cc;
	}	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean isMethodCorrect(String pathFile, String methodName, Object param, Object expected){
		
		try {
		Class params[] = new Class[1];
		params[0] = Integer.class;
		
		//URL url = new URL("file:/home/jonas/Developer/export/test.jar");
		URL url = new URL("file:"+pathFile);
		URL[] urls = {url};
	
		URLClassLoader child = new URLClassLoader(urls);
		
		Class cls = Class.forName(classCoverage.getName().replaceAll("/", "."),true, child);
	
		Object obj = cls.newInstance();
		
		Method method = cls.getDeclaredMethod(methodName, params);
				
		if(method.invoke(obj, param) == expected) {
			
			return true;
		}
		
		return false;
		
		}catch(Exception ex) {		
			ex.printStackTrace();
			return false;
		}
	}
}
