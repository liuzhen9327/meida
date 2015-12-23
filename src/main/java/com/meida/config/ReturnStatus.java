package com.meida.config;
/**
 * 
 * @author liuzhen
 * @version 
 * Jul 12, 2015 11:05:50 PM
 */
public class ReturnStatus {

	/*login begin*/
	public static final int ACCOUNT_NOT_EXISTS = 0,
							PASSWORD_ERROR = 1,
							LOGIN_SUCCESS = 2;
	/*login end*/
	
	/*register begin*/
	public static final int EMAIL_EXISTS = 3,
							SEND_EMAIL_ERROR = 4,
							WAITING_ACTIVE = 5;
	/*register end*/
	
	/*activeAccount begin*/
	public static final int ACTIVE_ERROR = 6,
							ACCOUNT_SUCCESSED = 7,
							ACTIVE_SUCCESS = 8;
	/*activeAccount end*/
}
