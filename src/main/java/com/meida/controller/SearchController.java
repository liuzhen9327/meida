package com.meida.controller;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.meida.interceptor.AuthInterceptor;
import com.meida.model.OriginalLogistic;
import com.meida.model.So;
import com.meida.model.TransitLogistic;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by admin on 16/1/22.
 */
public class SearchController extends BaseController {

    private static Logger log = LoggerFactory.getLogger(SearchController.class);

    @Clear(AuthInterceptor.class)
    public void index() {
        List<OriginalLogistic> list = new ArrayList<>();

        String value = getPara("value");
        if (StringUtils.isNotBlank(value)) {
            list = OriginalLogistic.dao.find("select * from " + OriginalLogistic.TABLE_NAME + " where " +
                    OriginalLogistic.number + "=? or " + OriginalLogistic.mobile + "=?", value, value);
//            list = So.dao.find("select * from so where originalNumber=? or mobile=?", value, value);
        }

        setAttr("list", list);
        setAttr("value", value);
        renderJsp("index.jsp");
    }

    public void importExcel() {
        String filePath = upload2();
        String msg = null;
        if (filePath != null) {
            boolean flag = saveExcel(filePath);
            if (flag) msg = "导入excel成功";
            else msg = "导入excel失败";
        } else {
            msg = "上传文件失败";
        }
        setAttr("msg", msg);
        renderJsp("upload.jsp");
    }

    public void upload() {
    }

    private String upload2() {
        String path = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
        UploadFile file = getFile("file", PathKit.getWebRootPath() + "/temp");
        File source = file.getFile();
        String fileName = file.getFileName();
        String extension = fileName.substring(fileName.lastIndexOf("."));
        String prefix;
        if(".png".equals(extension) || ".jpg".equals(extension) || ".gif".equals(extension)){
            prefix = "img";
            fileName = generateWord() + extension;
        }else{
            prefix = "file";
        }
        try {
            FileInputStream fis = new FileInputStream(source);
            File targetDir = new File(PathKit.getWebRootPath() + "/" + prefix + "/u/"
                    + path);
            if (!targetDir.exists()) {
                targetDir.mkdirs();
            }
            File target = new File(targetDir, fileName);
            if (!target.exists()) {
                target.createNewFile();
            }
            FileOutputStream fos = new FileOutputStream(target);
            byte[] bts = new byte[300];
            while (fis.read(bts, 0, 300) != -1) {
                fos.write(bts, 0, 300);
            }
            fos.close();
            fis.close();
            source.delete();
            return target.getAbsolutePath();
        } catch (FileNotFoundException e) {
            log.error("", e);
        } catch (IOException e) {
            log.error("", e);
        }
        return null;
    }

    private String generateWord() {
        String[] beforeShuffle = new String[] { "2", "3", "4", "5", "6", "7",
                "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
                "W", "X", "Y", "Z" };
        List<String> list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        return afterShuffle.substring(5, 9);
    }

    @Before(Tx.class)
    private boolean saveExcel(String filePath) {
        try {
            XSSFWorkbook xwb = new XSSFWorkbook(filePath);
            XSSFSheet sheet = xwb.getSheetAt(0);
            XSSFRow row;
//            long deleteId = 0l;
            List<So> result = new ArrayList<>();
            int begin = sheet.getFirstRowNum();

            Map<String, OriginalLogistic> originalLogisticMap = new HashMap<>();
            List<TransitLogistic> transitLogisticList = new ArrayList<>();

            int end = sheet.getLastRowNum();
            for (int i = begin; i < end; i++) {
                if (i == begin) continue;
                row = sheet.getRow(i);
                if (null == row) continue;

                OriginalLogistic originalLogistic = new OriginalLogistic();
                originalLogistic.set(OriginalLogistic.name, getCellValue(row.getCell(1)))
                        .set(OriginalLogistic.number, getCellValue(row.getCell(2)))
                        .set(OriginalLogistic.weight, getCellValue(row.getCell(3)))
                        .set(OriginalLogistic.receiver, getCellValue(row.getCell(5)))
                        .set(OriginalLogistic.mobile, getCellValue(row.getCell(6)))
                        .set(OriginalLogistic.address, getCellValue(row.getCell(7)))
                        .set(OriginalLogistic.orderId, 0)
                        .set(OriginalLogistic.creater, 0)
                        .set(OriginalLogistic.updater, 0);
                originalLogisticMap.put(row.getCell(2).toString(), originalLogistic);

                TransitLogistic transitLogistic = new TransitLogistic();
                transitLogistic.set(TransitLogistic.name, getCellValue(row.getCell(8)))
                        .set(TransitLogistic.number, getCellValue(row.getCell(9)))
                        .set(TransitLogistic.type, 1)
                        .set(TransitLogistic.contactInfo, getCellValue(row.getCell(4)))
                        .set(TransitLogistic.weight, 0)
                        .set(TransitLogistic.orderId, 0)
                        .set(TransitLogistic.originalNumber, getCellValue(row.getCell(2)))
                        .set(OriginalLogistic.creater, 0)
                        .set(OriginalLogistic.updater, 0);
                transitLogisticList.add(transitLogistic);
//                So model = new So();
//                model.set(So.number, row.getCell(0).toString())
//                        .set(So.originalName, row.getCell(1).toString())
//                        .set(So.originalNumber, row.getCell(2).toString())
//                        .set(So.weight, row.getCell(3).toString())
//                        .set(So.transitLogisticInfo, row.getCell(4).toString())
//                        .set(So.receiver, row.getCell(5).toString())
//                        .set(So.mobile, row.getCell(6).toString())
//                        .set(So.address, row.getCell(7).toString())
//                        .set(So.transitName, row.getCell(8).toString())
//                        .set(So.transitNumber, row.getCell(9).toString())
//                        .save();
//                if (i == begin+1) deleteId = model.getLong(So.id);
            }

            OriginalLogistic.dao.deleteAll();
            TransitLogistic.dao.deleteAll();

            for (Map.Entry<String, OriginalLogistic> entry : originalLogisticMap.entrySet()) {
                entry.getValue().save();
            }
            for (TransitLogistic transitLogistic : transitLogisticList) {
                transitLogistic.set(TransitLogistic.originalId, originalLogisticMap.get(
                        transitLogistic.getStr(TransitLogistic.originalNumber)).get(OriginalLogistic.id));
                transitLogistic.save();
            }
//            if (deleteId > 0) So.deleteData(deleteId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private Object getCellValue(XSSFCell cell) {
        switch (cell.getCellType()) {
            case XSSFCell.CELL_TYPE_NUMERIC: // 数字
                return (cell.getNumericCellValue());
            case XSSFCell.CELL_TYPE_STRING: // 字符串
                return (cell.getStringCellValue());
            case XSSFCell.CELL_TYPE_BOOLEAN: // Boolean
                return (cell.getBooleanCellValue());
            case XSSFCell.CELL_TYPE_FORMULA: // 公式
                return (cell.getCellFormula());
            default:
                return "";
        }

    }
}
