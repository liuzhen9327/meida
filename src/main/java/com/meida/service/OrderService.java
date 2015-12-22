package com.meida.service;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.meida.Constant;
import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OrderTypeEnum;
import com.meida.exception.BusinessException;
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
                    .set(Order.status, null)
                    .set(Order.acceptUser, 0)
                    .set(Order.transitUser, 0)
                    .set(Order.waitInWarehouse, 0)
                    .set(Order.waitExWarehouse, 0)
                    .set(Order.exWarehouse, 0)
                    .set(Order.deleteFlag, false)
                    .set(Order.ownerId, ownerId)
                    .set(Order.creater, ownerId)
                    .set(Order.updater, ownerId)
                    .save();
        } catch (Exception e) {
            if (e instanceof SQLIntegrityConstraintViolationException) {
                log.error("user[{}] repeat orders, create order again", ownerId);
                return newOrder(ownerId);
            } else throw e;
        }
        return order;
    }

    public static boolean saveOrCommit(long id, OrderTypeEnum orderType,
                long userId, String remark, boolean isCommit) {
        Order order = new Order().set(Order.type, orderType.getValue());
        switch (orderType) {
            case proxy:
                order.set(Order.acceptUser, userId);
                break;
            case transit:
                order.set(Order.transitUser, userId);
                break;
            default:
                throw new BusinessException(ExceptionEnum.SAVE_ORDER_ERROR,
                        !isCommit? "保存" : "提交", orderType.getName());
        }
        if (isCommit) order.set(Order.status, OrderStatusEnum.reserve);
        order.set(Order.updater, userId)
             .set(Order.remark, remark)
             .set(Order.id, id);
        return order.update();
    }

    public static void updateWarehouse(long orderId,
               int waitInWarehouse, int waitExWarehouse, int exWarehouse) {
        new Order().set(Order.waitInWarehouse, waitInWarehouse)
                .set(Order.waitExWarehouse, waitExWarehouse)
                .set(Order.exWarehouse, exWarehouse)
                .set(Order.id, orderId)
                .update();
    }

    public static Order get(long id) {
        return Order.dao.findById(id);
    }

    /**
     * 取消订单
     * @param id
     */
    public static void delete(long id, long userId) {
        new Order().set(Order.deleteFlag, true)
                .set(Order.updater, userId)
                .set(Order.id, id).update();
    }

}
