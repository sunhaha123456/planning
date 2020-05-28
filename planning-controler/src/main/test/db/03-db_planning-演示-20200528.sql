/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_planning

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-05-28 10:01:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_flow_instance
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance`;
CREATE TABLE `tb_flow_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `apply_content` varchar(800) DEFAULT NULL COMMENT '发起申请的内容',
  `handing_instance_node_ids` varchar(255) DEFAULT NULL COMMENT '当前正在处理的流程实例节点id',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '流程实例名称',
  `start_time` datetime DEFAULT NULL COMMENT '流程实例启动时间',
  `start_user_id` bigint(20) DEFAULT NULL COMMENT '流程启动用户',
  `state` tinyint(4) DEFAULT '0' COMMENT '流程实例状态',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance_file
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_file`;
CREATE TABLE `tb_flow_instance_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小，单位B',
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  `new_file_name` varchar(255) DEFAULT NULL COMMENT '文件新名称',
  `old_file_name` varchar(255) DEFAULT NULL COMMENT '文件原名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_file
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
  `node_level` int(11) DEFAULT '0' COMMENT '节点级别',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `operate_type` tinyint(4) DEFAULT '0' COMMENT '执行方式',
  `pid` bigint(20) DEFAULT '0' COMMENT '父节点id',
  `state` tinyint(4) DEFAULT '0' COMMENT '流程节点状态',
  `template_node_id` bigint(20) DEFAULT NULL COMMENT '模板节点id',
  `total_code` varchar(1000) DEFAULT NULL COMMENT '节点编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_node
-- ----------------------------

