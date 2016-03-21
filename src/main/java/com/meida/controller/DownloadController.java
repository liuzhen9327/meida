package com.meida.controller;

import com.jfinal.aop.Clear;
import com.jfinal.kit.PathKit;
import com.meida.interceptor.AuthInterceptor;

import java.io.File;

/**
 * Created by liuzhen on 16/3/14.
 */
public class DownloadController extends BaseController {
    private static String WEB_ROOT_PATH = PathKit.getWebRootPath();

    @Clear(AuthInterceptor.class)
    public void template() {
        File template = new File(WEB_ROOT_PATH + File.separator + "template" + File.separator + "order.xlsx");
        renderFile(template);
    }
}
