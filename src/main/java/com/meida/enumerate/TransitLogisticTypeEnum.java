package com.meida.enumerate;

/**
 * Created by admin on 15/12/27.
 */
public enum TransitLogisticTypeEnum {
    unpack(1, "原包拆包"), forward(2, "原包转发"), NULL(0, "");

    private int value;
    private String name;

    private TransitLogisticTypeEnum(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static TransitLogisticTypeEnum valueOf(int value) {    //    手写的从int到enum的转换函数
        switch (value) {
            case 1:
                return unpack;
            case 2:
                return forward;
            default:
                return NULL;
        }
    }

    public int getValue() {
        return value;
    }

    public String getName() {
        return name;
    }
}
