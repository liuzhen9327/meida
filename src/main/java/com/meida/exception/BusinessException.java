package com.meida.exception;

import com.meida.enumerate.ExceptionEnum;

/**
 * Created by liuzhen on 2015/12/18.
 */
public class BusinessException extends RuntimeException {

    private ExceptionEnum exceptionEnum;

    private Object[] args;

    public BusinessException(ExceptionEnum exceptionEnum, Object... theArgs) {
        this.exceptionEnum = exceptionEnum;
        this.args = theArgs;
    }

}
