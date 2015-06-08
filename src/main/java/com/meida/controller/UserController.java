package com.meida.controller;

import com.jfinal.core.Controller;

/**
 * 
 * @author liuzhen
 * @version 
 * May 30, 2015 5:10:12 PM
 */
public class UserController extends Controller{

	public void login() {
		renderJsp("../login.jsp");
	}
}
