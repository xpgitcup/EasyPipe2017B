/*
Navicat MySQL Data Transfer

Source Server         : 10.1.16.50
Source Server Version : 50627
Source Host           : 10.1.16.50:3306
Source Database       : pipelinesimulationdb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-02-02 10:22:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `unit_system`
-- ----------------------------
DROP TABLE IF EXISTS `unit_system`;
CREATE TABLE `unit_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c5ddp21vkngicwlunxt15bxax` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit_system
-- ----------------------------
INSERT INTO `unit_system` VALUES ('1', '0', '国际单位制', 'ISO');
INSERT INTO `unit_system` VALUES ('2', '0', '英制单位', 'English');
INSERT INTO `unit_system` VALUES ('3', '0', '自定义', 'User');
