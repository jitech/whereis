package br.com.whereis.factory;

import br.com.whereis.entity.Mail;

public class MailFactory {
	
	public static Mail create(String to, String from, String subject, String content) throws Exception{		
		return new Mail(to, from, subject, content);
	}
}