/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.10
Source Server Version : 50171
Source Host           : 192.168.2.10:3306
Source Database       : meida

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2016-01-07 17:37:13
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
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES ('1', 'aolau', 'AOL澳通速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('2', 'annengwuliu', '安能物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('3', 'anxl', '安迅物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('5', 'balunzhi', '巴伦支快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('6', 'xiaohongmao', '北青小红帽', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('7', 'htky', '百世汇通', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('8', 'bfdf', '百福东方物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('9', 'bangsongwuliu', '邦送物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('10', 'lbbk', '宝凯物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('11', 'bqcwl', '百千诚物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('12', 'byht', '博源恒通', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('13', 'idada', '百成大达物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('14', 'baishiwuliu', '百世快运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('15', 'baitengwuliu', '百腾物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('16', 'birdex', '笨鸟海淘', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('17', 'coe', 'COE（东方快递）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('18', 'city100', '城市100', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('19', 'chuanxiwuliu', '传喜物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('20', 'chengjisudi', '城际速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('22', 'chukou1', '出口易', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('23', 'nanjingshengbang', '晟邦物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('24', 'dhl', 'DHL快递（中国件）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('25', 'dhlen', 'DHL（国际件）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('26', 'dhlde', 'DHL（德国件）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('27', 'dbwl', '德邦', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('28', 'dtwl', '大田物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('30', 'disifang', '递四方', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('31', 'dayangwuliu', '大洋物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('32', 'diantongkuaidi', '店通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('33', 'dechuangwuliu', '德创物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('34', 'donghong', '东红物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('35', 'dskd', 'D速物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('36', 'donghanwl', '东瀚物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('37', 'dfpost', '达方物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('38', 'dongjun', '东骏快捷物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('40', 'emsguoji', 'EMS国际快递查询', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('41', 'eshunda', '俄顺达', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('42', 'fedex', 'FedEx快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('44', 'fedexus', 'FedEx（美国）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('46', 'fkd', '飞康达物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('47', 'feibaokuaidi', '飞豹快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('48', 'feihukuaidi', '飞狐快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('49', 'fanyukuaidi', '凡宇速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('50', 'fandaguoji', '颿达国际', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('51', 'feiyuanvipshop', '飞远配送', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('52', 'hnfy', '飞鹰物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('53', 'fengxingtianxia', '风行天下', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('54', 'flysman', '飞力士物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('55', 'gaticn', 'GATI快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('56', 'gts', 'GTS快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('57', 'guotongkuaidi', '国通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('61', 'gongsuda', '共速达', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('62', 'gtongsudi', '广通速递（山东）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('63', 'suteng', '广东速腾物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('64', 'gdkd', '港快速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('65', 'hre', '高铁速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('66', 'gda', '冠达快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('68', 'hl', '恒路物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('69', 'hlyex', '好来运快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('70', 'hxl', '华夏龙物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('72', 'hebeijianhua', '河北建华', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('73', 'haimengsudi', '海盟速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('74', 'huaqikuaiyun', '华企快运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('75', 'haosheng', '昊盛物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('76', 'hutongwuliu', '户通物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('77', 'hzpl', '华航快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('78', 'huangmajia', '黄马甲快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('79', 'ucs', '合众速递（UCS）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('80', 'hanrun', '韩润物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('81', 'pfcexpress', '皇家物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('82', 'huoban', '伙伴物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('83', 'nedahm', '红马速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('84', 'huiwen', '汇文配送', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('85', 'nmhuahe', '华赫物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('86', 'hjs', '猴急送', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('87', 'iparcel', 'i-parcel', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('88', 'jjwl', '佳吉物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('89', 'jywl', '佳怡物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('90', 'jymwl', '加运美快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('91', 'jxd', '急先达物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('92', 'jgsd', '京广速递快件', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('93', 'jykd', '晋越快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('94', 'jd', '京东快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('95', 'jietekuaidi', '捷特快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('96', 'jiuyicn', '久易快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('97', 'jiuyescm', '九曳供应链', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('98', 'junfengguoji', '骏丰国际速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('99', 'jiajiatong56', '佳家通货运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('100', 'jrypex', '吉日优派', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('101', 'kjkd', '快捷快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('102', 'kangliwuliu', '康力物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('103', 'kuayue', '跨越速运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('104', 'kuaiyouda', '快优达速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('105', 'kuaitao', '快淘快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('106', 'lianb', '联邦快递（国内）', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('107', 'lhtwl', '联昊通物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('108', 'lb', '龙邦速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('109', 'lejiedi', '乐捷递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('110', 'lijisong', '立即送', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('111', 'lanhukuaidi', '蓝弧快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('112', 'ltexp', '乐天速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('113', 'mh', '民航快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('114', 'meiguokuaidi', '美国快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('115', 'menduimen', '门对门', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('116', 'mingliangwuliu', '明亮物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('117', 'minbangsudi', '民邦速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('118', 'minshengkuaidi', '闽盛快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('119', 'mailikuaidi', '麦力快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('120', 'yundaexus', '美国韵达', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('121', 'ndkd', '能达速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('122', 'nuoyaao', '偌亚奥国际', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('123', 'pingandatengfei', '平安达腾飞', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('124', 'peixingwuliu', '陪行物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('125', 'qfkd', '全峰快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('126', 'qy', '全一快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('127', 'qrt', '全日通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('128', 'qckd', '全晨快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('129', 'sevendays', '7天连锁物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('130', 'qbexpress', '秦邦快运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('131', 'quanxintong', '全信通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('132', 'rufengda', '如风达快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('133', 'riyuwuliu', '日昱物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('134', 'rfsd', '瑞丰速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('135', 'rrs', '日日顺物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('136', 'st', '申通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('137', 'sf', '顺丰速运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('138', 'sewl', '速尔快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('139', 'haihongwangsong', '山东海红', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('140', 'sh', '盛辉物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('141', 'shiyunkuaidi', '世运快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('142', 'sfwl', '盛丰物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('143', 'shangda', '上大物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('144', 'stsd', '三态速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('145', 'saiaodi', '赛澳递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('146', 'ewl', '申通E物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('147', 'shenganwuliu', '圣安物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('148', 'sxhongmajia', '山西红马甲', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('149', 'suijiawuliu', '穗佳物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('150', 'syjiahuier', '沈阳佳惠尔', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('151', 'shlindao', '上海林道货运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('152', 'sfift', '十方通物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('154', 'shunjiefengda', '顺捷丰达', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('155', 'subida', '速必达物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('156', 'tnt', 'TNT快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('157', 'tt', '天天快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('158', 'tdhy', '天地华宇', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('159', 'tonghetianxia', '通和天下', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('160', 'tianzong', '天纵物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('161', 'chinatzx', '同舟行物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('162', 'nntengda', '腾达速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('163', 'sd138', '泰国138', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('164', 'ups', 'UPS快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('166', 'yskd', 'UC优速快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('167', 'usps', 'USPS美国邮政', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('168', 'wxwl', '万象物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('169', 'weitepai', '微特派', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('170', 'wjwl', '万家物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('171', 'wanboex', '万博快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('172', 'xiyoutekuaidi', '希优特快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('173', 'xbwl', '新邦物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('174', 'xfwl', '信丰物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('175', 'newegg', '新蛋物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('176', 'xianglongyuntong', '祥龙运通物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('177', 'xianchengliansudi', '西安城联速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('178', 'xilaikd', '西安喜来快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('179', 'xsrd', '鑫世锐达', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('180', 'xtb', '鑫通宝物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('181', 'xintianjie', '信天捷快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('182', 'xaetc', '西安胜峰', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('183', 'yt', '圆通速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('184', 'yd', '韵达快运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('185', 'ytkd', '运通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('187', 'yzgj', '邮政国际', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('188', 'ycwl', '远成物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('189', 'yfsd', '亚风速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('191', 'yishunhang', '亿顺航', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('192', 'yfwl', '越丰物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('193', 'yad', '源安达快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('194', 'yfh', '原飞航物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('195', 'ems', '邮政EMS速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('196', 'yinjiesudi', '银捷速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('197', 'yitongfeihong', '一统飞鸿', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('198', 'yuxinwuliu', '宇鑫物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('199', 'yitongda', '易通达', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('200', 'youbijia', '邮必佳', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('201', 'yiqiguojiwuliu', '一柒物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('202', 'yinsu', '音素快运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('203', 'yilingsuyun', '亿领速运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('204', 'yujiawuliu', '煜嘉物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('205', 'gml', '英脉物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('206', 'leopard', '云豹国际货运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('207', 'czwlyn', '云南中诚', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('208', 'sdyoupei', '优配速运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('209', 'yongchang', '永昌物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('210', 'zt', '中通快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('211', 'zjs', '宅急送', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('212', 'ztky', '中铁快运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('213', 'ztwl', '中铁物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('214', 'zywl', '中邮物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('216', 'zhimakaimen', '芝麻开门', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('217', 'yzgn', '中国邮政快递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('218', 'zhengzhoujianhua', '郑州建华', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('219', 'zhongsukuaidi', '中速快件', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('220', 'zhongtianwanyun', '中天万运', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('221', 'zhongruisudi', '中睿速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('222', 'zhongwaiyun', '中外运速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('223', 'zengyisudi', '增益速递', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('224', 'sujievip', '郑州速捷', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');
INSERT INTO `express` VALUES ('225', 'ztong', '智通物流', '', '2016-01-03 11:54:16', '0', '2016-01-03 11:54:16', '0');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `parentId` bigint(20) NOT NULL DEFAULT '0',
  `deleteFlag` bit(1) DEFAULT b'0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  `className` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_parentid_index` (`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '控制总台', 'javascript:void(0)', '0', '', '2016-01-06 16:17:52', '0', '2016-01-06 16:26:22', '0', 'fa fa-home');
INSERT INTO `menu` VALUES ('2', '物流处理中心', 'javascript:void(0)', '0', '', '2016-01-06 16:18:08', '0', '2016-01-06 16:26:22', '0', 'fa fa-th-list');
INSERT INTO `menu` VALUES ('3', '新建物流单', '/order/newOrder', '2', '', '2016-01-06 16:18:33', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('4', '物流列表明细', '/order/list', '2', '', '2016-01-06 16:18:53', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('5', '国内件处理中心', 'javascript:void(0)', '0', '', '2016-01-06 16:19:08', '0', '2016-01-06 16:26:22', '0', 'fa fa-th-list');
INSERT INTO `menu` VALUES ('6', '物流列表明细', 'javascript:void(0)', '5', '', '2016-01-06 16:19:27', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('7', '待受理件', 'javascript:void(0)', '5', '', '2016-01-06 16:19:50', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('8', '待妥投件', 'javascript:void(0)', '5', '', '2016-01-06 16:20:01', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('9', '国际直邮件处理中心', 'javascript:void(0)', '0', '', '2016-01-06 16:21:03', '0', '2016-01-06 16:26:22', '0', 'fa fa-th-list');
INSERT INTO `menu` VALUES ('10', '物流列表明细', 'javascript:void(0)', '9', '', '2016-01-06 16:21:47', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('11', '待受理件', 'javascript:void(0)', '9', '', '2016-01-06 16:22:09', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('12', '待妥投件', 'javascript:void(0)', '9', '', '2016-01-06 16:22:22', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('13', '中转仓处理中心', 'javascript:void(0)', '0', '', '2016-01-06 16:22:36', '0', '2016-01-06 16:26:22', '0', 'fa fa-th-list');
INSERT INTO `menu` VALUES ('14', '入库扫描', 'javascript:void(0)', '13', '', '2016-01-06 16:23:12', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('15', '中转仓储明细', 'javascript:void(0)', '13', '', '2016-01-06 16:23:38', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('16', '待中转件', 'javascript:void(0)', '13', '', '2016-01-06 16:23:45', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('17', 'Meida社区', 'javascript:void(0)', '0', '', '2016-01-06 16:24:10', '0', '2016-01-06 16:26:22', '0', 'fa fa-th-list');
INSERT INTO `menu` VALUES ('18', '联系我们', 'javascript:void(0)', '17', '', '2016-01-06 16:24:22', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('19', 'Meida社区', 'javascript:void(0)', '17', '', '2016-01-06 16:24:34', '0', '2016-01-06 16:26:22', '0', 'fa fa-caret-right');

-- ----------------------------
-- Table structure for `originalLogistic`
-- ----------------------------
DROP TABLE IF EXISTS `originalLogistic`;
CREATE TABLE `originalLogistic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '物流名称',
  `number` varchar(50) NOT NULL COMMENT '物流号',
  `weight` decimal(6,2) NOT NULL,
  `status` int(11) DEFAULT '0' COMMENT '处理状态 0待入库 1已入库 2已出仓',
  `receiver` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `remark` text,
  `orderId` bigint(20) NOT NULL,
  `deleteFlag` bit(1) DEFAULT b'0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `original_number_index` (`number`),
  KEY `original_order_index` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of originalLogistic
-- ----------------------------
INSERT INTO `originalLogistic` VALUES ('1', 'aolau', 'sdo092234', '1.10', '0', '刘镇', '18873942002', '测试地sd', '备注备注备注备注备注备注备注', '1', '', '2016-01-05 02:24:22', '18', '2016-01-05 06:38:50', '18');
INSERT INTO `originalLogistic` VALUES ('2', 'sf', 'utf4556576', '5.00', '0', '刘灿', '17588594434', '还是测试地址', '帮我发大箱', '1', '', '2016-01-05 02:28:42', '18', '2016-01-05 02:28:44', '18');
INSERT INTO `originalLogistic` VALUES ('3', 'htky', 'ht23343435', '7.00', '0', '李洋', '15187895543', '李洋地址', '', '1', '', '2016-01-05 02:33:49', '18', '2016-01-05 02:33:51', '18');
INSERT INTO `originalLogistic` VALUES ('4', 'htky', 'fdf34343', '2.00', '0', '李洋', '15187895543', '李洋地址2222222222', '', '1', '', '2016-01-05 02:41:34', '18', '2016-01-05 02:41:36', '18');
INSERT INTO `originalLogistic` VALUES ('5', 'xiaohongmao', 'sd454532', '4.00', '0', '刘镇', '18873942002', '刘镇地址', '', '1', '', '2016-01-05 02:46:13', '18', '2016-01-05 02:46:15', '18');
INSERT INTO `originalLogistic` VALUES ('6', 'xiaohongmao', 'sds3343423', '4.00', '0', '小明', '13233454432', '小明地址', '小明地址大件', '1', '', '2016-01-05 02:48:39', '18', '2016-01-05 02:48:41', '18');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL COMMENT '订单号',
  `type` int(11) NOT NULL COMMENT '1代理 2中转 3直达',
  `status` int(11) DEFAULT NULL COMMENT '0：预约待受理\r\n 1：发往中转仓 2：等待出仓中转 3：中转已完成 4：直达运输完成 -1：直达件',
  `acceptUser` bigint(20) NOT NULL DEFAULT '0' COMMENT '受理方',
  `acceptTime` bigint(13) DEFAULT NULL,
  `transitUser` bigint(20) NOT NULL DEFAULT '0' COMMENT '中转方',
  `remark` text,
  `totalWarehouse` int(11) DEFAULT '0' COMMENT '总件数',
  `waitInWarehouse` int(11) DEFAULT '0' COMMENT '等待入库',
  `waitExWarehouse` int(11) DEFAULT '0' COMMENT '等待出库',
  `exWarehouse` int(11) DEFAULT '0' COMMENT '已出库',
  `deleteFlag` bit(1) DEFAULT b'0',
  `ownerId` bigint(20) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number_index` (`number`),
  KEY `order_owner_index` (`ownerId`),
  KEY `order_accept_index` (`acceptUser`),
  KEY `order_transit_index` (`transitUser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', 'FIM160105015621610', '1', '1', '20', '1452083085176', '0', 'ssdd', '6', '6', '0', '0', '', '18', '2016-01-05 01:56:19', '18', '2016-01-06 20:22:10', '20');
INSERT INTO `tb_order` VALUES ('2', 'VVE160106060851664', '1', '-1', '0', null, '0', null, '0', '0', '0', '0', '', '18', '2016-01-06 18:08:50', '18', '2016-01-06 18:08:51', '18');

-- ----------------------------
-- Table structure for `transitLogistic`
-- ----------------------------
DROP TABLE IF EXISTS `transitLogistic`;
CREATE TABLE `transitLogistic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '物流名称',
  `number` varchar(50) NOT NULL COMMENT '物流号',
  `type` int(11) NOT NULL COMMENT '1拆包 2原装转发',
  `contactInfo` varchar(200) DEFAULT NULL,
  `weight` decimal(6,2) NOT NULL,
  `remark` text,
  `orderId` bigint(20) NOT NULL,
  `originalId` bigint(20) NOT NULL DEFAULT '0',
  `sendTime` bigint(13) DEFAULT NULL,
  `deleteFlag` bit(1) DEFAULT b'0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transit_number_index` (`number`),
  KEY `transit_order_index` (`orderId`),
  KEY `transit_original_index` (`originalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transitLogistic
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `openId` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `companyAddress` varchar(50) DEFAULT NULL,
  `deleteFlag` bit(1) DEFAULT b'0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `openId` (`openId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', 'liuzhen', '937687617@qq.com', '0c6d364ca2763d6a8d88d72da6c4f2491a9ebcc308edc146617eaa2ca5d89d4ea7a5dd6e3c56d8ea9334ff3009ec9dbf44b8683053d1b28ce1825d1cc5a54231', '1', '', null, null, '', '2016-01-03 21:38:38', '18', '2016-01-03 21:39:12', '18');
INSERT INTO `user` VALUES ('19', 'test', '22@qq.com', '2de53954a19cab71ec8b8cb31b07a541f5f556df88ced0098fdc5fedd6d8b6693c1e77e998cd36917df09f47eedca64e6d7a354525c588902c1fde57276a102c', '1', null, null, null, '', '2016-01-05 07:14:19', '18', '2016-01-03 21:39:12', '18');
INSERT INTO `user` VALUES ('20', 'test2', '222@qq.com', '3b1d26385a92b70fabd2b68204998c2c21ebbae83c3ce0e6475472bd7cf7e6f50d954c0f9910771579a5d59e7b98cdebd20acde33da6bf686688c03384d5a350', '1', null, null, null, '', '2016-01-05 07:14:57', '18', '2016-01-03 21:39:12', '18');

-- ----------------------------
-- Table structure for `userFriend`
-- ----------------------------
DROP TABLE IF EXISTS `userFriend`;
CREATE TABLE `userFriend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `friendId` bigint(20) NOT NULL,
  `deleteFlag` bit(1) DEFAULT b'0',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creater` bigint(20) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updater` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `friend_userid_index` (`userId`),
  KEY `friend_friendid_index` (`friendId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userFriend
-- ----------------------------
INSERT INTO `userFriend` VALUES ('1', '18', '19', '', '2016-01-05 07:17:01', '18', '2016-01-05 07:17:57', '18');
INSERT INTO `userFriend` VALUES ('2', '18', '20', '', '2016-01-05 07:17:15', '18', '2016-01-05 07:17:57', '18');
INSERT INTO `userFriend` VALUES ('3', '20', '19', '', '2016-01-06 20:24:28', '0', '2016-01-06 20:24:20', '18');
