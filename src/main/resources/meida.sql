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
  `creater` bigint(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8);
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
  `id` bigint(20) NOT NULL,
  `number` varchar(20) NOT NULL COMMENT '订单号',
  `type` varchar(10) NOT NULL COMMENT '1代理 2中转 3直达',
  `status` INT NOT NULL COMMENT '0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',
  `acceptId` bigint(20) NOT NULL DEFAULT 0 COMMENT '受理方',
  `remark` varchar(200),
  `deleteFlag` BIT DEFAULT 0,
  `isCommit` BIT DEFAULT 0,
  `ownerId` bigint(20) NOT NULL,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE index order_number_index on `order`(`number`);
CREATE index order_owner_index on `order`(ownerId);
CREATE index order_accept_index on `order`(acceptId);

DROP TABLE IF EXISTS `originalLogistic`;
CREATE TABLE `originalLogistic` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '物流名称',
  `number` varchar(50) NOT NULL COMMENT '物流号',
  `weight` decimal(6,2) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `remark` varchar(200),
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` bigint(20) NOT NULL ,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原始物流订单表';
CREATE index original_number_index on `originalLogistic`(`number`);

DROP TABLE IF EXISTS `transitLogistic`;
CREATE TABLE `transitLogistic` (
  `id` bigint(20) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原始物流订单表';

/**
原包拆包 是拆原始物流单还是整个订单?
原包拆包 添加地址信息时, 总重量是什么
原包拆包 添加地址信息时, 点击发货之后是什么处理逻辑

 */