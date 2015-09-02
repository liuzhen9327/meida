package com.meida.service;

import java.util.Date;

import javax.mail.MessagingException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;

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

	/**
	 * 登录不需要openId，只有网页版需要login方法，微信端用openIdExists()
	 * @param email
	 * @param password
	 * @return
	 */
	public static int login(String email, String password) {
		User user = getUserByEmail(email);
		if(user == null) return ReturnStatus.ACCOUNT_NOT_EXISTS;
		Long id = user.getLong("id");
		if(!HashKit.sha512(password + id).equals(user.getStr("password")))
			return ReturnStatus.PASSWORD_ERROR;
		return ReturnStatus.LOGIN_SUCCESS;
	}
//	public static void main(String[] args) {
//		System.out.println(new String(Base64.encodeBase64("1_350995931@qq.com".getBytes())));
//		System.out.println(new String(Base64.decodeBase64("MV8zNTA5OTU5MzFAcXEuY29t")));
//	}
	
	public static int register(String email, String password, String openId) {
		if(emailExists(email)) return ReturnStatus.EMAIL_EXISTS;
		boolean flag = false,
				isModify = false;
		Long id = null;
		if(StringUtils.isNotEmpty(openId)){
			// openIdexists && status == 0 
			User user = getUserByOpenId(openId);
			if(user.getInt("status") == 0) {
				//绑定了邮箱但是没激活时，重新绑定
				flag = true;
				id = user.getLong("id");
				isModify = user.keep("id").set("email", email).set("password", HashKit.sha512(password + user.getLong("id"))).update();
			}
		}
		if(!flag) {
			User user = new User()
			.set("email", email).set("status", 0)
			.set("openId", openId).set("updateTime", new Date());
			if(user.save()) {
				isModify = true;
				id = user.getLong("id");
				user.keep("id").set("password", HashKit.sha512(password + user.getLong("id"))).update();
			}
		}
		if(isModify)
			try {
				EmailUtils.sendMail(email, Constant.URL_PREFIX + "/user/activeAccount/" + new String(Base64.encodeBase64((id+"_"+email).getBytes())));
			} catch (MessagingException e) {
				e.printStackTrace();
				return ReturnStatus.SEND_EMAIL_ERROR;
			}
		return ReturnStatus.WAITING_ACTIVE;
	}
	
	public static int activeAccount(String base64Str) {
		String decodeStr = new String(Base64.decodeBase64(base64Str));
		String[] array = decodeStr.split("_");
		if(array.length != 2) return ReturnStatus.ACTIVE_ERROR;
		User user = User.dao.findFirst(User.byId, array[0]);
		//激活失败, 用户不存在
		if(user == null) return ReturnStatus.ACTIVE_ERROR;
		//已经被激活
		if(user.getInt("status") != 0) return ReturnStatus.ACCOUNT_SUCCESSED;
		if(user.set("status", 1).set("updateTime", new Date()).update()){
			//refresh cache
			if(StringUtils.isNotEmpty(user.getStr("email")))
				CacheKit.put(User.CACHE_NAME, user.get("email"), user);
			if(StringUtils.isNotEmpty(user.getStr("openId")))
				CacheKit.put(User.CACHE_NAME, user.get("openId"), user);
			return ReturnStatus.ACTIVE_SUCCESS;
		}
		return ReturnStatus.ACTIVE_ERROR;
	}
	
	public static boolean emailExists(String email) {
		return getUserByEmail(email) != null;
	}
	
	public static boolean openIdExists(String openId) {
		return getUserByOpenId(openId) != null;
	}
	
	public static User getUserByOpenId(final String openId) {
		return CacheKit.get(User.CACHE_NAME, openId,
				new IDataLoader() {
					public Object load() {
						return User.dao.findFirst(User.byOpenId, openId);
					}
				});
	}
	
//	public static User getUser(final String email, String password) {
//		return CacheKit.get(CACHE_NAME, email,
//				new IDataLoader() {
//					public Object load() {
//						return User.dao.find(User.byEmail, email);
//					}
//				});
//	}
	
	public static User getUserByEmail(final String email) {
		return CacheKit.get(User.CACHE_NAME, email,
				new IDataLoader() {
					public Object load() {
						return User.dao.findFirst(User.byEmail, email);
					}
				});
	}
}
