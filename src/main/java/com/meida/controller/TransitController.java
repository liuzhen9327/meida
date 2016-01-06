package com.meida.controller;

import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OrderTypeEnum;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;
import com.meida.model.User;
import com.meida.service.OrderService;
import com.meida.service.OriginalLogisticService;
import com.meida.service.UserService;
import org.apache.commons.lang.StringUtils;

/**
 * Created by liuzhen on 2016/1/6.
 */
public class TransitController extends BaseController {
    public void scan() {
        String searchValue = getPara("searchValue");
        String errMsg = null;
        OriginalLogistic originalLogistic = null;
        Order order = null;
        if (StringUtils.isNotBlank(searchValue)) {
            originalLogistic = OriginalLogisticService.findByNumber(searchValue);
            if (originalLogistic == null) {
                errMsg = "未找到物流订单";
            } else {
                order = OrderService.get(originalLogistic.getLong(OriginalLogistic.orderId));
                OrderStatusEnum orderStatus = OrderStatusEnum.valueOf(order.getInt(Order.status));
                if (orderStatus.equals(OrderStatusEnum.accepted) || orderStatus.equals(OrderStatusEnum.transit)){
                    setAttr("originalLogistic", originalLogistic);
                    setAttr("order", order);
                } else{
                    errMsg = "订单状态是[" + orderStatus.getName() + "], 不能检索入库";
                }
            }
        }
        setAttr("originalLogistic", originalLogistic == null ? new OriginalLogistic() : originalLogistic);
        setAttr("order", order == null ? new Order() : order);
        Long acceptUser = order.getLong(Order.acceptUser);
        setAttr("customer", (acceptUser != null && acceptUser != 0) ? UserService.get(acceptUser) : new User());
        setAttr("errMsg", errMsg);
        setAttr("searchValue", searchValue);
        renderJsp("scan.jsp");
    }

    public void confirm() {

    }
}
