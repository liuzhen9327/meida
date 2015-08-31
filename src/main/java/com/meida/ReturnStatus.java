package com.meida;
/**
 * 
 * @author liuzhen
 * @version 
 * Jul 12, 2015 11:05:50 PM
 */
public class ReturnStatus {

	/*login begin*/
	public static final int ACCOUNT_NOT_EXISTS = -1,
							PASSWORD_ERROR = 0,
							LOGIN_SUCCESS = 1;
	/*login end*/
	
	/*register begin*/
	public static final int EMAIL_EXISTS = -1,
							WAITING_ACTIVE = 0;
	/*register end*/
	
	/*activeAccount begin*/
	public static final int ACTIVE_ERROR = -1,
							ACCOUNT_SUCCESSED = 0,
							ACTIVE_SUCCESS = 1;
	/*activeAccount end*/
}
