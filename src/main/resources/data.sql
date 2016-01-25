/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.10
Source Server Version : 50171
Source Host           : 192.168.2.10:3306
Source Database       : meida

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2016-01-25 16:29:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `express`
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleteFlag` bit(1) DEFAULT b'0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `express_code_index` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=560 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES ('393', 'yuantong', '圆通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('394', 'shentong', '申通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('395', 'shunfeng', '顺丰快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('396', 'yunda', '韵达快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('397', 'debangwuliu', '德邦物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('398', 'zhongtong', '中通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('399', 'huitongkuaidi', '百世汇通', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('400', 'youzhengguonei', '邮政包裹', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('401', 'ems', 'EMS', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('402', 'annengwuliu', '安能物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('403', 'anxl', '安迅物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('404', 'balunzhi', '巴伦支快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('405', 'xiaohongmao', '北青小红帽', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('406', 'baifudongfang', '百福东方物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('407', 'bangsongwuliu', '邦送物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('408', 'lbbk', '宝凯物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('409', 'bqcwl', '百千诚物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('410', 'byht', '博源恒通', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('411', 'coe', 'COE（东方快递）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('412', 'city100', '城市100', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('413', 'chuanxiwuliu', '传喜物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('414', 'chengjisudi', '城际速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('415', 'lijisong', '成都立即送', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('416', 'chukou1', '出口易', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('417', 'dhl', 'DHL快递（中国件）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('418', 'dhlen', 'DHL（国际件）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('419', 'dhlde', 'DHL（德国件）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('420', 'datianwuliu', '大田物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('421', 'disifang', '递四方', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('422', 'dayangwuliu', '大洋物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('423', 'diantongkuaidi', '店通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('424', 'dechuangwuliu', '德创物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('425', 'donghong', '东红物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('426', 'dsukuaidi', 'D速物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('427', 'donghanwl', '东瀚物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('428', 'dfpost', '达方物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('429', 'emsguoji', 'EMS国际快递查询', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('430', 'fedex', 'FedEx快递查询', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('431', 'fedexus', 'FedEx（美国）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('432', 'rufengda', '凡客如风达', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('433', 'feikangda', '飞康达物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('434', 'feibaokuaidi', '飞豹快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('435', 'feihukuaidi', '飞狐快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('436', 'fanyukuaidi', '凡宇速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('437', 'fandaguoji', '颿达国际', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('438', 'feiyuanvipshop', '飞远配送', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('439', 'gts', 'GTS快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('440', 'guotongkuaidi', '国通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('441', 'youzhengguoji', '国际邮件查询', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('442', 'ganzhongnengda', '港中能达物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('443', 'gongsuda', '共速达', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('444', 'gtongsudi', '广通速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('445', 'gdkd', '港快速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('446', 'gaticn', 'GATI快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('447', 'hre', '高铁速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('448', 'gda', '冠达快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('449', 'tiandihuayu', '华宇物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('450', 'hengluwuliu', '恒路物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('451', 'hlyex', '好来运快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('452', 'huaxialongwuliu', '华夏龙物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('453', 'tiantian', '海航天天', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('454', 'hebeijianhua', '河北建华', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('455', 'haimengsudi', '海盟速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('456', 'huaqikuaiyun', '华企快运', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('457', 'haoshengwuliu', '昊盛物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('458', 'hutongwuliu', '户通物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('459', 'hzpl', '华航快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('460', 'huangmajia', '黄马甲快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('461', 'ucs', '合众速递（UCS）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('462', 'pfcexpress', '皇家物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('463', 'huoban', '伙伴物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('464', 'jiajiwuliu', '佳吉物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('465', 'jiayiwuliu', '佳怡物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('466', 'jiayunmeiwuliu', '加运美快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('467', 'jixianda', '急先达物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('468', 'jinguangsudikuaijian', '京广速递快件', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('469', 'jinyuekuaidi', '晋越快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('470', 'jd', '京东快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('471', 'jietekuaidi', '捷特快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('472', 'jiuyicn', '久易快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('473', 'kuaijiesudi', '快捷快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('474', 'kangliwuliu', '康力物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('475', 'kuayue', '跨越物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('476', 'kuaiyouda', '快优达速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('477', 'kuaitao', '快淘快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('478', 'lianbangkuaidi', '联邦快递（国内）', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('479', 'lianhaowuliu', '联昊通物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('480', 'longbanwuliu', '龙邦速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('481', 'lejiedi', '乐捷递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('482', 'lanhukuaidi', '蓝弧快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('483', 'minghangkuaidi', '民航快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('484', 'meiguokuaidi', '美国快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('485', 'menduimen', '门对门', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('486', 'mingliangwuliu', '明亮物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('487', 'minbangsudi', '民邦速递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('488', 'minshengkuaidi', '闽盛快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('489', 'nuoyaao', '偌亚奥国际', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('490', 'nanjingshengbang', '南京晟邦物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('491', 'pingandatengfei', '平安达腾飞', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('492', 'peixingwuliu', '陪行物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('493', 'quanfengkuaidi', '全峰快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('494', 'quanyikuaidi', '全一快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('495', 'quanritongkuaidi', '全日通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('496', 'quanchenkuaidi', '全晨快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('497', 'sevendays', '7天连锁物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('498', 'quanxintong', '全信通快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('499', 'riyuwuliu', '日昱物流', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('500', 'suer', '速尔快递', '', '2016-01-25 16:27:02', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('501', 'haihongwangsong', '山东海红', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('502', 'shenghuiwuliu', '盛辉物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('503', 'shiyunkuaidi', '世运快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('504', 'shengfengwuliu', '盛丰物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('505', 'shangda', '上大物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('506', 'santaisudi', '三态速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('507', 'saiaodi', '赛澳递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('508', 'shenganwuliu', '圣安物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('509', 'sxhongmajia', '山西红马甲', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('510', 'suijiawuliu', '穗佳物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('511', 'syjiahuier', '沈阳佳惠尔', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('512', 'shlindao', '上海林道货运', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('513', 'tnt', 'TNT快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('514', 'tonghetianxia', '通和天下', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('515', 'tianzong', '天纵物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('516', 'tongdaxing', '通达兴物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('517', 'ups', 'UPS快递查询', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('518', 'youshuwuliu', 'UC优速快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('519', 'usps', 'USPS美国邮政', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('520', 'wanxiangwuliu', '万象物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('521', 'weitepai', '微特派', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('522', 'wanjiawuliu', '万家物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('523', 'xiyoutekuaidi', '希优特快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('524', 'xinbangwuliu', '新邦物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('525', 'xinfengwuliu', '信丰物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('526', 'neweggozzo', '新蛋物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('527', 'xianglongyuntong', '祥龙运通物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('528', 'xianchengliansudi', '西安城联速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('529', 'xilaikd', '西安喜来快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('530', 'yuntongkuaidi', '运通快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('531', 'yuanchengwuliu', '远成物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('532', 'yafengsudi', '亚风速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('533', 'yishunhang', '亿顺航', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('534', 'yuefengwuliu', '越丰物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('535', 'yuananda', '源安达快递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('536', 'yuanfeihangwuliu', '原飞航物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('537', 'yinjiesudi', '银捷速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('538', 'yitongfeihong', '一统飞鸿', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('539', 'yuxinwuliu', '宇鑫物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('540', 'yitongda', '易通达', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('541', 'youbijia', '邮必佳', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('542', 'yiqiguojiwuliu', '一柒物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('543', 'yinsu', '音素快运', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('544', 'yilingsuyun', '亿领速运', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('545', 'yujiawuliu', '煜嘉物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('546', 'gml', '英脉物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('547', 'leopard', '云豹国际货运', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('548', 'yamaxunwuliu', '亚马逊物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('549', 'zhaijisong', '宅急送', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('550', 'zhongtiewuliu', '中铁快运', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('551', 'ztky', '中铁物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('552', 'zhongyouwuliu', '中邮物流', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('553', 'zhimakaimen', '芝麻开门', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('554', 'zhengzhoujianhua', '郑州建华', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('555', 'zhongsukuaidi', '中速快件', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('556', 'zhongtianwanyun', '中天万运', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('557', 'zhongruisudi', '中睿速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('558', 'zhongwaiyun', '中外运速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
INSERT INTO `express` VALUES ('559', 'zengyisudi', '增益速递', '', '2016-01-25 16:27:03', '0', '2016-01-25 16:27:03', '0');
