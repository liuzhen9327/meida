package com.meida.service;

import com.meida.config.Constant;
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
import java.util.Calendar;
import java.util.List;

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
        //找出没有取消的 且 是这个人创建的, 且状态是空的订单
        Order order = Order.dao.findFirst(Order.sql_findByOwner, ownerId, false, OrderStatusEnum.reserve.getValue());
        if (order != null) return order;
        order = new Order();
        try {
            order.set(Order.number, generateOrderNumber())
                    .set(Order.type, OrderTypeEnum.proxy.getValue())
                    .set(Order.status, null)
                    .set(Order.acceptUser, 0)
                    .set(Order.transitUser, 0)
                    .set(Order.totalWarehouse, 0)
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
        if (isCommit) order.set(Order.status, OrderStatusEnum.reserve.getValue());
        order.set(Order.updater, userId)
             .set(Order.remark, remark)
             .set(Order.id, id);
        return order.update();
    }

    public static void updateWarehouse(long orderId, int totalWarehouse,
               int waitInWarehouse, int waitExWarehouse, int exWarehouse) {
        new Order().set(Order.totalWarehouse, totalWarehouse)
                .set(Order.waitInWarehouse, waitInWarehouse)
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
     * @param userId 操作人
     */
    public static void delete(long id, long userId) {
        new Order().set(Order.deleteFlag, true)
                .set(Order.updater, userId)
                .set(Order.id, id).update();
    }

    /**
     * 受理订单
     * @param id
     * @param transitUserId 受理时选择的中转方
     * @param userId
     */
    public static void accept(long id, long transitUserId, long userId) {
        new Order().set(Order.transitUser, transitUserId)
                .set(Order.acceptTime, DateUtils.getTimeInMillis())
                .set(Order.updater, userId)
                .set(Order.status, OrderStatusEnum.accepted)
                .set(Order.id, id).update();
    }

}
