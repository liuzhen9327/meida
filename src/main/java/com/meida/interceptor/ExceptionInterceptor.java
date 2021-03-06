package com.meida.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.ActionException;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.meida.exception.BusinessException;
import com.meida.model.User;
import com.meida.utils.UrlUtils;
import com.meida.vo.JSONResult;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liuzhen on 2015/12/23.
 */
public class ExceptionInterceptor implements Interceptor {

    private static Logger log = LoggerFactory.getLogger(ExceptionInterceptor.class);

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        HttpServletRequest request = controller.getRequest();
        try {
            inv.invoke();
        } catch (Exception e) {
            //记录日志
            doLog(inv, e);
            //判断是否ajax请求
            String header = request.getHeader("X-Requested-With");
            boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(header);
            String errCode = null, errMsg = "系统出错啦!";
            if (e instanceof BusinessException) {
                BusinessException ex = (BusinessException) e;
                errMsg = ex.getErrMsg();
                errCode = ex.getErrCode();
            } else if (e instanceof ActionException) {
                controller.render(((ActionException) e).getErrorRender());
                return;
            }
            if (isAjax) {
                controller.renderJson(JSONResult.error(errCode, errMsg));
            } else {
                String actionKey = inv.getActionKey();
                Map<String, String> params = new HashMap<String, String>();
                if (actionKey.contains("login")) {
                    params.put("errMsg", errMsg);
                    params.put(User.email, controller.getPara(User.email));
                    params.put(User.password, controller.getPara(User.password));
                    controller.redirect(UrlUtils.buildParams("/login.jsp", params));
                    return;
                } else if (actionKey.contains("register")) {
                    params.put("errMsg", errMsg);
                    params.put("user.email", controller.getPara("user.email"));
                    params.put("user.name", controller.getPara("user.name"));
                    params.put("user.nick", controller.getPara("user.nick"));
                    params.put("user.phone", controller.getPara("user.phone"));
                    params.put("user.wechat", controller.getPara("user.wechat"));
                    params.put("user.work_address", controller.getPara("user.work_address"));
                    params.put("user.password", controller.getPara("user.password"));
                    controller.redirect(UrlUtils.buildParams("/register.jsp", params));
                    return;
                }
                String redirctUrl = request.getHeader("referer");
                if (StringUtils.isBlank(redirctUrl)) redirctUrl = request.getRequestURI();
                params.put("redirctUrl", redirctUrl);
                params.put("errMsg", errMsg);
                controller.redirect(UrlUtils.buildParams("/500.jsp", params));

            }
        }
    }

    private void doLog(Invocation ai, Exception e) {
//        //开发模式
//        if (JFinal.me().getConstants().getDevMode()) {
//            e.printStackTrace();
//        }
//        //业务异常不记录 ？？
//        if (e instanceof BusinessException) return;
//        StringBuilder sb = new StringBuilder("\n---Exception Log Begin---\n");
//        sb.append("Controller:").append(ai.getController().getClass().getName()).append("\n");
//        sb.append("Method:").append(ai.getMethodName()).append("\n");
//        sb.append("Exception Type:").append(e.getClass().getName()).append("\n");
//        sb.append("Exception Details:");
        log.error("", e);
    }

}
