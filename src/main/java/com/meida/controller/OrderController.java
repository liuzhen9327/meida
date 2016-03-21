package com.meida.controller;

import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OrderTypeEnum;
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
 * Created by liuzhen on 2015/12/18.
 */
public class OrderController extends BaseController {

    public void detail() {
        long id = getParaToLong(0, 0l);
        if (id == 0) renderError(404);

        Order order = OrderService.get(id);
        OrderStatusEnum orderStatus = OrderStatusEnum.valueOf(order.getInt(Order.status));

        long userId = getCurrentUserId();
        switch (orderStatus) {
            case NULL:
                newOrder();
                return;
            case reserve:
                long ownerId = order.getLong(Order.ownerId);
                if (ownerId == userId) {
                    edit(order);
                    return;
                }
                toAccept();
                return;
            case accepted:
            case transit:
                transitDetail(order);
                return;
        }
        renderError(404);
    }

    private void loadBaseOrderData(long orderId, long userId) {
        List<OriginalLogistic> originalLogisticList = OriginalLogisticService.findByOrderId(orderId);
        setAttr("originalLogisticList", originalLogisticList);

        List<User> myFriends = UserService.getMyFriends(userId);
        setAttr("myFriends", myFriends);

        setAttr("expressList", ExpressService.findAll());
    }
    public void newOrder() {
        long userId = getCurrentUserId();
        Order order = OrderService.newOrder(userId);
        setAttr("order", order);

        loadBaseOrderData(order.getId(), userId);
        renderJsp("newOrder.jsp");
    }

    public void save() {
        long id = getParaToLong("id");
        int orderType = getParaToInt(Order.type);

        String remark = getPara(Order.remark);
        Long acceptUserId = getParaToLong(Order.acceptUser, 0l);

        boolean isCommit = getParaToBoolean("isCommit", false);

        OrderService.saveOrCommit(id, OrderTypeEnum.valueOf(orderType), getCurrentUserId(), remark, acceptUserId, isCommit);
        renderJson(JSONResult.succ());
    }

    private void edit(Order order) {
        setAttr("order", order);

        loadBaseOrderData(order.getId(), getCurrentUserId());
        renderJsp("edit.jsp");
    }

    public void list() {
        List<Order> orderList = OrderService.getMyAllOrders(getCurrentUserId());
        setAttr("orderList", orderList);
        renderJsp("list.jsp");
    }

    private void toAccept() {
        long userId = getCurrentUserId();

        long id = getParaToLong(0, 0l);
        Order order = OrderService.toAccept(id, userId);
        setAttr("order", order);

//        User customer = UserService.getCustomerByOrder(order);
//        setAttr("customer", customer);

        loadBaseOrderData(order.getId(), userId);
        renderJsp("accept.jsp");
    }

    private void transitDetail(Order order) {
        //TODO 受理成功后，还有直发中转的订单，判断是否本人，如果是 可点中转发货
        setAttr("order", order);
        long orderId = order.getId();
        List<OriginalLogistic> originalLogisticList = OriginalLogisticService.findByOrderId(orderId);
        List<TransitLogistic> transitLogisticList = TransitLogisticService.findByOrderId(orderId);
        renderJsp("../transit/detail.jsp");
    }

    public void cancel() {
        long id = getParaToLong("id", 0l);
        OrderService.delete(id, getCurrentUserId());
        renderJson(JSONResult.succ());
    }

    public void accept() {
        long id = getParaToLong("id", 0l);
        String remark = getPara(Order.remark);
        Long transitUserId = getParaToLong(Order.transitUser, 0l);
        OrderService.accept(id, transitUserId, getCurrentUserId(), remark);
        redirect("/order/list");
    }


}
