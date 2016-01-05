package com.meida.controller;

import com.jfinal.core.Controller;
import com.meida.config.Constant;
import com.meida.enumerate.OrderTypeEnum;
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

//    public void detail() {
//        long id = getParaToLong(0, 0l);
//        if (id == 0) redirect("");//TODO  你访问的页面不存在
//        Order order = OrderService.get(id);
//        setAttr("order", order);
//        renderJsp("detail.jsp");
//    }

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

        OrderService.saveOrCommit(id, OrderTypeEnum.valueOf(orderType), userId, remark, acceptUserId, false);
        renderJson(JSONResult.succ());
    }

    public void list() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);
        List<Order> orderList = OrderService.getMyAllOrders(userId);
        setAttr("orderList", orderList);
        renderJsp("list.jsp");
    }

    public void toAccept() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        Long id = getParaToLong(0);
        if (id == null || !StringUtils.isNumeric(String.valueOf(id))) {
            redirect("");//TODO 非法参数
            return;
        }
        Order order = OrderService.toAccept(id, userId);
        setAttr("order", order);

        User customer = UserService.getCustomerByOrder(order);
        setAttr("customer", customer);

        loadBaseOrderData(order.getLong(Order.id), userId);
        renderJsp("toAccept.jsp");
    }

    public void accept() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(Order.id);
        String remark = getPara(Order.remark);
        Long transitUserId = getParaToLong(Order.transitUser, 0l);
        OrderService.accept(id, transitUserId, userId, remark);
    }

    public void saveOriginal() {
        //TODO orderid 状态判断, 订单所有者判断, userId是否有编辑权限
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        String receiver = getPara(OriginalLogistic.receiver),
                mobile = getPara(OriginalLogistic.mobile),
                address = getPara(OriginalLogistic.address),
                remark = getPara(OriginalLogistic.remark),
                name = getPara(OriginalLogistic.name),
                number = getPara(OriginalLogistic.number),
                weight = getPara(OriginalLogistic.weight);
        long id = getParaToLong(OriginalLogistic.id, 0l),
            orderId = getParaToLong(OriginalLogistic.orderId);
        OriginalLogistic originalLogistic = OriginalLogisticService.save(
                id, userId, orderId, remark, receiver, mobile, address, name, number, new BigDecimal(weight));
        renderJson(JSONResult.succ(originalLogistic));
    }

    public void editOriginal() {
        long id = getParaToLong(OriginalLogistic.id, 0l);
        renderJson(JSONResult.succ(OriginalLogisticService.get(id)));
    }

    public void deleteOriginal() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(OriginalLogistic.id, 0l);
        OriginalLogisticService.delete(id, userId);
        renderJson(JSONResult.succ());
    }
}
