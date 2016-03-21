package com.jfinal.plugin.activerecord.generator;

/**
 * Created by liuzhen on 16/3/17.
 */

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class TypeMapping {
    protected Map<String, String> map = new HashMap() {
        {
            this.put("java.sql.Date", "java.util.Date");
            this.put("java.sql.Time", "java.util.Date");
            this.put("java.sql.Timestamp", "java.util.Date");
            this.put("[B", "byte[]");
            this.put("java.lang.String", "java.lang.String");
            this.put("java.lang.Integer", "java.lang.Integer");
            this.put("java.lang.Long", "java.lang.Long");
            this.put("java.lang.Double", "java.lang.Double");
            this.put("java.lang.Float", "java.lang.Float");
            this.put("java.lang.Boolean", "java.lang.Boolean");
            this.put("java.math.BigDecimal", "java.math.BigDecimal");
            this.put("java.math.BigInteger", "java.math.BigInteger");
        }
    };

    public TypeMapping() {
    }

    public String getType(String typeString) {
        return (String)this.map.get(typeString);
    }

    public static void main(String[] args) throws ParseException {
//        long time = 1458244098000l;
////        long time = 1458272898000l;
//        System.out.println(new Timestamp(time));
////        try {
////            long t = DateUtils.parseDate("2016-03-18 03:48:18", new String[]{"yyyy-MM-dd hh:mm:ss"}).getTime();
////            System.out.println(t);
////        } catch (ParseException e) {
////            e.printStackTrace();
////        }
////        DateFormatUtils.for
////        System.out.println(new Date(time));
////        System.out.println(TimeZone.getTimeZone("GMT").get);
//        Calendar calendar = Calendar.getInstance();
//        System.out.println(TimeZone.getTimeZone("GMT+8"));
////        System.out.println(calendar.getTime());
//        System.out.println(TimeZone.getDefault());
////        calendar.setTimeInMillis(time);
//        System.out.println(calendar.getTime());

        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.set(Calendar.HOUR, calendar.get(Calendar.HOUR) -1);
        //2015-09-27 05:00:00
        System.out.println(calendar.getTime());
        System.out.println(DateFormatUtils.format(calendar, "yyyy-MM-dd HH:00:00"));

//        SimpleDateFormat foo = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        System.out.println("foo:" + foo.format(new Date()));
//
//        Calendar gc = GregorianCalendar.getInstance();
//        System.out.println("gc.getTime():" + gc.getTime());
//        System.out.println("gc.getTimeInMillis():" + new Date(gc.getTimeInMillis()));
//
//        // 当前系统默认时区的时间：
//        Calendar calendar = new GregorianCalendar();
//        System.out.print("时区：" + calendar.getTimeZone().getID() + "  ");
//        System.out.println("时间：" + calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE));
//        // 美国洛杉矶时区
//        TimeZone tz = TimeZone.getTimeZone("America/Los_Angeles");
//        // 时区转换
//        calendar.setTimeZone(tz);
//        System.out.print("时区：" + calendar.getTimeZone().getID() + "  ");
//        System.out.println("时间：" + calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE));
//        Date time = new Date();
//
//        // 1、取得本地时间：
//        java.util.Calendar cal = java.util.Calendar.getInstance();
//
//        // 2、取得时间偏移量：
//        int zoneOffset = cal.get(java.util.Calendar.ZONE_OFFSET);
//
//        // 3、取得夏令时差：
//        int dstOffset = cal.get(java.util.Calendar.DST_OFFSET);
//
//        // 4、从本地时间里扣除这些差量，即可以取得UTC时间：
//        cal.add(java.util.Calendar.MILLISECOND, -(zoneOffset + dstOffset));
//
//        // 之后调用cal.get(int x)或cal.getTimeInMillis()方法所取得的时间即是UTC标准时间。
//        System.out.println("UTC:" + new Date(cal.getTimeInMillis()));
//
//        Calendar calendar1 = Calendar.getInstance();
//        TimeZone tztz = TimeZone.getTimeZone("GMT");
//        calendar1.setTimeZone(tztz);
//        System.out.println(calendar.getTime());
//        System.out.println(calendar.getTimeInMillis());
//
//        // SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
//        // df.setTimeZone(TimeZone.getTimeZone("UTC"));
//        // System.out.println(df.parse("2014-08-23T09:20:05Z").toString());
//
////        SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
////        Date t = new Date();
////        System.out.println(df1.format(t));
////        System.out.println(df1.format(df1.parse("2014-08-27T18:02:59.676Z")) + "***********");
////        df1.setTimeZone(TimeZone.getTimeZone("UTC"));
////        System.out.println(df1.format(t));
////        System.out.println("-----------");
////        System.out.println(df1.format(df1.parse("2014-08-27T18:02:59.676Z")) + "***********");
////        System.out.println("2014-08-27T18:02:59.676Z");
    }
}
