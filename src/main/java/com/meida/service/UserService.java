package com.meida.service;

import java.util.Date;

import javax.mail.MessagingException;

import org.apache.commons.codec.binary.Base64;

import com.jfinal.kit.HashKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.meida.Constant;
import com.meida.ReturnStatus;
import com.meida.model.User;
import com.meida.utils.EmailUtils;

/**
 * 
 * @author liuzhen
 * @version 
 * May 26, 2015 3:23:35 PM
 */
public class UserService {

	private static String CACHE_NAME = "user";
	
	public static int login(String email, String password) {
		User user = getUserByEmail(email);
		if(user == null) return ReturnStatus.ACCOUNT_NOT_EXISTS;
		Long id = user.getLong("id");
		if(!HashKit.sha512(password + id).equals(user.getStr("password")))
			return ReturnStatus.PASSWORD_ERROR;
		return ReturnStatus.LOGIN_SUCCESS;
	}
	public static void main(String[] args) {
		System.out.println(new String(Base64.encodeBase64("1_350995931@qq.com".getBytes())));
		System.out.println(new String(Base64.decodeBase64("MV8zNTA5OTU5MzFAcXEuY29t")));
	}
	public static int register(String email, String password, String openId) {
		if(emailExists(email)) return ReturnStatus.EMAIL_EXISTS;
		User user = new User().set("status", 0)
			.set("email", email).set("password", password)
			.set("openId", openId).set("updateTime", new Date());
		if(user.save())
			try {
				EmailUtils.sendMail(email, Constant.URL_PREFIX + "/user/activeAccount/" + new String(Base64.encodeBase64((user.get("id")+"_"+email).getBytes())));
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		//TODO
		return ReturnStatus.WAITING_ACTIVE;
	}
	
	public static int activeAccount(String base64Str) {
		String decodeStr = new String(Base64.decodeBase64(base64Str));
		String[] array = decodeStr.split("_");
		if(array.length != 2) return ReturnStatus.ACTIVE_ERROR;
		User selectUser = User.dao.findFirst(User.byId, array[0]);
		//用户不存在
		if(selectUser == null) return ReturnStatus.ACTIVE_ERROR;
		//已经被激活
		if(selectUser.getInt("status") != 0) return ReturnStatus.ACCOUNT_SUCCESSED;
		new User().set("status", 1).set("updateTime", new Date()).set("id", array[0]).update();
		return ReturnStatus.ACTIVE_SUCCESS;
	}
	
	public static boolean emailExists(String email) {
		User user = getUserByEmail(email);
		return user != null;
	}
	
	public static User getUser(final String email, String password) {
		return CacheKit.get(CACHE_NAME, email,
				new IDataLoader() {
					public Object load() {
						return User.dao.find(User.byEmail, email);
					}
				});
	}
	
	private static User getUserByEmail(String email) {
		Object cacheObject = CacheKit.get(CACHE_NAME, email);
		if(cacheObject != null) return (User) cacheObject;
		return User.dao.findFirst(User.byEmail, email);
	}
}
