package com.meida.vo;

import com.alibaba.fastjson.JSON;
import com.jfinal.kit.JsonKit;
import org.apache.commons.lang.StringUtils;

/**
 * Created by liuzhen on 2015/12/23.
 */
public class JSONResult {
    private boolean succ;
    private String succMsg = StringUtils.EMPTY;
    private String errCode = StringUtils.EMPTY;
    private String errMsg = StringUtils.EMPTY;
    private Object data;

    public static String succ() {
        return succ(null);
    }
    public static String succ(Object data) {
        JSONResult result = new JSONResult();
        result.setSucc(true);
        if(data != null){
            result.setData(JsonKit.toJson(data));
        }
        return JSON.toJSONString(result);
    }

    public static String error(String errCode, String errMsg) {
        JSONResult result = new JSONResult();
        result.setErrCode(errCode);
        result.setErrMsg(errMsg);
        return JSON.toJSONString(result);
    }

    public boolean isSucc() {
        return succ;
    }

    public void setSucc(boolean succ) {
        this.succ = succ;
    }

    public String getSuccMsg() {
        return succMsg;
    }

    public void setSuccMsg(String succMsg) {
        this.succMsg = succMsg;
    }

    public String getErrCode() {
        return errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
