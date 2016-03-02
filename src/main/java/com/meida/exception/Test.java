package com.meida.exception;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by liuzhen on 16/3/1.
 */
public class Test {
    public static void main(String[] args) {
        File file = new File("/Users/admin/Documents/git/AirPop/AirPop_Web/base/src/main/java/v3/Othello.java");
        try {
            List<String> lines = FileUtils.readLines(file);
            for (String line : lines) {
                char[] chars = line.trim().toCharArray();
                StringBuilder newline = new StringBuilder();
                int index = -1;
                for (int i = 0; i < chars.length; i++) {
                    if (!Character.isDigit(chars[i])) {
                        index = i;
                        break;
                    }
                }
                if (index == -1) continue;
                for (int j = index; j < chars.length; j++) {
                    newline.append(chars[j]);
                }
                newline.append("\n");
                System.out.println(newline.toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
