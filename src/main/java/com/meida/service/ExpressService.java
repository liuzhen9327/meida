package com.meida.service;

import com.jfinal.plugin.ehcache.CacheKit;
import com.meida.model.Express;

import java.util.List;

/**
 * Created by admin on 16/1/3.
 */
public class ExpressService {
    public static List<Express> findAll() {
        return Express.dao.findByCache(Express.CACHE_NAME, Express.CACHE_NAME, Express.sql_findAll);
    }

    public static void saveExpress2Cache() {
        List<Express> allExpress = findAll();
        for (Express express : allExpress) {
            CacheKit.put(Express.CACHE_NAME, express.get(Express.code), express.get(Express.name));
        }
    }
}
