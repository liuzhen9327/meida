package com.meida.enumerate;

/**
 * Created by liuzhen on 2015/12/18.
 */
public enum ExceptionEnum {

    ACCOUNT_NOT_EXISTS ("账号不存在"),
    PASSWORD_ERROR ("密码错误"),
    EMAIL_EXISTS ("邮件已存在"),
    SEND_EMAIL_ERROR ("邮件发送失败, 请稍后重试!"),
    WAITING_ACTIVE ("用户还未激活，不能登录!"),
    ACTIVE_ERROR ("激活失败，{0}"),
    SAVE_ORDER_ERROR ("订单{0}失败，物流属性是:{1}"),

    ORDER_NOT_EXIST("订单不存在，id: {0}"),
    ORDER_NO_LOGISTIC("订单没有物流，请添加物流再提交订单"),
    ORDER_WAS_CANCELED("订单已经被[{0}]取消"),
    ORDER_STATUS_NOT_RESERVE("订单状态不是待受理，无法取消"),
    NOT_ORDER_CREATER("您不是该订单创建人，无权取消订单"),
    NOT_ORDER_ACCEPTER("您不是该订单的受理人，无权受理订单"),
    ORDER_TYPE_MUST_PROXY("订单类型必须是代理才能受理订单"),
    ORDER_CANCEL_ERROR("订单状态为[{0}]，不能取消订单"),
    ACCEPT_ORDER_TYPE_ERROR("订单属性不是[{0}], 不能受理订单"),
    NO_MATCH_ORIGINAL_LOGISTIC("没有检索到物流信息"),

    ORDER_STATUS_NOT_TRANSIT("订单状态:[{0}], 目前不能中转"),
    NOT_ORDER_TRANSIT_USER("您不是订单中转受理方"),

    PARAMS_ERROR("参数错误"),

    EXCEL_RESOLVE_ERROR("数据上传失败！第[{0}]行数据解析异常，请检查后再上传！"),

    READ_EXCEL_ERROR("读取文件失败{0}"),
    ;

    private String message;

    private ExceptionEnum(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
