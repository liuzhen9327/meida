package com.meida.service;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.meida.config.Constant;
import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OriginalLogisticStatusEnum;
import com.meida.enumerate.TransitLogisticTypeEnum;
import com.meida.exception.BusinessException;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;
import com.meida.model.TransitLogistic;
import com.meida.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by admin on 15/12/27.
 */
public class TransitLogisticService {
    private static Logger log = LoggerFactory.getLogger(TransitLogisticService.class);

    /**
     * 入库扫描
     * @param number 物流号
     * @param userId 扫描人
     *
     */
    @Before(Tx.class)
    public static void scan(String number, long userId) {
        OriginalLogistic originalLogistic = OriginalLogisticService.findByNumber(number);
        if (originalLogistic == null) throw new BusinessException(ExceptionEnum.NO_MATCH_ORIGINAL_LOGISTIC);
        long orderId = originalLogistic.getLong(OriginalLogistic.orderId);
        Order order = originalLogistic.getOrder();
        //检查订单中转受理人

        //原始物流状态变更为 已入库
        originalLogistic.set(OriginalLogistic.status, OriginalLogisticStatusEnum.alreadyInWarehouse.getValue()).update();

        int totalWarehouse = order.getInt(Order.totalWarehouse);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);
        waitInWarehouse --;
        waitExWarehouse ++;
        //改变订单 待入库和已入库数量
        OrderService.updateWarehouse(orderId, totalWarehouse, waitInWarehouse, waitExWarehouse, exWarehouse);
    }

    public static void save(long originalId, String originalNumber, long orderId, long userId,
                TransitLogisticTypeEnum type, String contactInfo, String name,
                String number, BigDecimal weight, String remark) {
        TransitLogistic transitLogistic = new TransitLogistic().set(TransitLogistic.originalId, originalId)
                .set(TransitLogistic.originalNumber, originalNumber)
                .set(TransitLogistic.type, type.getValue())
                .set(TransitLogistic.contactInfo, contactInfo)
                .set(TransitLogistic.name, name)
                .set(TransitLogistic.number, number)
                .set(TransitLogistic.weight, weight)
                .set(TransitLogistic.remark, remark);
        transitLogistic.setCreater(userId);
        transitLogistic.setUpdater(userId);
        transitLogistic.save();

    }

    public static void delete(long id) {
        TransitLogistic.dao.deleteById(id);
    }

    public static List<TransitLogistic> findByOriginalId(long originalId) {
        return TransitLogistic.dao.find(TransitLogistic.sql_findByOriginalId, originalId);
    }

    public static List<TransitLogistic> findByOriginalIdAndMobile(long originalId, String mobile) {
        return TransitLogistic.dao.find(TransitLogistic.sql_findByOriginalIdAndMobile, originalId, mobile);
    }

    public static List<TransitLogistic> findByOrderId(long orderId) {
        return TransitLogistic.dao.find(TransitLogistic.sql_findByOrderId, orderId);
    }

    public static Order getTransitOrder(long orderId, long userId) {
        Order order = OrderService.get(orderId);
        OrderStatusEnum orderStatus = OrderStatusEnum.valueOf(order.getInt(Order.status));
        switch (orderStatus) {
            case accepted:
            case transit:
                long transitUser = order.getLong(Order.transitUser);
                if (transitUser == userId) return order;
                throw new BusinessException(ExceptionEnum.NOT_ORDER_TRANSIT_USER);
            default:
                throw new BusinessException(ExceptionEnum.ORDER_STATUS_NOT_TRANSIT);
        }
    }

    /**
     * 获取没有发货的原始物流
     * @param orderId
     * @return
     */
    public static List<OriginalLogistic> getUnSendOriginalLogistic(long orderId) {
        return OriginalLogistic.dao.find(OriginalLogistic.sql_findUnSendOriginalLogistic, orderId, orderId);
    }
    /**
     * 中转发货
     * @param type
     * @param orderId
     * @param userId
     * @param originalIds
     */
    @Before(Tx.class)
    public static void sending(TransitLogisticTypeEnum type, long orderId, long userId, long... originalIds) {
        long sendTime = DateUtils.getTimeInMillis();
        Date now = new Date();
        // 改order 数量
        Order order = OrderService.get(orderId);
        int totalWarehouse = order.getInt(Order.totalWarehouse);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);

        if (type == TransitLogisticTypeEnum.unpack) {
            List<TransitLogistic> transitLogisticList = findByOriginalId(originalIds[0]);
            for (TransitLogistic transitLogistic : transitLogisticList) {
                transitLogistic.set(TransitLogistic.sendTime, sendTime)
                            .setUpdater(userId);
                transitLogistic.setUpdateTime(now);
                transitLogistic.update();
            }
//            Db.batch(TransitLogistic.sql_updateSendTime, TransitLogistic.columns_updateSendTime, transitLogisticList, Constant.mysqlBatchSize);
            //改原始物流状态为出仓
            OriginalLogisticService.exWarehouse(originalIds[0], userId);
            waitExWarehouse --;
            exWarehouse ++;
        } else if (type == TransitLogisticTypeEnum.forward) {
            StringBuilder sql = new StringBuilder(OriginalLogistic.sql_findAll);
            sql.append(" where ").append("id").append(" in(");
            int len = originalIds.length;
            for (int i=0; i<len; i++)
                if (i == len-1) sql.append("?)");
                else sql.append("?,");
            List<OriginalLogistic> originalLogisticList = OriginalLogistic.dao.find(sql.toString(), originalIds);
            for (OriginalLogistic originalLogistic : originalLogisticList) {
                new TransitLogistic().set(TransitLogistic.contactInfo,
                        originalLogistic.get(OriginalLogistic.receiver) + "," + originalLogistic.get(OriginalLogistic.mobile) + "," + originalLogistic.get(OriginalLogistic.address))
                        .set(TransitLogistic.sendTime, sendTime)
                        .set("updater", userId)
                        .set(TransitLogistic.name, originalLogistic.get(OriginalLogistic.name))
                        .set(TransitLogistic.remark, originalLogistic.get(OriginalLogistic.remark))
                        .set(TransitLogistic.weight, originalLogistic.get(OriginalLogistic.weight))
                        .set(TransitLogistic.number, originalLogistic.get(OriginalLogistic.number))
                        .set(TransitLogistic.orderId, originalLogistic.get(OriginalLogistic.orderId))
                        .set(TransitLogistic.originalId, originalLogistic.getId())
                        .set(TransitLogistic.originalNumber, originalLogistic.get(OriginalLogistic.number))
                        .set(TransitLogistic.type, TransitLogisticTypeEnum.forward.getValue())
                        .save();
                //改原始物流状态为出仓
                OriginalLogisticService.exWarehouse(originalLogistic.getId(), userId);
                waitExWarehouse --;
                exWarehouse ++;
            }
        }
        OrderService.updateWarehouse(orderId, totalWarehouse, waitInWarehouse, waitExWarehouse, exWarehouse);
    }
}
