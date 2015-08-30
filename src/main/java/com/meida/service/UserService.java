package com.meida.service;

import java.util.Date;

import com.jfinal.kit.HashKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.meida.ReturnStatus;
import com.meida.model.Address;
import com.meida.model.User;

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
	
	public static boolean register(String email, String password, String openId) {
		User user = new User()
			.set("email", email).set("password", password)
			.set("openId", openId).set("updateTime", new Date());
		user.save();
		//send email
		return true;
	}
	
//	public static void 
	
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
