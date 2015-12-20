package com.meida.enumerate;

/**
 * Created by admin on 15/12/18.
 */
public enum OrderStatusEnum {
    //'0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',

    reserve(0, "预约待受理", "fa-plane"),
    send2transit(1, "发往中转仓", "fa-pencil"),
    waitTransit(2, "等待出仓中转", ""),
    finishTransit(3, "中转已完成", ""),
    NULL(0, "", "");

    private int value;
    private String name, className;

    private OrderStatusEnum(int value, String name, String className) {
        this.value = value;
        this.name = name;
        this.className = className;
    }

    public static OrderStatusEnum valueOf(int value) {    //    手写的从int到enum的转换函数
        switch (value) {
            case 0:
                return reserve;
            case 1:
                return send2transit;
            case 2:
                return waitTransit;
            case 3:
                return finishTransit;
            default:
                return NULL;
        }
    }

    public String getName() {
        return name;
    }

    public String getClassName() {
        return className;
    }

    public int getValue() {
        return value;
    }

    public static void main(String[] args) {
        System.out.println(OrderStatusEnum.valueOf(1));
        System.out.println(OrderStatusEnum.valueOf(1).getName());
        System.out.println(OrderStatusEnum.valueOf(1).getClassName());
    }
}
