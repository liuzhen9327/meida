package com.meida;

import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.api.ApiConfig;

public class Constant {

	public static ApiConfig apiConfig = null;
	
	public static String  EMAIL_SUBJECT = null,
						  EMAIL_CONTENT = null,
						  EMAIL_USERNAME= null,
						  EMAIL_PASSWORD= null,
						  EMAIL_FORM    = null;
	public static String URL_PREFIX = null;
	
	public static void init() {
		apiConfig = new ApiConfig();
		apiConfig.setToken(PropKit.get("token"));
		apiConfig.setAppId(PropKit.get("appId"));
		apiConfig.setAppSecret(PropKit.get("appSecret"));
		apiConfig.setEncryptMessage(PropKit.getBoolean("encryptMessage", false));
		apiConfig.setEncodingAesKey(PropKit.get("encodingAesKey", "setting it in config file"));
		
		EMAIL_SUBJECT = PropKit.get("activate.account.subject");
		EMAIL_CONTENT = PropKit.get("activate.account.content");
		EMAIL_USERNAME = PropKit.get("activate.account.username");
		EMAIL_PASSWORD = PropKit.get("activate.account.password");
		EMAIL_FORM = PropKit.get("activate.account.from");
		
		URL_PREFIX = PropKit.get("url.prefix");
	}
}
