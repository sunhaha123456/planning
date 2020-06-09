/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_planning

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-06-09 18:31:39
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '2018-06-23 18:11:17', '2019-01-31 15:30:12', '1', 'fa-folder', '用户管理', '0', '0', '1', '');
INSERT INTO `tb_menu` VALUES ('2', '2018-06-23 18:11:17', '2019-01-31 15:31:26', '2', 'fa-circle-o', '用户管理', '0', '1', '3', 'user/userManage/toUserManage');
INSERT INTO `tb_menu` VALUES ('3', '2018-06-23 18:11:17', '2019-01-31 15:31:32', '2', 'fa-circle-o', '角色管理', '0', '1', '2', 'user/roleManage/toRoleManage');
INSERT INTO `tb_menu` VALUES ('4', '2018-06-23 18:11:17', '2019-01-31 15:31:37', '2', 'fa-circle-o', '菜单管理', '0', '1', '1', 'user/menuManage/toMenuManage');
INSERT INTO `tb_menu` VALUES ('5', '2018-11-09 14:31:04', '2020-06-09 18:13:14', '1', 'fa-folder', '自助办公', '0', '0', '8', null);
INSERT INTO `tb_menu` VALUES ('6', '2018-11-09 14:48:29', '2020-05-24 16:01:59', '2', 'fa-circle-o', '我的首页', '0', '5', '4', 'user/menuManage/toMyIndexPage');
INSERT INTO `tb_menu` VALUES ('7', '2020-05-24 16:02:33', '2020-05-24 16:02:33', '2', 'fa-circle-o', '发起申请', '0', '5', '3', 'user/menuManage/toStartApplyPage');
INSERT INTO `tb_menu` VALUES ('8', '2020-05-24 16:03:06', '2020-05-24 16:03:06', '2', 'fa-circle-o', '我发出的申请', '0', '5', '2', 'user/menuManage/toSelfSendApplyPage');
INSERT INTO `tb_menu` VALUES ('9', '2020-05-24 16:03:43', '2020-05-24 16:03:43', '2', 'fa-circle-o', '我审批的申请', '0', '5', '1', 'user/menuManage/toSelfApprovalApplyPage');
INSERT INTO `tb_menu` VALUES ('10', '2020-05-24 16:04:13', '2020-06-09 18:13:21', '1', 'fa-folder', '公告管理', '0', '0', '7', null);
INSERT INTO `tb_menu` VALUES ('11', '2020-05-24 16:04:43', '2020-05-24 16:04:43', '2', 'fa-circle-o', '发布公告', '0', '10', '1', 'user/menuManage/toPublishNotice');
INSERT INTO `tb_menu` VALUES ('12', '2020-05-24 16:05:07', '2020-06-09 18:14:34', '1', 'fa-folder', '流程管理', '0', '0', '3', null);
INSERT INTO `tb_menu` VALUES ('13', '2020-05-24 16:05:36', '2020-05-24 16:05:36', '2', 'fa-circle-o', '流程模板', '0', '12', '2', 'user/menuManage/toFlowTemplate');
INSERT INTO `tb_menu` VALUES ('14', '2020-05-24 16:06:05', '2020-05-24 16:06:05', '2', 'fa-circle-o', '流程实例', '0', '12', '1', 'user/menuManage/toFlowInstance');
INSERT INTO `tb_menu` VALUES ('15', '2020-05-27 13:28:12', '2020-06-09 17:58:27', '1', 'fa-folder', '系统管理', '0', '0', '2', null);
INSERT INTO `tb_menu` VALUES ('16', '2020-05-27 13:28:59', '2020-05-27 13:29:06', '2', 'fa-circle-o', '系统设置', '0', '15', '1', 'user/menuManage/toSystemSetting');
INSERT INTO `tb_menu` VALUES ('17', '2020-06-09 18:11:27', '2020-06-09 18:13:34', '1', 'fa-folder', '人力资源', '0', '0', '6', null);
INSERT INTO `tb_menu` VALUES ('18', '2020-06-09 18:11:43', '2020-06-09 18:13:45', '1', 'fa-folder', '工资薪酬', '0', '0', '5', null);
INSERT INTO `tb_menu` VALUES ('19', '2020-06-09 18:12:45', '2020-06-09 18:14:26', '1', 'fa-folder', '财务报表', '0', '0', '4', null);
INSERT INTO `tb_menu` VALUES ('20', '2020-06-09 18:16:28', '2020-06-09 18:16:28', '2', 'fa-circle-o', '员工信息录入', '0', '17', '4', 'user/menuManage/toEmployerEntry');
INSERT INTO `tb_menu` VALUES ('21', '2020-06-09 18:16:58', '2020-06-09 18:20:51', '2', 'fa-circle-o', '薪酬岗位管理', '0', '17', '2', 'user/menuManage/toEmployerSalaryManage');
INSERT INTO `tb_menu` VALUES ('22', '2020-06-09 18:20:46', '2020-06-09 18:20:46', '2', 'fa-circle-o', '员工信息管理', '0', '17', '3', 'user/menuManage/toEmployerManage');
INSERT INTO `tb_menu` VALUES ('23', '2020-06-09 18:21:22', '2020-06-09 18:21:22', '2', 'fa-circle-o', '人事档案', '0', '17', '1', 'user/menuManage/toEmployerArchive');
INSERT INTO `tb_menu` VALUES ('24', '2020-06-09 18:23:00', '2020-06-09 18:23:00', '2', 'fa-circle-o', '员工信息查看', '0', '18', '3', 'user/menuManage/toEmployerSalaryInfo');
INSERT INTO `tb_menu` VALUES ('25', '2020-06-09 18:23:22', '2020-06-09 18:23:22', '2', 'fa-circle-o', '员工发薪录入', '0', '18', '2', 'user/menuManage/toEmployerSalaryPaidEntry');
INSERT INTO `tb_menu` VALUES ('26', '2020-06-09 18:24:08', '2020-06-09 18:24:08', '2', 'fa-circle-o', '员工发薪管理', '0', '18', '1', 'user/menuManage/toEmployerSalaryPaidManage');
INSERT INTO `tb_menu` VALUES ('27', '2020-06-09 18:24:54', '2020-06-09 18:24:54', '2', 'fa-circle-o', '公司收支录入', '0', '19', '3', 'user/menuManage/toFinanceInOutEntry');
INSERT INTO `tb_menu` VALUES ('28', '2020-06-09 18:25:19', '2020-06-09 18:25:19', '2', 'fa-circle-o', '公司收支管理', '0', '19', '2', 'user/menuManage/toFinanceInOutManage');
INSERT INTO `tb_menu` VALUES ('29', '2020-06-09 18:25:53', '2020-06-09 18:25:53', '2', 'fa-circle-o', '财务报表', '0', '19', '1', 'user/menuManage/toFinanceReport');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu_role_group_releation
-- ----------------------------
INSERT INTO `tb_menu_role_group_releation` VALUES ('37', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '1', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('38', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '2', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('39', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '3', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('40', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '4', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('41', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '5', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('42', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '6', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('43', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '7', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('44', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '8', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('45', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '9', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('46', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '10', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('47', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '11', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('48', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '12', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('49', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '13', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('50', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '14', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('51', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '15', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('52', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '16', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('53', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '17', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('54', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '20', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('55', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '22', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('56', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '21', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('57', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '23', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('58', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '18', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('59', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '24', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('60', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '25', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('61', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '26', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('62', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '19', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('63', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '27', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('64', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '28', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('65', '2020-06-09 18:26:06', '2020-06-09 18:26:06', '29', '1');

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
-- Table structure for tb_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_setting`;
CREATE TABLE `tb_system_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `system_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `system_key` varchar(255) DEFAULT NULL COMMENT '项',
  `system_value` varchar(255) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_setting
-- ----------------------------
INSERT INTO `tb_system_setting` VALUES ('1', '2020-05-24 15:42:35', '2020-06-09 17:57:38', '设置首页是否展示公告', 'indexPageNoticeShowFlag', 'true');
INSERT INTO `tb_system_setting` VALUES ('2', '2020-06-09 17:03:44', '2020-06-09 17:03:47', '设置公司收支时间截点', 'companyInOutLockTimeFlag', null);

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
