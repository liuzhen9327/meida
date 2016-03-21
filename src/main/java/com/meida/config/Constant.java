package com.meida.config;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.api.ApiConfig;

public class Constant {

	public final static String CHARSET = "UTF-8";

	public static ApiConfig apiConfig = null;
	
	public static String  EMAIL_SUBJECT = null,
						  EMAIL_CONTENT = null,
						  EMAIL_USERNAME= null,
						  EMAIL_PASSWORD= null,
						  EMAIL_FORM    = null;
	public static String URL_PREFIX = null;

    public static String[] LETTERS = new String[]{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

	public static int mysqlBatchSize = 1000;

	//user config
	public final static String COOKIE_PATH = "/",
							   COOKIE_AUTH_KEY = "authId";

	public static void init() {
		apiConfig = new ApiConfig();
		Prop prop = PropKit.use("config.properties");
		apiConfig.setToken(prop.get("token"));
		apiConfig.setAppId(prop.get("appId"));
		apiConfig.setAppSecret(prop.get("appSecret"));
		apiConfig.setEncryptMessage(prop.getBoolean("encryptMessage", false));
		apiConfig.setEncodingAesKey(prop.get("encodingAesKey", "setting it in config file"));
		
		EMAIL_SUBJECT = prop.get("activate.account.subject");
		EMAIL_CONTENT = prop.get("activate.account.content");
		EMAIL_USERNAME = prop.get("activate.account.username");
		EMAIL_PASSWORD = prop.get("activate.account.password");
		EMAIL_FORM = prop.get("activate.account.from");
		
		URL_PREFIX = prop.get("url.prefix");

		mysqlBatchSize = prop.getInt("mysqlBatchSize");


	}

	public final static String CUT_FILL_STR = "...";
}
