package com.meida.model;

/**
 *
 * @author liuzhen
 * @version
 * May 30, 2015 5:08:21 PM
 * DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`id` bigint(20) NOT NULL auto_increment,
`name` VARCHAR (50) NOT null,
`email` varchar(50) NOT NULL,
`password` varchar(128) NOT NULL,
`status` int DEFAULT 0,
`openId` varchar(50),
`company` VARCHAR (50),
`companyAddress` VARCHAR (50),
`deleteFlag` BIT DEFAULT 0,
`createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
`creater` bigint(20) NOT NULL ,
`updateTime` TIMESTAMP NOT NULL,
`updater` bigint(20) NOT NULL ,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `user` ADD UNIQUE (`email`);
ALTER TABLE `user` ADD UNIQUE (`openId`);
 */
@SuppressWarnings("serial")
public class User extends BaseModel<User>{

	public final static User dao = new User();

	public final static String TABLE_NAME = "tb_user",
                               CACHE_NAME = "user",
			                   CACHE_KEY_START = "user_";

    public final static String name = "name",
                               email = "email",
                               password = "password",
                               status = "status",
                               openId = "openId",
                               company = "company",
                               companyAddress = "companyAddress";

	public final static String sql_findAll = "select * from " + User.TABLE_NAME,
							   sql_findByEmail = sql_findAll + " where email=?",
							   sql_findByOpenId = sql_findAll + " where openId=?";
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
