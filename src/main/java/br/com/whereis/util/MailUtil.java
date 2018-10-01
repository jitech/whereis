package br.com.whereis.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import br.com.whereis.entity.Mail;

public class MailUtil {
	
	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;
 
	public static boolean sendEmail(Mail mail) throws AddressException, MessagingException {
 
		try {
				mailServerProperties = System.getProperties();
				mailServerProperties.put("mail.smtp.port", "587");
				mailServerProperties.put("mail.smtp.auth", "true");
				mailServerProperties.put("mail.smtp.starttls.enable", "true");
 
				getMailSession = Session.getDefaultInstance(mailServerProperties, null);
				generateMailMessage = new MimeMessage(getMailSession);
				generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mail.getTo()));
				generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(mail.getFrom()));
				generateMailMessage.setSubject(mail.getSubject());
				generateMailMessage.setContent(mail.getContent(), "text/html");
				
				Transport transport = getMailSession.getTransport("smtp");
 
				transport.connect("smtp.gmail.com", "jgm.melo@gmail.com", "Ad@m19128888");
				transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
				transport.close();
				return true;				
				
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
