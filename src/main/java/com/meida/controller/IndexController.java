package com.meida.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.meida.interceptor.AuthInterceptor;

/**
 * @author liuzhen
 * 2015年9月2日下午7:05:28
 */
@Before(AuthInterceptor.class)
public class IndexController extends BaseController {

	public void index() {
		renderJsp("/index.jsp");
	}
}
