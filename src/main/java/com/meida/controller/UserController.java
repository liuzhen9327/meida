package com.meida.controller;

import org.apache.commons.lang.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.weixin.sdk.api.OpenIdApi;
import com.meida.ReturnStatus;
import com.meida.service.UserService;

/**
 * 
 * @author liuzhen
 * @version 
 * May 30, 2015 5:10:12 PM
 */
public class UserController extends Controller{

	public void login() {
		String username = getPara("email");
		String password = getPara("password");
		
	}
	
	public void register() {
		String  email = getPara("email"),
				password = getPara("password"),
				openId = getPara("openId");
		UserService.register(email, password, openId);
	}
	
	public void activeAccount() {
		String base64Str = getPara();
		System.out.println("base64Str: "+base64Str);
		if(StringUtils.isEmpty(base64Str)) renderError(500);
		int returnStatus = UserService.activeAccount(base64Str);
		if(returnStatus == ReturnStatus.ACTIVE_SUCCESS) {
//			setSessionAttr(key, value)
		}
		System.out.println("returnStatus: " + returnStatus);
//		forwardAction(actionUrl);
	}
}
