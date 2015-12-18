package com.meida.service;

import com.meida.Constant;
import com.meida.model.Order;
import com.meida.utils.DateUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.commons.lang.time.DateFormatUtils;

import java.util.Map;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class OrderService {

    private static String generateOrderNumber() {
        StringBuilder number = new StringBuilder();
        for (int i = 0; i < 3; i++) {
            number.append(Constant.LETTERS[RandomUtils.nextInt(26)]);
        }
        number.append(DateFormatUtils.format(System.currentTimeMillis(), DateUtils.yyMMddhhmmssSSS));
        return number.toString();
    }

    public static void newOrder(String key , long ownerId) {
        new Order().set(Order.number, generateOrderNumber())
                    .set(Order.type, 1);

    }

    public static void main(String[] args) {

//        long s = System.currentTimeMillis();
//        System.out.println(generateOrderNumber());
//        System.out.println(System.currentTimeMillis() - s);

//    char word='A';
//    for(int i=0;i<26;i++)
//        System.out.print("\"" + (word++) + "\", ");
    }
}
