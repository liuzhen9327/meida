package com.meida.controller;

import org.apache.commons.lang.StringUtils;

import com.jfinal.core.Controller;
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
		int returnStatus = UserService.register(email, password, openId);
		System.out.println("register returnStatus: " + returnStatus);
		switch (returnStatus) {
		case ReturnStatus.EMAIL_EXISTS:
			setAttr("email", email);
			setAttr("password", password);
			renderJsp("register.jsp");
			break;
		case ReturnStatus.SEND_EMAIL_ERROR:
			setAttr("errMsg", "发送激活邮件失败");
			renderError(500);
			break;
		case ReturnStatus.WAITING_ACTIVE:
			renderJsp("toActive.jsp");
			break;
		}
	}
	
	public void activeAccount() {
		String base64Str = getPara();
		System.out.println("base64Str: "+base64Str);
		if(StringUtils.isEmpty(base64Str)) renderError(500);
		int returnStatus = UserService.activeAccount(base64Str);
		System.out.println("activeAccount returnStatus: " + returnStatus);
		
		switch (returnStatus) {
		case ReturnStatus.ACTIVE_SUCCESS:
			redirect("/index/");
			break;
		case ReturnStatus.ACTIVE_ERROR:
			setAttr("errMsg", "激活失败");
			renderError(500);
			break;
		case ReturnStatus.ACCOUNT_SUCCESSED:
			setAttr("errMsg", "你已激活成功，请不要重复激活");
			renderError(500);
			break;
		}
	}
}
