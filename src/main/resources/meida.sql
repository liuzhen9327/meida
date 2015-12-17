create DATABASE meida;
use meida;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `name` VARCHAR (50) NOT null,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` int DEFAULT 0,
  `openId` varchar(50),
  `company` VARCHAR (50),
  `companyAddress` VARCHAR (50),
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20),
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8);
ALTER TABLE `user` ADD UNIQUE (`email`);
ALTER TABLE `user` ADD UNIQUE (`openId`);

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `mobile` varchar(20) ,
  `address` varchar(100) NOT NULL,
  `ownerId` bigint(20) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20),
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
CREATE index address_owner_index on address(ownerId);


DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `number` varchar(20) NOT NULL COMMENT '订单号',
  `logisticName` varchar(50) COMMENT '物流名称',
  `logisticSeq` varchar(50) COMMENT '物流号',
  `type` varchar(10),
  `status` INT ,
  `transitName` TIMESTAMP NOT NULL,
  `transitSeq` varchar(50) ,
  `weight` decimal(6,2) ,
  `remark` varchar(200) ,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20),
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

