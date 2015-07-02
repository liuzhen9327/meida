package com.meida.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.kit.IpKit;

/**
 * 
 * @author liuzhen
 * @version 
 * Jul 1, 2015 2:49:10 PM
 */
public class EmailUtils {
	
	private static Properties mailSmtpProps = new Properties();
	
	static {
		mailSmtpProps.put("mail.smtp.host", "smtp.qq.com");
		mailSmtpProps.put("mail.smtp.port", "25");
		mailSmtpProps.put("mail.smtp.auth", "true");
		mailSmtpProps.put("mail.smtp.localhost", IpKit.getHostName()); 
	}

	public static void sendMail(
			String to, String subject, String content) throws AddressException, MessagingException {
		final String username = PropKit.get("activate.account.username"); 
		final String password = PropKit.get("activate.account.password");
		Authenticator authenticator = new Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password);
		    }
		};
		Session sendMailSession = Session.getDefaultInstance(mailSmtpProps, authenticator);
		MimeMessage mailMessage = new MimeMessage(sendMailSession);
		mailMessage.setFrom(new InternetAddress(PropKit.get("activate.account.from")));
		// Message.RecipientType.TO属性表示接收者的类型为TO
		mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		mailMessage.setSubject(subject, "UTF-8");
		mailMessage.setSentDate(new Date());
		// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
		Multipart mainPart = new MimeMultipart();
		// 创建一个包含HTML内容的MimeBodyPart
		BodyPart html = new MimeBodyPart();
		html.setContent(content.trim(), "text/html; charset=utf-8");
		mainPart.addBodyPart(html);
		mailMessage.setContent(mainPart);
		Transport.send(mailMessage);
	}
	public static void main(String[] args) {
//		String format = "aaa{0}aaa";
//		System.out.println(MessageFormat.format(format, 1));
		System.out.println(IpKit.getHostName());
	}
	
}