package com.meida.enumerate;

/**
 * Created by liuzhen on 2015/12/18.
 */
public enum ExceptionEnum {

    ACCOUNT_NOT_EXISTS(1, "账号不存在"),
    PASSWORD_ERROR(2, "密码错误"),
    LOGIN_SUCCESS(3, "登录成功"),
    EMAIL_EXISTS(4, "邮件已存在"),
    SEND_EMAIL_ERROR(5, "邮件发送失败"),
    WAITING_ACTIVE(6, "等待激活"),
    ACTIVE_ERROR(7, "激活错误"),
    SAVE_ORDER_ERROR(8, "订单{}失败, 物流属性是:{}");

    private int code;
    private String message;

    private ExceptionEnum(int code, String message){
        this.code = code;
        this.message = message;
    }


    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
