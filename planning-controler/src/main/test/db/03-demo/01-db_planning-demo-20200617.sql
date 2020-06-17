/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_planning

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2020-06-17 17:15:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_company_in_out
-- ----------------------------
DROP TABLE IF EXISTS `tb_company_in_out`;
CREATE TABLE `tb_company_in_out` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `del_flag` tinyint(4) NOT NULL DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entry_amount` decimal(19,2) DEFAULT '0.00' COMMENT '录入项金额',
  `entry_desc` varchar(500) DEFAULT NULL COMMENT '录入项描述',
  `entry_happen_date` datetime DEFAULT NULL COMMENT '录入项发生时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '录入项名称',
  `entry_type` tinyint(4) DEFAULT '0' COMMENT '录入项类别',
  `entry_user_id` bigint(20) DEFAULT NULL COMMENT '录入用户id',
  `entry_user_remark` varchar(500) DEFAULT NULL COMMENT '录入用户备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_company_in_out
-- ----------------------------
INSERT INTO `tb_company_in_out` VALUES ('1', '2020-06-14 18:15:05', '0', '2020-06-14 18:15:05', '20000.00', '    ', '2020-06-14 00:00:00', '2020-06 工资支出', '0', '5', '    ');
INSERT INTO `tb_company_in_out` VALUES ('2', '2020-06-17 17:04:24', '0', '2020-06-17 17:04:24', '1000.00', '    采购白菜', '2020-05-01 00:00:00', '2020-05 采购支出', '0', '1', '    ');
INSERT INTO `tb_company_in_out` VALUES ('3', '2020-06-17 17:05:12', '1', '2020-06-17 17:06:49', '2000.00', '    服装费支出', '2020-04-14 00:00:00', '2020-07 服装费支出', '0', '1', '    ');
INSERT INTO `tb_company_in_out` VALUES ('4', '2020-06-17 17:08:56', '0', '2020-06-17 17:08:56', '1000.00', '    服装费支出', '2020-04-21 00:00:00', '2020-04 服装费支出', '0', '1', '    ');
INSERT INTO `tb_company_in_out` VALUES ('5', '2020-06-17 17:10:15', '0', '2020-06-17 17:11:09', '5000.00', '    营业收入', '2020-04-01 00:00:00', '2020-04 营业收入', '1', '1', '    ');
INSERT INTO `tb_company_in_out` VALUES ('6', '2020-06-17 17:13:07', '0', '2020-06-17 17:13:07', '4000.00', '    利润', '2020-08-03 00:00:00', '2020-08 利润', '2', '1', '    ');

-- ----------------------------
-- Table structure for tb_company_paid_salary
-- ----------------------------
DROP TABLE IF EXISTS `tb_company_paid_salary`;
CREATE TABLE `tb_company_paid_salary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `del_flag` tinyint(4) NOT NULL DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accumulation_company_paid` decimal(19,2) DEFAULT '0.00' COMMENT '公积金企业承担金额',
  `accumulation_personal_paid` decimal(19,2) DEFAULT '0.00' COMMENT '公积金个人承担金额',
  `deduction_amount` decimal(19,2) DEFAULT '0.00' COMMENT '扣款金额',
  `deduction_remark` varchar(500) DEFAULT NULL COMMENT '扣款原因',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `employer_id` bigint(20) DEFAULT NULL COMMENT '员工id',
  `entry_user_id` bigint(20) DEFAULT NULL COMMENT '录入用户id',
  `entry_user_remark` varchar(500) DEFAULT NULL COMMENT '录入用户备注',
  `paid_salary_amount` decimal(19,2) DEFAULT '0.00' COMMENT '支付工资金额',
  `paid_subsidy_amount` decimal(19,2) DEFAULT '0.00' COMMENT '支付补贴金额',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `salary_amount` decimal(19,2) DEFAULT '0.00' COMMENT '职位工资金额',
  `salary_date` datetime DEFAULT NULL COMMENT '工资日期',
  `social_company_paid` decimal(19,2) DEFAULT '0.00' COMMENT '社保企业承担金额',
  `social_personal_paid` decimal(19,2) DEFAULT '0.00' COMMENT '社保个人承担金额',
  `subsidy_amount` decimal(19,2) DEFAULT '0.00' COMMENT '职位补贴金额',
  `total_paid_amount` decimal(19,2) DEFAULT '0.00' COMMENT '总支付金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_company_paid_salary
-- ----------------------------
INSERT INTO `tb_company_paid_salary` VALUES ('1', '2020-06-14 18:13:49', '0', '2020-06-14 18:13:49', '500.00', '500.00', '0.00', '', '研发部', '2', '5', '', '15000.00', '3000.00', '高级工程师', '15000.00', '2020-06-01 00:00:00', '500.00', '500.00', '3000.00', '20000.00');
INSERT INTO `tb_company_paid_salary` VALUES ('2', '2020-06-14 18:14:08', '1', '2020-06-14 18:14:16', '500.00', '500.00', '0.00', '', '研发部', '2', '5', '', '15000.00', '3000.00', '高级工程师', '15000.00', '2020-06-01 00:00:00', '500.00', '500.00', '3000.00', '20000.00');

-- ----------------------------
-- Table structure for tb_employer
-- ----------------------------
DROP TABLE IF EXISTS `tb_employer`;
CREATE TABLE `tb_employer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `del_flag` tinyint(4) NOT NULL DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accumulation_fund_amount_company` decimal(19,2) DEFAULT '0.00' COMMENT '公积金金额企业部分',
  `accumulation_fund_amount_personal` decimal(19,2) DEFAULT '0.00' COMMENT '公积金金额个人部分',
  `become_regular_time` datetime DEFAULT NULL COMMENT '转正日期',
  `birthday_date` datetime DEFAULT NULL COMMENT '生日',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `emergency_contact_people` varchar(255) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_contact_phone` varchar(255) DEFAULT NULL COMMENT '紧急联系人手机号',
  `employer_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `employer_remark` varchar(600) DEFAULT NULL COMMENT '备注',
  `employer_type` tinyint(4) DEFAULT '0' COMMENT '员工类别',
  `entry_company_time` datetime DEFAULT NULL COMMENT '入职时间',
  `gender` tinyint(4) DEFAULT '0' COMMENT '性别',
  `graduated_date` datetime DEFAULT NULL COMMENT '毕业时间',
  `graduated_school` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `highest_education` tinyint(4) DEFAULT '0' COMMENT '最高学历',
  `highest_education_str` varchar(255) DEFAULT NULL,
  `id_card_no` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `income_desc` varchar(500) DEFAULT NULL COMMENT '补贴描述',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `now_place` varchar(255) DEFAULT NULL COMMENT '现住址',
  `on_job_state` tinyint(4) DEFAULT '0' COMMENT '在职状态',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `quit_time` datetime DEFAULT NULL COMMENT '离职时间',
  `salary_amount` decimal(19,2) DEFAULT '0.00' COMMENT '工资金额',
  `social_security_amount_company` decimal(19,2) DEFAULT '0.00' COMMENT '社保金额企业部分',
  `social_security_amount_personal` decimal(19,2) DEFAULT '0.00' COMMENT '社保金额个人部分',
  `subsidy_amount` decimal(19,2) DEFAULT '0.00' COMMENT '补贴',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_employer
-- ----------------------------
INSERT INTO `tb_employer` VALUES ('1', '2020-06-14 18:02:57', '1', '2020-06-14 18:08:01', '0.00', '0.00', null, '1990-03-07 00:00:00', '研发部', '小红', '1565111111', '小明', '        ', '0', '2019-06-07 00:00:00', '0', '2014-06-06 00:00:00', '北京大学', '6', null, '110101199003076798', null, '北京海淀', '北京海淀', '0', '15650000000', '高级工程师', null, '0.00', '0.00', '0.00', '0.00');
INSERT INTO `tb_employer` VALUES ('2', '2020-06-14 18:07:17', '0', '2020-06-14 18:08:55', '0.00', '0.00', null, '1990-03-07 00:00:00', '研发部', '小明', '15650000000', '小红', '', '0', '2019-08-01 00:00:00', '1', '2014-06-01 00:00:00', '北京大学', '6', '本科', '110101199003078259', '', '北京海淀', '北京海淀', '0', '15650111111', '高级工程师', null, '15000.00', '1200.00', '1200.00', '3000.00');

-- ----------------------------
-- Table structure for tb_employer_adjust_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_employer_adjust_history`;
CREATE TABLE `tb_employer_adjust_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `accumulation_fund_amount_company` decimal(19,2) DEFAULT '0.00' COMMENT '公积金金额企业部分',
  `accumulation_fund_amount_personal` decimal(19,2) DEFAULT '0.00' COMMENT '公积金金额个人部分',
  `become_regular_time` datetime DEFAULT NULL COMMENT '转正日期',
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `employer_id` bigint(20) DEFAULT NULL COMMENT '员工id',
  `employer_remark` varchar(600) DEFAULT NULL COMMENT '备注',
  `employer_type` tinyint(4) DEFAULT '0' COMMENT '员工类别',
  `entry_company_time` datetime DEFAULT NULL COMMENT '入职时间',
  `income_desc` varchar(500) DEFAULT NULL COMMENT '补贴描述',
  `on_job_state` tinyint(4) DEFAULT '0' COMMENT '在职状态',
  `operate_info` varchar(255) DEFAULT NULL COMMENT '操作信息',
  `operate_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户id',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `quit_time` datetime DEFAULT NULL COMMENT '离职时间',
  `salary_amount` decimal(19,2) DEFAULT '0.00' COMMENT '工资金额',
  `social_security_amount_company` decimal(19,2) DEFAULT '0.00' COMMENT '社保金额企业部分',
  `social_security_amount_personal` decimal(19,2) DEFAULT '0.00' COMMENT '社保金额个人部分',
  `subsidy_amount` decimal(19,2) DEFAULT '0.00' COMMENT '补贴',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_employer_adjust_history
