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

    @Before(Tx.class)
    public static void delete(long id, long userId) {
        OriginalLogistic originalLogistic = OriginalLogistic.dao.findById(id);
        long orderId = originalLogistic.getLong(OriginalLogistic.orderId);
        Order order = OrderService.get(orderId);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);
        OriginalLogisticStatusEnum status = OriginalLogisticStatusEnum.valueOf(originalLogistic.getInt(OriginalLogistic.status));
        switch (status) {
            case waitInWarehouse:
                waitInWarehouse --;
                break;
            case waitExWarehouse:
                waitExWarehouse --;
                break;
            case exWarehouse:
                exWarehouse --;
                break;
        }
        OrderService.updateWarehouse(orderId, waitInWarehouse, waitExWarehouse, exWarehouse);
        originalLogistic.deleteById(id);
    }

    public static OriginalLogistic edit(long id) {
        return OriginalLogistic.dao.findById(id);
    }
}
