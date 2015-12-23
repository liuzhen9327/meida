package com.meida.enumerate;

/**
 * Created by liuzhen on 2015/12/18.
 */
public enum ExceptionEnum {

    ACCOUNT_NOT_EXISTS ("账号不存在"),
    PASSWORD_ERROR ("密码错误"),
    LOGIN_SUCCESS ("登录成功"),
    EMAIL_EXISTS ("邮件已存在"),
    SEND_EMAIL_ERROR ("邮件发送失败"),
    WAITING_ACTIVE ("等待激活"),
    ACTIVE_ERROR ("激活错误"),
    SAVE_ORDER_ERROR ("订单{0}失败, 物流属性是:{1}");

    private String message;

    private ExceptionEnum(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
