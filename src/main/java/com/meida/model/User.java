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
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `openId` varchar(50) ,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updateTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */
	public static final User dao = new User();
}
