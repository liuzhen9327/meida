create DATABASE meida;
use meida;

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` int DEFAULT 0,
  `openId` varchar(50),
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updateTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_address`;
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

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL,
  `sequence` varchar(20) NOT NULL,
  `logisticName` varchar(50) ,
  `logisticSeq` varchar(50) ,
  `type` varchar(10),
  `status` varchar(10),
  `transitName` TIMESTAMP NOT NULL,
  `transitSeq` varchar(50) ,
  `weight` decimal(6,2) ,
  `remark` varchar(200) ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

