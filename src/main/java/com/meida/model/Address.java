package com.meida.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 
 * @author liuzhen
 * @version 
 * May 29, 2015 8:42:20 PM
 */
@SuppressWarnings("serial")
public class Address extends Model<Address>{
	/**
	 * DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `id` bigint(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `mobile` varchar(20) ,
  `address` varchar(100) NOT NULL,
  `ownerId` bigint(20) NOT NULL,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updateTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
	 */
	public static final Address dao = new Address();
	
	public static final String TABLE_NAME = "tb_address";
}
