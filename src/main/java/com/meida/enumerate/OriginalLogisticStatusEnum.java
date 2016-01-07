package com.meida.enumerate;

/**
 * Created by admin on 15/12/18.
 */
public enum OriginalLogisticStatusEnum {
    waitInWarehouse(0, "待入库", "fa-bell"), alreadyInWarehouse(1, "已入库", "fa-history"), exWarehouse(2, "已出仓", "fa-check-circle"), NULL(-1, "", "");

    private int value;
    private String name;
    private String className;

    private OriginalLogisticStatusEnum(int value, String name, String className) {
        this.value = value;
        this.name = name;
        this.className = className;
    }

    public static OriginalLogisticStatusEnum valueOf(int value) {    //    手写的从int到enum的转换函数
        switch (value) {
            case 0:
                return waitInWarehouse;
            case 1:
                return alreadyInWarehouse;
            case 2:
                return exWarehouse;
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
