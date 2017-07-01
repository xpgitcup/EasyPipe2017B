/*
Navicat MySQL Data Transfer

Source Server         : 10.1.16.50
Source Server Version : 50627
Source Host           : 10.1.16.50:3306
Source Database       : pipelinesimulationdb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-02-02 10:22:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `quantity_unit`
-- ----------------------------
DROP TABLE IF EXISTS `quantity_unit`;
CREATE TABLE `quantity_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `factora` double NOT NULL,
  `factorb` double NOT NULL,
  `label` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `physical_quantity_id` bigint(20) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `unit_system_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ci4q57gmqf45pue6iloo00mb4` (`unit_name`),
  KEY `FK_nml47x4spwo5jgbnen3sbsj3m` (`physical_quantity_id`),
  KEY `FK_borblkl2li0d7vrharyoktj6p` (`unit_system_id`),
  CONSTRAINT `FK_borblkl2li0d7vrharyoktj6p` FOREIGN KEY (`unit_system_id`) REFERENCES `unit_system` (`id`),
  CONSTRAINT `FK_nml47x4spwo5jgbnen3sbsj3m` FOREIGN KEY (`physical_quantity_id`) REFERENCES `physical_quantity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quantity_unit
-- ----------------------------
INSERT INTO `quantity_unit` VALUES ('1', '0', '千克', '1', '0', 'kg', '千克', '1', 'kilogram', '1');
INSERT INTO `quantity_unit` VALUES ('2', '1', '米', '1', '0', 'm', '米', '2', 'meter', '1');
INSERT INTO `quantity_unit` VALUES ('3', '0', '秒', '1', '0', 's', '秒', '3', 'second', '1');
INSERT INTO `quantity_unit` VALUES ('4', '0', '质量单位，克', '0.001', '0', 'g', '克', '1', 'gram', '1');
INSERT INTO `quantity_unit` VALUES ('5', '0', '质量单位，吨', '1000', '0', 't', '吨', '1', 'ton', '1');
INSERT INTO `quantity_unit` VALUES ('6', '0', '质量单位，毫克', '0.000001', '0', 'mg', '毫克', '1', 'milligram', '1');
INSERT INTO `quantity_unit` VALUES ('7', '0', '长度单位，公里（千米）', '1000', '0', 'km', '千米', '2', 'kilometer', '1');
INSERT INTO `quantity_unit` VALUES ('8', '0', '长度单位，分米', '0.1', '0', 'dm', '分米', '2', 'decimeter', '1');
INSERT INTO `quantity_unit` VALUES ('9', '0', '长度单位，厘米', '0.01', '0', 'cm', '厘米', '2', 'centimeter', '1');
INSERT INTO `quantity_unit` VALUES ('10', '0', '长度单位，毫米', '0.001', '0', 'mm', '毫米', '2', 'millimeter', '1');
INSERT INTO `quantity_unit` VALUES ('11', '0', '时间单位，毫秒', '0.001', '0', 'ms', '毫秒', '3', 'millisecond', '1');
INSERT INTO `quantity_unit` VALUES ('12', '1', '时间单位，分钟', '60', '0', 'min', '分钟', '3', 'minute', '1');
INSERT INTO `quantity_unit` VALUES ('13', '0', '时间单位，小时', '3600', '0', 'h', '小时', '3', 'hour', '1');
INSERT INTO `quantity_unit` VALUES ('14', '0', '力的标准单位，牛顿', '1', '0', 'N', '牛顿', '4', 'newton', '1');
INSERT INTO `quantity_unit` VALUES ('15', '0', '速度单位，米每秒', '1', '0', 'm/s', '米/秒', '5', 'meter per second', '1');
INSERT INTO `quantity_unit` VALUES ('16', '0', '加速度单位，米每平方秒', '1', '0', 'm/s^2', '米每秒平方', '6', 'meters per second square', '1');
INSERT INTO `quantity_unit` VALUES ('17', '0', '面积标准单位，平方米', '1', '0', 'm^2', '平方米', '7', 'square meter', '1');
INSERT INTO `quantity_unit` VALUES ('18', '0', '体积标准单位，立方米', '1', '0', 'm^3', '立方米', '8', 'cubic metre', '1');
INSERT INTO `quantity_unit` VALUES ('19', '0', '体积流量标准单位，立方米每秒', '1', '0', 'm^3/s', '立方米每秒', '9', 'cubic metre per second', '1');
INSERT INTO `quantity_unit` VALUES ('20', '0', '压力标准单位，帕斯卡', '1', '0', 'Pa', '帕斯卡', '10', 'pascal', '1');
INSERT INTO `quantity_unit` VALUES ('21', '0', '热力学温度', '1', '0', 'K', '开尔文', '1', 'Kelvin', '1');
