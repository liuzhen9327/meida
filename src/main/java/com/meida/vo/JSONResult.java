package com.meida.vo;

import org.apache.commons.lang.StringUtils;

/**
 * Created by liuzhen on 2015/12/23.
 */
public class JSONResult {
    private boolean succ;
    private String errCode = StringUtils.EMPTY;
    private String errMsg = StringUtils.EMPTY;
    private Object data;

    public static JSONResult succ() {
        return succ(null);
    }
    public static JSONResult succ(Object data) {
        JSONResult result = new JSONResult();
        result.setSucc(true);
        if(data != null){
            result.setData(data);
        }
        return result;
    }

    public static JSONResult error(String errCode, String errMsg) {
        JSONResult result = new JSONResult();
        result.setErrCode(errCode);
        result.setErrMsg(errMsg);
        return result;
    }

    public boolean isSucc() {
        return succ;
    }

    public void setSucc(boolean succ) {
        this.succ = succ;
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
