package com.meida.controller;

import com.jfinal.aop.Clear;
import com.meida.config.Constant;
import com.meida.interceptor.AuthInterceptor;
import com.meida.model.User;

import com.meida.service.UserService;
import org.apache.commons.codec.binary.Base64;

/**
 * @author liuzhen
 * @version May 30, 2015 5:10:12 PM
 */
public class UserController extends BaseController {

    @Clear(AuthInterceptor.class)
    public void login() {
        String email = getPara(User.email);
        String password = getPara(User.password);
        String authId = UserService.login(email, password);
        setCookie(Constant.COOKIE_AUTH_KEY, authId, 3600, Constant.COOKIE_PATH);
        renderJsp("/index.jsp");
    }

    @Clear(AuthInterceptor.class)
    public void register() {
		String  email = getPara(User.email),
                name = getPara(User.name),
				password = getPara(User.password),
				openId = getPara(User.openId);
		UserService.register(name, email, password, openId);
        redirect("/toActive.jsp?" + new String(Base64.encodeBase64(email.getBytes())));
    }

    @Clear(AuthInterceptor.class)
    public void activeAccount() {
		String base64Str = getPara();
        String authId = UserService.activeAccount(base64Str);
        setCookie(Constant.COOKIE_AUTH_KEY, authId, 3600, Constant.COOKIE_PATH);
        renderJsp("/index.jsp");
    }
}
