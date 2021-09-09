package spring.web;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailMail
{
	private JavaMailSender mailSender;
	private SimpleMailMessage simpleMailMessage;

	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	 public void sendMail(final String from, final String to,final String subject,final String msg) {  
	        try{  
	        MimeMessage message = mailSender.createMimeMessage();  
	  
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);  
	        helper.setFrom(from);  
	        helper.setTo(to);  
	        helper.setSubject(subject);  
	        helper.setText(msg);  
	  
	        // attach the file  
	   /*     FileSystemResource file = new FileSystemResource(new File("c:/rr.jpg"));  
	        helper.addAttachment("mybrothermage.jpg", file);//image will be sent by this name  
	  */
	        mailSender.send(message);  
	        }catch(MessagingException e){e.printStackTrace();}  
	    }  
}