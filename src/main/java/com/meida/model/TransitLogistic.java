package com.meida.model;

/**
 * Created by liuzhen on 2015/12/25.
 * CREATE TABLE `transitLogistic` (
 `id` bigint(20) NOT NULL auto_increment,
 `name` varchar(50) NOT NULL COMMENT '物流名称',
 `number` varchar(50) NOT NULL COMMENT '物流号',
 `type` INT NOT NULL COMMENT '1拆包 2原装转发',
 `contactInfo` VARCHAR (200),
 `weight` decimal(6,2) NOT NULL,
 `remark` varchar(200),
 `orderId` bigint(20) NOT NULL,
 `originalId` bigint(20) NOT NULL DEFAULT 0,
 `sendTime` bigint(13) default null,
 `deleteFlag` BIT DEFAULT 0,
 `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `creater` bigint(20) NOT NULL ,
 `updateTime` TIMESTAMP NOT NULL,
 `updater` bigint(20) NOT NULL ,
 PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
 */
public class TransitLogistic extends BaseModel<TransitLogistic>{
    public final static String TABLE_NAME = "transitLogistic";

    public final static TransitLogistic dao = new TransitLogistic();

    public final static String name = "name",
                               number = "number",
                               weight = "weight",
                               type = "type",
                               contactInfo = "contactInfo",
                               originalId = "originalId",
                               remark = "remark",
                               orderId = "orderId",
                               sendTime = "sendTime";

    public final static String sql_findByOriginalId = "select * from " + TABLE_NAME + " where " + originalId + "=?";
    public final static String sql_updateSendTime = "update " + TABLE_NAME + " set " + sendTime + " =?, " + updater + "=?, " + updateTime + "=?" + " where id=?";

    public final static String columns_updateSendTime = sendTime + "," + updater + "," + updateTime + "," + id;
}
