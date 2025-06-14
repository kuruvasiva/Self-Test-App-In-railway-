package com.siva.uility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
@Component
public class EmailUtils {

	@Autowired
	private JavaMailSender mailSender;
	
	public boolean sendEmail(String to, String subject, String body) {
		
		try {
			
		MimeMessage mimeMessage = mailSender.createMimeMessage();
	
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
	
			helper.setTo(to);
	        helper.setSubject(subject);
	        helper.setText(body,true);
			
	        mailSender.send(mimeMessage);
	        return true;
		} catch (MessagingException e) {
			
			e.printStackTrace();
			return false;
		}
		
		
		
	}
	
	
}
