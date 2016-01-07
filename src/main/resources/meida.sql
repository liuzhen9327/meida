DROP DATABASE IF EXISTS meida;
create DATABASE meida;
use meida;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR (50) NOT null,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(128) DEFAULT NULL,
  `status` INT DEFAULT 0,
  `openId` VARCHAR(50),
  `company` VARCHAR (50),
  `companyAddress` VARCHAR (50),
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `user` ADD UNIQUE (`email`);
ALTER TABLE `user` ADD UNIQUE (`openId`);

DROP TABLE IF EXISTS `userFriend`;
CREATE TABLE `userFriend` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `userId` BIGINT(20) NOT NULL,
  `friendId` BIGINT(20) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE index friend_userid_index on `userFriend`(userId);
CREATE index friend_friendid_index on `userFriend`(friendId);


DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR (50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=myisam DEFAULT CHARSET=utf8;
CREATE index express_code_index on `express`(`code`);


DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR (50) NOT NULL,
  `path` VARCHAR(50) NOT NULL,
  `className` VARCHAR(50) NOT NULL,
  `parentId` BIGINT(20) NOT NULL DEFAULT 0,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE index menu_parentid_index on `express`(`parentId`);
/*
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` BIGINT(20) NOT NULL,
  `receiver` VARCHAR(20) NOT NULL,
  `mobile` VARCHAR(20) ,
  `address` VARCHAR(100) NOT NULL,
  `ownerId` BIGINT(20) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20),
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
CREATE index address_owner_index on address(ownerId);
*/

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(20) NOT NULL COMMENT '订单号',
  `type` INT NOT NULL COMMENT '1代理 2中转 3直达',
  `status` INT DEFAULT NULL COMMENT '0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',
  `acceptUser` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '受理方',
  `acceptTime` BIGINT(13) DEFAULT NULL,
  `transitUser` BIGINT(20) NOT NULL DEFAULT 0 COMMENT '中转方',
  `remark` TEXT,
  `totalWarehouse` INT DEFAULT 0 COMMENT '总件数',
  `waitInWarehouse` INT DEFAULT 0 COMMENT '等待入库',
  `waitExWarehouse` INT DEFAULT 0 COMMENT '等待出库',
  `exWarehouse` INT DEFAULT 0 COMMENT '已出库',
  `deleteFlag` BIT DEFAULT 0,
  `ownerId` BIGINT(20) NOT NULL,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE index order_number_index on `tb_order`(`number`);
CREATE index order_owner_index on `tb_order`(ownerId);
CREATE index order_accept_index on `tb_order`(acceptUser);
CREATE index order_transit_index on `tb_order`(transitUser);

DROP TABLE IF EXISTS `originalLogistic`;
CREATE TABLE `originalLogistic` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL COMMENT '物流名称',
  `number` VARCHAR(50) NOT NULL COMMENT '物流号',
  `weight` decimal(6,2) NOT NULL,
  `status` INT DEFAULT 0 COMMENT '处理状态 0待入库 1已入库 2已出仓',
  `receiver` VARCHAR(20) NOT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `remark` TEXT,
  `orderId` BIGINT(20) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
CREATE index original_number_index on `originalLogistic`(`number`);
CREATE index original_order_index on `originalLogistic`(`orderId`);

DROP TABLE IF EXISTS `transitLogistic`;
CREATE TABLE `transitLogistic` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL COMMENT '物流名称',
  `number` VARCHAR(50) NOT NULL COMMENT '物流号',
  `type` INT NOT NULL COMMENT '1拆包 2原装转发',
  `contactInfo` TEXT,
  `weight` decimal(6,2) NOT NULL,
  `remark` TEXT,
  `orderId` BIGINT(20) NOT NULL,
  `originalId` BIGINT(20) NOT NULL DEFAULT 0,
  `originalNumber` VARCHAR(50) NOT NULL DEFAULT 0,
  `sendTime` BIGINT(13) DEFAULT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
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