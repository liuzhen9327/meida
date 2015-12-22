package com.meida.enumerate;

/**
 * Created by admin on 15/12/18.
 */
public enum OriginalLogisticStatusEnum {
    waitInWarehouse(0, "待入库"), waitExWarehouse(1, "待出库"), exWarehouse(2, "已出库"), NULL(0, "");

    private int value;
    private String name;

    private OriginalLogisticStatusEnum(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static OriginalLogisticStatusEnum valueOf(int value) {    //    手写的从int到enum的转换函数
        switch (value) {
            case 0:
                return waitInWarehouse;
            case 1:
                return waitExWarehouse;
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

}
