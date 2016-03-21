package com.meida.service;

import com.jfinal.kit.HashKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.meida.config.Constant;
import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OrderTypeEnum;
import com.meida.exception.BusinessException;
import com.meida.model.Order;
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
		Long id = user.getId();
		if(!encryptPassword(password, id).equals(user.getStr(User.password)))
			throw new BusinessException(ExceptionEnum.PASSWORD_ERROR);
		return saveUser2Cache(user);
	}

    public static User get(long id) {
        return User.dao.findById(id);
    }

	public static void main(String[] args) {
		System.out.println(System.getProperty("user.home"));
		System.out.println(System.getProperty("user.dir"));
		System.out.println(System.getProperty("java.io.tmpdir"));
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
	
	public static void register(User user) {
		if(emailExists(user.getEmail())) throw new BusinessException(ExceptionEnum.EMAIL_EXISTS);
		boolean flag = false,
				isModify = false;
		Long id = null;
		if(StringUtils.isNotEmpty(user.getOpenId())){
			// openIdexists && status == 0 
			User temp = getUserByOpenId(user.getOpenId());
			if(temp.getInt(User.status) == 0) {
				//绑定了邮箱但是没激活时，重新绑定
				flag = true;
				id = temp.getId();
				isModify = temp.keep("id").set(User.email, user.getEmail()).set(User.password, encryptPassword(user.getPassword(), id)).update();
			}
		}
		User temp = new User();
		if(!flag) {
			temp.set(User.name, user.getName())
				.set(User.email, user.getEmail())
				.set(User.status, 0)
				.set(User.openId, user.getOpenId() == ""?null:user.getOpenId())
				.setCreater(0l);
			temp.setUpdater(0l);
			temp.setUpdateTime(new Date());
			if(temp.save()) {
				isModify = true;
				id = temp.getId();
				temp.keep("id")
					.setCreater(id);
				temp.setUpdater(id);
				temp.set(User.password, encryptPassword(user.getPassword(), id));
				temp.update();
			}
		}
		if(isModify)
			EmailUtils.sendMail(user.getEmail(), Constant.URL_PREFIX + "/user/activeAccount/" + new String(Base64.encodeBase64((id+"_"+temp.getStr(User.password)).getBytes())));
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
		if (StringUtils.isBlank(email)) return null;
		return User.dao.findFirst(User.sql_findByEmail, email);
	}

	public static List<User> getMyFriends(long id) {
		return User.dao.find(User.sql_findMyFriends, id);
	}
}
