/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : seedapp2017dba

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2017-02-03 10:40:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `physical_quantity`
-- ----------------------------
DROP TABLE IF EXISTS `physical_quantity`;
CREATE TABLE `physical_quantity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `iso_unit_id` bigint(20) DEFAULT NULL,
  `quantity_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iffxi2ig0lqg7purmewhu5gmj` (`quantity_name`),
  KEY `FK_p71wwhk7luhg0b54uj1rf11le` (`iso_unit_id`),
  CONSTRAINT `FK_p71wwhk7luhg0b54uj1rf11le` FOREIGN KEY (`iso_unit_id`) REFERENCES `quantity_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of physical_quantity
-- ----------------------------
INSERT INTO `physical_quantity` VALUES ('1', '1', '质量', '1', 'Mass');
INSERT INTO `physical_quantity` VALUES ('2', '1', '长度', '2', 'Length');
INSERT INTO `physical_quantity` VALUES ('3', '1', '时间', '3', 'Time');
INSERT INTO `physical_quantity` VALUES ('4', '1', '力', '14', 'Force');
INSERT INTO `physical_quantity` VALUES ('5', '1', '速度', '15', 'Velocity');
INSERT INTO `physical_quantity` VALUES ('6', '1', '加速度', '16', 'Accelerated speed');
INSERT INTO `physical_quantity` VALUES ('7', '1', '面积', '17', 'Area');
INSERT INTO `physical_quantity` VALUES ('8', '1', '体积', '18', 'Volume');
INSERT INTO `physical_quantity` VALUES ('9', '2', '体积流量', '19', 'Flowrate');
INSERT INTO `physical_quantity` VALUES ('10', '1', '压力，压强', '20', 'Pressure');
INSERT INTO `physical_quantity` VALUES ('11', '1', '渗透率', '17', 'Permeability');
INSERT INTO `physical_quantity` VALUES ('12', '0', '温度', null, 'Temperature');
