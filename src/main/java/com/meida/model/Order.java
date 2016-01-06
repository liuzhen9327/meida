package com.meida.model;

import com.meida.utils.DateUtils;
import org.apache.commons.lang.time.DateFormatUtils;

/**
 * CREATE TABLE `order` (
 `id` bigint(20) NOT NULL auto_increment,
 `number` varchar(20) NOT NULL COMMENT '订单号',
 `type` INT NOT NULL COMMENT '1代理 2中转 3直达',
 `status` INT DEFAULT NULL COMMENT '0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',
 `acceptUser` bigint(20) NOT NULL DEFAULT 0 COMMENT '受理方',
 `acceptTime` bigint(13) DEFAULT NULL,
 `transitUser` bigint(20) NOT NULL DEFAULT 0 COMMENT '中转方',
 `remark` varchar(200),
 `totalWarehouse` int DEFAULT 0 COMMENT '总件数',
 `waitInWarehouse` int DEFAULT 0 COMMENT '等待入库',
 `waitExWarehouse` int DEFAULT 0 COMMENT '等待出库',
 `exWarehouse` int DEFAULT 0 COMMENT '已出库',
 `deleteFlag` BIT DEFAULT 0,
 `ownerId` bigint(20) NOT NULL,
 `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `creater` bigint(20) NOT NULL,
 `updateTime` TIMESTAMP NOT NULL,
 `updater` bigint(20) NOT NULL ,
 PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class Order extends BaseModel<Order> {
    public final static String TABLE_NAME = "tb_order";

    /**dao只能用作find delete*/
    public static Order dao = new Order();

    //columns
    public final static String number = "number",
                               type = "type",
                               status = "status",
                               acceptUser = "acceptUser",
                               acceptTime = "acceptTime",
                               transitUser = "transitUser",
                               remark = "remark",
                               ownerId = "ownerId",
                               totalWarehouse = "totalWarehouse",
                               waitInWarehouse = "waitInWarehouse",
                               waitExWarehouse = "waitExWarehouse",
                               exWarehouse = "exWarehouse";

    public final static String sql_findAll = "select * from " + TABLE_NAME;

    public static String sql_findNewOrder,
                         sql_findMyOrders;

    static {
        sql_findNewOrder = new StringBuilder(sql_findAll).append(" where ").append(Order.ownerId).append("=? and ").append(Order.deleteFlag).append("=? and ").append(Order.status).append("=?").toString();
        sql_findMyOrders = new StringBuilder(sql_findAll).append(" where ").append(Order.ownerId).append("=? or ").append(Order.acceptUser).append("=? or ").append(Order.transitUser).append("=? and ").append(Order.deleteFlag).append("=?").append(" ORDER BY ").append(Order.updateTime).append(" DESC").toString();
    }

    public String getAcceptTime() {
        return getLong(Order.acceptTime) == null ? "":DateFormatUtils.format(getLong(Order.acceptTime), DateUtils.yyyy_MM_dd_hh_mm_ss);
    }
}
