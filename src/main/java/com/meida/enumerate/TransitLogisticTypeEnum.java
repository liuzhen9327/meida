package com.meida.enumerate;

/**
 * Created by admin on 15/12/27.
 */
public enum TransitLogisticTypeEnum {
    unpack(1, "拆包", "fa-sitemap"), forward(2, "转发", "fa-cube"), NULL(-1, "", "");

    private int value;
    private String name;
    private String className;

    private TransitLogisticTypeEnum(int value, String name, String className) {
        this.value = value;
        this.name = name;
        this.className = className;
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

    public String getClassName() {
        return className;
    }
}
