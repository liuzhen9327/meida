package com.meida.controller;

import org.apache.commons.lang.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.weixin.sdk.api.OpenIdApi;

public class RedirectController extends Controller {
	public void login() {
		renderJsp("/login.jsp");
	}

	public void register() {
		String code = getPara("code");

//		System.out.println(code);
		if (StringUtils.isNotEmpty(code)) {
			String openId = OpenIdApi.getOpenId(code);
			setAttr("openId", openId);
//			System.out.println(openId);
		}
		renderJsp("/register.jsp");
	}

}
