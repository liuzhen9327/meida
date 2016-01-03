package com.meida.service;

import com.jfinal.kit.HashKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.meida.config.Constant;
import com.meida.enumerate.ExceptionEnum;
import com.meida.exception.BusinessException;
import com.meida.model.User;
import com.meida.utils.EmailUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 
 * @author liuzhen
 * @version 
 * May 26, 2015 3:23:35 PM
 */
public class UserService {

	private static Logger log = LoggerFactory.getLogger(UserService.class);
	/**
	 * 登录不需要openId，只有网页版需要login方法，微信端用openIdExists()
	 * @param email
	 * @param password
	 * @return authId
	 */
	public static String login(String email, String password) {
		User user = getUserByEmail(email);
		if(user == null) throw new BusinessException(ExceptionEnum.ACCOUNT_NOT_EXISTS);
		if (user.getInt(User.status) == 0) throw new BusinessException(ExceptionEnum.WAITING_ACTIVE);
		Long id = user.getLong(User.id);
		if(!encryptPassword(password, id).equals(user.getStr(User.password)))
			throw new BusinessException(ExceptionEnum.PASSWORD_ERROR);
		return saveUser2Cache(user);
	}

	/**
	 * @param user
	 * @return authId
     */
	public static String saveUser2Cache(User user) {
		String authId = UUID.randomUUID().toString().replace("-", "");
		CacheKit.put(User.CACHE_NAME, authId, user);
		return authId;
	}

	public static void refreshUserByCache(String authId, User user) {
		CacheKit.put(User.CACHE_NAME, authId, user);
	}

	public static User getUserByCache(String authId) {
		return CacheKit.get(User.CACHE_NAME, authId);
	}
//	public static void main(String[] args) {
//		System.out.println(new String(Base64.encodeBase64("1_350995931@qq.com".getBytes())));
//		System.out.println(new String(Base64.decodeBase64("MV8zNTA5OTU5MzFAcXEuY29t")));
//	}
	
	public static void register(String name, String email, String password, String openId) {
		if(emailExists(email)) throw new BusinessException(ExceptionEnum.EMAIL_EXISTS);
		boolean flag = false,
				isModify = false;
		Long id = null;
		if(StringUtils.isNotEmpty(openId)){
			// openIdexists && status == 0 
			User user = getUserByOpenId(openId);
			if(user.getInt(User.status) == 0) {
				//绑定了邮箱但是没激活时，重新绑定
				flag = true;
				id = user.getLong(User.id);
				isModify = user.keep(User.id).set(User.email, email).set(User.password, encryptPassword(password, id)).update();
			}
		}
		User user = new User();
		if(!flag) {
			user.set(User.name, name)
				.set(User.email, email)
				.set(User.status, 0)
				.set(User.openId, openId)
				.set(User.creater, 0)
				.set(User.updater, 0)
				.set(User.updateTime, new Date());
			if(user.save()) {
				isModify = true;
				id = user.getLong(User.id);
				user.keep(User.id)
					.set(User.creater, id)
					.set(User.updater, id)
					.set(User.password, encryptPassword(password, id))
					.update();
			}
		}
		if(isModify)
			EmailUtils.sendMail(email, Constant.URL_PREFIX + "/user/activeAccount/" + new String(Base64.encodeBase64((id+"_"+user.getStr(User.password)).getBytes())));
	}
	
	public static String activeAccount(String base64Str) {
		String decodeStr = new String(Base64.decodeBase64(base64Str));
		String[] array = decodeStr.split("_");
		if(array.length != 2) throw new BusinessException(ExceptionEnum.ACTIVE_ERROR, "参数错误");
		User user = User.dao.findById(array[0]);
		//激活失败, 用户不存在
		if(user == null) throw new BusinessException(ExceptionEnum.ACTIVE_ERROR, "用户不存在");
		if(!array[1].equals(user.getStr(User.password))) throw new BusinessException(ExceptionEnum.ACTIVE_ERROR, "参数错误");
		//已经被激活
		if(user.getInt("status") != 0) throw new BusinessException(ExceptionEnum.ACTIVE_ERROR, "用户已经被激活");
		user.set("status", 1).set("updateTime", new Date()).update();
		return saveUser2Cache(user);
	}

	private static String encryptPassword(String password, Object key) {
		return HashKit.sha512(password.concat(key.toString()));
	}

	public static boolean emailExists(String email) {
		return getUserByEmail(email) != null;
	}
	
	public static boolean openIdExists(String openId) {
		return getUserByOpenId(openId) != null;
	}
	
	public static User getUserByOpenId(final String openId) {
		return User.dao.findFirst(User.sql_findByOpenId, openId);
	}
	
//	public static User getUser(final String email, String password) {
//		return CacheKit.get(CACHE_NAME, email,
//				new IDataLoader() {
//					public Object load() {
//						return User.dao.find(User.getByEmail, email);
//					}
//				});
//	}
	
	public static User getUserByEmail(final String email) {
		return User.dao.findFirst(User.sql_findByEmail, email);
	}

	public static List<User> getMyFriends(long id) {
		return User.dao.find(User.sql_findMyFriends, id);
	}
}
