package jp.co.aforce.java;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail_function {
	public static boolean send_mail_function(String user_mailaddress, String user_name ,String login_url)
			throws UnsupportedEncodingException {
		String enc_user_mailaddress = Encryption_function.encryption(user_mailaddress);

		boolean check = false;
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				//return new PasswordAuthentication("a.tanaka.aforce@gmail.com", "hhrnasmnqlhugbmf");
				return new PasswordAuthentication("info.ecshopping.tanaka@gmail.com", "biiugxbrtwdwzhnl");
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("info.ecshopping.tanaka@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user_mailaddress));
			message.setSubject("ECサイト_アカウント認証のお知らせ");
			String body = "<html><body>" +
					"<p>こんにちは" + user_name + "さん</p><br><br>" +
					"<p>以下のリンクよりアカウント認証を行ってください</p><br>" +
					"<a href=\"http://"+login_url+"/ShoppingSite/views/users/access_authorization.jsp?autorization_code="
					+ enc_user_mailaddress + "\">アカウント認証はこちら</a>" +
					"</body></html>";
			message.setContent(body, "text/html; charset=utf-8");
			Transport.send(message);

			System.out.println("Email sent successfully.");
			check = true;

		} catch (MessagingException e) {
			e.printStackTrace();
			check = false;
		}
		return check;
	}
	public static boolean send_password_function(String user_mailaddress, String user_name, String password,String login_url)
			throws UnsupportedEncodingException {

		
		boolean check = false;

		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				
				
				//return new PasswordAuthentication("a.tanaka.aforce@gmail.com", "hhrnasmnqlhugbmf");
				return new PasswordAuthentication("info.ecshopping.tanaka@gmail.com", "biiugxbrtwdwzhnl");
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("info.ecshopping.tanaka@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user_mailaddress));
			message.setSubject("ECサイト_パスワードのお知らせ");
			String body = "<html><body>" +
					"<p>こんにちは" + user_name + "さん</p><br><br>" +
					"<p>あなたのログインパスワードはこちらです。</p><br>" +
					"<p>"+password+"</p><br>" +
					"<a href=\"http://"+login_url+"/ShoppingSite/views/users/login.jsp\">ログインはこちら</a>" +
					"</body></html>";
			message.setContent(body, "text/html; charset=utf-8");
			Transport.send(message);

			System.out.println("Email sent successfully.");
			check = true;

		} catch (MessagingException e) {
			e.printStackTrace();
			check = false;
		}
		return check;
	}
}
