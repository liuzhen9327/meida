package com.meida.service;

import com.meida.model.Express;

import java.util.List;

/**
 * Created by admin on 16/1/3.
 */
public class ExpressService {
    public static List<Express> findAll() {
        return Express.dao.findByCache(Express.CACHE_NAME, Express.CACHE_NAME, Express.sql_findAll);
    }
}
