package com.meida.controller;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.meida.interceptor.AuthInterceptor;
import com.meida.model.OriginalLogistic;
import com.meida.model.Receiver;
import com.meida.model.So;
import com.meida.model.TransitLogistic;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
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
                    OriginalLogistic.id + " in(select DISTINCT "+Receiver.originalId+" from "+Receiver.TABLE_NAME+
                    " where "+Receiver.originalNumber+"=? or "+Receiver.mobile+"=?) order by id desc", value, value);
        }

        setAttr("list", list);
        setAttr("value", value);
        renderJsp("index.jsp");
    }

    public void importExcel() {
        try {
            String filePath = upload2();
            String msg = null;
            log.debug("importExcel..");
            if (filePath != null) {
                log.debug("filepath:"+filePath);
                boolean flag = saveExcel(filePath);
                log.debug("save excel: "+flag);
                if (flag) msg = "导入excel成功";
                else msg = "导入excel失败";
            } else {
                msg = "上传文件失败";
            }
            setAttr("msg", msg);
            renderJsp("upload.jsp");
        } catch (Exception e) {
            log.error("", e);
        }
    }

    public void upload() {
    }

    private String upload2() throws Exception{
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
            OriginalLogistic.dao.deleteAll();
            TransitLogistic.dao.deleteAll();
            XSSFWorkbook xwb = new XSSFWorkbook(filePath);
            XSSFSheet sheet = xwb.getSheetAt(0);
            XSSFRow row;
//            long deleteId = 0l;
            List<So> result = new ArrayList<>();
            int begin = sheet.getFirstRowNum();

            Map<Object, OriginalLogistic> originalLogisticMap = new LinkedHashMap<>();
            List<TransitLogistic> transitLogisticList = new ArrayList<>();
            List<Receiver> receiverList = new ArrayList<>();

            int end = sheet.getLastRowNum();
            for (int i = begin; i < end; i++) {
                if (i == begin) continue;
                row = sheet.getRow(i);
                if (null == row) continue;

                Object originalName = getCellValue(row.getCell(1)),
                        originalNumber = getCellValue(row.getCell(2)),
                        weight = getCellValue(row.getCell(3)),
                        transitLogisticInfo = getCellValue(row.getCell(4)),
                        receiver = getCellValue(row.getCell(5)),
                        mobile = getCellValue(row.getCell(6)),
                        address = getCellValue(row.getCell(7)),
                        transitName = getCellValue(row.getCell(8)),
                        transitNumber = getCellValue(row.getCell(9)),
                        date = getCellValue(row.getCell(10));



                OriginalLogistic originalLogistic = new OriginalLogistic();
                originalLogistic.set(OriginalLogistic.name, originalName)
                        .set(OriginalLogistic.number, originalNumber)
                        .set(OriginalLogistic.weight, weight)
//                        .set(OriginalLogistic.receiver, receiver)
//                        .set(OriginalLogistic.mobile, mobile)
//                        .set(OriginalLogistic.address, address)
                        .set(OriginalLogistic.orderId, 0)
                        .set(OriginalLogistic.creater, 0)
                        .set(OriginalLogistic.updater, 0);
                if (date != null) originalLogistic.set(OriginalLogistic.updateTime, date);

                originalLogisticMap.put(originalNumber, originalLogistic);

                receiverList.add(new Receiver(receiver, mobile, address, null, originalNumber));


                if (transitName != null && !transitName.toString().equals("")
                        && transitNumber != null && !transitNumber.toString().equals("")
                        && transitLogisticInfo != null && !transitLogisticInfo.toString().equals("")) {
                    TransitLogistic transitLogistic = new TransitLogistic();
                    transitLogistic.set(TransitLogistic.name, transitName)
                            .set(TransitLogistic.number, transitNumber)
                            .set(TransitLogistic.type, 1)
                            .set(TransitLogistic.contactInfo, transitLogisticInfo)
                            .set(TransitLogistic.weight, 0)
                            .set(TransitLogistic.orderId, 0)
                            .set(TransitLogistic.originalNumber, originalNumber)
                            .set(TransitLogistic.originalMobile, mobile)
                            .set(TransitLogistic.creater, 0)
                            .set(TransitLogistic.updater, 0);
                    if (date != null) transitLogistic.set(TransitLogistic.updateTime, date);
                    transitLogisticList.add(transitLogistic);
                }

            }



            for (Map.Entry<Object, OriginalLogistic> entry : originalLogisticMap.entrySet()) {
                entry.getValue().save();
            }
            for (TransitLogistic transitLogistic : transitLogisticList) {
                transitLogistic.set(TransitLogistic.originalId, originalLogisticMap.get(
                        transitLogistic.getStr(TransitLogistic.originalNumber)).get(OriginalLogistic.id));
                transitLogistic.save();
            }

            for (Receiver receiver : receiverList) {
                receiver.set(Receiver.originalId, originalLogisticMap.get(
                        receiver.getStr(Receiver.originalNumber)).get(OriginalLogistic.id));
                receiver.save();
            }
            return true;
        } catch (Exception e) {
            log.error("", e);
        }
        return false;
    }

    private Object getCellValue(XSSFCell cell) {
        Object object = null;
        if (cell == null) return object;
        switch (cell.getCellType()) {
            case XSSFCell.CELL_TYPE_NUMERIC: // 数字
                if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式
                    object = cell.getDateCellValue();
                } else {
                    object = (cell.getNumericCellValue());
                }
                break;
            case XSSFCell.CELL_TYPE_STRING: // 字符串
                object = (cell.getStringCellValue());
                break;
            case XSSFCell.CELL_TYPE_BOOLEAN: // Boolean
                object = (cell.getBooleanCellValue());
                break;
            case XSSFCell.CELL_TYPE_FORMULA: // 公式
                object = (cell.getCellFormula());
                break;
        }
        return object;
    }
}
