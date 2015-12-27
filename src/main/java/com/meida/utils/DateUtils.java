package com.meida.utils;

import java.util.Calendar;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class DateUtils {
    public final static String yyMMddhhmmssSSS = "yyMMddhhmmssSSS";

    public static long getTimeInMillis() {
        return Calendar.getInstance().getTimeInMillis();
    }
}
