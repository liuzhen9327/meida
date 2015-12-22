package com.meida.service;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.meida.enumerate.OriginalLogisticStatusEnum;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;

import java.math.BigDecimal;

/**
 * Created by admin on 15/12/20.
 */
public class OriginalLogisticService {

    @Before(Tx.class)
    public static void save(long userId, long orderId, String remark,
            String receiver, String mobile, String address,
            String name, String number, BigDecimal weight) {
        /**
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
        new OriginalLogistic().set(OriginalLogistic.name, name)
                .set(OriginalLogistic.number, number)
                .set(OriginalLogistic.weight, weight)
                .set(OriginalLogistic.status, OriginalLogisticStatusEnum.waitInWarehouse)
                .set(OriginalLogistic.receiver, receiver)
                .set(OriginalLogistic.mobile, mobile)
                .set(OriginalLogistic.address, address)
                .set(OriginalLogistic.remark, remark)
                .set(OriginalLogistic.orderId, orderId)
                .set(OriginalLogistic.creater, userId)
                .set(OriginalLogistic.updater, userId)
                .save();
        Order order = OrderService.get(orderId);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);
        OrderService.updateWarehouse(orderId, waitInWarehouse++, waitExWarehouse, exWarehouse);
    }

    public static void delete(long id, long userId) {

    }
}
