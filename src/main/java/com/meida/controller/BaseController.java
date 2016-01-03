package com.meida.controller;

import com.jfinal.core.Controller;
import com.meida.config.Constant;
import com.meida.model.User;
import com.meida.service.UserService;

/**
 * Created by admin on 15/12/31.
 */
public class BaseController extends Controller {

    public User getCurrentUser() {
        return UserService.getUserByCache(getCookie(Constant.COOKIE_AUTH_KEY));
    }
}
