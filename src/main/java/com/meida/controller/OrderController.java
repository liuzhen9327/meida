package com.meida.controller;

import com.meida.enumerate.ExceptionEnum;
import com.meida.enumerate.OrderStatusEnum;
import com.meida.enumerate.OrderTypeEnum;
import com.meida.exception.BusinessException;
import com.meida.model.Order;
import com.meida.model.OriginalLogistic;
import com.meida.model.User;
import com.meida.service.ExpressService;
import com.meida.service.OrderService;
import com.meida.service.OriginalLogisticService;
import com.meida.service.UserService;
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
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        Order order = OrderService.get(id);
        OrderStatusEnum orderStatus = OrderStatusEnum.valueOf(order.getInt(Order.status));

        switch (orderStatus) {
            case NULL:
                newOrder();
                return;
            case reserve:
                long ownerId = order.getLong(Order.ownerId);
                if (ownerId == userId) {
                    edit();
                    return;
                }
                toAccept();
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
        User user = getCurrentUser();
        long userId = user.getLong(User.id);
        Order order = OrderService.newOrder(userId);
        setAttr("order", order);

        loadBaseOrderData(order.getLong(Order.id), userId);
        renderJsp("newOrder.jsp");
    }

    public void save() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(Order.id);
        int orderType = getParaToInt(Order.type);

        String remark = getPara(Order.remark);
        Long acceptUserId = getParaToLong(Order.acceptUser, 0l);

        boolean isCommit = getParaToBoolean("isCommit", false);

        OrderService.saveOrCommit(id, OrderTypeEnum.valueOf(orderType), userId, remark, acceptUserId, isCommit);
        renderJson(JSONResult.succ());
    }

    private void edit() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(0, 0l);
        Order order = OrderService.get(id);
        setAttr("order", order);

        User customer = UserService.getCustomerByOrder(order);
        setAttr("customer", customer);

        loadBaseOrderData(order.getLong(Order.id), userId);
        renderJsp("edit.jsp");
    }

    public void list() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);
        List<Order> orderList = OrderService.getMyAllOrders(userId);
        setAttr("orderList", orderList);
        renderJsp("list.jsp");
    }

    private void toAccept() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(0, 0l);
        Order order = OrderService.toAccept(id, userId);
        setAttr("order", order);

        User customer = UserService.getCustomerByOrder(order);
        setAttr("customer", customer);

        loadBaseOrderData(order.getLong(Order.id), userId);
        renderJsp("accept.jsp");
    }

    public void cancel() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(Order.id, 0l);
        OrderService.delete(id, userId);
        renderJson(JSONResult.succ());
    }

    public void accept() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(Order.id, 0l);
        String remark = getPara(Order.remark);
        Long transitUserId = getParaToLong(Order.transitUser, 0l);
        OrderService.accept(id, transitUserId, userId, remark);
        redirect("/order/list");
    }


}
