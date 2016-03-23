package com.meida;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * Created by liuzhen on 16/3/23.
 */
public class ReadSQLiteFile {
    public static void main(String[] args) throws Exception{
//        System.out.println(new Timestamp(1424793600000l));
//        System.out.println(getAirpopDbConnection());
        getSQLiteData();
    }

    private static void getSQLiteData() throws Exception {
        Class.forName("org.sqlite.JDBC");
        Connection connection=null;
        Connection airpopCon = null;
        try{
            connection= DriverManager.getConnection("jdbc:sqlite:/Users/admin/Downloads/aqi_sqlite_20150226");//D:/CF/HttpClient/1.db这个文件就是sqlite文件的存储地址，客户端下载的时候，jsp也是从这个地址获取
            Statement statement=connection.createStatement();
//            StringBuilder allLine = new StringBuilder();
            Map<Integer, String> pollutantMap = new HashMap<>();
            pollutantMap.put(null, "");
            ResultSet pollutantRs=statement.executeQuery("select * from pollutant");
            while(pollutantRs.next()){
                pollutantMap.put(pollutantRs.getInt("ID"), pollutantRs.getString("name"));
            }
            Map<Object, Map<String, Object>> areaMap = new HashMap<Object, Map<String, Object>>();
            ResultSet areaRs=statement.executeQuery("select * from areas");
            while(areaRs.next()){
                Map<String, Object> temp = new HashMap<String, Object>();
                Object division = areaRs.getObject("division");
                temp.put("division", division);
                temp.put("name", areaRs.getString("name"));
                temp.put("superior", areaRs.getLong("superior"));
                areaMap.put(division, temp);
//                System.out.println(areaMap.get(division));
//                if (division.equals(440000)) {
//                    System.out.println(areaMap.get(440000));
//                }
            }
//            Object aa = 440000;
//            System.out.println(areaMap.get(aa));

            ResultSet aqiRs=statement.executeQuery("select * from aqi");

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            OutputStream os = new FileOutputStream("/Users/admin/Documents/全国城市空气质量日报表.xlsx");
//            XSSFWorkbook wb = new XSSFWorkbook();
////            int i =444392;
//            int i =1;
//            XSSFSheet sheet= wb.createSheet("工作表1");
//
//            while(aqiRs.next()){
////                System.out.println("name:"+aqiRs.getString("name"));
////                allLine.append("").append("\t").append("").append("\t").append("").append("\t");
////                allLine.append(aqiRs.getString("areaName")).append("\t")
////                        .append(format.format(new Date(Long.valueOf(aqiRs.getLong("recordDate") + "000")))).append("\t")
////                        .append(format.format(new Date(Long.valueOf(aqiRs.getLong("_fetchDate") + "000")))).append("\t")
////                .append("\n");
//                XSSFRow row = sheet.createRow(i);
//                Object aqiDivision = aqiRs.getObject("division");
//                Map<String, Object> temp = areaMap.get(aqiDivision);
//                row.createCell(0).setCellValue(aqiRs.getString("areaName"));
//                if (temp != null) {
//                    Integer superior = Integer.valueOf(temp.get("superior").toString());
////                    System.out.println(superior);
////                    System.out.println(areaMap.get(superior));
//                    if (superior == 0) {
//                        row.createCell(1).setCellValue(temp.get("name").toString());
//                    } else {
//                        row.createCell(1).setCellValue(areaMap.get(superior).get("name").toString());
//                    }
//
//                    row.createCell(2).setCellValue(temp.get("name").toString());
//                }
//
//                row.createCell(3).setCellValue("");
//                row.createCell(4).setCellValue(format.format(new Date(Long.valueOf(aqiRs.getLong("recordDate") + "000"))));
//                row.createCell(5).setCellValue(format.format(new Date(Long.valueOf(aqiRs.getLong("_fetchDate") + "000"))));
//                row.createCell(6).setCellValue(aqiRs.getString("value"));
//                row.createCell(7).setCellValue(pollutantMap.get(aqiRs.getObject("pollutant")));
//                i++;
////                if (i % 10000 == 0) {
////                    wb.write(os);
////                    os.close();
////                    os = new FileOutputStream("/Users/admin/Documents/全国城市空气质量日报表.xlsx");
////                }
//            }
//            wb.write(os);
//            os.close();
//            System.out.println("i:" + i);
            OutputStream os2 = new FileOutputStream("/Users/admin/Documents/全国城市空气质量日报表2.xlsx");
            XSSFWorkbook wb2 = new XSSFWorkbook();
            int j =1;
            XSSFSheet sheet2= wb2.createSheet("工作表1");
            airpopCon = getAirpopDbConnection();
            Statement airSt=airpopCon.createStatement();
            ResultSet cityRs = airSt.executeQuery("select * from aqi_cities");
            Map<String, Map> cityMap = new HashMap();
            while (cityRs.next()) {
                Map temp = new HashMap();
                temp.put("id", cityRs.getObject("id").toString());
                temp.put("name", cityRs.getObject("name"));
                temp.put("provinceId", cityRs.getObject("provinceId"));
                cityMap.put(cityRs.getObject("id").toString(), temp);
            }

            ResultSet provincesRs = airSt.executeQuery("select * from aqi_provinces");
            Map provincesMap = new HashMap();
            while (provincesRs.next()) {
                provincesMap.put(provincesRs.getObject("id").toString(), provincesRs.getObject("name"));
            }

            ResultSet aqidailyRs = airSt.executeQuery("select * from airpopdb.aqi_master_daily where date > '2015-02-25';");
            while (aqidailyRs.next()) {
                if (aqidailyRs.getInt("cityId") < 0) continue;
                XSSFRow row = sheet2.createRow(j);

                String cityId = aqidailyRs.getObject("cityId").toString();
                row.createCell(0).setCellValue(cityMap.get(cityId).get("name").toString());
                row.createCell(1).setCellValue(provincesMap.get(cityMap.get(cityId).get("provinceId").toString()).toString());

                row.createCell(2).setCellValue(cityMap.get(cityId).get("name").toString());

                row.createCell(3).setCellValue("");
                row.createCell(4).setCellValue(format.format(aqidailyRs.getDate("date")));
                row.createCell(5).setCellValue(format.format(aqidailyRs.getDate("create_time")));
                row.createCell(6).setCellValue(aqidailyRs.getString("aqi"));
                row.createCell(7).setCellValue(ObjectUtils.toString(aqidailyRs.getObject("primaryPollutant")));
                j++;
            }
            wb2.write(os2);
            os2.close();


//            FileUtils.writeStringToFile(new File("/Users/admin/Documents/全国城市空气质量日报表.csv"), allLine.toString(), "UTF-8");



        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{
                if(connection !=null){
                    connection.close();
                }
                if (airpopCon != null) {
                    airpopCon.close();
                }
            }catch(SQLException e){
                System.err.println(e);
            }
        }
    }

    private static final String AIRPOP_DATABASE_URL = "jdbc:mysql://localhost/airpopdb?characterEncoding=UTF-8";
    private static final String AIRPOP_DATABASE_USER = "root";
    private static final String AIRPOP_DATABASE_PASSWORD = "!";

    public static Connection getAirpopDbConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(AIRPOP_DATABASE_URL, AIRPOP_DATABASE_USER, AIRPOP_DATABASE_PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
