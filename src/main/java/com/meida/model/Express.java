package com.meida.model;

/**
 * Created by admin on 16/1/3.
 */
public class Express extends BaseModel<Express> {
    public final static String TABLE_NAME = "express",
                               CACHE_NAME = "express";

    public final static Express dao = new Express();

    public final static String name = "name",
                               code = "code";

    public final static String sql_findAll = "select * from " + TABLE_NAME;
}
