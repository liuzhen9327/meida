package com.meida.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 
 * @author liuzhen
 * @version 
 * May 30, 2015 5:08:21 PM
 */
@SuppressWarnings("serial")
public class User extends Model<User>{

	/**
	 * DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `openId` varchar(50) ,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updateTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */
	public static final User dao = new User();
	
	public static final String  byEmail = "select * from " + User.TABLE_NAME + " where email=?",
								byId = "select * from " + User.TABLE_NAME + " where id=?",
								byOpenId = "select * from " + User.TABLE_NAME + " where openId=?";
	
	public static final String 
			TABLE_NAME = "tb_user",
			CACHE_NAME = "user",
			CACHE_KEY_START = "user_";
	
//	/**
//	 * 获取缓存
//	 * @param ids
//	 * @return
//	 */
//	public User cacheGet(String ids){
//		User user = CacheKit.get(CACHE_NAME, CACHE_KEY_START + ids);
//		return user;
//	}
}
