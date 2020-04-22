/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_planning

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-04-22 22:39:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_dimension
-- ----------------------------
DROP TABLE IF EXISTS `tb_dimension`;
CREATE TABLE `tb_dimension` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_type` tinyint(4) DEFAULT '0' COMMENT '维度类型',
  `dimension_level` int(11) DEFAULT '0' COMMENT '维度深度',
  `dimension_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` bigint(20) DEFAULT '0' COMMENT '父级id',
  `total_code` varchar(1000) DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_dimension
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance`;
CREATE TABLE `tb_flow_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `current_need_operate_instance_node_id` bigint(20) DEFAULT NULL COMMENT '当前需要操作的流程实例节点id',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '流程实例名称',
  `start_time` datetime DEFAULT NULL COMMENT '流程实例启动时间',
  `state` tinyint(4) DEFAULT '0' COMMENT '流程实例状态',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance_node
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_node`;
CREATE TABLE `tb_flow_instance_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  `instruction` varchar(255) DEFAULT NULL COMMENT '说明',
  `node_level` int(11) DEFAULT '1' COMMENT '节点级别',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `node_type` tinyint(4) DEFAULT '0' COMMENT '节点类型',
  `operate_type` tinyint(4) DEFAULT '0' COMMENT '执行方式',
  `pid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `total_code` varchar(1000) DEFAULT NULL COMMENT '节点编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_node
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance_node_form
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_node_form`;
CREATE TABLE `tb_flow_instance_node_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `form_id` bigint(20) DEFAULT NULL COMMENT '表单id',
  `instance_id` bigint(20) DEFAULT NULL COMMENT '流程id',
  `instance_node_id` bigint(20) DEFAULT NULL COMMENT '流程节点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_node_form
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance_node_user_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_node_user_task`;
CREATE TABLE `tb_flow_instance_node_user_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  `instance_node_id` bigint(20) DEFAULT NULL COMMENT '实例节点id',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_node_user_task
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_operate_history`;
CREATE TABLE `tb_flow_instance_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `instance_id` bigint(20) DEFAULT NULL COMMENT '流程实例id',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '流程实例名称',
  `instance_node_id` bigint(20) DEFAULT NULL COMMENT '流程实例节点id',
  `instance_node_name` varchar(255) DEFAULT NULL COMMENT '流程实例节点名称',
  `operate_info` varchar(500) DEFAULT NULL COMMENT '流程实例操作info',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_operate_history
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_template`;
CREATE TABLE `tb_flow_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `template_name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_template_node
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_template_node`;
CREATE TABLE `tb_flow_template_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `instruction` varchar(255) DEFAULT NULL COMMENT '说明',
  `node_level` int(11) DEFAULT '1' COMMENT '节点级别',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `node_type` tinyint(4) DEFAULT '0' COMMENT '节点类型',
  `operate_type` tinyint(4) DEFAULT '0' COMMENT '执行方式',
  `pid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `total_code` varchar(1000) DEFAULT NULL COMMENT '节点编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template_node
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_template_node_form
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_template_node_form`;
CREATE TABLE `tb_flow_template_node_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `form_id` bigint(20) DEFAULT NULL COMMENT '表单id',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `template_node_id` bigint(20) DEFAULT NULL COMMENT '模板节点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template_node_form
-- ----------------------------

-- ----------------------------
-- Table structure for tb_form_data
-- ----------------------------
DROP TABLE IF EXISTS `tb_form_data`;
CREATE TABLE `tb_form_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cell_content` varchar(255) DEFAULT NULL COMMENT '单元格内容',
  `form_id` bigint(20) DEFAULT NULL COMMENT '表单id',
  `gather_expression` varchar(1000) DEFAULT NULL COMMENT '聚集达式',
  `gather_flag` tinyint(4) DEFAULT '0' COMMENT '是否是聚集单元格',
  `x_index` int(11) DEFAULT '0' COMMENT 'x坐标',
  `y_index` int(11) DEFAULT '0' COMMENT 'y坐标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_form_data
-- ----------------------------

