/*
Navicat MySQL Data Transfer

Source Server         : abcd
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2017-04-19 23:31:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admininfo`
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(40) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aname` (`aname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO admininfo VALUES ('1', 'wer', '123456');
INSERT INTO admininfo VALUES ('2', 'asd', '111111');
INSERT INTO admininfo VALUES ('3', 'frr', '999999');
INSERT INTO admininfo VALUES ('4', 'rt', '12');
INSERT INTO admininfo VALUES ('5', 'de', '12');
INSERT INTO admininfo VALUES ('6', 'fr', 'q');

-- ----------------------------
-- Table structure for `contents`
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '任务表的外键',
  `tid` int(10) NOT NULL COMMENT '用户表的外键',
  `picture` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `price` varchar(20) NOT NULL,
  `cdate` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contents
-- ----------------------------

-- ----------------------------
-- Table structure for `goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO goodsinfo VALUES ('1', '好鱼', '2.00', '/pic/1488282349372_捕获.PNG', '1');
INSERT INTO goodsinfo VALUES ('2', '坏鱼', '1.00', '/pic/1488283485330_20150320044655149.jpg', '1');
INSERT INTO goodsinfo VALUES ('3', '大鱼', '39.00', '/pic/1488283577136_0vgrfcdumdg.jpg', '1');
INSERT INTO goodsinfo VALUES ('4', '大鱼', '89.00', '/pic/1488283909834_0vgrfcdumdg.jpg', '1');
INSERT INTO goodsinfo VALUES ('5', '小小鱼', '0.00', '/pic/1488283954496_0vgrfcdumdg.jpg,/pic/1488283954496_20150320044655149.jpg', '1');
INSERT INTO goodsinfo VALUES ('6', '荔枝', '40.00', '/pic/1488457364310_fish.gif', '3');
INSERT INTO goodsinfo VALUES ('7', 'ni', '2.00', '/pic/1492590491849_2017-03-23_163848.png', '2');

-- ----------------------------
-- Table structure for `goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(40) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `tname` (`tname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO goodstype VALUES ('1', '鱼', '0');
INSERT INTO goodstype VALUES ('2', '肉', '1');
INSERT INTO goodstype VALUES ('3', '水果', '1');

-- ----------------------------
-- Table structure for `taskinfo`
-- ----------------------------
DROP TABLE IF EXISTS `taskinfo`;
CREATE TABLE `taskinfo` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` float(8,2) NOT NULL,
  `number` int(20) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taskinfo
-- ----------------------------
INSERT INTO taskinfo VALUES ('1', '群友斗地主', '玩游戏', '2.00', '969');
INSERT INTO taskinfo VALUES ('2', '荣耀', '听音乐', '2.00', '989');
INSERT INTO taskinfo VALUES ('3', '凉凉', '听音乐', '3.00', '1089');
INSERT INTO taskinfo VALUES ('4', '南方姑娘', '听音乐', '1.00', '999');
INSERT INTO taskinfo VALUES ('5', '彩虹堂', '听音乐', '1.00', '999');
INSERT INTO taskinfo VALUES ('6', '窃听风云', '看电影', '4.00', '543');
INSERT INTO taskinfo VALUES ('7', '聚宝匯', '玩游戏', '1.00', '91');
INSERT INTO taskinfo VALUES ('8', '行尸走肉7', '看电影', '4.00', '543');
INSERT INTO taskinfo VALUES ('9', '择天记', '看电影', '4.00', '543');
INSERT INTO taskinfo VALUES ('10', '你的名字', '看电影', '4.00', '543');
