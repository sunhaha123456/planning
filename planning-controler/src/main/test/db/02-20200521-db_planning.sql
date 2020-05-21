/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_planning

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-05-21 16:01:06
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '2018-06-23 18:11:17', '2019-01-31 15:30:12', '1', 'fa-folder', '用户管理', '0', '0', '1', '');
INSERT INTO `tb_menu` VALUES ('2', '2018-06-23 18:11:17', '2019-01-31 15:31:26', '2', 'fa-circle-o', '用户管理', '0', '1', '3', 'user/userManage/toUserManage');
INSERT INTO `tb_menu` VALUES ('3', '2018-06-23 18:11:17', '2019-01-31 15:31:32', '2', 'fa-circle-o', '角色管理', '0', '1', '2', 'user/roleManage/toRoleManage');
INSERT INTO `tb_menu` VALUES ('4', '2018-06-23 18:11:17', '2019-01-31 15:31:37', '2', 'fa-circle-o', '菜单管理', '0', '1', '1', 'user/menuManage/toMenuManage');
INSERT INTO `tb_menu` VALUES ('5', '2018-11-09 14:31:04', '2020-05-21 15:56:22', '1', 'fa-folder', '自助办公', '0', '0', '4', null);
INSERT INTO `tb_menu` VALUES ('6', '2018-11-09 14:48:29', '2020-05-21 15:44:16', '2', 'fa-circle-o', '我的首页', '0', '5', '4', 'user/menuManage/toMyIndexPage');
INSERT INTO `tb_menu` VALUES ('7', '2020-05-13 12:50:53', '2020-05-21 15:44:31', '2', 'fa-circle-o', '发起申请', '0', '5', '3', 'user/menuManage/toStartApplyPage');
INSERT INTO `tb_menu` VALUES ('8', '2020-05-13 12:51:11', '2020-05-21 15:55:02', '2', 'fa-circle-o', '我发出的申请', '0', '5', '2', 'user/menuManage/toSelfSendApplyPage');
INSERT INTO `tb_menu` VALUES ('9', '2020-05-13 12:52:21', '2020-05-13 13:14:00', '1', 'fa-folder', '流程管理', '0', '0', '2', null);
INSERT INTO `tb_menu` VALUES ('10', '2020-05-13 12:53:23', '2020-05-13 12:53:23', '2', 'fa-circle-o', '流程模板', '0', '9', '2', 'user/menuManage/toFlowTemplate');
INSERT INTO `tb_menu` VALUES ('11', '2020-05-13 12:53:49', '2020-05-13 12:54:10', '2', 'fa-circle-o', '流程实例', '0', '9', '1', 'user/menuManage/toFlowInstance');
INSERT INTO `tb_menu` VALUES ('12', '2020-05-21 15:55:32', '2020-05-21 15:55:32', '2', 'fa-circle-o', '我审批的申请', '0', '5', '1', 'user/menuManage/toSelfApprovalApplyPage');
INSERT INTO `tb_menu` VALUES ('13', '2020-05-21 15:56:51', '2020-05-21 15:56:51', '1', 'fa-folder', '公告管理', '0', '0', '3', null);
INSERT INTO `tb_menu` VALUES ('14', '2020-05-21 15:57:23', '2020-05-21 15:59:20', '2', 'fa-circle-o', '发布公告', '0', '13', '1', 'user/menuManage/toPublishNotice');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu_role_group_releation
-- ----------------------------
INSERT INTO `tb_menu_role_group_releation` VALUES ('34', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '1', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('35', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '2', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('36', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '3', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('37', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '4', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('38', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '5', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('39', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '6', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('40', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '7', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('41', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '8', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('42', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '12', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('43', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '9', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('44', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '10', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('45', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '11', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('46', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '13', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('47', '2020-05-21 15:59:34', '2020-05-21 15:59:35', '14', '1');

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
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录用户名',
  `role_group_id` bigint(20) DEFAULT NULL COMMENT '角色组id',
  `upwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `user_state` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user
-- ----------------------------
INSERT INTO `tb_sys_user` VALUES ('1', '2020-05-01 15:37:13', '2020-05-01 15:37:27', 'superAdmin', '1', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', '0');

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