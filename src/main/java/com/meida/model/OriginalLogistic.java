package com.meida.model;

/**
 * 原始物流
 * Created by admin on 15/12/20.
 * `id` bigint(20) NOT NULL auto_increment,
 `name` varchar(50) NOT NULL COMMENT '物流名称',
 `number` varchar(50) NOT NULL COMMENT '物流号',
 `weight` decimal(6,2) NOT NULL,
 `status` INT DEFAULT 0 COMMENT '处理状态 0待入库 1已入库 2已出仓',
 `receiver` varchar(20) NOT NULL,
 `mobile` varchar(20) NOT NULL,
 `address` varchar(100) NOT NULL,
 `remark` varchar(200),
 `orderId` bigint(20) NOT NULL,
 `deleteFlag` BIT DEFAULT 0,
 `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `creater` bigint(20) NOT NULL ,
 `updateTime` TIMESTAMP NOT NULL,
 `updater` bigint(20) NOT NULL ,
 */
public class OriginalLogistic extends BaseModel<OriginalLogistic> {

    public final static String TABLE_NAME = "originalLogistic";

    public final static OriginalLogistic dao = new OriginalLogistic();

    public final static String name = "name",
                               number = "number",
                               weight = "weight",
                               status = "status",
                               receiver = "receiver",
                               mobile = "mobile",
                               address = "address",
                               remark = "remark",
                               orderId = "orderId";

    public final static String sql_findAll = "select * from " + TABLE_NAME;
    public final static String sql_findByNumber = sql_findAll + " where " + number + "=?";
}
