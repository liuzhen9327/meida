package com.meida.controller;

import com.jfinal.core.Controller;
import com.jfinal.weixin.sdk.api.OpenIdApi;

public class RedirectController extends Controller {

	public void login() {
		renderJsp("/login.jsp");
	}

	public void register() {
		String code = getPara("code");

//		System.out.println(code);
		if (code != null) {
			String openId = OpenIdApi.getOpenId(code);
			setAttr("openId", openId);
//			System.out.println(openId);
		}
		renderJsp("/register.jsp");
	}

}
