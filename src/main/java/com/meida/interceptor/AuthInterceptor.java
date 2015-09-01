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
	    User loginUser = controller.getSessionAttr("loginUser");
	    if (loginUser != null)
	    	inv.invoke();
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
	    		controller.redirect("/register.jsp");
	    		return;
	    	}
	    	if(user.getInt("status") == 0) {
	    		//TODO 去激活
	    	}
//	    	
	    }
	      
	}
}
