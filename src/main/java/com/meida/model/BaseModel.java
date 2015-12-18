package com.meida.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class BaseModel<M extends Model> extends Model<M>{
    public final static String id = "id",
                               deleteFlag = "deleteFlag",
                               createTime = "createTime",
                               creater = "creater",
                               updateTime = "updateTime",
                               updater = "updater";
}
