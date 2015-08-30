package com.jfinal.weixin.sdk.api;

import com.jfinal.kit.HttpKit;
import com.jfinal.weixin.sdk.kit.ParaMap;

/**
 * 
 * @author liuzhen
 * @version 
 * Aug 2, 2015 2:18:49 PM
 */
public class OpenIdApi {

	public final static String GET_OPENID = "https://api.weixin.qq.com/sns/oauth2/access_token";
	
	public static String getOpenId(String code) {
		ApiConfig apiConfig = ApiConfigKit.getApiConfig();
		ParaMap pm = ParaMap.create("appid", apiConfig.getAppId())
				.put("secret", apiConfig.getAppSecret())
				.put("code", code)
				.put("grant_type", "authorization_code");
		return new ApiResult(HttpKit.get(GET_OPENID, pm.getData())).getStr("openid");
	}
}
