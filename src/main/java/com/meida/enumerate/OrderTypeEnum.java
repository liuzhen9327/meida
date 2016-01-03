package com.meida.enumerate;

/**
 * Created by admin on 15/12/18.
 */
public enum OrderTypeEnum {
    proxy(1, "代理"), transit(2, "中转"), through(3, "直达"), NULL(0, "");

    private int value;
    private String name;

    private OrderTypeEnum(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public static OrderTypeEnum valueOf(int value) {
        switch (value) {
            case 1:
                return proxy;
            case 2:
                return transit;
            case 3:
                return through;
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
