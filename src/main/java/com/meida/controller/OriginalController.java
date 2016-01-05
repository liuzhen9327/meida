package com.meida.controller;

import com.meida.model.OriginalLogistic;
import com.meida.model.User;
import com.meida.service.OriginalLogisticService;
import com.meida.vo.JSONResult;

import java.math.BigDecimal;

/**
 * Created by admin on 16/1/6.
 */
public class OriginalController extends BaseController {
    public void save() {
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

    public void edit() {
        long id = getParaToLong(OriginalLogistic.id, 0l);
        renderJson(JSONResult.succ(OriginalLogisticService.get(id)));
    }

    public void delete() {
        User user = getCurrentUser();
        long userId = user.getLong(User.id);

        long id = getParaToLong(OriginalLogistic.id, 0l);
        OriginalLogisticService.delete(id, userId);
        renderJson(JSONResult.succ());
    }
}