-- ----------------------------
-- Table structure for tb_flow_instance_node_user_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_node_user_task`;
CREATE TABLE `tb_flow_instance_node_user_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approval_content` varchar(800) DEFAULT NULL COMMENT '审批内容',
  `approval_type` tinyint(4) DEFAULT '0' COMMENT '审批类型',
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
  `instance_name` varchar(255) DEFAULT NULL COMMENT '流程名称',
  `instance_node_id` bigint(20) DEFAULT NULL COMMENT '流程实例节点id',
  `instance_node_name` varchar(255) DEFAULT NULL COMMENT '流程节点名称',
  `operate_info` varchar(500) DEFAULT NULL COMMENT '流程实例操作info',
  `operate_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户id',
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
  `status` tinyint(4) DEFAULT '1' COMMENT '模板状态',
  `template_name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template
-- ----------------------------
INSERT INTO `tb_flow_template` VALUES ('2', '2020-05-27 15:38:31', '2020-05-27 15:38:31', '1', '请假审批');
INSERT INTO `tb_flow_template` VALUES ('3', '2020-05-27 15:38:54', '2020-05-27 15:38:54', '1', '采购审批');
INSERT INTO `tb_flow_template` VALUES ('4', '2020-05-27 15:39:11', '2020-05-27 15:39:11', '1', '离职审批');

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
-- Table structure for tb_flow_template_node_user_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_template_node_user_task`;
CREATE TABLE `tb_flow_template_node_user_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `template_node_id` bigint(20) DEFAULT NULL COMMENT '模板节点id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template_node_user_task
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '2018-06-23 18:11:17', '2019-01-31 15:30:12', '1', 'fa-folder', '用户管理', '0', '0', '1', '');
INSERT INTO `tb_menu` VALUES ('2', '2018-06-23 18:11:17', '2019-01-31 15:31:26', '2', 'fa-circle-o', '用户管理', '0', '1', '3', 'user/userManage/toUserManage');
INSERT INTO `tb_menu` VALUES ('3', '2018-06-23 18:11:17', '2019-01-31 15:31:32', '2', 'fa-circle-o', '角色管理', '0', '1', '2', 'user/roleManage/toRoleManage');
INSERT INTO `tb_menu` VALUES ('4', '2018-06-23 18:11:17', '2019-01-31 15:31:37', '2', 'fa-circle-o', '菜单管理', '0', '1', '1', 'user/menuManage/toMenuManage');
INSERT INTO `tb_menu` VALUES ('5', '2018-11-09 14:31:04', '2020-05-27 13:27:43', '1', 'fa-folder', '自助办公', '0', '0', '5', null);
INSERT INTO `tb_menu` VALUES ('6', '2018-11-09 14:48:29', '2020-05-24 16:01:59', '2', 'fa-circle-o', '我的首页', '0', '5', '4', 'user/menuManage/toMyIndexPage');
INSERT INTO `tb_menu` VALUES ('7', '2020-05-24 16:02:33', '2020-05-24 16:02:33', '2', 'fa-circle-o', '发起申请', '0', '5', '3', 'user/menuManage/toStartApplyPage');
INSERT INTO `tb_menu` VALUES ('8', '2020-05-24 16:03:06', '2020-05-24 16:03:06', '2', 'fa-circle-o', '我发出的申请', '0', '5', '2', 'user/menuManage/toSelfSendApplyPage');
INSERT INTO `tb_menu` VALUES ('9', '2020-05-24 16:03:43', '2020-05-24 16:03:43', '2', 'fa-circle-o', '我审批的申请', '0', '5', '1', 'user/menuManage/toSelfApprovalApplyPage');
INSERT INTO `tb_menu` VALUES ('10', '2020-05-24 16:04:13', '2020-05-27 13:27:49', '1', 'fa-folder', '公告管理', '0', '0', '4', null);
INSERT INTO `tb_menu` VALUES ('11', '2020-05-24 16:04:43', '2020-05-24 16:04:43', '2', 'fa-circle-o', '发布公告', '0', '10', '1', 'user/menuManage/toPublishNotice');
INSERT INTO `tb_menu` VALUES ('12', '2020-05-24 16:05:07', '2020-05-27 13:27:53', '1', 'fa-circle-o', '流程管理', '0', '0', '3', null);
INSERT INTO `tb_menu` VALUES ('13', '2020-05-24 16:05:36', '2020-05-24 16:05:36', '2', 'fa-circle-o', '流程模板', '0', '12', '2', 'user/menuManage/toFlowTemplate');
INSERT INTO `tb_menu` VALUES ('14', '2020-05-24 16:06:05', '2020-05-24 16:06:05', '2', 'fa-circle-o', '流程实例', '0', '12', '1', 'user/menuManage/toFlowInstance');
INSERT INTO `tb_menu` VALUES ('15', '2020-05-27 13:28:12', '2020-05-27 13:28:12', '1', 'fa-circle-o', '系统管理', '0', '0', '2', null);
INSERT INTO `tb_menu` VALUES ('16', '2020-05-27 13:28:59', '2020-05-27 13:29:06', '2', 'fa-circle-o', '系统设置', '0', '15', '1', 'user/menuManage/toSystemSetting');

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_menu_role_group_releation
-- ----------------------------
INSERT INTO `tb_menu_role_group_releation` VALUES ('21', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '1', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('22', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '2', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('23', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '3', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('24', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '4', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('25', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '5', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('26', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '6', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('27', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '7', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('28', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '8', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('29', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '9', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('30', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '10', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('31', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '11', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('32', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '12', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('33', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '13', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('34', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '14', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('35', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '15', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('36', '2020-05-27 13:29:13', '2020-05-27 13:29:13', '16', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('37', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '5', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('38', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '6', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('39', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '7', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('40', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '8', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('41', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '9', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('42', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '12', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('43', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '13', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('44', '2020-05-27 16:06:22', '2020-05-27 16:06:22', '14', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('45', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '5', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('46', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '6', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('47', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '7', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('48', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '8', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('49', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '9', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('50', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '10', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('51', '2020-05-27 16:06:53', '2020-05-27 16:06:53', '11', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('52', '2020-05-27 16:07:04', '2020-05-27 16:07:04', '5', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('53', '2020-05-27 16:07:04', '2020-05-27 16:07:04', '6', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('54', '2020-05-27 16:07:04', '2020-05-27 16:07:04', '7', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('55', '2020-05-27 16:07:04', '2020-05-27 16:07:04', '8', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('56', '2020-05-27 16:07:04', '2020-05-27 16:07:04', '9', '5');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text COMMENT '内容',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT '0' COMMENT '公告状态',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('1', '2020-05-27 11:53:13', '2020-05-27 12:14:25', '    新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '3', '1', '建议加强保护母语 调整高考语文比重');
INSERT INTO `tb_notice` VALUES ('2', '2020-05-27 11:56:19', '2020-05-27 12:14:20', '    新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '4', '1', '云游湖北，揭开宜昌、蕲春、大别山、潜江“宝藏”面纱');
INSERT INTO `tb_notice` VALUES ('3', '2020-05-27 11:57:53', '2020-05-27 19:06:04', '    新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '0', '0', '连花清瘟临床数据披露：钟南山领衔，促治愈但转阴作用不大');
INSERT INTO `tb_notice` VALUES ('4', '2020-05-27 11:58:44', '2020-05-27 12:14:33', '    新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '2', '1', '巅峰见证：2020珠峰高程登顶成功');
INSERT INTO `tb_notice` VALUES ('5', '2020-05-27 11:59:28', '2020-05-27 12:14:38', '    新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '1', '1', '为什么非要人力给珠峰测身高');
INSERT INTO `tb_notice` VALUES ('6', '2020-05-27 12:00:08', '2020-05-27 12:14:46', '        新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '0', '1', '建议将颈椎病认定为职业病');
INSERT INTO `tb_notice` VALUES ('7', '2020-05-27 12:01:09', '2020-05-27 18:11:28', '    新华社北京5月26日电（记者赵琬微、胡璐）2020年全国两会期间，如何进一步规范语言文字使用，增强公民的国家认同受到关注。全国人大代表、中共北京市委副秘书长唐海龙建议，可适时修改国家通用语言文字法，突出普通话、规范汉字在国家语言生活中的主体地位。同时增强高考、中考中语文分数比重，突出母语应有的优势地位。\n\n    他认为，目前国家通用语言文字工作存在一些困境：权威性小、惩罚力弱、规范性难以落实；网络语言和广告语言滥用外文、生造汉字汉语现象凸显；部分偏远地区国家通用语言文字学习和使用的条件不满足，普及程度不高；部分方言地区普通话和规范汉字的使用存在困难；部分港台青年对祖国文化疏远淡漠等。\n\n    此前，国家通用语言文字法最高处罚限于“警告”。从多年实践看，说服教育、警告不足以形成威慑，执法主体不明确，相关部门职责不明晰，缺乏国家强制力作为实施保障。\n\n    他建议，适时修改国家通用语言文字法，明显突出普通话、规范汉字在国家语言生活中的主体地位，是每个公民的权利与义务。同时与时俱进，统筹推进修改刑法、民族区域自治法、香港特别行政区基本法、澳门特别行政区基本法相关条款，全面突出包括普通话、规范汉字在内的国家通用语言文字的主体地位。\n\n   “法国、意大利、德国、挪威、俄罗斯、以色列、韩国等都制定法律或政策保护母语，抵御强势的英语入侵。”他说，修改国家通用语言文字法后，各部门可适时调整，加强保护母语，不宜过度突出外语。\n\n     如教育部门可针对高考、中考的语文、英语分数权重做出调整，突出母语应有的优势和地位。以部分城市为例，2020年北京高考语文、英语总分均为150分，中考均为100分；上海高考、中考均为150分；深圳高考均为150分，中考均为100分。建议调整后，高考、中考的语文总分，比英语和其他外语总分至少提高20%，以保护母语优势地位。（完）', '5', '1', '美丽青岛');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_role_group
-- ----------------------------
INSERT INTO `tb_role_group` VALUES ('1', '2018-07-24 11:51:57', '2020-05-27 16:03:24', '公司管理员', '整个系统的管理员', '0');
INSERT INTO `tb_role_group` VALUES ('2', '2020-05-27 15:44:41', '2020-05-27 16:04:27', '公司流程管理员', '负责流程管理', '0');
INSERT INTO `tb_role_group` VALUES ('3', '2020-05-27 15:46:37', '2020-05-27 16:04:47', '公司公告管理员', '负责公司公告管理', '0');
INSERT INTO `tb_role_group` VALUES ('5', '2020-05-27 16:05:48', '2020-05-27 16:05:48', '公司普通员工', '无管理权限员工', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_setting
-- ----------------------------
INSERT INTO `tb_system_setting` VALUES ('1', '2020-05-24 15:42:35', '2020-05-27 15:37:22', '用于首页是否展示公告标志', 'indexPageNoticeShowFlag', 'true');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user_log
-- ----------------------------
INSERT INTO `tb_sys_user_log` VALUES ('1', '2020-05-27 15:37:22', '2020-05-27 15:37:22', 0x5B2274727565225D, '127.0.0.1', 0x6E756C6C, '/planning/user/systemSetting/updateIndexPageShowNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('2', '2020-05-27 15:37:58', '2020-05-27 15:37:58', 0x5B7B226964223A312C2263726561746544617465223A22323032302D30352D32372031353A33373A3538222C226C6173744D6F646966696564223A22323032302D30352D32372031353A33373A3538222C2274656D706C6174654E616D65223A22E8AFB7E58187E5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D312C20637265617465446174653D576564204D61792032372031353A33373A353820474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204D61792032372031353A33373A353820474D542B30383A30302032303230292C2074656D706C6174654E616D653DE8AFB7E58187E5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('3', '2020-05-27 15:38:06', '2020-05-27 15:38:06', 0x5B312C325D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '1');
INSERT INTO `tb_sys_user_log` VALUES ('4', '2020-05-27 15:38:31', '2020-05-27 15:38:31', 0x5B7B226964223A322C2263726561746544617465223A22323032302D30352D32372031353A33383A3331222C226C6173744D6F646966696564223A22323032302D30352D32372031353A33383A3331222C2274656D706C6174654E616D65223A22E8AFB7E58187E5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D322C20637265617465446174653D576564204D61792032372031353A33383A333120474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204D61792032372031353A33383A333120474D542B30383A30302032303230292C2074656D706C6174654E616D653DE8AFB7E58187E5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('5', '2020-05-27 15:38:54', '2020-05-27 15:38:54', 0x5B7B226964223A332C2263726561746544617465223A22323032302D30352D32372031353A33383A3534222C226C6173744D6F646966696564223A22323032302D30352D32372031353A33383A3534222C2274656D706C6174654E616D65223A22E98787E8B4ADE5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D332C20637265617465446174653D576564204D61792032372031353A33383A353420474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204D61792032372031353A33383A353420474D542B30383A30302032303230292C2074656D706C6174654E616D653DE98787E8B4ADE5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('6', '2020-05-27 15:39:11', '2020-05-27 15:39:11', 0x5B7B226964223A342C2263726561746544617465223A22323032302D30352D32372031353A33393A3131222C226C6173744D6F646966696564223A22323032302D30352D32372031353A33393A3131222C2274656D706C6174654E616D65223A22E7A6BBE8818CE5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D342C20637265617465446174653D576564204D61792032372031353A33393A313120474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204D61792032372031353A33393A313120474D542B30383A30302032303230292C2074656D706C6174654E616D653DE7A6BBE8818CE5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('7', '2020-05-27 15:44:41', '2020-05-27 15:44:41', 0x5B22E585ACE58FB8E7AEA1E79086E59198222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('8', '2020-05-27 15:45:43', '2020-05-27 15:45:43', 0x5B322C22E699AEE9809AE7AEA1E79086E59198222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('9', '2020-05-27 15:46:37', '2020-05-27 15:46:37', 0x5B22E585ACE58FB8E59198E5B7A5222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('10', '2020-05-27 15:47:01', '2020-05-27 15:47:01', 0x5B332C22E699AEE9809AE59198E5B7A5222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('11', '2020-05-27 15:47:19', '2020-05-27 15:47:19', 0x5B22E7BC96E8BE91E983A8222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('12', '2020-05-27 15:47:34', '2020-05-27 15:47:34', 0x5B332C22E585ACE58FB8E59198E5B7A5222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('13', '2020-05-27 15:48:55', '2020-05-27 15:48:55', 0x5B342C22E585ACE58FB8E585ACE5918AE7AEA1E79086E59198222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('14', '2020-05-27 15:50:00', '2020-05-27 15:50:00', 0x5B322C22E585ACE58FB8E7AEA1E79086E59198222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('15', '2020-05-27 15:53:07', '2020-05-27 15:53:07', 0x5B312C22E8B685E7BAA7E7AEA1E79086E59198222C22E7B3BBE7BB9FE8B685E7BAA7E7AEA1E79086E59198225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('16', '2020-05-27 15:53:34', '2020-05-27 15:53:34', 0x5B342C22E585ACE58FB8E585ACE5918AE7AEA1E79086E5919831222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('17', '2020-05-27 15:53:59', '2020-05-27 15:53:59', 0x5B332C22E585ACE58FB8E585ACE5918AE7AEA1E79086E59198222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('18', '2020-05-27 15:54:11', '2020-05-27 15:54:11', 0x5B342C22E585ACE58FB8E59198E5B7A5222C22225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('19', '2020-05-27 15:55:28', '2020-05-27 15:55:28', 0x5B332C22E585ACE58FB8E585ACE5918AE7AEA1E79086E59198222C22E7AEA1E79086E585ACE58FB8E585ACE5918A225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('20', '2020-05-27 15:55:49', '2020-05-27 15:55:49', 0x5B322C22E585ACE58FB8E7AEA1E79086E59198222C22E585ACE58FB8E7BAA7E588ABE79A84E7AEA1E79086E59198225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('21', '2020-05-27 15:56:26', '2020-05-27 15:56:26', 0x5B342C22E585ACE58FB8E59198E5B7A5222C22E697A0E7AEA1E79086E69D83E99990E79A84E585ACE58FB8E59198E5B7A5225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('22', '2020-05-27 16:02:35', '2020-05-27 16:02:35', 0x5B322C22E585ACE58FB8E7AEA1E79086E5919831222C22E585ACE58FB8E7BAA7E588ABE79A84E7AEA1E79086E59198225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('23', '2020-05-27 16:02:40', '2020-05-27 16:02:40', 0x5B332C22E585ACE58FB8E585ACE5918AE7AEA1E79086E5919831222C22E7AEA1E79086E585ACE58FB8E585ACE5918A225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('24', '2020-05-27 16:02:55', '2020-05-27 16:02:55', 0x5B312C22E585ACE58FB8E7AEA1E79086E59198222C22E7B3BBE7BB9FE8B685E7BAA7E7AEA1E79086E59198225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('25', '2020-05-27 16:03:24', '2020-05-27 16:03:24', 0x5B312C22E585ACE58FB8E7AEA1E79086E59198222C22E695B4E4B8AAE7B3BBE7BB9FE79A84E7AEA1E79086E59198225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('26', '2020-05-27 16:04:27', '2020-05-27 16:04:27', 0x5B322C22E585ACE58FB8E6B581E7A88BE7AEA1E79086E59198222C22E8B49FE8B4A3E6B581E7A88BE7AEA1E79086225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('27', '2020-05-27 16:04:47', '2020-05-27 16:04:47', 0x5B332C22E585ACE58FB8E585ACE5918AE7AEA1E79086E59198222C22E8B49FE8B4A3E585ACE58FB8E585ACE5918AE7AEA1E79086225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/update', '1');
INSERT INTO `tb_sys_user_log` VALUES ('28', '2020-05-27 16:05:48', '2020-05-27 16:05:48', 0x5B22E585ACE58FB8E699AEE9809AE59198E5B7A5222C22E697A0E7AEA1E79086E69D83E99990E59198E5B7A5225D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('29', '2020-05-27 16:06:22', '2020-05-27 16:06:22', 0x5B7B22726F6C6547726F75704964223A322C226D656E75496473223A5B352C362C372C382C392C31322C31332C31345D7D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/menuSave', '1');
INSERT INTO `tb_sys_user_log` VALUES ('30', '2020-05-27 16:06:53', '2020-05-27 16:06:53', 0x5B7B22726F6C6547726F75704964223A332C226D656E75496473223A5B352C362C372C382C392C31302C31315D7D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/menuSave', '1');
INSERT INTO `tb_sys_user_log` VALUES ('31', '2020-05-27 16:07:04', '2020-05-27 16:07:04', 0x5B7B22726F6C6547726F75704964223A352C226D656E75496473223A5B352C362C372C382C395D7D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/menuSave', '1');
INSERT INTO `tb_sys_user_log` VALUES ('32', '2020-05-27 17:09:40', '2020-05-27 17:09:40', 0x5B7B226964223A372C2263726561746544617465223A22323032302D30352D32372031323A30313A3039222C226C6173744D6F646966696564223A22323032302D30352D32372031373A30393A3430222C227469746C65223A22E7BE8EE4B8BDE99D92E5B29B222C22636F6E74656E74223A2220202020E696B0E58D8EE7A4BEE58C97E4BAAC35E69C883236E697A5E794B5EFBC88E8AEB0E88085E8B5B5E790ACE5BEAEE38081E883A1E79290EFBC8932303230E5B9B4E585A8E59BBDE4B8A4E4BC9AE69C9FE997B4EFBC8CE5A682E4BD95E8BF9BE4B880E6ADA5E8A784E88C83E8AFADE8A880E69687E5AD97E4BDBFE794A8EFBC8CE5A29EE5BCBAE585ACE6B091E79A845C6EE59BBDE5AEB6E8AEA4E5908CE58F97E588B0E585B3E6B3A8E38082E585A8E59BBDE4BABAE5A4A7E4BBA3E8A1A8E38081E4B8ADE585B1E58C97E4BAACE5B882E5A794E589AFE7A798E4B9A6E995BFE59490E6B5B7E9BE99E5BBBAE8AEAEEFBC8CE58FAFE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE7AA81E587BAE699AE5C6EE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DE38082E5908CE697B6E5A29EE5BCBAE9AB98E88083E38081E4B8ADE88083E4B8ADE8AFADE69687E58886E695B0E6AF94E9878DEFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE59CB0E4BD8DE380825C6E20202020E4BB96E8AEA4E4B8BAEFBC8CE79BAEE5898DE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5B7A5E4BD9CE5AD98E59CA8E4B880E4BA9BE59BB0E5A283EFBC9AE69D83E5A881E680A7E5B08FE38081E683A9E7BD9AE58A9BE5BCB1E38081E8A784E88C83E680A7E99ABEE4BBA5E890BDE5AE9EEFBC9BE7BD91E7BB9CE8AFADE8A880E5928CE5B9BFE5918A5C6EE8AFADE8A880E6BBA5E794A8E5A496E69687E38081E7949FE980A0E6B189E5AD97E6B189E8AFADE78EB0E8B1A1E587B8E698BEEFBC9BE983A8E58886E5818FE8BF9CE59CB0E58CBAE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5ADA6E4B9A0E5928CE4BDBFE794A8E79A84E69DA1E4BBB6E4B88DE6BBA1E8B6B3EFBC8CE699AEE58F8AE7A88BE5BAA6E4B88D5C6EE9AB98EFBC9BE983A8E58886E696B9E8A880E59CB0E58CBAE699AEE9809AE8AF9DE5928CE8A784E88C83E6B189E5AD97E79A84E4BDBFE794A8E5AD98E59CA8E59BB0E99ABEEFBC9BE983A8E58886E6B8AFE58FB0E99D92E5B9B4E5AFB9E7A596E59BBDE69687E58C96E7968FE8BF9CE6B7A1E6BCA0E7AD89E380825C6E5C6E20202020E6ADA4E5898DEFBC8CE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E69C80E9AB98E5A484E7BD9AE99990E4BA8EE2809CE8ADA6E5918AE2809DE38082E4BB8EE5A49AE5B9B4E5AE9EE8B7B5E79C8BEFBC8CE8AFB4E69C8DE69599E882B2E38081E8ADA6E5918AE4B88DE8B6B3E4BBA5E5BDA2E68890E5A881E68591EFBC8CE689A7E6B395E4B8BBE4BD93E4B88DE6988EE7A1AEEFBC8CE79BB8E585B3E983A8E997A8E8818CE8B4A3E4B88DE6988EE699B0EFBC8CE7BCBAE4B98FE59BBDE5AEB6E5BCBAE588B6E58A9BE4BD9CE4B8BAE5AE9EE696BDE4BF9DE99A9CE380825C6E5C6E20202020E4BB96E5BBBAE8AEAEEFBC8CE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE6988EE698BEE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DEFBC8CE698AFE6AF8FE4B8AAE585ACE6B091E79A84E69D83E588A9E4B88EE4B989E58AA1E38082E5908CE697B6E4B88EE697B6E4BFB1E8BF9BEFBC8CE7BB9FE7ADB9E68EA8E8BF9BE4BFAEE694B9E58891E6B395E38081E6B091E6978FE58CBAE59F9FE887AAE6B2BBE6B395E38081E9A699E6B8AFE789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E38081E6BEB3E997A8E789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E79BB8E585B3E69DA1E6ACBEEFBC8CE585A8E99DA2E7AA81E587BAE58C85E68BACE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E58685E79A84E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E79A84E4B8BBE4BD93E59CB0E4BD8DE380825C6E5C6E202020E2809CE6B395E59BBDE38081E6848FE5A4A7E588A9E38081E5BEB7E59BBDE38081E68CAAE5A881E38081E4BF84E7BD97E696AFE38081E4BBA5E889B2E58897E38081E99FA9E59BBDE7AD89E983BDE588B6E5AE9AE6B395E5BE8BE68896E694BFE7AD96E4BF9DE68AA4E6AF8DE8AFADEFBC8CE68AB5E5BEA1E5BCBAE58ABFE79A84E88BB1E8AFADE585A5E4BEB5E38082E2809DE4BB96E8AFB4EFBC8CE4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E5908EEFBC8CE59084E983A8E997A8E58FAFE98082E697B6E8B083E695B4EFBC8CE58AA0E5BCBAE4BF9DE68AA4E6AF8DE8AFADEFBC8CE4B88DE5AE9CE8BF87E5BAA6E7AA81E587BAE5A496E8AFADE380825C6E5C6E2020202020E5A682E69599E882B2E983A8E997A8E58FAFE99288E5AFB9E9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E38081E88BB1E8AFADE58886E695B0E69D83E9878DE5819AE587BAE8B083E695B4EFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE5928CE59CB0E4BD8DE38082E4BBA5E983A8E58886E59F8EE5B882E4B8BAE4BE8BEFBC8C32303230E5B9B4E58C97E4BAACE9AB98E88083E8AFADE69687E38081E88BB1E8AFADE680BBE58886E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886EFBC9BE4B88AE6B5B7E9AB98E88083E38081E4B8ADE88083E59D87E4B8BA313530E58886EFBC9BE6B7B1E59CB3E9AB98E88083E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886E38082E5BBBAE8AEAEE8B083E695B4E5908EEFBC8CE9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E680BBE58886EFBC8CE6AF94E88BB1E8AFADE5928CE585B6E4BB96E5A496E8AFADE680BBE58886E887B3E5B091E68F90E9AB98323025EFBC8CE4BBA5E4BF9DE68AA4E6AF8DE8AFADE4BC98E58ABFE59CB0E4BD8DE38082EFBC88E5AE8CEFBC89222C22737461747573223A312C22736F7274223A357D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('33', '2020-05-27 17:11:29', '2020-05-27 17:11:29', 0x5B7B226964223A372C2263726561746544617465223A22323032302D30352D32372031323A30313A3039222C226C6173744D6F646966696564223A22323032302D30352D32372031373A31313A3239222C227469746C65223A22E7BE8EE4B8BDE99D92E5B29B222C22636F6E74656E74223A2220202020E696B0E58D8EE7A4BEE58C97E4BAAC35E69C883236E697A5E794B5EFBC88E8AEB0E88085E8B5B5E790ACE5BEAEE38081E883A1E79290EFBC8932303230E5B9B4E585A8E59BBDE4B8A4E4BC9AE69C9FE997B4EFBC8CE5A682E4BD95E8BF9BE4B880E6ADA5E8A784E88C83E8AFADE8A880E69687E5AD97E4BDBFE794A8EFBC8CE5A29EE5BCBAE585ACE6B091E79A84E59BBDE5AEB6E8AEA4E5908CE58F97E588B0E585B3E6B3A8E38082E585A8E59BBDE4BABAE5A4A7E4BBA3E8A1A8E38081E4B8ADE585B1E58C97E4BAACE5B882E5A794E589AFE7A798E4B9A6E995BFE59490E6B5B7E9BE99E5BBBAE8AEAEEFBC8CE58FAFE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DE38082E5908CE697B6E5A29EE5BCBAE9AB98E88083E38081E4B8ADE88083E4B8ADE8AFADE69687E58886E695B0E6AF94E9878DEFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE59CB0E4BD8DE380825C6E5C6E20202020E4BB96E8AEA4E4B8BAEFBC8CE79BAEE5898DE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5B7A5E4BD9CE5AD98E59CA8E4B880E4BA9BE59BB0E5A283EFBC9AE69D83E5A881E680A7E5B08FE38081E683A9E7BD9AE58A9BE5BCB1E38081E8A784E88C83E680A7E99ABEE4BBA5E890BDE5AE9EEFBC9BE7BD91E7BB9CE8AFADE8A880E5928CE5B9BFE5918AE8AFADE8A880E6BBA5E794A8E5A496E69687E38081E7949FE980A0E6B189E5AD97E6B189E8AFADE78EB0E8B1A1E587B8E698BEEFBC9BE983A8E58886E5818FE8BF9CE59CB0E58CBAE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5ADA6E4B9A0E5928CE4BDBFE794A8E79A84E69DA1E4BBB6E4B88DE6BBA1E8B6B3EFBC8CE699AEE58F8AE7A88BE5BAA6E4B88DE9AB98EFBC9BE983A8E58886E696B9E8A880E59CB0E58CBAE699AEE9809AE8AF9DE5928CE8A784E88C83E6B189E5AD97E79A84E4BDBFE794A8E5AD98E59CA8E59BB0E99ABEEFBC9BE983A8E58886E6B8AFE58FB0E99D92E5B9B4E5AFB9E7A596E59BBDE69687E58C96E7968FE8BF9CE6B7A1E6BCA0E7AD89E380825C6E5C6E20202020E6ADA4E5898DEFBC8CE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E69C80E9AB98E5A484E7BD9AE99990E4BA8EE2809CE8ADA6E5918AE2809DE38082E4BB8EE5A49AE5B9B4E5AE9EE8B7B5E79C8BEFBC8CE8AFB4E69C8DE69599E882B2E38081E8ADA6E5918AE4B88DE8B6B3E4BBA5E5BDA2E68890E5A881E68591EFBC8CE689A7E6B395E4B8BBE4BD93E4B88DE6988EE7A1AEEFBC8CE79BB8E585B3E983A8E997A8E8818CE8B4A3E4B88DE6988EE699B0EFBC8CE7BCBAE4B98FE59BBDE5AEB6E5BCBAE588B6E58A9BE4BD9CE4B8BAE5AE9EE696BDE4BF9DE99A9CE380825C6E5C6E20202020E4BB96E5BBBAE8AEAEEFBC8CE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE6988EE698BEE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DEFBC8CE698AFE6AF8FE4B8AAE585ACE6B091E79A84E69D83E588A9E4B88EE4B989E58AA1E38082E5908CE697B6E4B88EE697B6E4BFB1E8BF9BEFBC8CE7BB9FE7ADB9E68EA8E8BF9BE4BFAEE694B9E58891E6B395E38081E6B091E6978FE58CBAE59F9FE887AAE6B2BBE6B395E38081E9A699E6B8AFE789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E38081E6BEB3E997A8E789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E79BB8E585B3E69DA1E6ACBEEFBC8CE585A8E99DA2E7AA81E587BAE58C85E68BACE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E58685E79A84E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E79A84E4B8BBE4BD93E59CB0E4BD8DE380825C6E5C6E202020E2809CE6B395E59BBDE38081E6848FE5A4A7E588A9E38081E5BEB7E59BBDE38081E68CAAE5A881E38081E4BF84E7BD97E696AFE38081E4BBA5E889B2E58897E38081E99FA9E59BBDE7AD89E983BDE588B6E5AE9AE6B395E5BE8BE68896E694BFE7AD96E4BF9DE68AA4E6AF8DE8AFADEFBC8CE68AB5E5BEA1E5BCBAE58ABFE79A84E88BB1E8AFADE585A5E4BEB5E38082E2809DE4BB96E8AFB4EFBC8CE4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E5908EEFBC8CE59084E983A8E997A8E58FAFE98082E697B6E8B083E695B4EFBC8CE58AA0E5BCBAE4BF9DE68AA4E6AF8DE8AFADEFBC8CE4B88DE5AE9CE8BF87E5BAA6E7AA81E587BAE5A496E8AFADE380825C6E5C6E2020202020E5A682E69599E882B2E983A8E997A8E58FAFE99288E5AFB9E9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E38081E88BB1E8AFADE58886E695B0E69D83E9878DE5819AE587BAE8B083E695B4EFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE5928CE59CB0E4BD8DE38082E4BBA5E983A8E58886E59F8EE5B882E4B8BAE4BE8BEFBC8C32303230E5B9B4E58C97E4BAACE9AB98E88083E8AFADE69687E38081E88BB1E8AFADE680BBE58886E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886EFBC9BE4B88AE6B5B7E9AB98E88083E38081E4B8ADE88083E59D87E4B8BA313530E58886EFBC9BE6B7B1E59CB3E9AB98E88083E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886E38082E5BBBAE8AEAEE8B083E695B4E5908EEFBC8CE9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E680BBE58886EFBC8CE6AF94E88BB1E8AFADE5928CE585B6E4BB96E5A496E8AFADE680BBE58886E887B3E5B091E68F90E9AB98323025EFBC8CE4BBA5E4BF9DE68AA4E6AF8DE8AFADE4BC98E58ABFE59CB0E4BD8DE38082EFBC88E5AE8CEFBC89222C22737461747573223A312C22736F7274223A357D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('34', '2020-05-27 18:11:11', '2020-05-27 18:11:11', 0x5B7B226964223A372C2263726561746544617465223A22323032302D30352D32372031323A30313A3039222C226C6173744D6F646966696564223A22323032302D30352D32372031383A31313A3131222C227469746C65223A22E7BE8EE4B8BDE99D92E5B29B31222C22636F6E74656E74223A22202020203131E696B0E58D8EE7A4BEE58C97E4BAAC35E69C883236E697A5E794B5EFBC88E8AEB0E88085E8B5B5E790ACE5BEAEE38081E883A1E79290EFBC8932303230E5B9B4E585A8E59BBDE4B8A4E4BC9AE69C9FE997B4EFBC8CE5A682E4BD95E8BF9BE4B880E6ADA5E8A784E88C83E8AFADE8A880E69687E5AD97E4BDBFE794A8EFBC8CE5A29EE5BCBAE585ACE6B091E79A84E59BBDE5AEB6E8AEA4E5908CE58F97E588B0E585B3E6B3A8E38082E585A8E59BBDE4BABAE5A4A7E4BBA3E8A1A8E38081E4B8ADE585B1E58C97E4BAACE5B882E5A794E589AFE7A798E4B9A6E995BFE59490E6B5B7E9BE99E5BBBAE8AEAEEFBC8CE58FAFE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DE38082E5908CE697B6E5A29EE5BCBAE9AB98E88083E38081E4B8ADE88083E4B8ADE8AFADE69687E58886E695B0E6AF94E9878DEFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE59CB0E4BD8DE380825C6E5C6E20202020E4BB96E8AEA4E4B8BAEFBC8CE79BAEE5898DE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5B7A5E4BD9CE5AD98E59CA8E4B880E4BA9BE59BB0E5A283EFBC9AE69D83E5A881E680A7E5B08FE38081E683A9E7BD9AE58A9BE5BCB1E38081E8A784E88C83E680A7E99ABEE4BBA5E890BDE5AE9EEFBC9BE7BD91E7BB9CE8AFADE8A880E5928CE5B9BFE5918AE8AFADE8A880E6BBA5E794A8E5A496E69687E38081E7949FE980A0E6B189E5AD97E6B189E8AFADE78EB0E8B1A1E587B8E698BEEFBC9BE983A8E58886E5818FE8BF9CE59CB0E58CBAE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5ADA6E4B9A0E5928CE4BDBFE794A8E79A84E69DA1E4BBB6E4B88DE6BBA1E8B6B3EFBC8CE699AEE58F8AE7A88BE5BAA6E4B88DE9AB98EFBC9BE983A8E58886E696B9E8A880E59CB0E58CBAE699AEE9809AE8AF9DE5928CE8A784E88C83E6B189E5AD97E79A84E4BDBFE794A8E5AD98E59CA8E59BB0E99ABEEFBC9BE983A8E58886E6B8AFE58FB0E99D92E5B9B4E5AFB9E7A596E59BBDE69687E58C96E7968FE8BF9CE6B7A1E6BCA0E7AD89E380825C6E5C6E20202020E6ADA4E5898DEFBC8CE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E69C80E9AB98E5A484E7BD9AE99990E4BA8EE2809CE8ADA6E5918AE2809DE38082E4BB8EE5A49AE5B9B4E5AE9EE8B7B5E79C8BEFBC8CE8AFB4E69C8DE69599E882B2E38081E8ADA6E5918AE4B88DE8B6B3E4BBA5E5BDA2E68890E5A881E68591EFBC8CE689A7E6B395E4B8BBE4BD93E4B88DE6988EE7A1AEEFBC8CE79BB8E585B3E983A8E997A8E8818CE8B4A3E4B88DE6988EE699B0EFBC8CE7BCBAE4B98FE59BBDE5AEB6E5BCBAE588B6E58A9BE4BD9CE4B8BAE5AE9EE696BDE4BF9DE99A9CE380825C6E5C6E20202020E4BB96E5BBBAE8AEAEEFBC8CE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE6988EE698BEE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DEFBC8CE698AFE6AF8FE4B8AAE585ACE6B091E79A84E69D83E588A9E4B88EE4B989E58AA1E38082E5908CE697B6E4B88EE697B6E4BFB1E8BF9BEFBC8CE7BB9FE7ADB9E68EA8E8BF9BE4BFAEE694B9E58891E6B395E38081E6B091E6978FE58CBAE59F9FE887AAE6B2BBE6B395E38081E9A699E6B8AFE789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E38081E6BEB3E997A8E789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E79BB8E585B3E69DA1E6ACBEEFBC8CE585A8E99DA2E7AA81E587BAE58C85E68BACE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E58685E79A84E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E79A84E4B8BBE4BD93E59CB0E4BD8DE380825C6E5C6E202020E2809CE6B395E59BBDE38081E6848FE5A4A7E588A9E38081E5BEB7E59BBDE38081E68CAAE5A881E38081E4BF84E7BD97E696AFE38081E4BBA5E889B2E58897E38081E99FA9E59BBDE7AD89E983BDE588B6E5AE9AE6B395E5BE8BE68896E694BFE7AD96E4BF9DE68AA4E6AF8DE8AFADEFBC8CE68AB5E5BEA1E5BCBAE58ABFE79A84E88BB1E8AFADE585A5E4BEB5E38082E2809DE4BB96E8AFB4EFBC8CE4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E5908EEFBC8CE59084E983A8E997A8E58FAFE98082E697B6E8B083E695B4EFBC8CE58AA0E5BCBAE4BF9DE68AA4E6AF8DE8AFADEFBC8CE4B88DE5AE9CE8BF87E5BAA6E7AA81E587BAE5A496E8AFADE380825C6E5C6E2020202020E5A682E69599E882B2E983A8E997A8E58FAFE99288E5AFB9E9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E38081E88BB1E8AFADE58886E695B0E69D83E9878DE5819AE587BAE8B083E695B4EFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE5928CE59CB0E4BD8DE38082E4BBA5E983A8E58886E59F8EE5B882E4B8BAE4BE8BEFBC8C32303230E5B9B4E58C97E4BAACE9AB98E88083E8AFADE69687E38081E88BB1E8AFADE680BBE58886E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886EFBC9BE4B88AE6B5B7E9AB98E88083E38081E4B8ADE88083E59D87E4B8BA313530E58886EFBC9BE6B7B1E59CB3E9AB98E88083E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886E38082E5BBBAE8AEAEE8B083E695B4E5908EEFBC8CE9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E680BBE58886EFBC8CE6AF94E88BB1E8AFADE5928CE585B6E4BB96E5A496E8AFADE680BBE58886E887B3E5B091E68F90E9AB98323025EFBC8CE4BBA5E4BF9DE68AA4E6AF8DE8AFADE4BC98E58ABFE59CB0E4BD8DE38082EFBC88E5AE8CEFBC89222C22737461747573223A312C22736F7274223A357D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('35', '2020-05-27 18:11:28', '2020-05-27 18:11:28', 0x5B7B226964223A372C2263726561746544617465223A22323032302D30352D32372031323A30313A3039222C226C6173744D6F646966696564223A22323032302D30352D32372031383A31313A3238222C227469746C65223A22E7BE8EE4B8BDE99D92E5B29B222C22636F6E74656E74223A2220202020E696B0E58D8EE7A4BEE58C97E4BAAC35E69C883236E697A5E794B5EFBC88E8AEB0E88085E8B5B5E790ACE5BEAEE38081E883A1E79290EFBC8932303230E5B9B4E585A8E59BBDE4B8A4E4BC9AE69C9FE997B4EFBC8CE5A682E4BD95E8BF9BE4B880E6ADA5E8A784E88C83E8AFADE8A880E69687E5AD97E4BDBFE794A8EFBC8CE5A29EE5BCBAE585ACE6B091E79A84E59BBDE5AEB6E8AEA4E5908CE58F97E588B0E585B3E6B3A8E38082E585A8E59BBDE4BABAE5A4A7E4BBA3E8A1A8E38081E4B8ADE585B1E58C97E4BAACE5B882E5A794E589AFE7A798E4B9A6E995BFE59490E6B5B7E9BE99E5BBBAE8AEAEEFBC8CE58FAFE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DE38082E5908CE697B6E5A29EE5BCBAE9AB98E88083E38081E4B8ADE88083E4B8ADE8AFADE69687E58886E695B0E6AF94E9878DEFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE59CB0E4BD8DE380825C6E5C6E20202020E4BB96E8AEA4E4B8BAEFBC8CE79BAEE5898DE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5B7A5E4BD9CE5AD98E59CA8E4B880E4BA9BE59BB0E5A283EFBC9AE69D83E5A881E680A7E5B08FE38081E683A9E7BD9AE58A9BE5BCB1E38081E8A784E88C83E680A7E99ABEE4BBA5E890BDE5AE9EEFBC9BE7BD91E7BB9CE8AFADE8A880E5928CE5B9BFE5918AE8AFADE8A880E6BBA5E794A8E5A496E69687E38081E7949FE980A0E6B189E5AD97E6B189E8AFADE78EB0E8B1A1E587B8E698BEEFBC9BE983A8E58886E5818FE8BF9CE59CB0E58CBAE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5ADA6E4B9A0E5928CE4BDBFE794A8E79A84E69DA1E4BBB6E4B88DE6BBA1E8B6B3EFBC8CE699AEE58F8AE7A88BE5BAA6E4B88DE9AB98EFBC9BE983A8E58886E696B9E8A880E59CB0E58CBAE699AEE9809AE8AF9DE5928CE8A784E88C83E6B189E5AD97E79A84E4BDBFE794A8E5AD98E59CA8E59BB0E99ABEEFBC9BE983A8E58886E6B8AFE58FB0E99D92E5B9B4E5AFB9E7A596E59BBDE69687E58C96E7968FE8BF9CE6B7A1E6BCA0E7AD89E380825C6E5C6E20202020E6ADA4E5898DEFBC8CE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E69C80E9AB98E5A484E7BD9AE99990E4BA8EE2809CE8ADA6E5918AE2809DE38082E4BB8EE5A49AE5B9B4E5AE9EE8B7B5E79C8BEFBC8CE8AFB4E69C8DE69599E882B2E38081E8ADA6E5918AE4B88DE8B6B3E4BBA5E5BDA2E68890E5A881E68591EFBC8CE689A7E6B395E4B8BBE4BD93E4B88DE6988EE7A1AEEFBC8CE79BB8E585B3E983A8E997A8E8818CE8B4A3E4B88DE6988EE699B0EFBC8CE7BCBAE4B98FE59BBDE5AEB6E5BCBAE588B6E58A9BE4BD9CE4B8BAE5AE9EE696BDE4BF9DE99A9CE380825C6E5C6E20202020E4BB96E5BBBAE8AEAEEFBC8CE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE6988EE698BEE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DEFBC8CE698AFE6AF8FE4B8AAE585ACE6B091E79A84E69D83E588A9E4B88EE4B989E58AA1E38082E5908CE697B6E4B88EE697B6E4BFB1E8BF9BEFBC8CE7BB9FE7ADB9E68EA8E8BF9BE4BFAEE694B9E58891E6B395E38081E6B091E6978FE58CBAE59F9FE887AAE6B2BBE6B395E38081E9A699E6B8AFE789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E38081E6BEB3E997A8E789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E79BB8E585B3E69DA1E6ACBEEFBC8CE585A8E99DA2E7AA81E587BAE58C85E68BACE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E58685E79A84E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E79A84E4B8BBE4BD93E59CB0E4BD8DE380825C6E5C6E202020E2809CE6B395E59BBDE38081E6848FE5A4A7E588A9E38081E5BEB7E59BBDE38081E68CAAE5A881E38081E4BF84E7BD97E696AFE38081E4BBA5E889B2E58897E38081E99FA9E59BBDE7AD89E983BDE588B6E5AE9AE6B395E5BE8BE68896E694BFE7AD96E4BF9DE68AA4E6AF8DE8AFADEFBC8CE68AB5E5BEA1E5BCBAE58ABFE79A84E88BB1E8AFADE585A5E4BEB5E38082E2809DE4BB96E8AFB4EFBC8CE4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E5908EEFBC8CE59084E983A8E997A8E58FAFE98082E697B6E8B083E695B4EFBC8CE58AA0E5BCBAE4BF9DE68AA4E6AF8DE8AFADEFBC8CE4B88DE5AE9CE8BF87E5BAA6E7AA81E587BAE5A496E8AFADE380825C6E5C6E2020202020E5A682E69599E882B2E983A8E997A8E58FAFE99288E5AFB9E9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E38081E88BB1E8AFADE58886E695B0E69D83E9878DE5819AE587BAE8B083E695B4EFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE5928CE59CB0E4BD8DE38082E4BBA5E983A8E58886E59F8EE5B882E4B8BAE4BE8BEFBC8C32303230E5B9B4E58C97E4BAACE9AB98E88083E8AFADE69687E38081E88BB1E8AFADE680BBE58886E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886EFBC9BE4B88AE6B5B7E9AB98E88083E38081E4B8ADE88083E59D87E4B8BA313530E58886EFBC9BE6B7B1E59CB3E9AB98E88083E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886E38082E5BBBAE8AEAEE8B083E695B4E5908EEFBC8CE9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E680BBE58886EFBC8CE6AF94E88BB1E8AFADE5928CE585B6E4BB96E5A496E8AFADE680BBE58886E887B3E5B091E68F90E9AB98323025EFBC8CE4BBA5E4BF9DE68AA4E6AF8DE8AFADE4BC98E58ABFE59CB0E4BD8DE38082EFBC88E5AE8CEFBC89222C22737461747573223A312C22736F7274223A357D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('36', '2020-05-27 18:11:42', '2020-05-27 18:11:42', 0x5B7B226964223A382C2263726561746544617465223A22323032302D30352D32372031383A31313A3432222C226C6173744D6F646966696564223A22323032302D30352D32372031383A31313A3432222C227469746C65223A22323133222C22636F6E74656E74223A2220202020313233222C22737461747573223A302C22736F7274223A307D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('37', '2020-05-27 18:11:49', '2020-05-27 18:11:49', 0x5B7B226964223A382C2263726561746544617465223A22323032302D30352D32372031383A31313A3432222C226C6173744D6F646966696564223A22323032302D30352D32372031383A31313A3439222C227469746C65223A22323133222C22636F6E74656E74223A2220202020313233222C22737461747573223A312C22736F7274223A307D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('38', '2020-05-27 18:12:08', '2020-05-27 18:12:08', 0x5B385D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/deleteNotice', '1');
INSERT INTO `tb_sys_user_log` VALUES ('39', '2020-05-27 18:26:15', '2020-05-27 18:26:15', 0x5B7B226C6F67696E4E616D65223A22737570657241646D696E222C2275707764223A22313233343536222C226B6579223A223665333464333733663831613436383062623332313137346666623436363364222C22636F6465223A2237343631227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D653637363337363536356466343533663934643138303966613463383132626332663930343834366539386134346631623666396166613632346632653461327D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('40', '2020-05-27 19:05:22', '2020-05-27 19:05:22', 0x5B7B226C6F67696E4E616D65223A22737570657241646D696E222C2275707764223A22313233343536222C226B6579223A223862336662306461363066333435656638616138336566643530363739343338222C22636F6465223A2230393831227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D303337323165363134373235343738646131663439356532376338383362353530373536346562316331623334373362383039333662363265396539653630307D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('41', '2020-05-27 19:06:04', '2020-05-27 19:06:04', 0x5B7B226964223A332C2263726561746544617465223A22323032302D30352D32372031313A35373A3533222C226C6173744D6F646966696564223A22323032302D30352D32372031393A30363A3034222C227469746C65223A22E8BF9EE88AB1E6B885E7989FE4B8B4E5BA8AE695B0E68DAEE68AABE99CB2EFBC9AE9929FE58D97E5B1B1E9A286E8A194EFBC8CE4BF83E6B2BBE68488E4BD86E8BDACE998B4E4BD9CE794A8E4B88DE5A4A7222C22636F6E74656E74223A2220202020E696B0E58D8EE7A4BEE58C97E4BAAC35E69C883236E697A5E794B5EFBC88E8AEB0E88085E8B5B5E790ACE5BEAEE38081E883A1E79290EFBC8932303230E5B9B4E585A8E59BBDE4B8A4E4BC9AE69C9FE997B4EFBC8CE5A682E4BD95E8BF9BE4B880E6ADA5E8A784E88C83E8AFADE8A880E69687E5AD97E4BDBFE794A8EFBC8CE5A29EE5BCBAE585ACE6B091E79A84E59BBDE5AEB6E8AEA4E5908CE58F97E588B0E585B3E6B3A8E38082E585A8E59BBDE4BABAE5A4A7E4BBA3E8A1A8E38081E4B8ADE585B1E58C97E4BAACE5B882E5A794E589AFE7A798E4B9A6E995BFE59490E6B5B7E9BE99E5BBBAE8AEAEEFBC8CE58FAFE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DE38082E5908CE697B6E5A29EE5BCBAE9AB98E88083E38081E4B8ADE88083E4B8ADE8AFADE69687E58886E695B0E6AF94E9878DEFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE59CB0E4BD8DE380825C6E5C6E20202020E4BB96E8AEA4E4B8BAEFBC8CE79BAEE5898DE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5B7A5E4BD9CE5AD98E59CA8E4B880E4BA9BE59BB0E5A283EFBC9AE69D83E5A881E680A7E5B08FE38081E683A9E7BD9AE58A9BE5BCB1E38081E8A784E88C83E680A7E99ABEE4BBA5E890BDE5AE9EEFBC9BE7BD91E7BB9CE8AFADE8A880E5928CE5B9BFE5918AE8AFADE8A880E6BBA5E794A8E5A496E69687E38081E7949FE980A0E6B189E5AD97E6B189E8AFADE78EB0E8B1A1E587B8E698BEEFBC9BE983A8E58886E5818FE8BF9CE59CB0E58CBAE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E5ADA6E4B9A0E5928CE4BDBFE794A8E79A84E69DA1E4BBB6E4B88DE6BBA1E8B6B3EFBC8CE699AEE58F8AE7A88BE5BAA6E4B88DE9AB98EFBC9BE983A8E58886E696B9E8A880E59CB0E58CBAE699AEE9809AE8AF9DE5928CE8A784E88C83E6B189E5AD97E79A84E4BDBFE794A8E5AD98E59CA8E59BB0E99ABEEFBC9BE983A8E58886E6B8AFE58FB0E99D92E5B9B4E5AFB9E7A596E59BBDE69687E58C96E7968FE8BF9CE6B7A1E6BCA0E7AD89E380825C6E5C6E20202020E6ADA4E5898DEFBC8CE59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E69C80E9AB98E5A484E7BD9AE99990E4BA8EE2809CE8ADA6E5918AE2809DE38082E4BB8EE5A49AE5B9B4E5AE9EE8B7B5E79C8BEFBC8CE8AFB4E69C8DE69599E882B2E38081E8ADA6E5918AE4B88DE8B6B3E4BBA5E5BDA2E68890E5A881E68591EFBC8CE689A7E6B395E4B8BBE4BD93E4B88DE6988EE7A1AEEFBC8CE79BB8E585B3E983A8E997A8E8818CE8B4A3E4B88DE6988EE699B0EFBC8CE7BCBAE4B98FE59BBDE5AEB6E5BCBAE588B6E58A9BE4BD9CE4B8BAE5AE9EE696BDE4BF9DE99A9CE380825C6E5C6E20202020E4BB96E5BBBAE8AEAEEFBC8CE98082E697B6E4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395EFBC8CE6988EE698BEE7AA81E587BAE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E59BBDE5AEB6E8AFADE8A880E7949FE6B4BBE4B8ADE79A84E4B8BBE4BD93E59CB0E4BD8DEFBC8CE698AFE6AF8FE4B8AAE585ACE6B091E79A84E69D83E588A9E4B88EE4B989E58AA1E38082E5908CE697B6E4B88EE697B6E4BFB1E8BF9BEFBC8CE7BB9FE7ADB9E68EA8E8BF9BE4BFAEE694B9E58891E6B395E38081E6B091E6978FE58CBAE59F9FE887AAE6B2BBE6B395E38081E9A699E6B8AFE789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E38081E6BEB3E997A8E789B9E588ABE8A18CE694BFE58CBAE59FBAE69CACE6B395E79BB8E585B3E69DA1E6ACBEEFBC8CE585A8E99DA2E7AA81E587BAE58C85E68BACE699AEE9809AE8AF9DE38081E8A784E88C83E6B189E5AD97E59CA8E58685E79A84E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E79A84E4B8BBE4BD93E59CB0E4BD8DE380825C6E5C6E202020E2809CE6B395E59BBDE38081E6848FE5A4A7E588A9E38081E5BEB7E59BBDE38081E68CAAE5A881E38081E4BF84E7BD97E696AFE38081E4BBA5E889B2E58897E38081E99FA9E59BBDE7AD89E983BDE588B6E5AE9AE6B395E5BE8BE68896E694BFE7AD96E4BF9DE68AA4E6AF8DE8AFADEFBC8CE68AB5E5BEA1E5BCBAE58ABFE79A84E88BB1E8AFADE585A5E4BEB5E38082E2809DE4BB96E8AFB4EFBC8CE4BFAEE694B9E59BBDE5AEB6E9809AE794A8E8AFADE8A880E69687E5AD97E6B395E5908EEFBC8CE59084E983A8E997A8E58FAFE98082E697B6E8B083E695B4EFBC8CE58AA0E5BCBAE4BF9DE68AA4E6AF8DE8AFADEFBC8CE4B88DE5AE9CE8BF87E5BAA6E7AA81E587BAE5A496E8AFADE380825C6E5C6E2020202020E5A682E69599E882B2E983A8E997A8E58FAFE99288E5AFB9E9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E38081E88BB1E8AFADE58886E695B0E69D83E9878DE5819AE587BAE8B083E695B4EFBC8CE7AA81E587BAE6AF8DE8AFADE5BA94E69C89E79A84E4BC98E58ABFE5928CE59CB0E4BD8DE38082E4BBA5E983A8E58886E59F8EE5B882E4B8BAE4BE8BEFBC8C32303230E5B9B4E58C97E4BAACE9AB98E88083E8AFADE69687E38081E88BB1E8AFADE680BBE58886E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886EFBC9BE4B88AE6B5B7E9AB98E88083E38081E4B8ADE88083E59D87E4B8BA313530E58886EFBC9BE6B7B1E59CB3E9AB98E88083E59D87E4B8BA313530E58886EFBC8CE4B8ADE88083E59D87E4B8BA313030E58886E38082E5BBBAE8AEAEE8B083E695B4E5908EEFBC8CE9AB98E88083E38081E4B8ADE88083E79A84E8AFADE69687E680BBE58886EFBC8CE6AF94E88BB1E8AFADE5928CE585B6E4BB96E5A496E8AFADE680BBE58886E887B3E5B091E68F90E9AB98323025EFBC8CE4BBA5E4BF9DE68AA4E6AF8DE8AFADE4BC98E58ABFE59CB0E4BD8DE38082EFBC88E5AE8CEFBC89222C22737461747573223A302C22736F7274223A307D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/publishNotice/saveNotice', '1');
