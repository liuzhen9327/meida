package com.meida.model;

import com.jfinal.plugin.ehcache.CacheKit;
import com.meida.model.base.BaseMenu;

import java.util.List;

/**
 * Created by liuzhen on 2016/1/6.
 */
public class Menu extends BaseMenu<Menu> {
    public final static String TABLE_NAME = "menu",
                               CACHE_NAME = "menu";

    public final static String name = "name",
                               path = "path",
                               className = "className",
                               parentId = "parentId";

    public static Menu dao = new Menu();

    public static List<Menu> allParentMenu() {
        return dao.findByCache(CACHE_NAME, "allParentMenu", "select * from " + TABLE_NAME + " where "+parentId+" =0 and deleteFlag=0");
    }

    public List<Menu> findSubMenu(long parentId) {
//        return dao.findByCache(CACHE_NAME, parentId, "select * from " + TABLE_NAME + " where parentId=?", parentId);
        return dao.find("select * from " + TABLE_NAME + " where parentId=?", parentId);
    }
}
