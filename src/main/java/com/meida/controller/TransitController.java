package com.meida.controller;

import com.meida.model.Order;
import com.meida.model.OriginalLogistic;
import com.meida.service.OriginalLogisticService;
import org.apache.commons.lang.StringUtils;

/**
 * Created by liuzhen on 2016/1/6.
 */
public class TransitController extends BaseController {
    public void scan() {
        String searchValue = getPara("searchValue");

//        if (StringUtils.isNotBlank(searchValue)) {
//            OriginalLogisticService.findByNumber()
//        }
        renderJsp("scan.jsp");
    }

    public void confirm() {

    }
}
