package br.com.whereis.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;

import br.com.whereis.entity.TestCase;

public class MethodUtil {

	private static JarInputStream jarInputStream;
	
	public static boolean isCorrectMethod(String pathFile, TestCase testCase) {
		
		try {
				@SuppressWarnings("rawtypes")
				Class params[] = new Class[testCase.getTypeParameters().length];
			
				for(int x = 0 ; x < testCase.getTypeParameters().length; x++) {
					
					if(testCase.getTypeParameters()[x].equals("double") || testCase.getTypeParameters()[x].equals("Double")) {
						params[x] = double.class;
						
					}else if(testCase.getTypeParameters()[x].equals("int") || testCase.getTypeParameters()[x].equals("Integer")){
						params[x] = int.class;
						
					}else if(testCase.getTypeParameters()[x].equals("String")){
						params[x] = String.class;
						
					}else if(testCase.getTypeParameters()[x].equals("float")){
						params[x] = float.class;						
					}							
				}
						
				jarInputStream = new JarInputStream(new FileInputStream(pathFile));
				JarEntry jarEntry;
				
				
				while (true) {
					
					jarEntry = jarInputStream.getNextJarEntry();
					
					if (jarEntry == null) {
						break;
					}
					
					if ((jarEntry.getName().endsWith(".class") && jarEntry.getName().contains(testCase.getClassName()+".class"))) {
						String name = jarEntry.getName().replaceAll("/", "\\.");
						String myClass = name.substring(0, name.lastIndexOf('.'));
						
						URL url = new URL("file:"+pathFile);
						URLClassLoader loader = new URLClassLoader (new URL[] {url});
						Class<?> cl = Class.forName (myClass, true, loader);
						Method method = cl.getMethod(testCase.getMethodName(), params);
						Constructor<?> ctor = cl.getConstructor();
						Object instance = ctor.newInstance();

						if(method.invoke(instance, testCase.getParameters()).equals(testCase.getExpected())) {				
							return true;
						}
					}
				}

				return false;
		
		}catch(NoSuchMethodException ex) {
			ex.printStackTrace();
			return false;
			
		}catch(Exception ex) {		
			ex.printStackTrace();
			return false;	
			
		}finally {
			
			try {
				jarInputStream.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