-- ----------------------------
-- Table structure for tb_form_definition
-- ----------------------------
DROP TABLE IF EXISTS `tb_form_definition`;
CREATE TABLE `tb_form_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `column_expression` varchar(1000) DEFAULT NULL COMMENT '列表达式',
  `row_expression` varchar(1000) DEFAULT NULL COMMENT '行表达式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_form_definition
-- ----------------------------

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dir_level` int(1) DEFAULT NULL COMMENT '目录深度',
  `icon_cls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单图标',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单名称',
  `menu_state` int(1) DEFAULT '0' COMMENT '菜单状态',
  `parent_id` int(20) DEFAULT NULL COMMENT '上级目录id',
  `sort` int(20) DEFAULT NULL COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '跳转链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '2018-06-23 18:11:17', '2019-01-31 15:30:12', '1', 'fa-folder', '用户管理', '0', '0', '1', '');
INSERT INTO `tb_menu` VALUES ('2', '2018-06-23 18:11:17', '2019-01-31 15:31:26', '2', 'fa-circle-o', '用户管理', '0', '1', '3', 'user/userManage/toUserManage');
INSERT INTO `tb_menu` VALUES ('3', '2018-06-23 18:11:17', '2019-01-31 15:31:32', '2', 'fa-circle-o', '角色管理', '0', '1', '2', 'user/roleManage/toRoleManage');
INSERT INTO `tb_menu` VALUES ('4', '2018-06-23 18:11:17', '2019-01-31 15:31:37', '2', 'fa-circle-o', '菜单管理', '0', '1', '1', 'user/menuManage/toMenuManage');
INSERT INTO `tb_menu` VALUES ('5', '2018-11-09 14:31:04', '2020-04-16 14:26:42', '1', 'fa-folder', '流程管理', '0', '0', '2', null);
INSERT INTO `tb_menu` VALUES ('6', '2018-11-09 14:48:29', '2020-04-20 11:41:20', '2', 'fa-circle-o', '流程模板', '0', '5', '2', 'user/menuManage/toFlowTemplate');
INSERT INTO `tb_menu` VALUES ('7', '2020-04-16 14:36:25', '2020-04-20 11:41:48', '2', 'fa-circle-o', '流程实例', '0', '5', '1', 'user/menuManage/toFlowInstance');
INSERT INTO `tb_menu` VALUES ('8', '2020-04-18 19:31:52', '2020-04-18 19:31:52', '1', 'fa-folder', '系统管理', '0', '0', '3', null);
INSERT INTO `tb_menu` VALUES ('9', '2020-04-18 19:32:25', '2020-04-20 11:25:54', '2', 'fa-circle-o', '维度管理', '0', '8', '3', 'user/menuManage/toDimensionManage');
INSERT INTO `tb_menu` VALUES ('10', '2020-04-18 19:32:56', '2020-04-20 11:39:32', '2', 'fa-circle-o', '表单管理', '0', '8', '2', 'user/menuManage/toFormManage');
INSERT INTO `tb_menu` VALUES ('11', '2020-04-18 19:33:35', '2020-04-20 11:40:30', '2', 'fa-circle-o', '系统设置', '0', '8', '1', 'user/menuManage/toSystemSet');
INSERT INTO `tb_menu` VALUES ('12', '2020-04-18 19:34:43', '2020-04-18 19:34:43', '1', 'fa-folder', '平台首页', '0', '0', '4', null);
INSERT INTO `tb_menu` VALUES ('13', '2020-04-18 19:35:10', '2020-04-20 11:38:46', '2', 'fa-circle-o', '平台首页', '0', '12', '1', 'user/menuManage/toPlatformIndexPage');

-- ----------------------------
-- Table structure for tb_menu_role_group_releation
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu_role_group_releation`;
CREATE TABLE `tb_menu_role_group_releation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `menu_id` int(20) DEFAULT NULL COMMENT '菜单id',
  `role_group_id` int(20) DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu_role_group_releation
-- ----------------------------
INSERT INTO `tb_menu_role_group_releation` VALUES ('18', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '1', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('19', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '2', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('20', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '3', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('21', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '4', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('22', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '5', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('23', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '6', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('24', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '7', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('25', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '8', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('26', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '9', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('27', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '10', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('28', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '11', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('29', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '12', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('30', '2020-04-18 19:35:29', '2020-04-18 19:35:29', '13', '1');

-- ----------------------------
-- Table structure for tb_role_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_group`;
CREATE TABLE `tb_role_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `role_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色备注',
  `role_state` int(1) DEFAULT '0' COMMENT '角色状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_role_group
-- ----------------------------
INSERT INTO `tb_role_group` VALUES ('1', '2018-07-24 11:51:57', '2018-08-26 13:55:34', '超级管理员', '超级管理员', '0');

-- ----------------------------
-- Table structure for tb_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_user`;
CREATE TABLE `tb_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_group_id` int(20) DEFAULT NULL COMMENT '角色组id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `upwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `user_state` int(1) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user
-- ----------------------------
INSERT INTO `tb_sys_user` VALUES ('1', '2018-07-24 15:35:24', '2018-09-03 09:42:52', '1', 'superAdmin', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('2', '2018-09-04 19:00:30', '2018-11-08 15:39:58', '1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('3', '2018-09-04 19:04:15', '2018-11-08 15:39:59', '1', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('4', '2018-09-04 19:06:35', '2018-11-08 15:40:01', '1', 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '0');

-- ----------------------------
-- Table structure for tb_sys_user_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_user_log`;
CREATE TABLE `tb_sys_user_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '参数',
  `ip` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `ret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '返回',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'url地址',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user_log
-- ----------------------------
