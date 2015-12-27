package com.meida.service;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.meida.config.Constant;
import com.meida.enumerate.OriginalLogisticStatusEnum;
import com.meida.enumerate.TransitLogisticTypeEnum;
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
     */
    @Before(Tx.class)
    public static void scan(String number, long userId) {
        OriginalLogistic originalLogistic = OriginalLogisticService.findByNumber(number);
        //原始物流状态变更为 已入库
        originalLogistic.set(OriginalLogistic.status, OriginalLogisticStatusEnum.alreadyInWarehouse.getValue()).update();
        long orderId = originalLogistic.getLong(OriginalLogistic.orderId);
        Order order = OrderService.get(orderId);
        int totalWarehouse = order.getInt(Order.totalWarehouse);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);
        //改变订单 待入库和已入库数量
        OrderService.updateWarehouse(orderId, totalWarehouse, waitInWarehouse--, waitExWarehouse++, exWarehouse);
    }

    public static void save(long originalId, long orderId, long userId,
                TransitLogisticTypeEnum type, String contactInfo, String name,
                String number, BigDecimal weight, String remark) {
        new TransitLogistic().set(TransitLogistic.originalId, originalId)
                .set(TransitLogistic.type, type)
                .set(TransitLogistic.contactInfo, contactInfo)
                .set(TransitLogistic.name, name)
                .set(TransitLogistic.number, number)
                .set(TransitLogistic.weight, weight)
                .set(TransitLogistic.remark, remark)
                .set(TransitLogistic.creater, userId)
                .set(TransitLogistic.updater, userId)
                .save();
    }

    public static void delete(long id) {
        TransitLogistic.dao.deleteById(id);
    }

    public static List<TransitLogistic> findByOriginalId(long originalId) {
        return TransitLogistic.dao.find(TransitLogistic.sql_findByOriginalId, originalId);
    }

    /**
     * 中转发货
     * @param type
     * @param orderId
     * @param userId
     * @param originalId
     */
    @Before(Tx.class)
    public static void sending(TransitLogisticTypeEnum type, long orderId, long userId, long... originalId) {
        long sendTime = DateUtils.getTimeInMillis();
        Date now = new Date();
        if (type == TransitLogisticTypeEnum.unpack) {
            List<TransitLogistic> transitLogisticList = findByOriginalId(originalId[0]);
            for (TransitLogistic transitLogistic : transitLogisticList) {
                transitLogistic.set(TransitLogistic.sendTime, sendTime)
                            .set(TransitLogistic.updater, userId)
                            .set(TransitLogistic.updateTime, now);
            }
            Db.batch(TransitLogistic.sql_updateSendTime, TransitLogistic.columns_updateSendTime, transitLogisticList, Constant.mysqlBatchSize);
        } else if (type == TransitLogisticTypeEnum.forward) {

        }
        Order order = OrderService.get(orderId);
        int totalWarehouse = order.getInt(Order.totalWarehouse);
        int waitInWarehouse = order.getInt(Order.waitInWarehouse);
        int waitExWarehouse = order.getInt(Order.waitExWarehouse);
        int exWarehouse = order.getInt(Order.exWarehouse);
        //TODO 改order sendtime, 数量
    }
}
