package com.meida.service;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OriginalLogisticStatusEnum;
import com.meida.exception.BusinessException;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by admin on 15/12/20.
 */
public class OriginalLogisticService {

    @Before(Tx.class)
    public static OriginalLogistic save(long id, long userId, long orderId, String remark,
            String receiver, String mobile, String address,
            String name, String number, BigDecimal weight) {
        OriginalLogistic originalLogistic = new OriginalLogistic().set(OriginalLogistic.name, name)
                .set(OriginalLogistic.number, number)
                .set(OriginalLogistic.weight, weight)

                .set(OriginalLogistic.receiver, receiver)
                .set(OriginalLogistic.mobile, mobile)
                .set(OriginalLogistic.address, address)
                .set(OriginalLogistic.remark, remark)
                .set(OriginalLogistic.orderId, orderId)
                .set("updater", userId);
        if (id == 0) {
            originalLogistic.set("creater", userId)
                    .set(OriginalLogistic.status, OriginalLogisticStatusEnum.waitInWarehouse.getValue())
                    .save();
            Order order = OrderService.get(orderId);
            int totalWarehouse = order.getInt(Order.totalWarehouse);
            int waitInWarehouse = order.getInt(Order.waitInWarehouse);
            int waitExWarehouse = order.getInt(Order.waitExWarehouse);
            int exWarehouse = order.getInt(Order.exWarehouse);
            totalWarehouse ++;
            waitInWarehouse ++;
            OrderService.updateWarehouse(orderId, totalWarehouse, waitInWarehouse, waitExWarehouse, exWarehouse);
        } else {
            originalLogistic.setId(id);
            originalLogistic.update();
        }
        return originalLogistic;
    }

    @Before(Tx.class)
    public static void delete(long id, long userId) {
        OriginalLogistic originalLogistic = OriginalLogistic.dao.findById(id);
        long orderId = originalLogistic.getLong(OriginalLogistic.orderId);
        Order order = originalLogistic.getOrder();
        int totalWarehouse = order.getInt(Order.totalWarehouse);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);
        OriginalLogisticStatusEnum status = OriginalLogisticStatusEnum.valueOf(originalLogistic.getInt(OriginalLogistic.status));
        switch (status) {
            case waitInWarehouse:
                waitInWarehouse --;
                break;
            case alreadyInWarehouse:
                waitExWarehouse --;
                break;
            case exWarehouse:
                exWarehouse --;
                break;
        }
        totalWarehouse --;
        OrderService.updateWarehouse(orderId, totalWarehouse, waitInWarehouse, waitExWarehouse, exWarehouse);
        originalLogistic.deleteById(id);
    }

    public static OriginalLogistic get(long id) {
        return OriginalLogistic.dao.findById(id);
    }

    public static OriginalLogistic findByNumber(String number) {
        return OriginalLogistic.dao.findFirst(OriginalLogistic.sql_findByNumber, number);
    }

    public static List<OriginalLogistic> findByOrderId(long orderId) {
        return OriginalLogistic.dao.find(OriginalLogistic.sql_findByOrderId, orderId);
    }

    public static void exWarehouse(long id, long userId) {
        new OriginalLogistic().set(OriginalLogistic.status, OriginalLogisticStatusEnum.exWarehouse)
                .set("updater", userId)
                .set("updateTime", new Date())
                .set("id", id)
                .update();
    }
}
