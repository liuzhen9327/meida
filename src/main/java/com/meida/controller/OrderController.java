package com.meida.controller;

import com.jfinal.core.Controller;
import com.meida.config.Constant;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;
import com.meida.model.User;
import com.meida.service.ExpressService;
import com.meida.service.OrderService;
import com.meida.service.OriginalLogisticService;
import com.meida.service.UserService;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class OrderController extends BaseController {

    public void test() {
//        OrderService.newOrder("id", 1l);
//        OrderService.newOrder("ownerId", 2l);
//        getParaValues()
        renderText("1");
    }

    public void newOrder() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);
        Order order = OrderService.newOrder(userId);
        setAttr("order", order);

        List<OriginalLogistic> originalLogisticList = OriginalLogisticService.findByOrderId(order.getLong(Order.id));
        setAttr("originalLogisticList", originalLogisticList);

        List<User> myFriends = UserService.getMyFriends(userId);
        setAttr("myFriends", myFriends);

        setAttr("expressList", ExpressService.findAll());
        renderJsp("newOrder.jsp");
    }

    public void list() {

    }

    public void saveOriginal() {
        //TODO orderid 状态判断, 订单所有者判断,
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        String receiver = getPara(OriginalLogistic.receiver),
                mobile = getPara(OriginalLogistic.mobile),
                address = getPara(OriginalLogistic.address),
                remark = getPara(OriginalLogistic.remark),
                name = getPara(OriginalLogistic.name),
                number = getPara(OriginalLogistic.number),
                weight = getPara(OriginalLogistic.weight);
        Long id = getParaToLong(OriginalLogistic.id),
            orderId = getParaToLong(OriginalLogistic.orderId);
        OriginalLogisticService.save(id, userId, orderId, remark, receiver, mobile, address, name, number, new BigDecimal(weight));
    }
}
