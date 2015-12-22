package com.meida.model;

import java.util.Date;

/**
 * Created by liuzhen on 2015/12/18.
 * CREATE TABLE `order` (
 `id` bigint(20) NOT NULL auto_increment,
 `number` varchar(20) NOT NULL COMMENT '订单号',
 `type` INT NOT NULL COMMENT '1代理 2中转 3直达',
 `status` INT NOT NULL COMMENT '0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',
 `acceptUser` bigint(20) NOT NULL DEFAULT 0 COMMENT '受理方',
 `transitUser` bigint(20) NOT NULL DEFAULT 0 COMMENT '中转方',
 `remark` varchar(200),
 `waitInWarehouse` int DEFAULT 0 COMMENT '等待入库',
 `waitExWarehouse` int DEFAULT 0 COMMENT '等待出库',
 `exWarehouse` int DEFAULT 0 COMMENT '已出库',
 `deleteFlag` BIT DEFAULT 0,
 `ownerId` bigint(20) NOT NULL,
 `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `creater` bigint(20) NOT NULL ,
 `updateTime` TIMESTAMP NOT NULL,
 `updater` bigint(20) NOT NULL ,
 PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Order extends BaseModel<Order> {
    public final static String TABLE_NAME = "order";

    /**dao只能用作find delete*/
    public static Order dao = new Order();

    //columns
    public final static String number = "number",
                               type = "type",
                               status = "status",
                               acceptUser = "acceptUser",
                               transitUser = "transitUser",
                               remark = "remark",
                               ownerId = "ownerId",
                               waitInWarehouse = "waitInWarehouse",
                               waitExWarehouse = "waitExWarehouse",
                               exWarehouse = "exWarehouse";

}
