package com.meida.interceptor;

import com.meida.config.Constant;
import com.meida.controller.BaseController;
import org.apache.commons.lang.StringUtils;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.weixin.sdk.api.OpenIdApi;
import com.meida.model.User;
import com.meida.service.UserService;

public class AuthInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		BaseController controller = (BaseController) inv.getController();

		String authId = controller.getCookie(Constant.COOKIE_AUTH_KEY);
		if (StringUtils.isBlank(authId)) {
			controller.redirect("/login.jsp");
			return;
		}

		User user = controller.getCurrentUser();
	    if (user != null) {
			inv.invoke();
            controller.setCookie(Constant.COOKIE_AUTH_KEY, authId, 3600, Constant.COOKIE_PATH);
			UserService.refreshUserByCache(authId, user);
            controller.setAttr("user", user);
        } else {
	    	String code = controller.getPara("code");
	    	if(StringUtils.isBlank(code)) {
	    		//网页端
	    		controller.redirect("/login.jsp");
	    		return;
	    	}
	    	String openId = OpenIdApi.getOpenId(code);
			//TODO validate openId
	    	//if openid exists
//	    	User user = UserService.getUserByOpenId(openId);
//	    	if(user == null) {
//	    		//去绑定邮箱
//	    		controller.redirect("/register.jsp");
//	    		return;
//	    	}
//	    	if(user.getInt("status") == 0) {
//	    		//去激活
//	    		controller.redirect("/toActive.jsp");
//	    		return;
//	    	}
//	    	//如果已经绑定了账号 但是session中user是空
//	    	controller.setSessionAttr("user", user);
//	    	inv.invoke();
		}
	}
}
