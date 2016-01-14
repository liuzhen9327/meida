package com.meida.controller;

import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OrderTypeEnum;
import com.meida.enumerate.TransitLogisticTypeEnum;
import com.meida.exception.BusinessException;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;
import com.meida.model.TransitLogistic;
import com.meida.model.User;
import com.meida.service.*;
import com.meida.vo.JSONResult;
import org.apache.commons.lang.StringUtils;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by liuzhen on 2016/1/6.
 */
public class TransitController extends BaseController {
    public void scan() {
        String searchValue = getPara("searchValue");
        String confirm = getPara("confirm");

        String errMsg = null;
        OriginalLogistic originalLogistic = null;
        Order order = null;
        long userId = getCurrentUserId();
        if (StringUtils.isNotBlank(searchValue)) {
            if (StringUtils.isNotBlank(confirm)) {
                TransitLogisticService.scan(searchValue, getCurrentUserId());
                errMsg = "已经入库";
                searchValue = "";
            } else {
                originalLogistic = OriginalLogisticService.findByNumber(searchValue);
                if (originalLogistic == null) {
                    errMsg = "未找到物流订单";
                } else {
                    order = originalLogistic.getOrder();
                    if (order.getLong(Order.transitUser) != userId)
                        throw new BusinessException(ExceptionEnum.NOT_ORDER_TRANSIT_USER);
                    OrderStatusEnum orderStatus = OrderStatusEnum.valueOf(order.getInt(Order.status));
                    if (orderStatus.equals(OrderStatusEnum.accepted) || orderStatus.equals(OrderStatusEnum.transit)){
                        setAttr("originalLogistic", originalLogistic);
                        setAttr("order", order);
                    } else{
                        errMsg = "订单状态是[" + orderStatus.getName() + "], 不能检索入库";
                    }
                }
            }
        }
        setAttr("originalLogistic", originalLogistic == null ? new OriginalLogistic() : originalLogistic);
        setAttr("order", order == null ? new Order() : order);
        setAttr("errMsg", errMsg);
        setAttr("searchValue", searchValue);
        renderJsp("scan.jsp");
    }

    public void list() {
        List<Order> orderList = OrderService.getMyTransitOrders(getCurrentUserId());
        setAttr("orderList", orderList);
        renderJsp("list.jsp");
    }

    public void add() {
        long orderId = getParaToLong(0, 0l);
        Order order = TransitLogisticService.getTransitOrder(orderId, getCurrentUserId());
        setAttr("order", order);
        List<OriginalLogistic> originalLogisticList = TransitLogisticService.getUnSendOriginalLogistic(orderId);
        setAttr("originalLogisticList", originalLogisticList);

        setAttr("expressList", ExpressService.findAll());
        renderJsp("add.jsp");
    }

    public void save() {
        String contactInfo = getPara(TransitLogistic.contactInfo),
                receiver = getPara(OriginalLogistic.receiver),
                mobile = getPara(OriginalLogistic.mobile),
                address = getPara(OriginalLogistic.address),
                name = getPara(TransitLogistic.name),
                number = getPara(TransitLogistic.number),
                weight = getPara(TransitLogistic.weight),
                remark = getPara(TransitLogistic.remark),
                originalNumber = getPara(TransitLogistic.originalNumber);

        long orderId = getParaToLong(TransitLogistic.orderId, 0l),
             originalId = getParaToLong(TransitLogistic.originalId, 0l);

        Integer transitType = getParaToInt("transitType");

        if (orderId == 0 || originalId == 0 || transitType == null)
            throw new BusinessException(ExceptionEnum.PARAMS_ERROR);

        if ("qt".equals(contactInfo)) {
            contactInfo = receiver +  "," + mobile + "," + address;
        }
        TransitLogisticService.save(originalId, originalNumber, orderId,
                getCurrentUserId(), TransitLogisticTypeEnum.valueOf(transitType),
                contactInfo, name, number, new BigDecimal(weight), remark);
        renderJson(JSONResult.succ());
    }
}
