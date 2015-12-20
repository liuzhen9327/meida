package com.meida.service;

import com.meida.Constant;
import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OrderTypeEnum;
import com.meida.model.Order;
import com.meida.utils.DateUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Date;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class OrderService {

    private static Logger log = LoggerFactory.getLogger(OrderService.class);

    private static String generateOrderNumber() {
        StringBuilder number = new StringBuilder();
        for (int i = 0; i < 3; i++) {
            number.append(Constant.LETTERS[RandomUtils.nextInt(26)]);
        }
        number.append(DateFormatUtils.format(System.currentTimeMillis(), DateUtils.yyMMddhhmmssSSS));
        return number.toString();
    }

    public static Order newOrder(long ownerId) {
        Order order = new Order();
        try {
            order.set(Order.number, generateOrderNumber())
                    .set(Order.type, OrderTypeEnum.proxy.getValue())
                    .set(Order.status, OrderStatusEnum.reserve.getValue())
                    .set(Order.acceptId, 0)
                    .set(Order.waitInWarehouse, 0)
                    .set(Order.waitExWarehouse, 0)
                    .set(Order.exWarehouse, 0)
                    .set(Order.deleteFlag, false)
                    .set(Order.isCommit, false)
                    .set(Order.ownerId, ownerId)
                    .set(Order.creater, ownerId)
                    .set(Order.updater, ownerId)
                    .set(Order.updateTime, new Date())
                    .save();
        } catch (Exception e) {
            if (e instanceof SQLIntegrityConstraintViolationException) {
                log.error("user[{}] repeat orders, create order again", ownerId);
                return newOrder(ownerId);
            } else throw e;
        }
        return order;
    }

    public static boolean save() {

        return true;
    }

    public static boolean commit() {

        return true;
    }

    /**
     * 取消订单
     * @param id
     */
    public static void delete(Long id) {
        new Order().set(Order.deleteFlag, true).set(Order.id, id).update();
    }

}
