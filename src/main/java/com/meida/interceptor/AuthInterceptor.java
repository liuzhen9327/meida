package com.meida.interceptor;

import org.apache.commons.lang.StringUtils;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.weixin.sdk.api.OpenIdApi;
import com.meida.model.User;
import com.meida.service.UserService;

public class AuthInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		Controller controller = inv.getController();
	    User sessionUser = controller.getSessionAttr("user");
	    if (sessionUser != null) inv.invoke();
	    else {
	    	String code = controller.getPara("code");
	    	if(StringUtils.isEmpty(code)) {
	    		//网页端
	    		controller.redirect("/login.jsp");
	    		return;
	    	}
	    	String openId = OpenIdApi.getOpenId(code);
	    	//if openid exists 
	    	User user = UserService.getUserByOpenId(openId);
	    	if(user == null) {
	    		//去绑定邮箱
	    		controller.redirect("/register.jsp");
	    		return;
	    	}
	    	if(user.getInt("status") == 0) {
	    		//去激活
	    		controller.redirect("/toActive.jsp");
	    		return;
	    	}
	    	//如果已经绑定了账号 但是session中user是空
	    	controller.setSessionAttr("user", user);
	    	inv.invoke();
	    }
	      
	}
}
