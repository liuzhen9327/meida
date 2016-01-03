package com.meida.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by admin on 16/1/3.
 */
public class ValidatorUtils {

    private static final String emailAddressPattern = "\\b(^['_A-Za-z0-9-]+(\\.['_A-Za-z0-9-]+)*@([A-Za-z0-9-])+(\\.[A-Za-z0-9-]+)*((\\.[A-Za-z0-9]{2,})|(\\.[A-Za-z0-9]{2,}\\.[A-Za-z0-9]{2,}))$)\\b";

    public static boolean isEmail(String value) {
        Pattern pattern = Pattern.compile(emailAddressPattern);
        Matcher matcher = pattern.matcher(value);
        return matcher.matches();
    }
}
