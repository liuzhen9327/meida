package com.meida.controller;

import com.jfinal.aop.Clear;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.meida.interceptor.AuthInterceptor;
import com.meida.model.So;
import org.apache.commons.lang.StringUtils;
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
        List<So> list = new ArrayList<>();

        String value = getPara("value");
        if (StringUtils.isNotBlank(value)) {
            list = So.dao.find("select * from so where originalNumber=? or mobile=?", value, value);
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

    private boolean saveExcel(String filePath) {
        try {
            XSSFWorkbook xwb = new XSSFWorkbook(filePath);
            XSSFSheet sheet = xwb.getSheetAt(0);
            XSSFRow row;
            long deleteId = 0l;
            List<So> result = new ArrayList<>();
            int begin = sheet.getFirstRowNum();

            int end = sheet.getLastRowNum();
            for (int i = begin; i < end; i++) {
                if (i == begin) continue;
                row = sheet.getRow(i);
                if (null == row) continue;
                So model = new So();
                model.set(So.number, row.getCell(0).toString())
                        .set(So.originalName, row.getCell(1).toString())
                        .set(So.originalNumber, row.getCell(2).toString())
                        .set(So.weight, row.getCell(3).toString())
                        .set(So.transitLogisticInfo, row.getCell(4).toString())
                        .set(So.receiver, row.getCell(5).toString())
                        .set(So.mobile, row.getCell(6).toString())
                        .set(So.address, row.getCell(7).toString())
                        .set(So.transitName, row.getCell(8).toString())
                        .set(So.transitNumber, row.getCell(9).toString())
                        .save();
                if (i == begin+1) deleteId = model.getLong(So.id);
            }
            if (deleteId > 0) So.deleteData(deleteId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
