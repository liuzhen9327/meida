create DATABASE meida;
use meida;

DROP TABLE IF EXISTS `user`;
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

/*
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
*/

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL auto_increment,
  `number` varchar(20) NOT NULL COMMENT '订单号',
  `type` INT NOT NULL COMMENT '1代理 2中转 3直达',
  `status` INT DEFAULT NULL COMMENT '0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',
  `acceptUser` bigint(20) NOT NULL DEFAULT 0 COMMENT '受理方',
  `transitUser` bigint(20) NOT NULL DEFAULT 0 COMMENT '中转方',
  `remark` varchar(200),
  `waitInWarehouse` int DEFAULT 0 COMMENT '等待入库',
  `waitExWarehouse` int DEFAULT 0 COMMENT '等待出库',
  `exWarehouse` int DEFAULT 0 COMMENT '已出库',
  `deleteFlag` BIT DEFAULT 0,
  `ownerId` bigint(20) NOT NULL,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE index order_number_index on `order`(`number`);
CREATE index order_owner_index on `order`(ownerId);
CREATE index order_accept_index on `order`(acceptId);

DROP TABLE IF EXISTS `originalLogistic`;
CREATE TABLE `originalLogistic` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '物流名称',
  `number` varchar(50) NOT NULL COMMENT '物流号',
  `weight` decimal(6,2) NOT NULL,
  `status` INT DEFAULT 0 COMMENT '处理状态 0待入库 1已入库 2已出仓',
  `receiver` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `remark` varchar(200),
  `orderId` bigint(20) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
CREATE index original_number_index on `originalLogistic`(`number`);
CREATE index original_order_index on `originalLogistic`(`orderId`);

DROP TABLE IF EXISTS `transitLogistic`;
CREATE TABLE `transitLogistic` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '物流名称',
  `number` varchar(50) NOT NULL COMMENT '物流号',
  `type` INT NOT NULL COMMENT '1拆包 2原装转发',
  `contactInfo` VARCHAR (200),
  `remark` varchar(200),
  `orderId` bigint(20) NOT NULL,
  `originalId` bigint(20) NOT NULL DEFAULT 0,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
CREATE index transit_number_index on `transitLogistic`(`number`);
CREATE index transit_order_index on `transitLogistic`(`orderId`);
CREATE index transit_original_index on `transitLogistic`(`originalId`);

/**
原包拆包 是拆原始物流单还是整个订单?
原包拆包 添加地址信息时, 总重量是什么
原包拆包 添加地址信息时, 点击发货之后是什么处理逻辑

 */