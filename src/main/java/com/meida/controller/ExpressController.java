package com.meida.controller;

import com.jfinal.aop.Before;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import com.jfinal.plugin.ehcache.CacheName;
import com.meida.model.Express;
import com.meida.service.ExpressService;
import com.meida.vo.JSONResult;

import java.util.List;

/**
 * Created by admin on 16/1/3.
 */
public class ExpressController extends BaseController {

//    @Before(CacheInterceptor.class)
//    @CacheName("expressList")
//    public void all() {
//        List<Express> expressList = ExpressService.findAll();
//        renderJson(JSONResult.succ(expressList));
//    }
}
