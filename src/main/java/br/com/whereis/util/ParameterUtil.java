package br.com.whereis.util;

import java.util.Random;

public class ParameterUtil {

	public static Integer generateByRange100() throws Exception{
		return new Random().nextInt(100); 
	}
}