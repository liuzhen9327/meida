package com.meida.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.weixin.sdk.api.OpenIdApi;
import com.meida.interceptor.AuthInterceptor;
import org.apache.commons.lang.StringUtils;

/**
 * @author liuzhen
 * 2015年9月2日下午7:05:28
 */
@Before(AuthInterceptor.class)
public class IndexController extends BaseController {

	public void index() {
		renderJsp("/index.jsp");
	}

//	public void login() {
//		renderJsp("/login.jsp");
//	}

	public void register() {
		String code = getPara("code");

//		System.out.println(code);
		if (StringUtils.isNotEmpty(code)) {
			String openId = OpenIdApi.getOpenId(code);
			setAttr("openId", openId);
//			System.out.println(openId);
		}
		renderJsp("/WEB-INF/register.jsp");
	}
}
