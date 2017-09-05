/*
Navicat MySQL Data Transfer

Source Server         : abcd
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : newcs

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2017-04-19 23:34:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `contents`
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '任务表的外键',
  `tid` int(10) NOT NULL COMMENT '用户表的外键',
  `picture` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cdate` date NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `taskinfo` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contents
-- ----------------------------

-- ----------------------------
-- Table structure for `taskinfo`
-- ----------------------------
DROP TABLE IF EXISTS `taskinfo`;
CREATE TABLE `taskinfo` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` float(8,2) NOT NULL,
  `number` int(20) DEFAULT NULL,
  `pic` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of taskinfo
-- ----------------------------
INSERT INTO taskinfo VALUES ('1', '七月与安生', '看电影', '2.00', '245', null);
INSERT INTO taskinfo VALUES ('2', '你给我听好', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('3', '群友斗地主', '玩游戏', '2.00', '969', null);
INSERT INTO taskinfo VALUES ('4', '荣耀', '听音乐', '2.00', '989', null);
INSERT INTO taskinfo VALUES ('5', '凉凉', '听音乐', '3.00', '1089', null);
INSERT INTO taskinfo VALUES ('6', '情书', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('7', '暗黑萌神', '玩游戏', '1.00', '91', null);
INSERT INTO taskinfo VALUES ('8', '闲来麻将', '玩游戏', '1.00', '401', null);
INSERT INTO taskinfo VALUES ('9', '速度与激情8', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('10', '暹罗之恋', '看电影', '2.00', '593', null);
INSERT INTO taskinfo VALUES ('11', '南方姑娘', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('12', '彩虹堂', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('13', '秘密', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('14', '窃听风云', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('15', '聚宝匯', '玩游戏', '1.00', '91', null);
INSERT INTO taskinfo VALUES ('16', '英雄联盟', '玩游戏', '1.00', '103', null);
INSERT INTO taskinfo VALUES ('17', '王者荣耀', '玩游戏', '5.00', '333', null);
INSERT INTO taskinfo VALUES ('18', '大话西游', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('19', '告白气球', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('20', '认真的雪', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('21', 'trouble-maker', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('22', '绅士', '听音乐', '1.00', '999', null);
INSERT INTO taskinfo VALUES ('23', '全齐霸业', '玩游戏', '5.00', '333', null);
INSERT INTO taskinfo VALUES ('24', '龙武2', '玩游戏', '5.00', '333', null);
INSERT INTO taskinfo VALUES ('25', '生化危机6', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('26', '行尸走肉7', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('27', '择天记', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('28', '择天记', '血战钢锯岭', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('29', '你的名字', '看电影', '4.00', '543', null);
INSERT INTO taskinfo VALUES ('30', '枪炮师', '玩游戏', '1.00', '321', null);
INSERT INTO taskinfo VALUES ('31', '魔术世界', '玩游戏', '1.00', '321', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 NOT NULL,
  `pwd` varchar(20) CHARACTER SET utf8 NOT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', '13207343359', 'a', '0');
INSERT INTO user VALUES ('2', '15307479947', 'de', '0');
INSERT INTO user VALUES ('3', '15307479948', '1', '0');
