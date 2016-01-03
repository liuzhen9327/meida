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

import com.jfinal.core.JFinal;
import com.meida.enumerate.ExceptionEnum;
import com.meida.exception.BusinessException;
import org.apache.commons.lang.StringUtils;

import com.jfinal.weixin.sdk.kit.IpKit;
import com.meida.config.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author liuzhen
 * @version Jul 1, 2015 2:49:10 PM
 */
public class EmailUtils {

    private static Properties mailSmtpProps = new Properties();

    private static Logger log = LoggerFactory.getLogger(EmailUtils.class);

    static {
//		mailSmtpProps.put("mail.smtp.host", "smtp.qq.com");
//		mailSmtpProps.put("mail.smtp.port", "465");
//		mailSmtpProps.put("mail.smtp.auth", "true");
//		mailSmtpProps.put("mail.smtp.ssl.trust","*");
//		mailSmtpProps.put("mail.smtp.localhost", IpKit.getHostName());

        mailSmtpProps.put("mail.smtp.auth", "true");
        mailSmtpProps.put("mail.smtp.debug", "true");
        mailSmtpProps.put("mail.smtp.host", "smtp.qq.com");
        mailSmtpProps.put("mail.smtp.port", "465");
        mailSmtpProps.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        mailSmtpProps.put("mail.smtp.socketFactory.fallback", "false");
        mailSmtpProps.put("mail.smtp.socketFactory.port", "465");
        mailSmtpProps.put("mail.smtp.starttls.enable", "true");
    }

    public static void sendMail(
            String to, String content) {
        try {
            final String username = Constant.EMAIL_USERNAME,
                    password = Constant.EMAIL_PASSWORD,
                    from = Constant.EMAIL_FORM;
            Authenticator authenticator = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            };//npsagsfgxmycbjae
            Session sendMailSession = Session.getDefaultInstance(mailSmtpProps, authenticator);
            MimeMessage mailMessage = new MimeMessage(sendMailSession);
            mailMessage.setFrom(new InternetAddress(from));
            // Message.RecipientType.TO属性表示接收者的类型为TO
            mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            mailMessage.setSubject(Constant.EMAIL_SUBJECT, "UTF-8");
            mailMessage.setSentDate(new Date());
            // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
            Multipart mainPart = new MimeMultipart();
            // 创建一个包含HTML内容的MimeBodyPart
            BodyPart html = new MimeBodyPart();
            html.setContent(StringUtils.replace(Constant.EMAIL_CONTENT, "${url}", content), "text/html; charset=utf-8");
            mainPart.addBodyPart(html);
            mailMessage.setContent(mainPart);
            Transport.send(mailMessage);
        } catch (MessagingException e) {
            log.error("send mail error!", e);
            throw new BusinessException(ExceptionEnum.SEND_EMAIL_ERROR);
        }

    }

    public static void main(String[] args) {
//		String format = "aaa{0}aaa";
//		System.out.println(MessageFormat.format(format, 1));
//		System.out.println(IpKit.getHostName());
        sendMail("350995931@qq.com", "aaaa");
    }

}
