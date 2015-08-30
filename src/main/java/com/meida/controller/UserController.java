package com.meida.controller;

import com.jfinal.core.Controller;
import com.jfinal.weixin.sdk.api.OpenIdApi;
import com.meida.service.UserService;

/**
 * 
 * @author liuzhen
 * @version 
 * May 30, 2015 5:10:12 PM
 */
public class UserController extends Controller{

	public void tologin() {
		renderJsp("/login.jsp");
	}
	
	public void login() {
		String username = getPara("email");
		String password = getPara("password");
		
	}
	
	public void emailExists() {
		String email = getPara("email");
		
	}
	
	public void toRegister() {
		String code = getPara("code");
		String openId = OpenIdApi.getOpenId(code);
		setAttr("openId", openId);
		renderJsp("/register.jsp");
	}
	
	public void register() {
		String  email = getPara("email"),
				password = getPara("password"),
				openId = getPara("openId");
		UserService.register(email, password, openId);
	}
}
