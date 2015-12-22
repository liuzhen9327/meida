package com.meida.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.Date;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class BaseModel<M extends Model> extends Model<M>{

    public BaseModel() {
        set(Order.updateTime, new Date());
    }
    public final static String id = "id",
                               deleteFlag = "deleteFlag",
                               createTime = "createTime",
                               creater = "creater",
                               updateTime = "updateTime",
                               updater = "updater";
}
