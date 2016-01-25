package com.meida.utils;

import java.util.Calendar;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class DateUtils {
    public final static String yyMMddhhmmssSSS = "yyMMddhhmmssSSS",
                                yyyy_MM_dd_hh_mm_ss = "yyyy-MM-dd hh:mm:ss",
                                yyMMddhhmm = "yy/MM/dd/hh:mm";

    public static long getTimeInMillis() {
        return Calendar.getInstance().getTimeInMillis();
    }


}