-- ----------------------------
INSERT INTO `tb_employer_adjust_history` VALUES ('1', '2020-06-14 18:02:57', '2020-06-14 18:02:57', '0.00', '0.00', null, '研发部', '1', '        ', '0', '2019-06-07 00:00:00', null, '0', '新增人员信息', '4', '高级工程师', null, '0.00', '0.00', '0.00', '0.00');
INSERT INTO `tb_employer_adjust_history` VALUES ('2', '2020-06-14 18:07:17', '2020-06-14 18:07:17', '0.00', '0.00', null, '研发部', '2', null, '0', '2019-08-01 00:00:00', null, '0', '新增人员信息', '4', '高级工程师', null, '0.00', '0.00', '0.00', '0.00');
INSERT INTO `tb_employer_adjust_history` VALUES ('3', '2020-06-14 18:08:01', '2020-06-14 18:08:01', null, null, null, null, '1', null, null, null, null, null, '删除人员信息', '4', null, null, null, null, null, null);
INSERT INTO `tb_employer_adjust_history` VALUES ('4', '2020-06-14 18:08:55', '2020-06-14 18:08:55', '0.00', '0.00', null, '研发部', '2', '', '0', '2019-08-01 00:00:00', '', '0', '调整人员信息', '4', '高级工程师', null, '15000.00', '1200.00', '1200.00', '3000.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance
-- ----------------------------
INSERT INTO `tb_flow_instance` VALUES ('4', '2020-06-14 17:22:38', '2020-06-14 17:26:47', '    身体不适，请假一天。', null, '请假一天', '2020-06-14 17:22:38', '7', '1', '1');
INSERT INTO `tb_flow_instance` VALUES ('8', '2020-06-16 11:01:47', '2020-06-16 11:13:36', '    办公需要，希望采购一批纸巾。', null, '采购一批纸巾', '2020-06-16 11:01:47', '7', '1', '3');
INSERT INTO `tb_flow_instance` VALUES ('14', '2020-06-17 13:15:59', '2020-06-17 13:17:24', '    ', null, '采购一批蔬菜', '2020-06-17 13:15:59', '7', '1', '5');
INSERT INTO `tb_flow_instance` VALUES ('16', '2020-06-17 13:28:09', '2020-06-17 13:30:42', '    ', null, '多人多部门审批演示', '2020-06-17 13:28:09', '7', '1', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_file
-- ----------------------------
INSERT INTO `tb_flow_instance_file` VALUES ('1', '2020-06-14 18:18:32', '2020-06-14 18:18:32', '24064', '5', '4f79b4f9d9be4e359f69c9effc48da9b91c987dbe9964546a5b85a164f3a5725.xls', '2020年06工资单.xls');

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
  `template_node_id` bigint(20) DEFAULT NULL COMMENT '模板节点id',
  `total_code` varchar(1000) DEFAULT NULL COMMENT '节点编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_node
-- ----------------------------
INSERT INTO `tb_flow_instance_node` VALUES ('10', '2020-06-14 17:22:38', '2020-06-14 17:22:38', '4', '', '0', '人力审批', '0', '0', '1', '10');
INSERT INTO `tb_flow_instance_node` VALUES ('11', '2020-06-14 17:22:38', '2020-06-14 17:22:38', '4', '', '1', '财务审批', '0', '10', '2', '10,11');
INSERT INTO `tb_flow_instance_node` VALUES ('12', '2020-06-14 17:22:38', '2020-06-14 17:22:38', '4', '', '2', '部门领导审批', '0', '11', '3', '10,11,12');
INSERT INTO `tb_flow_instance_node` VALUES ('13', '2020-06-14 18:18:32', '2020-06-14 18:18:32', '5', '', '0', '董事长审批', '0', '0', '4', '13');
INSERT INTO `tb_flow_instance_node` VALUES ('14', '2020-06-14 18:18:32', '2020-06-14 18:18:32', '5', '', '1', '财务审批', '0', '13', '5', '13,14');
INSERT INTO `tb_flow_instance_node` VALUES ('21', '2020-06-16 11:01:47', '2020-06-16 11:01:47', '8', '', '0', '董事长审批', '0', '0', '6', '21');
INSERT INTO `tb_flow_instance_node` VALUES ('22', '2020-06-16 11:01:47', '2020-06-16 11:01:47', '8', '', '1', '财务审批', '0', '21', '7', '21,22');
INSERT INTO `tb_flow_instance_node` VALUES ('23', '2020-06-16 11:01:47', '2020-06-16 11:01:47', '8', '', '1', '人力审批', '0', '21', '8', '21,23');
INSERT INTO `tb_flow_instance_node` VALUES ('24', '2020-06-16 11:14:27', '2020-06-16 11:14:27', '9', '', '0', '人力审批', '0', '0', '1', '24');
INSERT INTO `tb_flow_instance_node` VALUES ('25', '2020-06-16 11:14:27', '2020-06-16 11:14:27', '9', '', '1', '财务审批', '0', '24', '2', '24,25');
INSERT INTO `tb_flow_instance_node` VALUES ('26', '2020-06-16 11:14:27', '2020-06-16 11:14:27', '9', '', '2', '部门领导审批', '0', '25', '3', '24,25,26');
INSERT INTO `tb_flow_instance_node` VALUES ('39', '2020-06-17 13:15:59', '2020-06-17 13:15:59', '14', '', '0', '董事长审批', '0', '0', '12', '39');
INSERT INTO `tb_flow_instance_node` VALUES ('40', '2020-06-17 13:15:59', '2020-06-17 13:15:59', '14', '', '1', '人力审批', '0', '39', '13', '39,40');
INSERT INTO `tb_flow_instance_node` VALUES ('41', '2020-06-17 13:15:59', '2020-06-17 13:15:59', '14', '', '2', '财务审批', '1', '40', '14', '39,40,41');
INSERT INTO `tb_flow_instance_node` VALUES ('45', '2020-06-17 13:28:09', '2020-06-17 13:28:09', '16', '', '0', '董事长审批', '0', '0', '15', '45');
INSERT INTO `tb_flow_instance_node` VALUES ('46', '2020-06-17 13:28:09', '2020-06-17 13:28:09', '16', '', '1', '财务审批', '0', '45', '16', '45,46');
INSERT INTO `tb_flow_instance_node` VALUES ('47', '2020-06-17 13:28:09', '2020-06-17 13:28:09', '16', '', '1', '总部人力审批', '0', '45', '17', '45,47');
INSERT INTO `tb_flow_instance_node` VALUES ('48', '2020-06-17 13:28:09', '2020-06-17 13:28:09', '16', '', '2', '公司人力审批', '1', '47', '18', '45,47,48');

-- ----------------------------
-- Table structure for tb_flow_instance_node_user_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_flow_instance_node_user_task`;
CREATE TABLE `tb_flow_instance_node_user_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approval_content` varchar(800) DEFAULT NULL COMMENT '审批内容',
  `approval_date` datetime DEFAULT NULL COMMENT '审批时间',
  `approval_type` tinyint(4) DEFAULT '0' COMMENT '审批类型',
  `instance_id` bigint(20) DEFAULT NULL COMMENT '实例id',
  `instance_node_id` bigint(20) DEFAULT NULL COMMENT '实例节点id',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_node_user_task
-- ----------------------------
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('10', '2020-06-14 17:22:38', '2020-06-14 17:26:47', '    同意。', '2020-06-14 17:26:47', '1', '4', '10', '1', '4');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('11', '2020-06-14 17:22:38', '2020-06-14 17:26:09', '    已记录。', '2020-06-14 17:26:09', '1', '4', '11', '1', '5');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('12', '2020-06-14 17:22:38', '2020-06-14 17:23:16', '    同意，好好休息。', '2020-06-14 17:23:16', '1', '4', '12', '1', '6');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('13', '2020-06-14 18:18:32', '2020-06-14 18:19:43', '    同意，可以发放。', '2020-06-14 18:19:43', '1', '5', '13', '1', '6');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('14', '2020-06-14 18:18:32', '2020-06-14 18:19:07', '    已审阅，同意。', '2020-06-14 18:19:07', '1', '5', '14', '1', '5');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('21', '2020-06-16 11:01:47', '2020-06-16 11:13:36', '    可以。', '2020-06-16 11:13:36', '1', '8', '21', '1', '6');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('22', '2020-06-16 11:01:47', '2020-06-16 11:13:15', '    可以', '2020-06-16 11:13:15', '1', '8', '22', '1', '5');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('23', '2020-06-16 11:01:47', '2020-06-16 11:12:42', '    可以', '2020-06-16 11:12:42', '1', '8', '23', '1', '4');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('24', '2020-06-16 11:14:27', '2020-06-16 11:16:57', '    可以', '2020-06-16 11:16:57', '1', '9', '24', '1', '4');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('25', '2020-06-16 11:14:27', '2020-06-16 11:16:23', '    好的。', '2020-06-16 11:16:23', '1', '9', '25', '1', '5');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('26', '2020-06-16 11:14:27', '2020-06-16 11:15:42', '    可以。', '2020-06-16 11:15:42', '1', '9', '26', '1', '6');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('41', '2020-06-17 13:15:59', '2020-06-17 13:17:24', '    可以。', '2020-06-17 13:17:24', '1', '14', '39', '1', '6');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('42', '2020-06-17 13:15:59', '2020-06-17 13:17:08', '    好的。', '2020-06-17 13:17:08', '1', '14', '40', '1', '4');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('43', '2020-06-17 13:15:59', '2020-06-17 13:16:49', '    可以。', '2020-06-17 13:16:49', '1', '14', '41', '1', '5');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('44', '2020-06-17 13:15:59', '2020-06-17 13:16:31', '    同意。', '2020-06-17 13:16:31', '1', '14', '41', '1', '1');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('49', '2020-06-17 13:28:09', '2020-06-17 13:30:42', '    好的。', '2020-06-17 13:30:42', '1', '16', '45', '1', '6');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('50', '2020-06-17 13:28:09', '2020-06-17 13:30:24', '    可以。', '2020-06-17 13:30:24', '1', '16', '46', '1', '5');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('51', '2020-06-17 13:28:09', '2020-06-17 13:30:05', '    可以。', '2020-06-17 13:30:05', '1', '16', '47', '1', '4');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('52', '2020-06-17 13:28:09', '2020-06-17 13:29:15', '    可以', '2020-06-17 13:29:15', '1', '16', '48', '1', '1');
INSERT INTO `tb_flow_instance_node_user_task` VALUES ('53', '2020-06-17 13:28:09', '2020-06-17 13:29:31', '    好的。', '2020-06-17 13:29:31', '1', '16', '48', '1', '2');

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
  `operate_info` varchar(600) DEFAULT NULL COMMENT '流程实例操作info',
  `operate_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_instance_operate_history
-- ----------------------------
INSERT INTO `tb_flow_instance_operate_history` VALUES ('1', '2020-06-16 11:00:25', '2020-06-16 11:00:25', '6', '采购一批纸巾', '0', '', '用户撤回流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('2', '2020-06-16 11:00:32', '2020-06-16 11:00:32', '6', '采购一批纸巾', '0', '', '用户删除流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('3', '2020-06-16 11:00:55', '2020-06-16 11:00:55', '7', '采购一批纸巾', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('4', '2020-06-16 11:01:06', '2020-06-16 11:01:06', '7', '采购一批纸巾', '0', '', '用户撤回流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('5', '2020-06-16 11:01:10', '2020-06-16 11:01:10', '7', '采购一批纸巾', '0', '', '用户删除流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('6', '2020-06-16 11:01:47', '2020-06-16 11:01:47', '8', '采购一批纸巾', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('7', '2020-06-16 11:12:42', '2020-06-16 11:12:42', '8', '采购一批纸巾', '23', '人力审批', '同意。    可以', '4');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('8', '2020-06-16 11:13:15', '2020-06-16 11:13:15', '8', '采购一批纸巾', '22', '财务审批', '同意。    可以', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('9', '2020-06-16 11:13:36', '2020-06-16 11:13:36', '8', '采购一批纸巾', '21', '董事长审批', '同意。    可以。', '6');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('10', '2020-06-16 11:14:27', '2020-06-16 11:14:27', '9', '请假一个月', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('11', '2020-06-16 11:15:42', '2020-06-16 11:15:42', '9', '请假一个月', '26', '部门领导审批', '同意。    可以。', '6');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('12', '2020-06-16 11:16:23', '2020-06-16 11:16:23', '9', '请假一个月', '25', '财务审批', '同意。    好的。', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('13', '2020-06-16 11:16:57', '2020-06-16 11:16:57', '9', '请假一个月', '24', '人力审批', '同意。    可以', '4');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('14', '2020-06-16 11:19:00', '2020-06-16 11:19:00', '10', '采购一批水果', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('15', '2020-06-16 11:19:30', '2020-06-16 11:19:30', '10', '采购一批水果', '28', '财务审批', '同意。    可以。', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('16', '2020-06-16 11:19:55', '2020-06-16 11:19:55', '10', '采购一批水果', '29', '人力审批', '拒绝。    不行。', '4');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('17', '2020-06-16 11:23:51', '2020-06-16 11:23:51', '11', '请假两天', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('18', '2020-06-17 09:49:58', '2020-06-17 09:49:58', '12', '水电费费', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('19', '2020-06-17 09:53:16', '2020-06-17 09:53:16', '12', '水电费费', '35', 'a', '同意。    好的。', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('20', '2020-06-17 10:31:10', '2020-06-17 10:31:10', '12', '水电费费', '0', '', '以管理员身份冻结流程', '2');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('21', '2020-06-17 10:31:14', '2020-06-17 10:31:14', '12', '水电费费', '0', '', '以管理员身份删除流程', '2');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('22', '2020-06-17 10:31:37', '2020-06-17 10:31:37', '13', '哈哈', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('23', '2020-06-17 10:32:30', '2020-06-17 10:32:30', '13', '哈哈', '38', 'a', '同意。    同意', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('24', '2020-06-17 10:32:39', '2020-06-17 10:32:39', '13', '哈哈', '38', 'a', '同意。    同意。', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('25', '2020-06-17 10:33:11', '2020-06-17 10:33:11', '13', '哈哈', '37', 'b', '同意。    同意。', '4');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('26', '2020-06-17 10:33:37', '2020-06-17 10:33:37', '13', '哈哈', '36', 'c', '同意。    tongyi', '6');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('27', '2020-06-17 10:33:44', '2020-06-17 10:33:44', '11', '请假两天', '32', '部门领导审批', '同意。    togn', '6');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('28', '2020-06-17 13:12:09', '2020-06-17 13:12:09', '13', '哈哈', '0', '', '以管理员身份冻结流程', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('29', '2020-06-17 13:12:13', '2020-06-17 13:12:13', '13', '哈哈', '0', '', '以管理员身份删除流程', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('30', '2020-06-17 13:15:59', '2020-06-17 13:15:59', '14', '采购一批蔬菜', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('31', '2020-06-17 13:16:31', '2020-06-17 13:16:31', '14', '采购一批蔬菜', '41', '财务审批', '同意。    同意。', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('32', '2020-06-17 13:16:49', '2020-06-17 13:16:49', '14', '采购一批蔬菜', '41', '财务审批', '同意。    可以。', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('33', '2020-06-17 13:17:08', '2020-06-17 13:17:08', '14', '采购一批蔬菜', '40', '人力审批', '同意。    好的。', '4');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('34', '2020-06-17 13:17:24', '2020-06-17 13:17:24', '14', '采购一批蔬菜', '39', '董事长审批', '同意。    可以。', '6');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('35', '2020-06-17 13:17:59', '2020-06-17 13:17:59', '15', '采购一批猪肉', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('36', '2020-06-17 13:18:34', '2020-06-17 13:18:34', '15', '采购一批猪肉', '44', '财务审批', '同意。    可以。', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('37', '2020-06-17 13:19:10', '2020-06-17 13:19:10', '15', '采购一批猪肉', '44', '财务审批', '拒绝。    不行。', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('38', '2020-06-17 13:22:36', '2020-06-17 13:22:36', '10', '采购一批水果', '0', '', '用户撤回流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('39', '2020-06-17 13:22:41', '2020-06-17 13:22:41', '10', '采购一批水果', '0', '', '用户删除流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('40', '2020-06-17 13:22:48', '2020-06-17 13:22:48', '11', '请假两天', '0', '', '用户撤回流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('41', '2020-06-17 13:22:52', '2020-06-17 13:22:52', '11', '请假两天', '0', '', '用户删除流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('42', '2020-06-17 13:23:09', '2020-06-17 13:23:09', '15', '采购一批猪肉', '0', '', '用户撤回流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('43', '2020-06-17 13:23:13', '2020-06-17 13:23:13', '15', '采购一批猪肉', '0', '', '用户删除流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('44', '2020-06-17 13:28:09', '2020-06-17 13:28:09', '16', '多人多部门审批演示', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('45', '2020-06-17 13:29:15', '2020-06-17 13:29:15', '16', '多人多部门审批演示', '48', '公司人力审批', '同意。    可以', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('46', '2020-06-17 13:29:31', '2020-06-17 13:29:31', '16', '多人多部门审批演示', '48', '公司人力审批', '同意。    好的。', '2');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('47', '2020-06-17 13:30:05', '2020-06-17 13:30:05', '16', '多人多部门审批演示', '47', '总部人力审批', '同意。    可以。', '4');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('48', '2020-06-17 13:30:24', '2020-06-17 13:30:24', '16', '多人多部门审批演示', '46', '财务审批', '同意。    可以。', '5');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('49', '2020-06-17 13:30:42', '2020-06-17 13:30:42', '16', '多人多部门审批演示', '45', '董事长审批', '同意。    好的。', '6');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('50', '2020-06-17 13:31:34', '2020-06-17 13:31:34', '17', '11', '0', '', '发起申请', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('51', '2020-06-17 13:31:56', '2020-06-17 13:31:56', '17', '11', '52', '公司人力审批', '拒绝。    buxing', '1');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('52', '2020-06-17 13:32:30', '2020-06-17 13:32:30', '17', '11', '0', '', '用户撤回流程', '7');
INSERT INTO `tb_flow_instance_operate_history` VALUES ('53', '2020-06-17 13:32:33', '2020-06-17 13:32:33', '17', '11', '0', '', '用户删除流程', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template
-- ----------------------------
INSERT INTO `tb_flow_template` VALUES ('1', '2020-06-14 15:22:18', '2020-06-14 15:23:46', '0', '请假审批');
INSERT INTO `tb_flow_template` VALUES ('2', '2020-06-14 18:15:54', '2020-06-14 18:17:00', '0', '发薪申请');
INSERT INTO `tb_flow_template` VALUES ('3', '2020-06-15 12:16:04', '2020-06-15 12:17:18', '0', '采购审批');
INSERT INTO `tb_flow_template` VALUES ('5', '2020-06-17 13:12:55', '2020-06-17 13:15:21', '0', '多人审批');
INSERT INTO `tb_flow_template` VALUES ('6', '2020-06-17 13:24:48', '2020-06-17 13:27:40', '0', '多人多部门审批');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template_node
-- ----------------------------
INSERT INTO `tb_flow_template_node` VALUES ('1', '2020-06-14 15:22:44', '2020-06-14 15:22:44', '', '0', '人力审批', '0', '0', '1', '1');
INSERT INTO `tb_flow_template_node` VALUES ('2', '2020-06-14 15:23:00', '2020-06-14 15:23:00', '', '1', '财务审批', '0', '1', '1', '1,2');
INSERT INTO `tb_flow_template_node` VALUES ('3', '2020-06-14 15:23:22', '2020-06-14 15:23:22', '', '2', '部门领导审批', '0', '2', '1', '1,2,3');
INSERT INTO `tb_flow_template_node` VALUES ('4', '2020-06-14 18:16:28', '2020-06-14 18:16:28', '', '0', '董事长审批', '0', '0', '2', '4');
INSERT INTO `tb_flow_template_node` VALUES ('5', '2020-06-14 18:16:51', '2020-06-14 18:16:51', '', '1', '财务审批', '0', '4', '2', '4,5');
INSERT INTO `tb_flow_template_node` VALUES ('6', '2020-06-15 12:16:37', '2020-06-15 12:16:37', '', '0', '董事长审批', '0', '0', '3', '6');
INSERT INTO `tb_flow_template_node` VALUES ('7', '2020-06-15 12:17:01', '2020-06-15 12:17:01', '', '1', '财务审批', '0', '6', '3', '6,7');
INSERT INTO `tb_flow_template_node` VALUES ('8', '2020-06-15 12:17:14', '2020-06-15 12:17:14', '', '1', '人力审批', '0', '6', '3', '6,8');
INSERT INTO `tb_flow_template_node` VALUES ('12', '2020-06-17 13:13:38', '2020-06-17 13:13:38', '', '0', '董事长审批', '0', '0', '5', '12');
INSERT INTO `tb_flow_template_node` VALUES ('13', '2020-06-17 13:14:01', '2020-06-17 13:14:01', '', '1', '人力审批', '0', '12', '5', '12,13');
INSERT INTO `tb_flow_template_node` VALUES ('14', '2020-06-17 13:14:35', '2020-06-17 13:14:35', '', '2', '财务审批', '1', '13', '5', '12,13,14');
INSERT INTO `tb_flow_template_node` VALUES ('15', '2020-06-17 13:25:12', '2020-06-17 13:25:12', '', '0', '董事长审批', '0', '0', '6', '15');
INSERT INTO `tb_flow_template_node` VALUES ('16', '2020-06-17 13:25:35', '2020-06-17 13:25:35', '', '1', '财务审批', '0', '15', '6', '15,16');
INSERT INTO `tb_flow_template_node` VALUES ('17', '2020-06-17 13:26:02', '2020-06-17 13:26:02', '', '1', '总部人力审批', '0', '15', '6', '15,17');
INSERT INTO `tb_flow_template_node` VALUES ('18', '2020-06-17 13:26:29', '2020-06-17 13:27:20', '', '2', '公司人力审批', '1', '17', '6', '15,17,18');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_flow_template_node_user_task
-- ----------------------------
INSERT INTO `tb_flow_template_node_user_task` VALUES ('1', '2020-06-14 15:22:44', '2020-06-14 15:22:44', '1', '1', '4');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('2', '2020-06-14 15:23:00', '2020-06-14 15:23:00', '1', '2', '5');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('3', '2020-06-14 15:23:22', '2020-06-14 15:23:22', '1', '3', '6');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('4', '2020-06-14 18:16:28', '2020-06-14 18:16:28', '2', '4', '6');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('5', '2020-06-14 18:16:51', '2020-06-14 18:16:51', '2', '5', '5');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('6', '2020-06-15 12:16:37', '2020-06-15 12:16:37', '3', '6', '6');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('7', '2020-06-15 12:17:01', '2020-06-15 12:17:01', '3', '7', '5');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('8', '2020-06-15 12:17:14', '2020-06-15 12:17:14', '3', '8', '4');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('13', '2020-06-17 13:13:38', '2020-06-17 13:13:38', '5', '12', '6');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('14', '2020-06-17 13:14:01', '2020-06-17 13:14:01', '5', '13', '4');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('15', '2020-06-17 13:14:35', '2020-06-17 13:14:35', '5', '14', '5');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('16', '2020-06-17 13:14:35', '2020-06-17 13:14:35', '5', '14', '1');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('17', '2020-06-17 13:25:12', '2020-06-17 13:25:12', '6', '15', '6');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('18', '2020-06-17 13:25:35', '2020-06-17 13:25:35', '6', '16', '5');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('19', '2020-06-17 13:26:02', '2020-06-17 13:26:02', '6', '17', '4');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('21', '2020-06-17 13:27:20', '2020-06-17 13:27:20', '6', '18', '1');
INSERT INTO `tb_flow_template_node_user_task` VALUES ('22', '2020-06-17 13:27:20', '2020-06-17 13:27:20', '6', '18', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `tb_menu_role_group_releation` VALUES ('76', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '5', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('77', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '6', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('78', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '7', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('79', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '8', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('80', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '9', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('81', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '12', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('82', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '13', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('83', '2020-06-13 20:19:58', '2020-06-13 20:19:58', '14', '2');
INSERT INTO `tb_menu_role_group_releation` VALUES ('84', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '5', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('85', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '6', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('86', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '7', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('87', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '8', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('88', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '9', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('89', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '10', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('90', '2020-06-13 20:20:21', '2020-06-13 20:20:21', '11', '3');
INSERT INTO `tb_menu_role_group_releation` VALUES ('91', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '5', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('92', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '6', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('93', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '7', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('94', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '8', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('95', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '9', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('96', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '17', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('97', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '20', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('98', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '22', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('99', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '21', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('100', '2020-06-13 20:20:35', '2020-06-13 20:20:35', '23', '4');
INSERT INTO `tb_menu_role_group_releation` VALUES ('110', '2020-06-13 20:20:55', '2020-06-13 20:20:55', '5', '6');
INSERT INTO `tb_menu_role_group_releation` VALUES ('111', '2020-06-13 20:20:55', '2020-06-13 20:20:55', '6', '6');
INSERT INTO `tb_menu_role_group_releation` VALUES ('112', '2020-06-13 20:20:55', '2020-06-13 20:20:55', '7', '6');
INSERT INTO `tb_menu_role_group_releation` VALUES ('113', '2020-06-13 20:20:55', '2020-06-13 20:20:55', '8', '6');
INSERT INTO `tb_menu_role_group_releation` VALUES ('114', '2020-06-13 20:20:55', '2020-06-13 20:20:55', '9', '6');
INSERT INTO `tb_menu_role_group_releation` VALUES ('115', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '5', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('116', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '6', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('117', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '7', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('118', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '8', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('119', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '9', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('120', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '18', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('121', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '24', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('122', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '25', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('123', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '26', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('124', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '19', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('125', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '27', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('126', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '28', '5');
INSERT INTO `tb_menu_role_group_releation` VALUES ('127', '2020-06-14 18:10:31', '2020-06-14 18:10:31', '29', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('1', '2020-06-13 21:43:29', '2020-06-13 21:43:29', '    长达八百多公里的青岛海岸线，不但有着迷人的风景，而且有丰富的自然资源和特产。著名的栈桥海滨是青岛海边观光必游之地。另外，众多的沙滩浴场，可以让游客尽情的享受海洋的乐趣。之后自青岛圆满举办了2008年奥运会帆船比赛，海上运动场的建设，是集旅游和体育比赛为一体的新型旅游胜地。\n    青岛，别称岛城、琴岛、胶澳，是山东省副省级市、计划单列市 [1]  ，国务院批复确定的中国沿海重要中心城市和滨海度假旅游城市、国际性港口城市 [2]。截至2019年，全市下辖7个区、代管3个县级市，总面积11293平方千米，2019年全市常住总人口949.98万人。其中，市区常住人口645.20万人，常住外来人口达161万人。[3-4]\n    青岛地处中国华东地区、山东半岛东南、东濒黄海，位于中日韩自贸区的前沿地带，是山东省经济中心、国家重要的现代海洋产业发展先行区、东北亚国际航运枢纽、海上体育运动基地[5]，一带一路新亚欧大陆桥经济走廊主要节点城市和海上合作战略支点。[6]\n青岛是国家历史文化名城、中国道教发祥地[7]。因树木繁多，四季常青而得名。 [8]  1891年清政府驻兵建制，[7]青岛是2008北京奥运会和第13届残奥会帆船比赛举办城市，是中国帆船之都，[9]亚洲最佳航海城，[6]世界啤酒之城、联合国“电影之都” [10]  、全国首批沿海开放城市、全国文明城市、 [11]  中国最具幸福感城市。被誉为“东方瑞士” [12]、中国品牌之都。\n青岛是国际海洋科研教育中心，驻有山东大学（青岛）、北京航空航天大学青岛校区、[13]中国海洋大学等高校26所，引进清华大学、北京大学等29所高校。[14-16]青岛的异域建筑种类繁多，被称作“万国建筑博览会”。八大关建筑群荣膺“中国最美城区”称号。[6]', '5', '1', '美丽的青岛');
INSERT INTO `tb_notice` VALUES ('2', '2020-06-13 21:43:57', '2020-06-13 21:44:19', '    长达八百多公里的青岛海岸线，不但有着迷人的风景，而且有丰富的自然资源和特产。著名的栈桥海滨是青岛海边观光必游之地。另外，众多的沙滩浴场，可以让游客尽情的享受海洋的乐趣。之后自青岛圆满举办了2008年奥运会帆船比赛，海上运动场的建设，是集旅游和体育比赛为一体的新型旅游胜地。\n    青岛，别称岛城、琴岛、胶澳，是山东省副省级市、计划单列市 [1]  ，国务院批复确定的中国沿海重要中心城市和滨海度假旅游城市、国际性港口城市 [2]。截至2019年，全市下辖7个区、代管3个县级市，总面积11293平方千米，2019年全市常住总人口949.98万人。其中，市区常住人口645.20万人，常住外来人口达161万人。[3-4]\n    青岛地处中国华东地区、山东半岛东南、东濒黄海，位于中日韩自贸区的前沿地带，是山东省经济中心、国家重要的现代海洋产业发展先行区、东北亚国际航运枢纽、海上体育运动基地[5]，一带一路新亚欧大陆桥经济走廊主要节点城市和海上合作战略支点。[6]\n青岛是国家历史文化名城、中国道教发祥地[7]。因树木繁多，四季常青而得名。 [8]  1891年清政府驻兵建制，[7]青岛是2008北京奥运会和第13届残奥会帆船比赛举办城市，是中国帆船之都，[9]亚洲最佳航海城，[6]世界啤酒之城、联合国“电影之都” [10]  、全国首批沿海开放城市、全国文明城市、 [11]  中国最具幸福感城市。被誉为“东方瑞士” [12]、中国品牌之都。\n青岛是国际海洋科研教育中心，驻有山东大学（青岛）、北京航空航天大学青岛校区、[13]中国海洋大学等高校26所，引进清华大学、北京大学等29所高校。[14-16]青岛的异域建筑种类繁多，被称作“万国建筑博览会”。八大关建筑群荣膺“中国最美城区”称号。[6]', '4', '1', '美丽的济南');
INSERT INTO `tb_notice` VALUES ('3', '2020-06-13 21:48:03', '2020-06-13 21:48:03', '    长达八百多公里的青岛海岸线，不但有着迷人的风景，而且有丰富的自然资源和特产。著名的栈桥海滨是青岛海边观光必游之地。另外，众多的沙滩浴场，可以让游客尽情的享受海洋的乐趣。之后自青岛圆满举办了2008年奥运会帆船比赛，海上运动场的建设，是集旅游和体育比赛为一体的新型旅游胜地。\n    青岛，别称岛城、琴岛、胶澳，是山东省副省级市、计划单列市 [1]  ，国务院批复确定的中国沿海重要中心城市和滨海度假旅游城市、国际性港口城市 [2]。截至2019年，全市下辖7个区、代管3个县级市，总面积11293平方千米，2019年全市常住总人口949.98万人。其中，市区常住人口645.20万人，常住外来人口达161万人。[3-4]\n    青岛地处中国华东地区、山东半岛东南、东濒黄海，位于中日韩自贸区的前沿地带，是山东省经济中心、国家重要的现代海洋产业发展先行区、东北亚国际航运枢纽、海上体育运动基地[5]，一带一路新亚欧大陆桥经济走廊主要节点城市和海上合作战略支点。[6]\n青岛是国家历史文化名城、中国道教发祥地[7]。因树木繁多，四季常青而得名。 [8]  1891年清政府驻兵建制，[7]青岛是2008北京奥运会和第13届残奥会帆船比赛举办城市，是中国帆船之都，[9]亚洲最佳航海城，[6]世界啤酒之城、联合国“电影之都” [10]  、全国首批沿海开放城市、全国文明城市、 [11]  中国最具幸福感城市。被誉为“东方瑞士” [12]、中国品牌之都。\n青岛是国际海洋科研教育中心，驻有山东大学（青岛）、北京航空航天大学青岛校区、[13]中国海洋大学等高校26所，引进清华大学、北京大学等29所高校。[14-16]青岛的异域建筑种类繁多，被称作“万国建筑博览会”。八大关建筑群荣膺“中国最美城区”称号。[6]', '3', '1', '美丽的烟台');
INSERT INTO `tb_notice` VALUES ('4', '2020-06-13 21:49:18', '2020-06-13 21:49:18', '    长达八百多公里的青岛海岸线，不但有着迷人的风景，而且有丰富的自然资源和特产。著名的栈桥海滨是青岛海边观光必游之地。另外，众多的沙滩浴场，可以让游客尽情的享受海洋的乐趣。之后自青岛圆满举办了2008年奥运会帆船比赛，海上运动场的建设，是集旅游和体育比赛为一体的新型旅游胜地。\n    青岛，别称岛城、琴岛、胶澳，是山东省副省级市、计划单列市 [1]  ，国务院批复确定的中国沿海重要中心城市和滨海度假旅游城市、国际性港口城市 [2]。截至2019年，全市下辖7个区、代管3个县级市，总面积11293平方千米，2019年全市常住总人口949.98万人。其中，市区常住人口645.20万人，常住外来人口达161万人。[3-4]\n    青岛地处中国华东地区、山东半岛东南、东濒黄海，位于中日韩自贸区的前沿地带，是山东省经济中心、国家重要的现代海洋产业发展先行区、东北亚国际航运枢纽、海上体育运动基地[5]，一带一路新亚欧大陆桥经济走廊主要节点城市和海上合作战略支点。[6]\n青岛是国家历史文化名城、中国道教发祥地[7]。因树木繁多，四季常青而得名。 [8]  1891年清政府驻兵建制，[7]青岛是2008北京奥运会和第13届残奥会帆船比赛举办城市，是中国帆船之都，[9]亚洲最佳航海城，[6]世界啤酒之城、联合国“电影之都” [10]  、全国首批沿海开放城市、全国文明城市、 [11]  中国最具幸福感城市。被誉为“东方瑞士” [12]、中国品牌之都。\n青岛是国际海洋科研教育中心，驻有山东大学（青岛）、北京航空航天大学青岛校区、[13]中国海洋大学等高校26所，引进清华大学、北京大学等29所高校。[14-16]青岛的异域建筑种类繁多，被称作“万国建筑博览会”。八大关建筑群荣膺“中国最美城区”称号。[6]', '2', '1', '美丽的北京');
INSERT INTO `tb_notice` VALUES ('5', '2020-06-13 21:49:43', '2020-06-13 21:49:43', '    长达八百多公里的青岛海岸线，不但有着迷人的风景，而且有丰富的自然资源和特产。著名的栈桥海滨是青岛海边观光必游之地。另外，众多的沙滩浴场，可以让游客尽情的享受海洋的乐趣。之后自青岛圆满举办了2008年奥运会帆船比赛，海上运动场的建设，是集旅游和体育比赛为一体的新型旅游胜地。\n    青岛，别称岛城、琴岛、胶澳，是山东省副省级市、计划单列市 [1]  ，国务院批复确定的中国沿海重要中心城市和滨海度假旅游城市、国际性港口城市 [2]。截至2019年，全市下辖7个区、代管3个县级市，总面积11293平方千米，2019年全市常住总人口949.98万人。其中，市区常住人口645.20万人，常住外来人口达161万人。[3-4]\n    青岛地处中国华东地区、山东半岛东南、东濒黄海，位于中日韩自贸区的前沿地带，是山东省经济中心、国家重要的现代海洋产业发展先行区、东北亚国际航运枢纽、海上体育运动基地[5]，一带一路新亚欧大陆桥经济走廊主要节点城市和海上合作战略支点。[6]\n青岛是国家历史文化名城、中国道教发祥地[7]。因树木繁多，四季常青而得名。 [8]  1891年清政府驻兵建制，[7]青岛是2008北京奥运会和第13届残奥会帆船比赛举办城市，是中国帆船之都，[9]亚洲最佳航海城，[6]世界啤酒之城、联合国“电影之都” [10]  、全国首批沿海开放城市、全国文明城市、 [11]  中国最具幸福感城市。被誉为“东方瑞士” [12]、中国品牌之都。\n青岛是国际海洋科研教育中心，驻有山东大学（青岛）、北京航空航天大学青岛校区、[13]中国海洋大学等高校26所，引进清华大学、北京大学等29所高校。[14-16]青岛的异域建筑种类繁多，被称作“万国建筑博览会”。八大关建筑群荣膺“中国最美城区”称号。[6]', '1', '1', '美丽的杭州');
INSERT INTO `tb_notice` VALUES ('6', '2020-06-13 21:50:30', '2020-06-13 21:50:51', '    长达八百多公里的青岛海岸线，不但有着迷人的风景，而且有丰富的自然资源和特产。著名的栈桥海滨是青岛海边观光必游之地。另外，众多的沙滩浴场，可以让游客尽情的享受海洋的乐趣。之后自青岛圆满举办了2008年奥运会帆船比赛，海上运动场的建设，是集旅游和体育比赛为一体的新型旅游胜地。\n    青岛，别称岛城、琴岛、胶澳，是山东省副省级市、计划单列市 [1]  ，国务院批复确定的中国沿海重要中心城市和滨海度假旅游城市、国际性港口城市 [2]。截至2019年，全市下辖7个区、代管3个县级市，总面积11293平方千米，2019年全市常住总人口949.98万人。其中，市区常住人口645.20万人，常住外来人口达161万人。[3-4]\n    青岛地处中国华东地区、山东半岛东南、东濒黄海，位于中日韩自贸区的前沿地带，是山东省经济中心、国家重要的现代海洋产业发展先行区、东北亚国际航运枢纽、海上体育运动基地[5]，一带一路新亚欧大陆桥经济走廊主要节点城市和海上合作战略支点。[6]\n青岛是国家历史文化名城、中国道教发祥地[7]。因树木繁多，四季常青而得名。 [8]  1891年清政府驻兵建制，[7]青岛是2008北京奥运会和第13届残奥会帆船比赛举办城市，是中国帆船之都，[9]亚洲最佳航海城，[6]世界啤酒之城、联合国“电影之都” [10]  、全国首批沿海开放城市、全国文明城市、 [11]  中国最具幸福感城市。被誉为“东方瑞士” [12]、中国品牌之都。\n青岛是国际海洋科研教育中心，驻有山东大学（青岛）、北京航空航天大学青岛校区、[13]中国海洋大学等高校26所，引进清华大学、北京大学等29所高校。[14-16]青岛的异域建筑种类繁多，被称作“万国建筑博览会”。八大关建筑群荣膺“中国最美城区”称号。[6]', '6', '1', '太平洋好大啊');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_role_group
-- ----------------------------
INSERT INTO `tb_role_group` VALUES ('1', '2018-07-24 11:51:57', '2020-06-13 20:12:07', '系统管理员', '系统管理员', '0');
INSERT INTO `tb_role_group` VALUES ('2', '2020-06-13 20:12:21', '2020-06-13 20:18:15', '流程管理员', '', '0');
INSERT INTO `tb_role_group` VALUES ('3', '2020-06-13 20:12:39', '2020-06-13 20:18:37', '公告管理员', '', '0');
INSERT INTO `tb_role_group` VALUES ('4', '2020-06-13 20:15:40', '2020-06-13 20:18:58', '人力管理员', '', '0');
INSERT INTO `tb_role_group` VALUES ('5', '2020-06-13 20:16:07', '2020-06-13 20:19:05', '财务管理员', '', '0');
INSERT INTO `tb_role_group` VALUES ('6', '2020-06-13 20:17:25', '2020-06-13 20:19:06', '普通员工', '', '0');

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
INSERT INTO `tb_system_setting` VALUES ('2', '2020-06-09 17:03:44', '2020-06-17 17:04:34', '设置公司收支时间截点', 'companyInOutLockTimeFlag', '2020-06-17 17:04:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user
-- ----------------------------
INSERT INTO `tb_sys_user` VALUES ('1', '2020-05-01 15:37:13', '2020-06-13 20:27:07', 'xiaoMing', '1', 'e10adc3949ba59abbe56e057f20f883e', '小明', '0');
INSERT INTO `tb_sys_user` VALUES ('2', '2020-06-13 20:27:49', '2020-06-13 20:27:49', 'xiaoHong', '2', 'e10adc3949ba59abbe56e057f20f883e', '小红', '0');
INSERT INTO `tb_sys_user` VALUES ('3', '2020-06-13 20:28:22', '2020-06-13 20:28:22', 'xiaoHua', '3', 'e10adc3949ba59abbe56e057f20f883e', '小花', '0');
INSERT INTO `tb_sys_user` VALUES ('4', '2020-06-13 20:29:07', '2020-06-13 20:29:07', 'xiaoHuang', '4', 'e10adc3949ba59abbe56e057f20f883e', '小黄', '0');
INSERT INTO `tb_sys_user` VALUES ('5', '2020-06-13 20:29:45', '2020-06-13 20:29:45', 'xiaoLan', '5', 'e10adc3949ba59abbe56e057f20f883e', '小蓝', '0');
INSERT INTO `tb_sys_user` VALUES ('6', '2020-06-13 20:30:27', '2020-06-13 20:30:27', 'xiaoQing', '6', 'e10adc3949ba59abbe56e057f20f883e', '小青', '0');
INSERT INTO `tb_sys_user` VALUES ('7', '2020-06-14 11:51:01', '2020-06-14 11:51:01', 'xiaoNiu', '6', 'e10adc3949ba59abbe56e057f20f883e', '小牛', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user_log
-- ----------------------------
INSERT INTO `tb_sys_user_log` VALUES ('1', '2020-06-14 15:21:50', '2020-06-14 15:21:50', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('2', '2020-06-14 15:22:18', '2020-06-14 15:22:18', 0x5B7B226964223A312C2263726561746544617465223A22323032302D30362D31342031353A32323A3138222C226C6173744D6F646966696564223A22323032302D30362D31342031353A32323A3138222C2274656D706C6174654E616D65223A22E8AFB7E58187E5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D312C20637265617465446174653D53756E204A756E2031342031353A32323A313820474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031353A32323A313820474D542B30383A30302032303230292C2074656D706C6174654E616D653DE8AFB7E58187E5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '2');
INSERT INTO `tb_sys_user_log` VALUES ('3', '2020-06-14 15:22:44', '2020-06-14 15:22:44', 0x5B7B226964223A312C2263726561746544617465223A22323032302D30362D31342031353A32323A3434222C226C6173744D6F646966696564223A22323032302D30362D31342031353A32323A3434222C226E6F64654E616D65223A22E4BABAE58A9BE5AEA1E689B9222C2274656D706C6174654964223A312C22706964223A302C226E6F64654C6576656C223A302C22746F74616C436F6465223A2231222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B345D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D312C20637265617465446174653D53756E204A756E2031342031353A32323A343420474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031353A32323A343420474D542B30383A30302032303230292C206E6F64654E616D653DE4BABAE58A9BE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D312C207069643D302C206E6F64654C6576656C3D302C20746F74616C436F64653D312C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B345D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('4', '2020-06-14 15:23:00', '2020-06-14 15:23:00', 0x5B7B226964223A322C2263726561746544617465223A22323032302D30362D31342031353A32333A3030222C226C6173744D6F646966696564223A22323032302D30362D31342031353A32333A3030222C226E6F64654E616D65223A22E8B4A2E58AA1E5AEA1E689B9222C2274656D706C6174654964223A312C22706964223A312C226E6F64654C6576656C223A312C22746F74616C436F6465223A22312C32222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B355D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D322C20637265617465446174653D53756E204A756E2031342031353A32333A303020474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031353A32333A303020474D542B30383A30302032303230292C206E6F64654E616D653DE8B4A2E58AA1E5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D312C207069643D312C206E6F64654C6576656C3D312C20746F74616C436F64653D312C322C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B355D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('5', '2020-06-14 15:23:22', '2020-06-14 15:23:22', 0x5B7B226964223A332C2263726561746544617465223A22323032302D30362D31342031353A32333A3232222C226C6173744D6F646966696564223A22323032302D30362D31342031353A32333A3232222C226E6F64654E616D65223A22E983A8E997A8E9A286E5AFBCE5AEA1E689B9222C2274656D706C6174654964223A312C22706964223A322C226E6F64654C6576656C223A322C22746F74616C436F6465223A22312C322C33222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B365D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D332C20637265617465446174653D53756E204A756E2031342031353A32333A323220474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031353A32333A323220474D542B30383A30302032303230292C206E6F64654E616D653DE983A8E997A8E9A286E5AFBCE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D312C207069643D322C206E6F64654C6576656C3D322C20746F74616C436F64653D312C322C332C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B365D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('6', '2020-06-14 15:23:46', '2020-06-14 15:23:46', 0x5B312C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '2');
INSERT INTO `tb_sys_user_log` VALUES ('7', '2020-06-14 15:23:51', '2020-06-14 15:23:51', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('8', '2020-06-14 15:24:09', '2020-06-14 15:24:09', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226265663062623164663732373432383662636636343137376136623935303161222C22636F6465223A2237303239227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D383466383164376635323030343565616265643932656364366634386565373564386132383466363162383834326264396366303131383139653830623165357D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('9', '2020-06-14 15:24:36', '2020-06-14 15:24:36', 0x5B312C22E8AFB7E58187E4B880E5A4A9222C2220202020E8BAABE4BD93E4B88DE98082EFBC8CE5B88CE69C9BE8AFB7E58187E4B880E5A4A9E38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('10', '2020-06-14 15:25:53', '2020-06-14 15:25:53', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('11', '2020-06-14 15:26:09', '2020-06-14 15:26:09', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226364356136316564383564353438346438656463313037396535396663333763222C22636F6465223A2230313538227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D366564373035373335386265343636326231313631623465356265633131353766343535313736343564656434353231626665386131653037636463623661617D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('12', '2020-06-14 15:26:22', '2020-06-14 15:26:22', 0x5B7B226964223A312C22757365725461736B4964223A332C22617070726F76616C4170706C794F70657261746554797065223A302C22617070726F76616C4170706C79436F6E74656E74223A2220202020E4B88DE5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('13', '2020-06-14 15:26:53', '2020-06-14 15:26:53', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('14', '2020-06-14 15:27:10', '2020-06-14 15:27:10', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223437316563353230336561623433396661613233343162353562306333333062222C22636F6465223A2232313531227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D363533313536363561373464343037326165613139353334656234313466383837356661316261633461393334366165393766323131303236366339643666327D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('15', '2020-06-14 15:27:44', '2020-06-14 15:27:44', 0x5B312C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('16', '2020-06-14 15:28:11', '2020-06-14 15:28:11', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226162373365376339653864383462656562396566366565653939326666666230222C22636F6465223A2230363236227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D343565623230653236653639343834373932633632623761623535306661633264666637396366383538356634396131383330383436313836366536663465647D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('17', '2020-06-14 15:28:40', '2020-06-14 15:28:40', 0x5B312C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('18', '2020-06-14 15:29:01', '2020-06-14 15:29:01', 0x5B312C22E8AFB7E58187E4B880E591A8222C2220202020E8BAABE4BD93E4B88DE98082EFBC8CE8AFB7E58187E4B880E591A8E38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('19', '2020-06-14 15:29:20', '2020-06-14 15:29:20', 0x5B7B226964223A322C22757365725461736B4964223A362C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('20', '2020-06-14 17:14:38', '2020-06-14 17:14:38', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('21', '2020-06-14 17:15:23', '2020-06-14 17:15:23', 0x5B312C22E8AFB7E58187E4B8A4E5A4A9222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('22', '2020-06-14 17:15:26', '2020-06-14 17:15:26', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('23', '2020-06-14 17:15:52', '2020-06-14 17:15:52', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223831343933323832633261303432643738353934386465633263316134663366222C22636F6465223A2239313839227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D633839353036363732613061343935346139613130336462323632353966616235373931343536616635326534316131396530336462333466316239373665637D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('24', '2020-06-14 17:17:38', '2020-06-14 17:17:38', 0x5B7B226964223A332C22757365725461736B4964223A392C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848F227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('25', '2020-06-14 17:19:43', '2020-06-14 17:19:43', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('26', '2020-06-14 17:20:51', '2020-06-14 17:20:51', 0x5B322C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('27', '2020-06-14 17:20:57', '2020-06-14 17:20:57', 0x5B332C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('28', '2020-06-14 17:21:04', '2020-06-14 17:21:04', 0x5B332C325D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('29', '2020-06-14 17:21:09', '2020-06-14 17:21:09', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('30', '2020-06-14 17:21:25', '2020-06-14 17:21:26', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226630303038636466646166343431313662376237616466373138303932623665222C22636F6465223A2239333838227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D303466303930373231383630346161316231303264353764303137333430366532326532356566393035396234366635383163643861346432343434303537657D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('31', '2020-06-14 17:21:44', '2020-06-14 17:21:44', 0x5B322C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('32', '2020-06-14 17:21:49', '2020-06-14 17:21:49', 0x5B322C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('33', '2020-06-14 17:22:38', '2020-06-14 17:22:38', 0x5B312C22E8AFB7E58187E4B880E5A4A9222C2220202020E8BAABE4BD93E4B88DE98082EFBC8CE8AFB7E58187E4B880E5A4A9E38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('34', '2020-06-14 17:22:41', '2020-06-14 17:22:41', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('35', '2020-06-14 17:22:51', '2020-06-14 17:22:51', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226233306431333265326435373436353138383862386439653635396339363330222C22636F6465223A2239313537227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D366639313237306464316336343331636234613062363731623531386633616261303362643135316335626134393465613539323830636333383732646231347D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('36', '2020-06-14 17:23:16', '2020-06-14 17:23:16', 0x5B7B226964223A342C22757365725461736B4964223A31322C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FEFBC8CE5A5BDE5A5BDE4BC91E681AFE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('37', '2020-06-14 17:23:30', '2020-06-14 17:23:30', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('38', '2020-06-14 17:23:39', '2020-06-14 17:23:39', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223361633263336263646238633436373638323336616565366632303634323431222C22636F6465223A2237353831227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D373736313064363636663831346234303931616263336565376330623936303636613534636333313366623134633936383539366432623565353966613062317D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('39', '2020-06-14 17:23:52', '2020-06-14 17:23:52', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('40', '2020-06-14 17:24:14', '2020-06-14 17:24:14', 0x5B7B226C6F67696E4E616D65223A227869616F486F6E67222C2275707764223A22313233343536222C226B6579223A226661303933626264363862613463613262633664643663396565343261656435222C22636F6465223A2238323733227D5D, '127.0.0.1', 0x7B7573657249643D322C20746F6B656E3D353839333464366563386666343366643966333933386665383863303337346665646431653066623238663034333034393031326137313937346534383933347D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('41', '2020-06-14 17:24:23', '2020-06-14 17:24:23', 0x5B342C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('42', '2020-06-14 17:24:27', '2020-06-14 17:24:27', 0x5B342C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('43', '2020-06-14 17:24:31', '2020-06-14 17:24:31', 0x5B342C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('44', '2020-06-14 17:24:36', '2020-06-14 17:24:36', 0x5B342C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('45', '2020-06-14 17:24:40', '2020-06-14 17:24:40', 0x5B342C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('46', '2020-06-14 17:24:44', '2020-06-14 17:24:44', 0x5B342C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('47', '2020-06-14 17:24:55', '2020-06-14 17:24:55', 0x5B342C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('48', '2020-06-14 17:24:59', '2020-06-14 17:24:59', 0x5B342C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('49', '2020-06-14 17:25:04', '2020-06-14 17:25:04', 0x5B342C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('50', '2020-06-14 17:25:09', '2020-06-14 17:25:09', 0x5B342C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('51', '2020-06-14 17:25:13', '2020-06-14 17:25:13', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('52', '2020-06-14 17:25:28', '2020-06-14 17:25:28', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223365396335363162303236343464383461656139323731316335366138326232222C22636F6465223A2238303336227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D353064643861336537643134346237663936366464653332663865383334323937306166316232376533383034333864613962626131616134373334373962627D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('53', '2020-06-14 17:25:42', '2020-06-14 17:25:42', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('54', '2020-06-14 17:25:57', '2020-06-14 17:25:57', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223739393563343363663563373466366138653134373834303434613664383837222C22636F6465223A2231373231227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D343664663938336661616131346230653931633266636461326466356534346364323432643761613432323134333032613264316433383865393935326565387D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('55', '2020-06-14 17:26:09', '2020-06-14 17:26:09', 0x5B7B226964223A342C22757365725461736B4964223A31312C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5B7B2E8AEB0E5BD95E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('56', '2020-06-14 17:26:27', '2020-06-14 17:26:27', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('57', '2020-06-14 17:26:37', '2020-06-14 17:26:37', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A226232653466613634313833353438393238646437323735616237613939616461222C22636F6465223A2238323139227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D346335666266396561386462343862393965303835393731346632633135353561656161323061396561366534346433613938363464373434373763323031327D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('58', '2020-06-14 17:26:47', '2020-06-14 17:26:47', 0x5B7B226964223A342C22757365725461736B4964223A31302C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('59', '2020-06-14 17:54:59', '2020-06-14 17:54:59', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('60', '2020-06-14 17:55:07', '2020-06-14 17:55:07', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223839363461333863333761303466313361316232373231636239333534353162222C22636F6465223A2238313535227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D663263663438363331356263346531356262303235383135633166356365653233366233633634363834303634666362396162636437346239333835313738377D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('61', '2020-06-14 18:02:57', '2020-06-14 18:02:57', 0x5B7B226964223A312C2263726561746544617465223A22323032302D30362D31342031383A30323A3537222C226C6173744D6F646966696564223A22323032302D30362D31342031383A30323A3537222C2264656C466C6167223A302C22656D706C6F7965724E616D65223A22E5B08FE6988E222C2267656E646572223A302C226964436172644E6F223A22313130313031313939303033303736373938222C22626972746864617944617465223A22313939302D30332D3037222C2270686F6E65223A223135363530303030303030222C226E6174697665506C616365223A22E58C97E4BAACE6B5B7E6B780222C226E6F77506C616365223A22E58C97E4BAACE6B5B7E6B780222C226465706172746D656E74223A22E7A094E58F91E983A8222C22706F736974696F6E223A22E9AB98E7BAA7E5B7A5E7A88BE5B888222C22656D706C6F79657254797065223A302C226F6E4A6F625374617465223A302C22656E747279436F6D70616E7954696D65223A22323031392D30362D3037222C2268696768657374456475636174696F6E223A362C226772616475617465645363686F6F6C223A22E58C97E4BAACE5A4A7E5ADA6222C2267726164756174656444617465223A22323031342D30362D3036222C22656D657267656E6379436F6E7461637450656F706C65223A22E5B08FE7BAA2222C22656D657267656E6379436F6E7461637450656F706C6550686F6E65223A2231353635313131313131222C2273616C617279416D6F756E74223A302C2273756273696479416D6F756E74223A302C22736F6369616C5365637572697479416D6F756E74506572736F6E616C223A302C22736F6369616C5365637572697479416D6F756E74436F6D70616E79223A302C22616363756D756C6174696F6E46756E64416D6F756E74506572736F6E616C223A302C22616363756D756C6174696F6E46756E64416D6F756E74436F6D70616E79223A302C22656D706C6F79657252656D61726B223A222020202020202020227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerEntry/add', '4');
INSERT INTO `tb_sys_user_log` VALUES ('62', '2020-06-14 18:07:17', '2020-06-14 18:07:17', 0x5B5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerEntry/importFile', '4');
INSERT INTO `tb_sys_user_log` VALUES ('63', '2020-06-14 18:07:40', '2020-06-14 18:07:40', 0x5B7B226964223A312C2270686F6E65223A223135363530303030303030222C226E6F77506C616365223A22E58C97E4BAACE6B5B7E6B780222C2268696768657374456475636174696F6E223A362C226772616475617465645363686F6F6C223A22E58C97E4BAACE5A4A7E5ADA6222C2267726164756174656444617465223A22323031342D30362D3036222C22656D657267656E6379436F6E7461637450656F706C65223A22E5B08FE7BAA2E5958A222C22656D657267656E6379436F6E7461637450656F706C6550686F6E65223A2231353635313131313131222C22656D706C6F79657252656D61726B223A222020202020202020227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerManage/updateEmployerLimitInfo', '4');
INSERT INTO `tb_sys_user_log` VALUES ('64', '2020-06-14 18:07:56', '2020-06-14 18:07:56', 0x5B7B226964223A312C2270686F6E65223A223135363530303030303030222C226E6F77506C616365223A22E58C97E4BAACE6B5B7E6B780222C2268696768657374456475636174696F6E223A362C226772616475617465645363686F6F6C223A22E58C97E4BAACE5A4A7E5ADA6222C2267726164756174656444617465223A22323031342D30362D3036222C22656D657267656E6379436F6E7461637450656F706C65223A22E5B08FE7BAA2222C22656D657267656E6379436F6E7461637450656F706C6550686F6E65223A2231353635313131313131222C22656D706C6F79657252656D61726B223A222020202020202020227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerManage/updateEmployerLimitInfo', '4');
INSERT INTO `tb_sys_user_log` VALUES ('65', '2020-06-14 18:08:01', '2020-06-14 18:08:01', 0x5B315D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerManage/delete', '4');
INSERT INTO `tb_sys_user_log` VALUES ('66', '2020-06-14 18:08:55', '2020-06-14 18:08:55', 0x5B7B226964223A322C226465706172746D656E74223A22E7A094E58F91E983A8222C22706F736974696F6E223A22E9AB98E7BAA7E5B7A5E7A88BE5B888222C22656D706C6F79657254797065223A302C226F6E4A6F625374617465223A302C22656E747279436F6D70616E7954696D65223A22323031392D30382D3031222C2273616C617279416D6F756E74223A31353030302E30302C2273756273696479416D6F756E74223A333030302E30302C22736F6369616C5365637572697479416D6F756E74506572736F6E616C223A313230302E30302C22736F6369616C5365637572697479416D6F756E74436F6D70616E79223A313230302E30302C22616363756D756C6174696F6E46756E64416D6F756E74506572736F6E616C223A302E30302C22616363756D756C6174696F6E46756E64416D6F756E74436F6D70616E79223A302E30302C22696E636F6D6544657363223A22222C22656D706C6F79657252656D61726B223A22227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerSalaryManage/updateEmployerSalaryPosition', '4');
INSERT INTO `tb_sys_user_log` VALUES ('67', '2020-06-14 18:09:16', '2020-06-14 18:09:16', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('68', '2020-06-14 18:09:29', '2020-06-14 18:09:29', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226265326631616536373039343462613761343562373237366534623532623665222C22636F6465223A2235373933227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D363432313361663035363163343962653830333535306538366231616332333665626137313233633238363834346364623136366663646666366234336337647D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('69', '2020-06-14 18:09:46', '2020-06-14 18:09:46', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('70', '2020-06-14 18:09:51', '2020-06-14 18:09:51', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223931643039356562343738393466313862646665613565373030666331376630222C22636F6465223A2233313838227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D333131613533363764646364343436633866616264353731643930656133366435643432646265313135333134653738616235393835636565363038623666647D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('71', '2020-06-14 18:09:58', '2020-06-14 18:09:58', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('72', '2020-06-14 18:10:12', '2020-06-14 18:10:12', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223638383639333932333330633462313561646639316432396538323764316331222C22636F6465223A2235303432227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D653564656535376530393936343138316132353137643862353634653264383661313230613862386562313634313131626232623261333235653565613165397D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('73', '2020-06-14 18:10:31', '2020-06-14 18:10:31', 0x5B7B22726F6C6547726F75704964223A352C226D656E75496473223A5B352C362C372C382C392C31382C32342C32352C32362C31392C32372C32382C32395D7D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/roleManage/menuSave', '1');
INSERT INTO `tb_sys_user_log` VALUES ('74', '2020-06-14 18:10:34', '2020-06-14 18:10:34', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('75', '2020-06-14 18:10:48', '2020-06-14 18:10:48', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226366313032636132376465343464323938653338343131303563393361643562222C22636F6465223A2233383631227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D643236343332306162366366346332366265663061626163326338326131306635623263393163653932633734333163386130663266653666656630666235337D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('76', '2020-06-14 18:13:49', '2020-06-14 18:13:49', 0x5B5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerSalaryPaidEntry/importFile', '5');
INSERT INTO `tb_sys_user_log` VALUES ('77', '2020-06-14 18:14:08', '2020-06-14 18:14:08', 0x5B5D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerSalaryPaidEntry/importFile', '5');
INSERT INTO `tb_sys_user_log` VALUES ('78', '2020-06-14 18:14:16', '2020-06-14 18:14:16', 0x5B325D, '127.0.0.1', 0x6E756C6C, '/planning/user/employerSalaryPaidManage/delete', '5');
INSERT INTO `tb_sys_user_log` VALUES ('79', '2020-06-14 18:15:05', '2020-06-14 18:15:05', 0x5B7B226964223A312C2263726561746544617465223A22323032302D30362D31342031383A31353A3035222C226C6173744D6F646966696564223A22323032302D30362D31342031383A31353A3035222C2264656C466C6167223A302C22656E747279557365724964223A352C22656E7472795573657252656D61726B223A2220202020222C22656E7472794E616D65223A22323032302D303620E5B7A5E8B584E694AFE587BA222C22656E74727944657363223A2220202020222C22656E747279416D6F756E74223A32303030302E30302C22656E74727954797065223A302C22656E74727948617070656E44617465223A22323032302D30362D3134227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutEntry/add', '5');
INSERT INTO `tb_sys_user_log` VALUES ('80', '2020-06-14 18:15:10', '2020-06-14 18:15:10', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('81', '2020-06-14 18:15:23', '2020-06-14 18:15:23', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226631343938333631373632353437613461616462626135383930343662366535222C22636F6465223A2239383030227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D346263353033653034663463346564366236366564646338626137353965656537643361386339363238376134626337626639353661353631653263623565357D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('82', '2020-06-14 18:15:34', '2020-06-14 18:15:34', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('83', '2020-06-14 18:15:39', '2020-06-14 18:15:39', 0x5B7B226C6F67696E4E616D65223A227869616F486F6E67222C2275707764223A22313233343536222C226B6579223A226531643135376635643332613462373538383665666661333264333038646532222C22636F6465223A2230383432227D5D, '127.0.0.1', 0x7B7573657249643D322C20746F6B656E3D336437343037363361666237346664396237313035393762613530336337626566656235386639663263633034653932383163663138653438353239636466357D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('84', '2020-06-14 18:15:54', '2020-06-14 18:15:54', 0x5B7B226964223A322C2263726561746544617465223A22323032302D30362D31342031383A31353A3534222C226C6173744D6F646966696564223A22323032302D30362D31342031383A31353A3534222C2274656D706C6174654E616D65223A22E58F91E896AAE794B3E8AFB7222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D322C20637265617465446174653D53756E204A756E2031342031383A31353A353420474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031383A31353A353420474D542B30383A30302032303230292C2074656D706C6174654E616D653DE58F91E896AAE794B3E8AFB72C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '2');
INSERT INTO `tb_sys_user_log` VALUES ('85', '2020-06-14 18:16:28', '2020-06-14 18:16:28', 0x5B7B226964223A342C2263726561746544617465223A22323032302D30362D31342031383A31363A3238222C226C6173744D6F646966696564223A22323032302D30362D31342031383A31363A3238222C226E6F64654E616D65223A22E891A3E4BA8BE995BFE5AEA1E689B9222C2274656D706C6174654964223A322C22706964223A302C226E6F64654C6576656C223A302C22746F74616C436F6465223A2234222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B365D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D342C20637265617465446174653D53756E204A756E2031342031383A31363A323820474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031383A31363A323820474D542B30383A30302032303230292C206E6F64654E616D653DE891A3E4BA8BE995BFE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D322C207069643D302C206E6F64654C6576656C3D302C20746F74616C436F64653D342C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B365D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('86', '2020-06-14 18:16:51', '2020-06-14 18:16:51', 0x5B7B226964223A352C2263726561746544617465223A22323032302D30362D31342031383A31363A3531222C226C6173744D6F646966696564223A22323032302D30362D31342031383A31363A3531222C226E6F64654E616D65223A22E8B4A2E58AA1E5AEA1E689B9222C2274656D706C6174654964223A322C22706964223A342C226E6F64654C6576656C223A312C22746F74616C436F6465223A22342C35222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B355D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D352C20637265617465446174653D53756E204A756E2031342031383A31363A353120474D542B30383A303020323032302C206C6173744D6F6469666965643D53756E204A756E2031342031383A31363A353120474D542B30383A30302032303230292C206E6F64654E616D653DE8B4A2E58AA1E5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D322C207069643D342C206E6F64654C6576656C3D312C20746F74616C436F64653D342C352C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B355D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('87', '2020-06-14 18:17:00', '2020-06-14 18:17:00', 0x5B322C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '2');
INSERT INTO `tb_sys_user_log` VALUES ('88', '2020-06-14 18:17:06', '2020-06-14 18:17:06', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('89', '2020-06-14 18:17:20', '2020-06-14 18:17:20', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223737626464613032623666303464613238636437366331636332633837646637222C22636F6465223A2239343037227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D326363353534353534626131346534336139353539363061336135653661613564386131633361383262313734623239616365386361313263656230306432327D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('90', '2020-06-14 18:18:32', '2020-06-14 18:18:32', 0x5B322C2232303230E5B9B436E69C88E5B7A5E8B584E58F91E694BEE5AEA1E689B9222C2220202020E5B7A5E8B584E58D95E38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('91', '2020-06-14 18:18:36', '2020-06-14 18:18:36', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('92', '2020-06-14 18:18:45', '2020-06-14 18:18:45', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226464393637323336326366353439343839616530393138366133633235363766222C22636F6465223A2232343332227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D393765393230336365383065346162386135313038643861343939313062336663333964636132636235636634366364396230336665336435646537336665667D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('93', '2020-06-14 18:19:13', '2020-06-14 18:19:13', 0x5B7B226964223A352C22757365725461736B4964223A31342C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5B7B2E5AEA1E99885EFBC8CE5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('94', '2020-06-14 18:19:17', '2020-06-14 18:19:17', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('95', '2020-06-14 18:19:26', '2020-06-14 18:19:26', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226136633062366236323735383435646161633863376465633062346235333663222C22636F6465223A2238353733227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D346564663038663631363737346338393932643662366366383636663365643764303336636134313165333534613330383630613236323237303839383036617D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('96', '2020-06-14 18:19:43', '2020-06-14 18:19:43', 0x5B7B226964223A352C22757365725461736B4964223A31332C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FEFBC8CE58FAFE4BBA5E58F91E694BEE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('97', '2020-06-14 18:20:05', '2020-06-14 18:20:05', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('98', '2020-06-14 18:20:13', '2020-06-14 18:20:13', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A226165376135323439656433623466373438613565643635646138373065623665222C22636F6465223A2236363033227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D646566616366306634353738346538356130653432396365326563353432663738636331623162303430656634646364383563363234363939656436386534347D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('99', '2020-06-14 18:20:36', '2020-06-14 18:20:36', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('100', '2020-06-14 18:20:50', '2020-06-14 18:20:50', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223961313238373961636139633465656462646265666639633663656263666636222C22636F6465223A2234393832227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D313266313337373334373834346461346138313261353337633966363334626432633038383965396630386434623030616238376263353231313931623437667D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('101', '2020-06-14 18:23:34', '2020-06-14 18:23:34', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('102', '2020-06-15 12:16:05', '2020-06-15 12:16:05', 0x5B7B226964223A332C2263726561746544617465223A22323032302D30362D31352031323A31363A3034222C226C6173744D6F646966696564223A22323032302D30362D31352031323A31363A3034222C2274656D706C6174654E616D65223A22E98787E8B4ADE5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D332C20637265617465446174653D4D6F6E204A756E2031352031323A31363A303420474D542B30383A303020323032302C206C6173744D6F6469666965643D4D6F6E204A756E2031352031323A31363A303420474D542B30383A30302032303230292C2074656D706C6174654E616D653DE98787E8B4ADE5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('103', '2020-06-15 12:16:37', '2020-06-15 12:16:37', 0x5B7B226964223A362C2263726561746544617465223A22323032302D30362D31352031323A31363A3337222C226C6173744D6F646966696564223A22323032302D30362D31352031323A31363A3337222C226E6F64654E616D65223A22E891A3E4BA8BE995BFE5AEA1E689B9222C2274656D706C6174654964223A332C22706964223A302C226E6F64654C6576656C223A302C22746F74616C436F6465223A2236222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B365D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D362C20637265617465446174653D4D6F6E204A756E2031352031323A31363A333720474D542B30383A303020323032302C206C6173744D6F6469666965643D4D6F6E204A756E2031352031323A31363A333720474D542B30383A30302032303230292C206E6F64654E616D653DE891A3E4BA8BE995BFE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D332C207069643D302C206E6F64654C6576656C3D302C20746F74616C436F64653D362C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B365D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('104', '2020-06-15 12:17:01', '2020-06-15 12:17:01', 0x5B7B226964223A372C2263726561746544617465223A22323032302D30362D31352031323A31373A3031222C226C6173744D6F646966696564223A22323032302D30362D31352031323A31373A3031222C226E6F64654E616D65223A22E8B4A2E58AA1E5AEA1E689B9222C2274656D706C6174654964223A332C22706964223A362C226E6F64654C6576656C223A312C22746F74616C436F6465223A22362C37222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B355D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D372C20637265617465446174653D4D6F6E204A756E2031352031323A31373A303120474D542B30383A303020323032302C206C6173744D6F6469666965643D4D6F6E204A756E2031352031323A31373A303120474D542B30383A30302032303230292C206E6F64654E616D653DE8B4A2E58AA1E5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D332C207069643D362C206E6F64654C6576656C3D312C20746F74616C436F64653D362C372C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B355D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('105', '2020-06-15 12:17:14', '2020-06-15 12:17:14', 0x5B7B226964223A382C2263726561746544617465223A22323032302D30362D31352031323A31373A3134222C226C6173744D6F646966696564223A22323032302D30362D31352031323A31373A3134222C226E6F64654E616D65223A22E4BABAE58A9BE5AEA1E689B9222C2274656D706C6174654964223A332C22706964223A362C226E6F64654C6576656C223A312C22746F74616C436F6465223A22362C38222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B345D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D382C20637265617465446174653D4D6F6E204A756E2031352031323A31373A313420474D542B30383A303020323032302C206C6173744D6F6469666965643D4D6F6E204A756E2031352031323A31373A313420474D542B30383A30302032303230292C206E6F64654E616D653DE4BABAE58A9BE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D332C207069643D362C206E6F64654C6576656C3D312C20746F74616C436F64653D362C382C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B345D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('106', '2020-06-15 12:17:18', '2020-06-15 12:17:18', 0x5B332C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '1');
INSERT INTO `tb_sys_user_log` VALUES ('107', '2020-06-15 12:17:22', '2020-06-15 12:17:22', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('108', '2020-06-15 12:17:36', '2020-06-15 12:17:36', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226331356166623733386431633434656662326437393761376337653130353338222C22636F6465223A2238323136227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D643934616238353432626539343638636133653233323333303433326165333266393364343434643535313634643735626361316636376465393065366335657D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('109', '2020-06-15 12:17:52', '2020-06-15 12:17:52', 0x5B332C22E8B4ADE4B9B0E7BAB8E5B7BE222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('110', '2020-06-15 12:17:57', '2020-06-15 12:17:57', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('111', '2020-06-15 12:18:05', '2020-06-15 12:18:05', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A226331373437323164646365313462613561613530343764373863326534636661222C22636F6465223A2239363730227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D643537633663333364373833343533316138336333323539343162376239643934306634653836363739633934333639386565623832373163346465623562627D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('112', '2020-06-15 12:18:18', '2020-06-15 12:18:18', 0x5B7B226964223A362C22757365725461736B4964223A31372C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FEFBC8CE58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('113', '2020-06-15 12:18:31', '2020-06-15 12:18:31', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('114', '2020-06-15 12:18:41', '2020-06-15 12:18:41', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223833613937303235303266333435636162613431366431396438326435303832222C22636F6465223A2238313437227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D313537383839613332613933343263306264303831633364303435363237663165356437636338343139386434346233393938333036396361393161303531367D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('115', '2020-06-15 12:18:48', '2020-06-15 12:18:48', 0x5B7B226964223A362C22757365725461736B4964223A31362C22617070726F76616C4170706C794F70657261746554797065223A302C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('116', '2020-06-15 12:18:51', '2020-06-15 12:18:51', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('117', '2020-06-15 12:19:00', '2020-06-15 12:19:00', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223735616662653062336332343464363239656561643035376238326666633330222C22636F6465223A2235393334227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D383033656464643565313261346538656231346361656633353933363839376630393837643164323438643034616461613766346530383766303364333265657D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('118', '2020-06-15 12:19:12', '2020-06-15 12:19:12', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('119', '2020-06-15 12:19:19', '2020-06-15 12:19:19', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223038373662313835343762323435373839383064343336346235663733393238222C22636F6465223A2232303831227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D383638343433366435643732343134336236613738616430323839396636623436626433306261363932393934383632393865373061653266643834626435337D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('120', '2020-06-15 12:20:20', '2020-06-15 12:20:20', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('121', '2020-06-15 12:20:29', '2020-06-15 12:20:29', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226261666333623130383139343464363262643536613963623631663237646564222C22636F6465223A2239343031227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D333037663134313862366161346661653961333638643163366238356131343437326235346531303130333434363337623033643431386639623962613436657D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('122', '2020-06-15 12:20:34', '2020-06-15 12:20:34', 0x5B362C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('123', '2020-06-15 12:20:37', '2020-06-15 12:20:37', 0x5B362C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('124', '2020-06-15 12:20:48', '2020-06-15 12:20:48', 0x5B332C22E8B4ADE4B9B0E7BAB8E5B7BE222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('125', '2020-06-15 12:20:50', '2020-06-15 12:20:50', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('126', '2020-06-15 12:20:57', '2020-06-15 12:20:57', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223533653237613230646432343465336638343433346136633262313737626332222C22636F6465223A2233343635227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D373837626437303563313466343961346166316632326132396636613834666166353039383838363861366334303532393139656634353362653032313563357D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('127', '2020-06-15 12:21:03', '2020-06-15 12:21:03', 0x5B7B226964223A372C22757365725461736B4964223A32302C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('128', '2020-06-15 12:21:05', '2020-06-15 12:21:05', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('129', '2020-06-15 12:21:11', '2020-06-15 12:21:11', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223862383535306333646261343435646262623961616530646232373431613361222C22636F6465223A2232313633227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D313430366566656538333363343939356236353139666161323139313831613265646364303438323234396534306336613336646639333263353933633632667D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('130', '2020-06-15 12:21:18', '2020-06-15 12:21:18', 0x5B7B226964223A372C22757365725461736B4964223A31392C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5A5BDE79A84E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('131', '2020-06-15 12:21:19', '2020-06-15 12:21:19', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('132', '2020-06-15 12:21:29', '2020-06-15 12:21:29', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226538396265313963386662653465313062306132626630383434323638306435222C22636F6465223A2235383932227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D333331356365613661643931343236393833653539346133346530343262383234623063663733323261626434306337613162643335343766616562646637637D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('133', '2020-06-15 12:21:36', '2020-06-15 12:21:36', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('134', '2020-06-15 12:21:42', '2020-06-15 12:21:42', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226530656564646135656438303430613839646435343238333865303365613930222C22636F6465223A2237373731227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D393436353338366663656161346462316239343731633765323534313039333734393136616663303466323734343036383439306432303437363563373035317D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('135', '2020-06-15 12:22:06', '2020-06-15 12:22:06', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('136', '2020-06-15 12:22:13', '2020-06-15 12:22:13', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223861313164613834636332653461353562363731353335333037353232303237222C22636F6465223A2239383733227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D303430366536613831643665343833313963333661646139373237343533616338363665353439633537393234376636626230633039383736613734376436307D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('137', '2020-06-15 12:22:23', '2020-06-15 12:22:23', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('138', '2020-06-15 12:22:35', '2020-06-15 12:22:35', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223539333533313433393933393465663261393731313865613131633463383839222C22636F6465223A2231363938227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D313461663231373464333037343561653964326661663438373263386361623665323737316565326162353934656463396531383565376436613537363235327D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('139', '2020-06-15 12:22:42', '2020-06-15 12:22:42', 0x5B372C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('140', '2020-06-15 12:22:45', '2020-06-15 12:22:45', 0x5B372C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('141', '2020-06-15 12:22:51', '2020-06-15 12:22:51', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('142', '2020-06-16 10:11:14', '2020-06-16 10:11:14', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('143', '2020-06-16 10:12:08', '2020-06-16 10:12:08', 0x5B332C22E98787E8B4ADE4B880E689B9E7BAB8E5B7BE222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('144', '2020-06-16 10:13:58', '2020-06-16 10:13:58', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('145', '2020-06-16 10:14:09', '2020-06-16 10:14:09', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223231623564646230316665383464643139383061653535653032316563316333222C22636F6465223A2230333338227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D333334333664613131356630343735356161346531636662656532396166653730376464383536303563393334343430396131303638376565353463653166387D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('146', '2020-06-16 10:14:17', '2020-06-16 10:14:17', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('147', '2020-06-16 10:15:14', '2020-06-16 10:15:14', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A226638333232343361646161353439373338636635386230323433353336333333222C22636F6465223A2232353935227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D336531363337613233323661343430383939396134356236383863333562323365383766303130343930643434613163616166616262393866343865303531307D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('148', '2020-06-16 10:15:25', '2020-06-16 10:15:25', 0x5B7B226964223A362C22757365725461736B4964223A31372C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('149', '2020-06-16 10:15:56', '2020-06-16 10:15:56', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('150', '2020-06-16 10:16:07', '2020-06-16 10:16:07', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226561316637386566313365633433346262626136643462323437343433373862222C22636F6465223A2239373337227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D323161303030333030313536343435356265343638376130653235613166353234646261653536386636373334643634393539633266363038333939376139617D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('151', '2020-06-16 10:24:15', '2020-06-16 10:24:15', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226166333130656235633161653463303662353235393335653631303962633439222C22636F6465223A2231343533227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D623061623233366437376637343938326164356335653438303664366339316631393163646162313832663734623530393936373364326538626661363861667D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('152', '2020-06-16 11:00:25', '2020-06-16 11:00:25', 0x5B362C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('153', '2020-06-16 11:00:32', '2020-06-16 11:00:32', 0x5B362C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('154', '2020-06-16 11:00:55', '2020-06-16 11:00:55', 0x5B332C22E98787E8B4ADE4B880E689B9E7BAB8E5B7BE222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('155', '2020-06-16 11:01:06', '2020-06-16 11:01:06', 0x5B372C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('156', '2020-06-16 11:01:10', '2020-06-16 11:01:10', 0x5B372C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('157', '2020-06-16 11:01:47', '2020-06-16 11:01:47', 0x5B332C22E98787E8B4ADE4B880E689B9E7BAB8E5B7BE222C2220202020E58A9EE585ACE99C80E8A681EFBC8CE5B88CE69C9BE98787E8B4ADE4B880E689B9E7BAB8E5B7BEE38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('158', '2020-06-16 11:01:57', '2020-06-16 11:01:57', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('159', '2020-06-16 11:02:10', '2020-06-16 11:02:10', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223538646430313339393634363432666262396133313435333832393063653262222C22636F6465223A2238353935227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D653763356239623135343161343464393831363133353165663732373334623033386165363463363136313534643332623130343265336364336632373639357D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('160', '2020-06-16 11:12:42', '2020-06-16 11:12:42', 0x5B7B226964223A382C22757365725461736B4964223A32332C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('161', '2020-06-16 11:12:50', '2020-06-16 11:12:50', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('162', '2020-06-16 11:13:00', '2020-06-16 11:13:00', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226464623439356433636361643439346662326239353961653134383564353332222C22636F6465223A2238373138227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D323730663662336533353037346563363931613664383537656362613039356564643731383532363232656234396137623166346637306465386265633537617D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('163', '2020-06-16 11:13:15', '2020-06-16 11:13:15', 0x5B7B226964223A382C22757365725461736B4964223A32322C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('164', '2020-06-16 11:13:19', '2020-06-16 11:13:19', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('165', '2020-06-16 11:13:28', '2020-06-16 11:13:28', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223938363966373237376439653463376239363039666631623438383465663061222C22636F6465223A2236303433227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D336132346533333433383464343733396138623937383063343663353736666535383966373436363132353134323739623164666562643565316537633231657D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('166', '2020-06-16 11:13:36', '2020-06-16 11:13:36', 0x5B7B226964223A382C22757365725461736B4964223A32312C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('167', '2020-06-16 11:13:58', '2020-06-16 11:13:58', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('168', '2020-06-16 11:14:06', '2020-06-16 11:14:06', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223532613565396235623164633464343362666565313263306564653266653763222C22636F6465223A2232383935227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D313161376238636635653265346232666134653364333432373637353932323534336265386639646265316434306235623337653132393866616566356136347D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('169', '2020-06-16 11:14:27', '2020-06-16 11:14:27', 0x5B312C22E8AFB7E58187E4B880E4B8AAE69C88222C2220202020E59BA0E4B8BAE4B8AAE4BABAE58E9FE59BA0EFBC8CE8AFB7E58187E4B880E4B8AAE69C88E38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('170', '2020-06-16 11:14:39', '2020-06-16 11:14:39', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('171', '2020-06-16 11:14:47', '2020-06-16 11:14:47', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223035363734396365623432353464626161306636633334323364393665386663222C22636F6465223A2235363632227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D306535646364363037303266346333646165373534386266303436663035646564656239383239346237393234616537383739303230636235353030616261317D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('172', '2020-06-16 11:15:09', '2020-06-16 11:15:09', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('173', '2020-06-16 11:15:18', '2020-06-16 11:15:18', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223839373039316162353330383437376162633730363665366539323230636365222C22636F6465223A2232333734227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D656333313061643733613436343433633837363164336336383738373261336463643433396532393764363734393636396531363139393634303436626465387D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('174', '2020-06-16 11:15:42', '2020-06-16 11:15:42', 0x5B7B226964223A392C22757365725461736B4964223A32362C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('175', '2020-06-16 11:15:55', '2020-06-16 11:15:55', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('176', '2020-06-16 11:16:06', '2020-06-16 11:16:06', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223765373738383438363965653433626161316332666536313063373437323661222C22636F6465223A2239373239227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D623935623632326566663564343233656230626162626638373466343566353434333133663838633238633634346131616237353966636439356330343963617D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('177', '2020-06-16 11:16:23', '2020-06-16 11:16:23', 0x5B7B226964223A392C22757365725461736B4964223A32352C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5A5BDE79A84E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('178', '2020-06-16 11:16:36', '2020-06-16 11:16:36', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('179', '2020-06-16 11:16:45', '2020-06-16 11:16:45', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223338386135316361393333653432303862643330643561633163623730633265222C22636F6465223A2230383439227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D383463373933653662356562343861646230633162316462393039636538353431373939393938353438336134373938623666333632383130656138363339367D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('180', '2020-06-16 11:16:57', '2020-06-16 11:16:57', 0x5B7B226964223A392C22757365725461736B4964223A32342C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('181', '2020-06-16 11:17:10', '2020-06-16 11:17:10', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('182', '2020-06-16 11:17:21', '2020-06-16 11:17:21', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226138353434346464396639393431303439306632616465373036326131303439222C22636F6465223A2238333638227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D653830393563383236313538346135616161666661353633366633343239386566633966396134373563333434356361383031346336376331333865396462377D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('183', '2020-06-16 11:19:00', '2020-06-16 11:19:00', 0x5B332C22E98787E8B4ADE4B880E689B9E6B0B4E69E9C222C2220202020E4B8ADE7A78BE88A82EFBC8CE98787E8B4ADE4B880E689B9E6B0B4E69E9CE38082225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('184', '2020-06-16 11:19:09', '2020-06-16 11:19:09', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('185', '2020-06-16 11:19:18', '2020-06-16 11:19:18', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226166373330663265646537383434383461386339653566383935303637643235222C22636F6465223A2230303837227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D343764626238353432636664343664376236643234343463633137643233313266663664646465316661393334633135386232356338343563656562663039347D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('186', '2020-06-16 11:19:30', '2020-06-16 11:19:30', 0x5B7B226964223A31302C22757365725461736B4964223A32382C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('187', '2020-06-16 11:19:32', '2020-06-16 11:19:32', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('188', '2020-06-16 11:19:42', '2020-06-16 11:19:42', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223163343337343437393066393438656238613961613666383230623366333738222C22636F6465223A2235363538227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D656531326236363162353835343433616233356639343239616563363330323233396462373135313930653834633035383836303936386663326164616337367D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('189', '2020-06-16 11:19:55', '2020-06-16 11:19:55', 0x5B7B226964223A31302C22757365725461736B4964223A32392C22617070726F76616C4170706C794F70657261746554797065223A302C22617070726F76616C4170706C79436F6E74656E74223A2220202020E4B88DE8A18CE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('190', '2020-06-16 11:20:02', '2020-06-16 11:20:02', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('191', '2020-06-16 11:20:11', '2020-06-16 11:20:11', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223161386639613231333366613466313761663365616537636432353363303966222C22636F6465223A2237393231227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D363231353833646638646434343164346134626531613562353336633037663562333165663530616433303834313934613162346439336233333963393066337D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('192', '2020-06-16 11:23:51', '2020-06-16 11:23:51', 0x5B312C22E8AFB7E58187E4B8A4E5A4A9222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('193', '2020-06-16 11:23:56', '2020-06-16 11:23:56', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('194', '2020-06-16 11:24:04', '2020-06-16 11:24:04', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223635333638363432353234383430633139623962316663613831326162623832222C22636F6465223A2235363537227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D323532393930643439613136343535666139613030306463663739393364646631386337616238313463393434306161383030386461373632643964663235387D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('195', '2020-06-17 09:47:18', '2020-06-17 09:47:18', 0x5B7B226964223A342C2263726561746544617465223A22323032302D30362D31372030393A34373A3138222C226C6173744D6F646966696564223A22323032302D30362D31372030393A34373A3138222C2274656D706C6174654E616D65223A22E6B58BE8AF952D3031222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D342C20637265617465446174653D576564204A756E2031372030393A34373A313820474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372030393A34373A313820474D542B30383A30302032303230292C2074656D706C6174654E616D653DE6B58BE8AF952D30312C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('196', '2020-06-17 09:47:39', '2020-06-17 09:47:39', 0x5B7B226964223A392C2263726561746544617465223A22323032302D30362D31372030393A34373A3339222C226C6173744D6F646966696564223A22323032302D30362D31372030393A34373A3339222C226E6F64654E616D65223A2263222C2274656D706C6174654964223A342C22706964223A302C226E6F64654C6576656C223A302C22746F74616C436F6465223A2239222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B365D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D392C20637265617465446174653D576564204A756E2031372030393A34373A333920474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372030393A34373A333920474D542B30383A30302032303230292C206E6F64654E616D653D632C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D342C207069643D302C206E6F64654C6576656C3D302C20746F74616C436F64653D392C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B365D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('197', '2020-06-17 09:48:20', '2020-06-17 09:48:20', 0x5B7B226964223A31302C2263726561746544617465223A22323032302D30362D31372030393A34383A3230222C226C6173744D6F646966696564223A22323032302D30362D31372030393A34383A3230222C226E6F64654E616D65223A2262222C2274656D706C6174654964223A342C22706964223A392C226E6F64654C6576656C223A312C22746F74616C436F6465223A22392C3130222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B345D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31302C20637265617465446174653D576564204A756E2031372030393A34383A323020474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372030393A34383A323020474D542B30383A30302032303230292C206E6F64654E616D653D622C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D342C207069643D392C206E6F64654C6576656C3D312C20746F74616C436F64653D392C31302C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B345D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('198', '2020-06-17 09:48:57', '2020-06-17 09:48:57', 0x5B7B226964223A31312C2263726561746544617465223A22323032302D30362D31372030393A34383A3537222C226C6173744D6F646966696564223A22323032302D30362D31372030393A34383A3537222C226E6F64654E616D65223A2261222C2274656D706C6174654964223A342C22706964223A31302C226E6F64654C6576656C223A322C22746F74616C436F6465223A22392C31302C3131222C22696E737472756374696F6E223A22222C226F70657261746554797065223A312C227573657255706C617465466C6167223A312C227573657249644C697374223A5B352C315D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31312C20637265617465446174653D576564204A756E2031372030393A34383A353720474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372030393A34383A353720474D542B30383A30302032303230292C206E6F64654E616D653D612C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D342C207069643D31302C206E6F64654C6576656C3D322C20746F74616C436F64653D392C31302C31312C20696E737472756374696F6E3D2C206F706572617465547970653D312C207573657255706C617465466C61673D312C207573657249644C6973743D5B352C20315D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('199', '2020-06-17 09:49:19', '2020-06-17 09:49:19', 0x5B342C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '1');
INSERT INTO `tb_sys_user_log` VALUES ('200', '2020-06-17 09:49:38', '2020-06-17 09:49:38', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('201', '2020-06-17 09:49:50', '2020-06-17 09:49:50', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223236363430636431333836623461323539356632623238383433323064383666222C22636F6465223A2233383830227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D333364383737336639313164346435346232366330353534313434336131383136376562386538643766343134626635396338396231343933663261636233617D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('202', '2020-06-17 09:49:59', '2020-06-17 09:49:59', 0x5B342C22E6B0B4E794B5E8B4B9E8B4B9222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('203', '2020-06-17 09:50:06', '2020-06-17 09:50:06', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('204', '2020-06-17 09:50:17', '2020-06-17 09:50:17', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223236353464626361393362383431643639393663323464333230326630383739222C22636F6465223A2238343330227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D646338636435316537653232343364303962623062356632366230336664373966383962376265326236316234333736623737353437333530656435623437367D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('205', '2020-06-17 09:52:48', '2020-06-17 09:52:48', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223731323331616237373335313435343461383738623034376564383932636663222C22636F6465223A2239303633227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D643636643063613261303532343134386236643133653934623334623362613263356636396561336363383134656564383861386231613732656564636338377D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('206', '2020-06-17 09:53:16', '2020-06-17 09:53:16', 0x5B7B226964223A31322C22757365725461736B4964223A33352C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5A5BDE79A84E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('207', '2020-06-17 10:29:44', '2020-06-17 10:29:44', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('208', '2020-06-17 10:30:23', '2020-06-17 10:30:23', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('209', '2020-06-17 10:30:34', '2020-06-17 10:30:34', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223366623430626337343066393462353961376364313439393431393638316337222C22636F6465223A2238323131227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D343037633334326535366234346434373963336337333734343536383033323966643333376133663336316234633164613965613536336630353830353838397D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('210', '2020-06-17 10:30:52', '2020-06-17 10:30:52', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('211', '2020-06-17 10:30:58', '2020-06-17 10:30:58', 0x5B7B226C6F67696E4E616D65223A227869616F486F6E67222C2275707764223A22313233343536222C226B6579223A226136303833643064363364363432643939346133383862343265303763313433222C22636F6465223A2238313534227D5D, '127.0.0.1', 0x7B7573657249643D322C20746F6B656E3D323763623632636664633562346166643833643264313236303861353966633439353837366634376537366434643135613430646631373432666165343563327D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('212', '2020-06-17 10:31:10', '2020-06-17 10:31:10', 0x5B31322C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('213', '2020-06-17 10:31:14', '2020-06-17 10:31:14', 0x5B31322C325D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '2');
INSERT INTO `tb_sys_user_log` VALUES ('214', '2020-06-17 10:31:19', '2020-06-17 10:31:19', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('215', '2020-06-17 10:31:28', '2020-06-17 10:31:28', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223864646435316562323736353431636538333137383664366436316239613466222C22636F6465223A2230323832227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D663166313435363832393231346237626138313839663531336131353935633663353863326436633662336534623862383635373264303933396539363033657D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('216', '2020-06-17 10:31:37', '2020-06-17 10:31:37', 0x5B342C22E59388E59388222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('217', '2020-06-17 10:31:51', '2020-06-17 10:31:51', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('218', '2020-06-17 10:31:59', '2020-06-17 10:31:59', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223236613762643163613231303462616161336433353932316666353565323961222C22636F6465223A2235313237227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D323430376137623532376231346236346133366638663465346266633464343165643737636637383531323034646263626163353033386233396430393337317D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('219', '2020-06-17 10:32:15', '2020-06-17 10:32:15', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A226537666365613233633939373466326239373663616266616339353765373064222C22636F6465223A2236323836227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D353165643864306163366631343032333837313035323163353133626466343632383061363337386661653734353335396436623330343736656430623266317D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('220', '2020-06-17 10:32:30', '2020-06-17 10:32:30', 0x5B7B226964223A31332C22757365725461736B4964223A33392C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848F227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('221', '2020-06-17 10:32:39', '2020-06-17 10:32:39', 0x5B7B226964223A31332C22757365725461736B4964223A34302C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '1');
INSERT INTO `tb_sys_user_log` VALUES ('222', '2020-06-17 10:32:52', '2020-06-17 10:32:52', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('223', '2020-06-17 10:33:01', '2020-06-17 10:33:01', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223334663735653365373735633465653261303531393435633236353138343233222C22636F6465223A2237303834227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D376534376137333163333763346364663963353831613961363837383934643638386534626139376237366134653336396463376463333530393930313735647D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('224', '2020-06-17 10:33:11', '2020-06-17 10:33:11', 0x5B7B226964223A31332C22757365725461736B4964223A33382C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('225', '2020-06-17 10:33:17', '2020-06-17 10:33:17', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('226', '2020-06-17 10:33:28', '2020-06-17 10:33:28', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226435346238303666653937633464376262633065663936633133316634646666222C22636F6465223A2237353339227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D323731626337333062333832343732323965666565653462306330643634656134333162353537346238376434333964393165356539383661663063353365397D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('227', '2020-06-17 10:33:37', '2020-06-17 10:33:37', 0x5B7B226964223A31332C22757365725461736B4964223A33372C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020746F6E677969227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('228', '2020-06-17 10:33:44', '2020-06-17 10:33:44', 0x5B7B226964223A31312C22757365725461736B4964223A33322C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020746F676E227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('229', '2020-06-17 10:34:11', '2020-06-17 10:34:11', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('230', '2020-06-17 10:34:19', '2020-06-17 10:34:19', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223531316366316431336132383436636461366238323537653739343538303733222C22636F6465223A2237353131227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D333238373035303638646630346164336236313861666165666266663961643132353466363762643731333334613164386336346562326236633930386435617D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('231', '2020-06-17 10:34:36', '2020-06-17 10:34:36', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('232', '2020-06-17 13:10:02', '2020-06-17 13:10:02', 0x5B342C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '1');
INSERT INTO `tb_sys_user_log` VALUES ('233', '2020-06-17 13:12:09', '2020-06-17 13:12:09', 0x5B31332C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '1');
INSERT INTO `tb_sys_user_log` VALUES ('234', '2020-06-17 13:12:13', '2020-06-17 13:12:13', 0x5B31332C325D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowInstance/operateInstance', '1');
INSERT INTO `tb_sys_user_log` VALUES ('235', '2020-06-17 13:12:37', '2020-06-17 13:12:37', 0x5B342C325D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '1');
INSERT INTO `tb_sys_user_log` VALUES ('236', '2020-06-17 13:12:56', '2020-06-17 13:12:56', 0x5B7B226964223A352C2263726561746544617465223A22323032302D30362D31372031333A31323A3535222C226C6173744D6F646966696564223A22323032302D30362D31372031333A31323A3535222C2274656D706C6174654E616D65223A22E5A49AE4BABAE5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D352C20637265617465446174653D576564204A756E2031372031333A31323A353520474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A31323A353520474D542B30383A30302032303230292C2074656D706C6174654E616D653DE5A49AE4BABAE5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '1');
INSERT INTO `tb_sys_user_log` VALUES ('237', '2020-06-17 13:13:38', '2020-06-17 13:13:38', 0x5B7B226964223A31322C2263726561746544617465223A22323032302D30362D31372031333A31333A3338222C226C6173744D6F646966696564223A22323032302D30362D31372031333A31333A3338222C226E6F64654E616D65223A22E891A3E4BA8BE995BFE5AEA1E689B9222C2274656D706C6174654964223A352C22706964223A302C226E6F64654C6576656C223A302C22746F74616C436F6465223A223132222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B365D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31322C20637265617465446174653D576564204A756E2031372031333A31333A333820474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A31333A333820474D542B30383A30302032303230292C206E6F64654E616D653DE891A3E4BA8BE995BFE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D352C207069643D302C206E6F64654C6576656C3D302C20746F74616C436F64653D31322C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B365D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('238', '2020-06-17 13:14:01', '2020-06-17 13:14:01', 0x5B7B226964223A31332C2263726561746544617465223A22323032302D30362D31372031333A31343A3031222C226C6173744D6F646966696564223A22323032302D30362D31372031333A31343A3031222C226E6F64654E616D65223A22E4BABAE58A9BE5AEA1E689B9222C2274656D706C6174654964223A352C22706964223A31322C226E6F64654C6576656C223A312C22746F74616C436F6465223A2231322C3133222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B345D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31332C20637265617465446174653D576564204A756E2031372031333A31343A303120474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A31343A303120474D542B30383A30302032303230292C206E6F64654E616D653DE4BABAE58A9BE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D352C207069643D31322C206E6F64654C6576656C3D312C20746F74616C436F64653D31322C31332C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B345D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('239', '2020-06-17 13:14:35', '2020-06-17 13:14:35', 0x5B7B226964223A31342C2263726561746544617465223A22323032302D30362D31372031333A31343A3335222C226C6173744D6F646966696564223A22323032302D30362D31372031333A31343A3335222C226E6F64654E616D65223A22E8B4A2E58AA1E5AEA1E689B9222C2274656D706C6174654964223A352C22706964223A31332C226E6F64654C6576656C223A322C22746F74616C436F6465223A2231322C31332C3134222C22696E737472756374696F6E223A22222C226F70657261746554797065223A312C227573657255706C617465466C6167223A312C227573657249644C697374223A5B352C315D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31342C20637265617465446174653D576564204A756E2031372031333A31343A333520474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A31343A333520474D542B30383A30302032303230292C206E6F64654E616D653DE8B4A2E58AA1E5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D352C207069643D31332C206E6F64654C6576656C3D322C20746F74616C436F64653D31322C31332C31342C20696E737472756374696F6E3D2C206F706572617465547970653D312C207573657255706C617465466C61673D312C207573657249644C6973743D5B352C20315D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '1');
INSERT INTO `tb_sys_user_log` VALUES ('240', '2020-06-17 13:14:52', '2020-06-17 13:14:52', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('241', '2020-06-17 13:15:00', '2020-06-17 13:15:00', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226436393339386331656236363462386162363362303334363035313238303338222C22636F6465223A2233393239227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D666533346330383135323535346261393831326566653564643736643563373939656137383365396130306434393132626536616331396465623963393265307D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('242', '2020-06-17 13:15:07', '2020-06-17 13:15:07', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('243', '2020-06-17 13:15:10', '2020-06-17 13:15:10', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A226433313565323333613837343430346338623938393837373131643363323664222C22636F6465223A2239393933227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D303332633063356461656531343563316131663437363266363530393134663062643536323730623833383534343635386535333338303233346130393037337D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('244', '2020-06-17 13:15:21', '2020-06-17 13:15:21', 0x5B352C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '1');
INSERT INTO `tb_sys_user_log` VALUES ('245', '2020-06-17 13:15:24', '2020-06-17 13:15:24', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('246', '2020-06-17 13:15:34', '2020-06-17 13:15:34', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223361303165616136363335303437366139313466353630653132316530386261222C22636F6465223A2235313431227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D333462393439366161316335346130666132616666633035353564316234643832343636306233613735346534356663616461646661643533373034633566367D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('247', '2020-06-17 13:15:59', '2020-06-17 13:15:59', 0x5B352C22E98787E8B4ADE4B880E689B9E894ACE88F9C222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('248', '2020-06-17 13:16:08', '2020-06-17 13:16:08', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('249', '2020-06-17 13:16:15', '2020-06-17 13:16:15', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223635616335626430613933653437663639323065613363386565313761633836222C22636F6465223A2235393235227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D393166386162636366336631343938646165623335376236323536656537666531613034303061303037383434336635393764333635393362313538343233647D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('250', '2020-06-17 13:16:31', '2020-06-17 13:16:31', 0x5B7B226964223A31342C22757365725461736B4964223A34342C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5908CE6848FE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '1');
INSERT INTO `tb_sys_user_log` VALUES ('251', '2020-06-17 13:16:33', '2020-06-17 13:16:33', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('252', '2020-06-17 13:16:40', '2020-06-17 13:16:40', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A226262346534633762656333393434366138383432363063323961363430303165222C22636F6465223A2236363330227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D373830393165363362663862343637336163656439353835613237386534326433616237663234663761323834356338383562323465356565636165353361377D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('253', '2020-06-17 13:16:49', '2020-06-17 13:16:49', 0x5B7B226964223A31342C22757365725461736B4964223A34332C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('254', '2020-06-17 13:16:53', '2020-06-17 13:16:53', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('255', '2020-06-17 13:17:01', '2020-06-17 13:17:01', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A226663383166653133633762633436653838323839366262346461663630353838222C22636F6465223A2232393139227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D346439313433316462653237343037396166656263303163663963373135383739643737653434656332623034366566396463303365373364326635643265637D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('256', '2020-06-17 13:17:08', '2020-06-17 13:17:08', 0x5B7B226964223A31342C22757365725461736B4964223A34322C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5A5BDE79A84E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('257', '2020-06-17 13:17:10', '2020-06-17 13:17:10', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('258', '2020-06-17 13:17:18', '2020-06-17 13:17:18', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A226466666536336232353630643431343438656564303833333036633938396631222C22636F6465223A2238393230227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D626466393864323532313564346665366266396336303935623537353965396538316334366566633934323134303833616636663131356430343436613038367D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('259', '2020-06-17 13:17:24', '2020-06-17 13:17:24', 0x5B7B226964223A31342C22757365725461736B4964223A34312C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('260', '2020-06-17 13:17:25', '2020-06-17 13:17:25', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('261', '2020-06-17 13:17:32', '2020-06-17 13:17:33', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226131653966663362383132393439613161346639366333613735336138643438222C22636F6465223A2230303238227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D646235633365653139623363343530636265616130333531396235643463326135643733316233363366643434303632623761383135613963613361653361367D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('262', '2020-06-17 13:17:59', '2020-06-17 13:17:59', 0x5B352C22E98787E8B4ADE4B880E689B9E78CAAE88289222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('263', '2020-06-17 13:18:05', '2020-06-17 13:18:05', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('264', '2020-06-17 13:18:13', '2020-06-17 13:18:13', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223831623661633730356166303432666538393737653833366262643862396533222C22636F6465223A2234333034227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D643030656531386463313666343337356263326135656131376132326337663866313734616634633033366434623539623964613366353661323238363531357D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('265', '2020-06-17 13:18:16', '2020-06-17 13:18:16', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('266', '2020-06-17 13:18:24', '2020-06-17 13:18:24', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223965333938663565373962343438306262303831636538376463393530353735222C22636F6465223A2237313830227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D393533353838633232356264346438646166366135626439383036646464373638666661373263326363666234636537386363616664653866376161626135367D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('267', '2020-06-17 13:18:34', '2020-06-17 13:18:34', 0x5B7B226964223A31352C22757365725461736B4964223A34372C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('268', '2020-06-17 13:18:37', '2020-06-17 13:18:37', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('269', '2020-06-17 13:18:50', '2020-06-17 13:18:50', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223036386332646638396661343462396439333131323535376438306630343236222C22636F6465223A2230333630227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D393962316466623730633836346332613864653930383566643537666364633665343133616136373432623434616462626165383466386534383231366435637D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('270', '2020-06-17 13:18:53', '2020-06-17 13:18:53', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('271', '2020-06-17 13:18:59', '2020-06-17 13:18:59', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223464653337363031393837323464653162303035656130353163346139623966222C22636F6465223A2231383637227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D333430316635323937303765343331303865363864626239353937393961343164633532656436323662333234393333626664313535663234376538626666357D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('272', '2020-06-17 13:19:10', '2020-06-17 13:19:10', 0x5B7B226964223A31352C22757365725461736B4964223A34382C22617070726F76616C4170706C794F70657261746554797065223A302C22617070726F76616C4170706C79436F6E74656E74223A2220202020E4B88DE8A18CE38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '1');
INSERT INTO `tb_sys_user_log` VALUES ('273', '2020-06-17 13:19:12', '2020-06-17 13:19:12', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('274', '2020-06-17 13:19:20', '2020-06-17 13:19:20', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A223537353434396235396236333464313861616330613566623563366234353463222C22636F6465223A2231333231227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D383831353166663931393362346136356163326462626632663835353462343032333135643439633363323834353363613035373138633865376130323733377D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('275', '2020-06-17 13:22:36', '2020-06-17 13:22:36', 0x5B31302C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('276', '2020-06-17 13:22:41', '2020-06-17 13:22:41', 0x5B31302C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('277', '2020-06-17 13:22:48', '2020-06-17 13:22:48', 0x5B31312C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('278', '2020-06-17 13:22:52', '2020-06-17 13:22:52', 0x5B31312C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('279', '2020-06-17 13:23:09', '2020-06-17 13:23:09', 0x5B31352C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('280', '2020-06-17 13:23:13', '2020-06-17 13:23:13', 0x5B31352C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('281', '2020-06-17 13:23:52', '2020-06-17 13:23:52', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('282', '2020-06-17 13:24:05', '2020-06-17 13:24:05', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A226137313761616138333034623437343238346635393633633937363437366530222C22636F6465223A2237393535227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D303631383162376462386437346463383962663237633136616464333537303361356164323234353132663234306437613862633033313939623165333936657D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('283', '2020-06-17 13:24:15', '2020-06-17 13:24:15', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('284', '2020-06-17 13:24:21', '2020-06-17 13:24:21', 0x5B7B226C6F67696E4E616D65223A227869616F486F6E67222C2275707764223A22313233343536222C226B6579223A223464353462633832626138623461346239623238356630393138313730346132222C22636F6465223A2235353630227D5D, '127.0.0.1', 0x7B7573657249643D322C20746F6B656E3D633638373435623564666261343764633936353636316134303361623032323061636562376333366133383734303961386430663962363232646232653564367D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('285', '2020-06-17 13:24:48', '2020-06-17 13:24:48', 0x5B7B226964223A362C2263726561746544617465223A22323032302D30362D31372031333A32343A3438222C226C6173744D6F646966696564223A22323032302D30362D31372031333A32343A3438222C2274656D706C6174654E616D65223A22E5A49AE4BABAE5A49AE983A8E997A8E5AEA1E689B9222C22737461747573223A317D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174652873757065723D426173654461746149644C6F6E672869643D362C20637265617465446174653D576564204A756E2031372031333A32343A343820474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A32343A343820474D542B30383A30302032303230292C2074656D706C6174654E616D653DE5A49AE4BABAE5A49AE983A8E997A8E5AEA1E689B92C207374617475733D312C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C6174654E6F64654C6973743D6E756C6C29, '/planning/user/flowTemplate/saveTemplate', '2');
INSERT INTO `tb_sys_user_log` VALUES ('286', '2020-06-17 13:25:12', '2020-06-17 13:25:12', 0x5B7B226964223A31352C2263726561746544617465223A22323032302D30362D31372031333A32353A3132222C226C6173744D6F646966696564223A22323032302D30362D31372031333A32353A3132222C226E6F64654E616D65223A22E891A3E4BA8BE995BFE5AEA1E689B9222C2274656D706C6174654964223A362C22706964223A302C226E6F64654C6576656C223A302C22746F74616C436F6465223A223135222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B365D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31352C20637265617465446174653D576564204A756E2031372031333A32353A313220474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A32353A313220474D542B30383A30302032303230292C206E6F64654E616D653DE891A3E4BA8BE995BFE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D362C207069643D302C206E6F64654C6576656C3D302C20746F74616C436F64653D31352C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B365D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('287', '2020-06-17 13:25:35', '2020-06-17 13:25:35', 0x5B7B226964223A31362C2263726561746544617465223A22323032302D30362D31372031333A32353A3335222C226C6173744D6F646966696564223A22323032302D30362D31372031333A32353A3335222C226E6F64654E616D65223A22E8B4A2E58AA1E5AEA1E689B9222C2274656D706C6174654964223A362C22706964223A31352C226E6F64654C6576656C223A312C22746F74616C436F6465223A2231352C3136222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B355D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31362C20637265617465446174653D576564204A756E2031372031333A32353A333520474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A32353A333520474D542B30383A30302032303230292C206E6F64654E616D653DE8B4A2E58AA1E5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D362C207069643D31352C206E6F64654C6576656C3D312C20746F74616C436F64653D31352C31362C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B355D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('288', '2020-06-17 13:26:02', '2020-06-17 13:26:02', 0x5B7B226964223A31372C2263726561746544617465223A22323032302D30362D31372031333A32363A3032222C226C6173744D6F646966696564223A22323032302D30362D31372031333A32363A3032222C226E6F64654E616D65223A22E680BBE983A8E4BABAE58A9BE5AEA1E689B9222C2274656D706C6174654964223A362C22706964223A31352C226E6F64654C6576656C223A312C22746F74616C436F6465223A2231352C3137222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B345D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31372C20637265617465446174653D576564204A756E2031372031333A32363A303220474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A32363A303220474D542B30383A30302032303230292C206E6F64654E616D653DE680BBE983A8E4BABAE58A9BE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D362C207069643D31352C206E6F64654C6576656C3D312C20746F74616C436F64653D31352C31372C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B345D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('289', '2020-06-17 13:26:29', '2020-06-17 13:26:29', 0x5B7B226964223A31382C2263726561746544617465223A22323032302D30362D31372031333A32363A3239222C226C6173744D6F646966696564223A22323032302D30362D31372031333A32363A3239222C226E6F64654E616D65223A22E585ACE58FB8E4BABAE58A9BE5AEA1E689B9222C2274656D706C6174654964223A362C22706964223A31372C226E6F64654C6576656C223A322C22746F74616C436F6465223A2231352C31372C3138222C22696E737472756374696F6E223A22222C226F70657261746554797065223A302C227573657255706C617465466C6167223A312C227573657249644C697374223A5B315D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31382C20637265617465446174653D576564204A756E2031372031333A32363A323920474D542B30383A303020323032302C206C6173744D6F6469666965643D576564204A756E2031372031333A32363A323920474D542B30383A30302032303230292C206E6F64654E616D653DE585ACE58FB8E4BABAE58A9BE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D362C207069643D31372C206E6F64654C6576656C3D322C20746F74616C436F64653D31352C31372C31382C20696E737472756374696F6E3D2C206F706572617465547970653D302C207573657255706C617465466C61673D312C207573657249644C6973743D5B315D2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('290', '2020-06-17 13:27:20', '2020-06-17 13:27:20', 0x5B7B226964223A31382C226E6F64654E616D65223A22E585ACE58FB8E4BABAE58A9BE5AEA1E689B9222C2274656D706C6174654964223A362C22696E737472756374696F6E223A22222C226F70657261746554797065223A312C227573657255706C617465466C6167223A312C227573657249644C697374223A5B312C325D7D5D, '127.0.0.1', 0x5462466C6F7754656D706C6174654E6F64652873757065723D426173654461746149644C6F6E672869643D31382C20637265617465446174653D323032302D30362D31372031333A32363A32392E302C206C6173744D6F6469666965643D576564204A756E2031372031333A32373A323020474D542B30383A30302032303230292C206E6F64654E616D653DE585ACE58FB8E4BABAE58A9BE5AEA1E689B92C20746578743D6E756C6C2C2073746174653D6E756C6C2C2074656D706C61746549643D362C207069643D31372C206E6F64654C6576656C3D322C20746F74616C436F64653D31352C31372C31382C20696E737472756374696F6E3D2C206F706572617465547970653D312C207573657255706C617465466C61673D6E756C6C2C207573657249644C6973743D6E756C6C2C207573657254726565526573706F6E73653D6E756C6C2C206368696C6472656E3D6E756C6C29, '/planning/user/flowTemplate/saveTemplateNode', '2');
INSERT INTO `tb_sys_user_log` VALUES ('291', '2020-06-17 13:27:40', '2020-06-17 13:27:40', 0x5B362C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/flowTemplate/operateTemplateState', '2');
INSERT INTO `tb_sys_user_log` VALUES ('292', '2020-06-17 13:27:47', '2020-06-17 13:27:47', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('293', '2020-06-17 13:27:55', '2020-06-17 13:27:55', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226561313239363739653862313436636238393134643037393032353639666364222C22636F6465223A2234313736227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D653930313535376431323337343066386232656231643462306166656530353261613165653136303734343334376364623632396239376538633232623866397D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('294', '2020-06-17 13:28:09', '2020-06-17 13:28:09', 0x5B362C22E5A49AE4BABAE5A49AE983A8E997A8E5AEA1E689B9E6BC94E7A4BA222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('295', '2020-06-17 13:28:18', '2020-06-17 13:28:18', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('296', '2020-06-17 13:28:30', '2020-06-17 13:28:30', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223039663338323364623832323461616562643964383838623561656361323666222C22636F6465223A2235333433227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D656661353864353235616161346462396133323136663265396435396262343766373233633864613738633534356131383634653133656236356333313163617D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('297', '2020-06-17 13:28:49', '2020-06-17 13:28:49', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('298', '2020-06-17 13:29:02', '2020-06-17 13:29:02', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223638626262393231346336663462313739663737653165343232333033373839222C22636F6465223A2231333037227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D643263393233363539316438343635393964303138613562356332633239303963356666303163623837633634663631626262636337383764653765363536317D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('299', '2020-06-17 13:29:15', '2020-06-17 13:29:15', 0x5B7B226964223A31362C22757365725461736B4964223A35322C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '1');
INSERT INTO `tb_sys_user_log` VALUES ('300', '2020-06-17 13:29:17', '2020-06-17 13:29:17', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('301', '2020-06-17 13:29:24', '2020-06-17 13:29:24', 0x5B7B226C6F67696E4E616D65223A227869616F486F6E67222C2275707764223A22313233343536222C226B6579223A226531303266313864646337373465353462306331323033323038306261323962222C22636F6465223A2233333733227D5D, '127.0.0.1', 0x7B7573657249643D322C20746F6B656E3D363638643231333836306635343066313931303131376430666533353830373065313836636234633061353134373435393033633533373632303666346336327D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('302', '2020-06-17 13:29:31', '2020-06-17 13:29:31', 0x5B7B226964223A31362C22757365725461736B4964223A35332C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5A5BDE79A84E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '2');
INSERT INTO `tb_sys_user_log` VALUES ('303', '2020-06-17 13:29:33', '2020-06-17 13:29:33', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('304', '2020-06-17 13:29:45', '2020-06-17 13:29:45', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223964313164316331316430613466333761343438303233376466343133666430222C22636F6465223A2234323837227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D346636333134373864326232343539323961373666363062393930366339323935303730373561383939333834316463383130623166663233313632633533397D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('305', '2020-06-17 13:29:48', '2020-06-17 13:29:48', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('306', '2020-06-17 13:30:00', '2020-06-17 13:30:00', 0x5B7B226C6F67696E4E616D65223A227869616F4875616E67222C2275707764223A22313233343536222C226B6579223A223063383237613866303833383464303538373464623664303530633235356563222C22636F6465223A2236323836227D5D, '127.0.0.1', 0x7B7573657249643D342C20746F6B656E3D373463656631353332643234343265353938623133616161363163633964373464633831323639306636306234306362383731356663363265356264646561667D, '/planning/login/verify', '2');
INSERT INTO `tb_sys_user_log` VALUES ('307', '2020-06-17 13:30:05', '2020-06-17 13:30:05', 0x5B7B226964223A31362C22757365725461736B4964223A35312C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '4');
INSERT INTO `tb_sys_user_log` VALUES ('308', '2020-06-17 13:30:07', '2020-06-17 13:30:07', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '4');
INSERT INTO `tb_sys_user_log` VALUES ('309', '2020-06-17 13:30:17', '2020-06-17 13:30:17', 0x5B7B226C6F67696E4E616D65223A227869616F4C616E222C2275707764223A22313233343536222C226B6579223A223030363233396562356235613464626538623638323066666331643965306230222C22636F6465223A2232353435227D5D, '127.0.0.1', 0x7B7573657249643D352C20746F6B656E3D363138343339653337323838346332643836383265663966396632303831643230666234663162353266346534393530616361326264643065313833306264387D, '/planning/login/verify', '4');
INSERT INTO `tb_sys_user_log` VALUES ('310', '2020-06-17 13:30:24', '2020-06-17 13:30:24', 0x5B7B226964223A31362C22757365725461736B4964223A35302C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E58FAFE4BBA5E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '5');
INSERT INTO `tb_sys_user_log` VALUES ('311', '2020-06-17 13:30:28', '2020-06-17 13:30:28', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '5');
INSERT INTO `tb_sys_user_log` VALUES ('312', '2020-06-17 13:30:35', '2020-06-17 13:30:35', 0x5B7B226C6F67696E4E616D65223A227869616F51696E67222C2275707764223A22313233343536222C226B6579223A223934303465386234326662613463343662663464656632306135613735643036222C22636F6465223A2230383137227D5D, '127.0.0.1', 0x7B7573657249643D362C20746F6B656E3D313030366532636632616339343136616131386231636462393430613235343338356231393665383463333234323131383161633132353035366465623136627D, '/planning/login/verify', '5');
INSERT INTO `tb_sys_user_log` VALUES ('313', '2020-06-17 13:30:42', '2020-06-17 13:30:42', 0x5B7B226964223A31362C22757365725461736B4964223A34392C22617070726F76616C4170706C794F70657261746554797065223A312C22617070726F76616C4170706C79436F6E74656E74223A2220202020E5A5BDE79A84E38082227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '6');
INSERT INTO `tb_sys_user_log` VALUES ('314', '2020-06-17 13:30:47', '2020-06-17 13:30:47', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '6');
INSERT INTO `tb_sys_user_log` VALUES ('315', '2020-06-17 13:30:56', '2020-06-17 13:30:56', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226262346535616435363631393434323961643266366630323461313266323265222C22636F6465223A2238373834227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D323235363539663366333332346462633964666635353433306262623631636465643237663664666136343034383430393338373639656366376263613962347D, '/planning/login/verify', '6');
INSERT INTO `tb_sys_user_log` VALUES ('316', '2020-06-17 13:31:34', '2020-06-17 13:31:34', 0x5B362C223131222C2220202020225D, '127.0.0.1', 0x6E756C6C, '/planning/user/startApply/startApply', '7');
INSERT INTO `tb_sys_user_log` VALUES ('317', '2020-06-17 13:31:40', '2020-06-17 13:31:40', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('318', '2020-06-17 13:31:48', '2020-06-17 13:31:48', 0x5B7B226C6F67696E4E616D65223A227869616F4D696E67222C2275707764223A22313233343536222C226B6579223A223733366139643862306263313465316139613131663433653765376164346535222C22636F6465223A2237353934227D5D, '127.0.0.1', 0x7B7573657249643D312C20746F6B656E3D663832636565373964656633343733366233306635323565383164313331366264643564333337326531323634613662613666383031613132336338363864387D, '/planning/login/verify', '7');
INSERT INTO `tb_sys_user_log` VALUES ('319', '2020-06-17 13:31:56', '2020-06-17 13:31:56', 0x5B7B226964223A31372C22757365725461736B4964223A35372C22617070726F76616C4170706C794F70657261746554797065223A302C22617070726F76616C4170706C79436F6E74656E74223A2220202020627578696E67227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/myIndexPage/approvalApply', '1');
INSERT INTO `tb_sys_user_log` VALUES ('320', '2020-06-17 13:32:01', '2020-06-17 13:32:01', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '1');
INSERT INTO `tb_sys_user_log` VALUES ('321', '2020-06-17 13:32:10', '2020-06-17 13:32:10', 0x5B7B226C6F67696E4E616D65223A227869616F486F6E67222C2275707764223A22313233343536222C226B6579223A223739333237333965333331343430613938333339633661626432306439306338222C22636F6465223A2238393833227D5D, '127.0.0.1', 0x7B7573657249643D322C20746F6B656E3D643335646634353265393834343437326132633039363163656532393132613664636634623030316139613834643364626462613936623330366665613934627D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('322', '2020-06-17 13:32:13', '2020-06-17 13:32:13', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '2');
INSERT INTO `tb_sys_user_log` VALUES ('323', '2020-06-17 13:32:20', '2020-06-17 13:32:20', 0x5B7B226C6F67696E4E616D65223A227869616F4E6975222C2275707764223A22313233343536222C226B6579223A226430373365653638623330383432326139656231633163336266613163343561222C22636F6465223A2230373732227D5D, '127.0.0.1', 0x7B7573657249643D372C20746F6B656E3D653033333165373231336131343532346133393434313638633237626365663836633836623031666165393134663165613233396565353564373064643863397D, '/planning/login/verify', '1');
INSERT INTO `tb_sys_user_log` VALUES ('324', '2020-06-17 13:32:30', '2020-06-17 13:32:30', 0x5B31372C305D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('325', '2020-06-17 13:32:33', '2020-06-17 13:32:33', 0x5B31372C315D, '127.0.0.1', 0x6E756C6C, '/planning/user/selfSendApply/operateInstance', '7');
INSERT INTO `tb_sys_user_log` VALUES ('326', '2020-06-17 13:32:35', '2020-06-17 13:32:35', 0x5B5D, '127.0.0.1', 0x6C6F67696E, '/planning/login/out', '7');
INSERT INTO `tb_sys_user_log` VALUES ('327', '2020-06-17 17:04:24', '2020-06-17 17:04:24', 0x5B7B226964223A322C2263726561746544617465223A22323032302D30362D31372031373A30343A3234222C226C6173744D6F646966696564223A22323032302D30362D31372031373A30343A3234222C2264656C466C6167223A302C22656E747279557365724964223A312C22656E7472795573657252656D61726B223A2220202020222C22656E7472794E616D65223A22323032302D303520E98787E8B4ADE694AFE587BA222C22656E74727944657363223A2220202020E98787E8B4ADE799BDE88F9C222C22656E747279416D6F756E74223A313030302E30302C22656E74727954797065223A302C22656E74727948617070656E44617465223A22323032302D30352D3031227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutEntry/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('328', '2020-06-17 17:04:34', '2020-06-17 17:04:34', 0x5B22323032302D30362D31372031373A30343A3330225D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutManage/updateLockTime', '1');
INSERT INTO `tb_sys_user_log` VALUES ('329', '2020-06-17 17:05:12', '2020-06-17 17:05:12', 0x5B7B226964223A332C2263726561746544617465223A22323032302D30362D31372031373A30353A3132222C226C6173744D6F646966696564223A22323032302D30362D31372031373A30353A3132222C2264656C466C6167223A302C22656E747279557365724964223A312C22656E7472795573657252656D61726B223A2220202020222C22656E7472794E616D65223A22323032302D303720E69C8DE8A385E8B4B9E694AFE587BA222C22656E74727944657363223A2220202020E69C8DE8A385E8B4B9E694AFE587BA222C22656E747279416D6F756E74223A323030302E30302C22656E74727954797065223A302C22656E74727948617070656E44617465223A22323032302D30342D3134227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutEntry/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('330', '2020-06-17 17:06:49', '2020-06-17 17:06:49', 0x5B335D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutManage/delete', '1');
INSERT INTO `tb_sys_user_log` VALUES ('331', '2020-06-17 17:09:15', '2020-06-17 17:09:15', 0x5B7B226964223A342C2263726561746544617465223A22323032302D30362D31372031373A30383A3536222C226C6173744D6F646966696564223A22323032302D30362D31372031373A30383A3536222C2264656C466C6167223A302C22656E747279557365724964223A312C22656E7472795573657252656D61726B223A2220202020222C22656E7472794E616D65223A22323032302D303420E69C8DE8A385E8B4B9E694AFE587BA222C22656E74727944657363223A2220202020E69C8DE8A385E8B4B9E694AFE587BA222C22656E747279416D6F756E74223A313030302E30302C22656E74727954797065223A302C22656E74727948617070656E44617465223A22323032302D30342D3231227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutEntry/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('332', '2020-06-17 17:10:31', '2020-06-17 17:10:31', 0x5B7B226964223A352C2263726561746544617465223A22323032302D30362D31372031373A31303A3135222C226C6173744D6F646966696564223A22323032302D30362D31372031373A31303A3135222C2264656C466C6167223A302C22656E747279557365724964223A312C22656E7472795573657252656D61726B223A2220202020222C22656E7472794E616D65223A22323032302D3034222C22656E74727944657363223A2220202020E890A5E4B89AE694B6E585A5222C22656E747279416D6F756E74223A353030302E30302C22656E74727954797065223A312C22656E74727948617070656E44617465223A22323032302D30342D3031227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutEntry/add', '1');
INSERT INTO `tb_sys_user_log` VALUES ('333', '2020-06-17 17:13:07', '2020-06-17 17:13:07', 0x5B7B226964223A362C2263726561746544617465223A22323032302D30362D31372031373A31333A3037222C226C6173744D6F646966696564223A22323032302D30362D31372031373A31333A3037222C2264656C466C6167223A302C22656E747279557365724964223A312C22656E7472795573657252656D61726B223A2220202020222C22656E7472794E616D65223A22323032302D303820E588A9E6B6A6222C22656E74727944657363223A2220202020E588A9E6B6A6222C22656E747279416D6F756E74223A343030302E30302C22656E74727954797065223A322C22656E74727948617070656E44617465223A22323032302D30382D3033227D5D, '127.0.0.1', 0x6E756C6C, '/planning/user/financeInOutEntry/add', '1');
