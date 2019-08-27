/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : running

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 27/08/2019 20:28:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_carousel
-- ----------------------------
DROP TABLE IF EXISTS `app_carousel`;
CREATE TABLE `app_carousel`  (
  `carousel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '轮播图表',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接（预留）',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `del` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '删除标志',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_login_log
-- ----------------------------
DROP TABLE IF EXISTS `app_login_log`;
CREATE TABLE `app_login_log`  (
  `login_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '具体消息',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_member
-- ----------------------------
DROP TABLE IF EXISTS `app_member`;
CREATE TABLE `app_member`  (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序用户的openid',
  `head` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别(字典)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员等级',
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在国家',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `language` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语种',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '授权日期',
  `last_login` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '状态(启用)',
  `del_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '删除标志',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '平台文章表',
  `article_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型（实验室法检图文、实验室快检图文）',
  `main_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `sub_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '子图JSON',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `del` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '删除标志',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'PROFESSION_TEST', NULL, NULL, NULL, '法检图文', NULL, 'N', NULL, '2019-08-16 15:18:06', 1, '2019-08-25 15:24:29', 1);
INSERT INTO `article` VALUES (2, 'QUICK_TEST', NULL, NULL, NULL, '快检图文', NULL, 'N', NULL, '2019-08-16 15:21:06', 1, '2019-08-25 15:24:37', 1);

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '轮播图表',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接（预留）',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `del` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '删除标志',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_info
-- ----------------------------
DROP TABLE IF EXISTS `pay_info`;
CREATE TABLE `pay_info`  (
  `pay_info_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `user_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型（根据用户类型来判断用户角色）',
  `order_no` bigint(20) NULL DEFAULT NULL COMMENT '订单号',
  `pay_platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付平台(微信、支付宝)',
  `platform_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付流水号（第三方接口返回流水号）',
  `platform_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付状态（第三方接口返回状态）',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`pay_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_record
-- ----------------------------
DROP TABLE IF EXISTS `pay_record`;
CREATE TABLE `pay_record`  (
  `pay_record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `request_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求数据',
  `response_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '响应数据',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `user_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`pay_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方支付接口记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pro_contact
-- ----------------------------
DROP TABLE IF EXISTS `pro_contact`;
CREATE TABLE `pro_contact`  (
  `contact_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `start` datetime(0) NULL DEFAULT NULL COMMENT '上班时间',
  `end` datetime(0) NULL DEFAULT NULL COMMENT '下班时间',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`contact_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1151432786055757826 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服联系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_contact
-- ----------------------------
INSERT INTO `pro_contact` VALUES (1150954379450773505, '刘某人', '156489787897', 'ENABLE', 'dhfdsjjh', '1970-01-01 08:03:00', '1970-01-01 21:14:27', '2019-07-16 10:24:42', 1, '2019-08-26 10:00:26', 1162185426314104833);

-- ----------------------------
-- Table structure for quartz_task_errors
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_errors`;
CREATE TABLE `quartz_task_errors`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskExecuteRecordId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务执行记录Id',
  `errorKey` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息关键字',
  `errorValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '信息内容',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1164326332358090755 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务出错现场信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quartz_task_informations
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_informations`;
CREATE TABLE `quartz_task_informations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL COMMENT '版本号：需要乐观锁控制',
  `taskNo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务编号',
  `taskName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `schedulerRule` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时规则表达式',
  `frozenStatus` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '冻结状态',
  `executorNo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行方',
  `frozenTime` bigint(13) NULL DEFAULT NULL COMMENT '冻结时间',
  `unfrozenTime` bigint(13) NULL DEFAULT NULL COMMENT '解冻时间',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) NULL DEFAULT NULL COMMENT '最近修改时间',
  `sendType` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送方式',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `executeParamter` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行参数',
  `timeKey` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1151331308104298498 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quartz_task_informations
-- ----------------------------
INSERT INTO `quartz_task_informations` VALUES (1151040572494417922, 25, '10001', '公告管理-刷新公告', '0 0 0/1 * * ? ', 'FROZEN', '1', 1566435552662, 1566370180631, 1563264432433, 1566435552662, 'http', 'http://localhost/quartzApi/bulletin/checkEnd', '', 'yyyy-MM-dd HH:mm:ss');

-- ----------------------------
-- Table structure for quartz_task_records
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_records`;
CREATE TABLE `quartz_task_records`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskNo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务编号',
  `timeKeyValue` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行时间格式值',
  `executeTime` bigint(13) NOT NULL COMMENT '执行时间',
  `taskStatus` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态',
  `failcount` int(10) NULL DEFAULT NULL COMMENT '失败统计数',
  `failReason` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败错误描述',
  `createTime` bigint(13) NOT NULL COMMENT '创建时间',
  `lastModifyTime` bigint(13) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_records_taskno`(`taskNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 530 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务执行情况记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性编码',
  `value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '状态   Y：启用   N：禁用',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型 （SYSTEM-系统参数 COMMON-公用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '删除 Y：是 N:否',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `code_key`(`code`, `del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1165931855616573443 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1149509364430114818, 'a', 'a', 'a', 'Y', NULL, 'a', 'Y', '2019-07-12 10:42:44', '2019-07-12 10:42:47', 1, 1);
INSERT INTO `sys_config` VALUES (1149509393307897857, 'ass', 'UPLOAD_PATH', 'ass', 'Y', NULL, 'as', 'Y', '2019-07-12 10:42:51', '2019-07-12 11:15:32', 1, 1);
INSERT INTO `sys_config` VALUES (1149516285870583810, 'UPLOAD_PATH', 'F:/xunzi/file/running/uploads/', '图片上传路径', 'Y', 'SYSTEM', '本地路径', 'N', '2019-07-12 11:10:14', '2019-08-27 20:25:57', 1, 1);
INSERT INTO `sys_config` VALUES (1151062171687780353, 'BULLETIN_DAYS', '1', '公告持续天数', 'Y', 'SYSTEM', '单位：天', 'N', '2019-07-16 17:33:02', '2019-07-16 17:40:17', 1, 1);
INSERT INTO `sys_config` VALUES (1158949544719257601, 'APPID', 'wxba8404960652459a', '小程序APPID', 'Y', 'SYSTEM', '', 'N', '2019-08-07 11:54:38', '2019-08-07 16:15:04', 1, 1);
INSERT INTO `sys_config` VALUES (1158949729381879810, 'APP_SECRET', '256e10bf27bfc5806dd07c9439e88533', '小程序秘钥', 'Y', 'SYSTEM', '', 'N', '2019-08-07 11:55:22', '2019-08-07 16:15:11', 1, 1);
INSERT INTO `sys_config` VALUES (1158949985486082049, 'REQUEST_URL', 'https://api.weixin.qq.com/sns/jscode2session', '小程序授权地址', 'Y', 'SYSTEM', '', 'N', '2019-08-07 11:56:23', NULL, 1, NULL);
INSERT INTO `sys_config` VALUES (1159351193522630658, 'REPORT_ADDRESS', '深圳市龙岗区坂田城市山海中心', '自取报告地址', 'Y', 'COMMON', 'fdsadf', 'N', '2019-08-08 14:30:39', '2019-08-16 10:02:25', 1, 1);
INSERT INTO `sys_config` VALUES (1163395267435053058, 'TOKEN_EXPIRE', '0', '小程序token过期时间', 'Y', 'SYSTEM', '单位：秒', 'N', '2019-08-19 18:20:21', '2019-08-23 11:14:55', 1, 1);
INSERT INTO `sys_config` VALUES (1164056505542426625, 'URL', 'http://192.168.101.184:8046', '本站URL', 'Y', 'SYSTEM', '外链使用', 'N', '2019-08-21 14:07:53', NULL, 1, NULL);
INSERT INTO `sys_config` VALUES (1165931855616573442, 'GET_ACCESS_TOKEN_URL', 'https://api.weixin.qq.com/sns/oauth2/access_token', '小程序code换取access_token', 'Y', 'SYSTEM', '', 'N', '2019-08-26 18:19:51', '2019-08-26 18:20:11', 1, 1);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `pids` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '父级ids',
  `simple_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '简称',
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '全称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (24, 0, '[0],', '总公司', '总公司', '', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (25, 24, '[0],[24],', '开发部', '开发部', '', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (26, 24, '[0],[24],', '运营部', '运营部', '', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (27, 24, '[0],[24],', '战略部', '战略部', '', NULL, 4, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `DICT_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `PID` bigint(20) NULL DEFAULT NULL COMMENT '父级字典id',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典的编码',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  `SORT` int(11) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`DICT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1152109452771954690 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (50, 0, '性别', 'SEX', '', 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (51, 50, '男', 'M', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (52, 50, '女', 'F', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (53, 0, '状态', 'STATUS', '', 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (54, 53, '启用', 'ENABLE', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (55, 53, '禁用', 'DISABLE', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (56, 0, '账号状态', 'ACCOUNT_STATUS', '', 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (57, 56, '启用', 'ENABLE', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (58, 56, '冻结', 'FREEZE', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (59, 56, '已删除', 'DELETED', NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES (1071611355157749761, 0, '是否删除', 'DEL_FLAG', '用于数据库中是否删除的标记', NULL, '2018-12-09 11:43:51', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1071611420735692802, 1071611355157749761, '已经删除', 'Y', '', NULL, '2018-12-09 11:44:07', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1071611458312462337, 1071611355157749761, '未删除', 'N', '', NULL, '2018-12-09 11:44:16', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1148858644307619841, 0, '公告状态', 'BULLETIN_STATUS', '公告状态', 1, '2019-07-10 15:37:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1148859056968413186, 1148858644307619841, '已发布', 'PUBLISHED', '', NULL, '2019-07-10 15:38:39', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1148859179098157058, 1148858644307619841, '已关闭', 'CLOSED', '', NULL, '2019-07-10 15:39:08', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151337222978908161, 0, '任务状态', 'TASK_STATUS', '定时任务', 10, '2019-07-17 11:45:59', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151337433683963906, 1151337222978908161, '已冻结', 'FROZEN', '', 1, '2019-07-17 11:46:50', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151337527841894401, 1151337222978908161, '未冻结', 'UNFROZEN', '', NULL, '2019-07-17 11:47:12', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151388593702789122, 0, '任务执行状态', 'RECORD_STATUS', '任务执行状态', NULL, '2019-07-17 15:10:07', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151388663365984257, 1151388593702789122, '成功', 'SUCCESS', '', NULL, '2019-07-17 15:10:24', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151388764310298625, 1151388593702789122, '失败', 'FAIL', '', NULL, '2019-07-17 15:10:48', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151690806841012226, 0, '等级审核状态', 'LEVEL_APPROVAL_STATUS', '', NULL, '2019-07-18 11:11:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151690941201346562, 1151690806841012226, '通过', 'SUCCESS', '', NULL, '2019-07-18 11:11:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151691094331191297, 1151690806841012226, '拒绝', 'REJECT', '', NULL, '2019-07-18 11:12:09', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1151691355325952001, 1151690806841012226, '待审核', 'APPROVALING', '', NULL, '2019-07-18 11:13:11', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_type_id` bigint(20) NOT NULL COMMENT '字典类型id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典类型编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典类型名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字典描述',
  `system_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否是系统字典，Y-是，N-否',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1106120208097067009, 'SEX', '性别', '', 'Y', 'ENABLE', 4, '2019-03-14 17:09:43', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120265689055233, 'STATUS', '状态', '', 'Y', 'ENABLE', 3, '2019-03-14 17:09:57', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120322450571266, 'ACCOUNT_STATUS', '账号状态', '', 'Y', 'ENABLE', 21112, '2019-03-14 17:10:10', 1, '2019-03-16 10:56:15', 1);
INSERT INTO `sys_dict_type` VALUES (1106120388036902914, 'DEL_FLAG', '是否删除', '', 'Y', 'ENABLE', 2, '2019-03-14 17:10:26', 1, '2019-03-27 16:26:31', 1);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `file_data` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'base64编码的文件',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES ('1', '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', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `login_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '具体消息',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1164436827819995138, '登录日志', 1162185426314104833, '2019-08-22 15:19:09', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1164447765709189122, '登录日志', 1162185426314104833, '2019-08-22 16:02:36', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1164448071012577282, '登录日志', 1162185426314104833, '2019-08-22 16:03:49', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164448105217126401, '登录日志', 1162185426314104833, '2019-08-22 16:03:57', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164449112265302017, '登录日志', 1162185426314104833, '2019-08-22 16:07:57', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164449719894122497, '登录日志', 1162185426314104833, '2019-08-22 16:10:22', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1164450487644692482, '退出日志', 1162185426314104833, '2019-08-22 16:13:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164450701625499649, '登录日志', 1, '2019-08-22 16:14:16', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164456290384490498, '登录失败日志', NULL, '2019-08-22 16:36:29', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164456307069431809, '登录日志', 1162185426314104833, '2019-08-22 16:36:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164461980045946882, '登录日志', 1162185426314104833, '2019-08-22 16:59:05', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1164473613640151042, '登录日志', 1162185426314104833, '2019-08-22 17:45:19', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1164473650675855361, '登录日志', 1162185426314104833, '2019-08-22 17:45:28', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1164503204597477378, '登录日志', 1162185426314104833, '2019-08-22 19:42:54', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1164504452998508545, '登录日志', 1162185426314104833, '2019-08-22 19:47:52', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164528178347520001, '登录日志', 1162185426314104833, '2019-08-22 21:22:08', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1164544373809360898, '登录日志', 1162185426314104833, '2019-08-22 22:26:30', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1164701910466813954, '登录日志', 1162185426314104833, '2019-08-23 08:52:29', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164716529876942850, '登录日志', 1162185426314104833, '2019-08-23 09:50:35', '成功', NULL, '192.168.101.62');
INSERT INTO `sys_login_log` VALUES (1164717732782358530, '登录日志', 1162185426314104833, '2019-08-23 09:55:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164737713599365122, '登录日志', 1, '2019-08-23 11:14:45', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164742565809287170, '登录日志', 1162185426314104833, '2019-08-23 11:34:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164744133740785666, '登录日志', 1162185426314104833, '2019-08-23 11:40:16', '成功', NULL, '192.168.101.62');
INSERT INTO `sys_login_log` VALUES (1164756107237208066, '登录日志', 1162185426314104833, '2019-08-23 12:27:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1164757725735235586, '登录日志', 1162185426314104833, '2019-08-23 12:34:17', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1165509440935714818, '登录日志', 1162185426314104833, '2019-08-25 14:21:19', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165515318309130242, '登录日志', 1162185426314104833, '2019-08-25 14:44:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165516098663583746, '登录日志', 1162185426314104833, '2019-08-25 14:47:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165517584697122817, '登录日志', 1162185426314104833, '2019-08-25 14:53:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165520377361190914, '登录日志', 1162185426314104833, '2019-08-25 15:04:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165524120198684674, '登录日志', 1162185426314104833, '2019-08-25 15:19:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165532088537321473, '登录日志', 1162185426314104833, '2019-08-25 15:51:19', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165543282270765058, '登录日志', 1162185426314104833, '2019-08-25 16:35:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165569778888704002, '退出日志', 1162185426314104833, '2019-08-25 18:21:05', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165569794999025665, '登录日志', 1, '2019-08-25 18:21:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165579826389999617, '登录日志', 1162185426314104833, '2019-08-25 19:01:01', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165581457420607489, '登录日志', 1162185426314104833, '2019-08-25 19:07:30', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1165587050608975873, '登录日志', 1162185426314104833, '2019-08-25 19:29:43', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165587233145085953, '登录日志', 1162185426314104833, '2019-08-25 19:30:27', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1165588388688326658, '登录日志', 1162185426314104833, '2019-08-25 19:35:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165588875303088130, '登录日志', 1162185426314104833, '2019-08-25 19:36:58', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1165597742728712193, '登录失败日志', NULL, '2019-08-25 20:12:12', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165597756632829954, '登录日志', 1162185426314104833, '2019-08-25 20:12:16', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165598337057419266, '登录日志', 1162185426314104833, '2019-08-25 20:14:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165618535764201474, '登录日志', 1162185426314104833, '2019-08-25 21:34:50', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165798386664079361, '登录日志', 1162185426314104833, '2019-08-26 09:29:29', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165806061821054977, '登录日志', 1162185426314104833, '2019-08-26 09:59:59', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165807242739929089, '登录日志', 1162185426314104833, '2019-08-26 10:04:41', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1165828904126386177, '登录日志', 1162185426314104833, '2019-08-26 11:30:45', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165833577872887810, '登录日志', 1162185426314104833, '2019-08-26 11:49:20', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1165845997655822338, '登录日志', 1162185426314104833, '2019-08-26 12:38:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165867913003274241, '登录日志', 1162185426314104833, '2019-08-26 14:05:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165876354635665409, '登录日志', 1162185426314104833, '2019-08-26 14:39:19', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165876389901373441, '登录日志', 1162185426314104833, '2019-08-26 14:39:27', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1165887324665810946, '登录日志', 1162185426314104833, '2019-08-26 15:22:54', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1165895220652875778, '登录日志', 1162185426314104833, '2019-08-26 15:54:16', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165901523328638977, '登录日志', 1162185426314104833, '2019-08-26 16:19:19', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1165902460747194370, '登录日志', 1162185426314104833, '2019-08-26 16:23:03', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1165918836681527298, '登录日志', 1162185426314104833, '2019-08-26 17:28:07', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165920018464428034, '登录日志', 1162185426314104833, '2019-08-26 17:32:49', '成功', NULL, '192.168.101.129');
INSERT INTO `sys_login_log` VALUES (1165927702190280705, '登录日志', 1162185426314104833, '2019-08-26 18:03:21', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1165930525091053570, '登录日志', 1162185426314104833, '2019-08-26 18:14:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165931014834765826, '退出日志', 1162185426314104833, '2019-08-26 18:16:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165931176059633665, '登录日志', 1162185426314104833, '2019-08-26 18:17:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165931258880360450, '退出日志', 1162185426314104833, '2019-08-26 18:17:29', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165931273283600385, '登录日志', 1, '2019-08-26 18:17:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1165939861523750914, '登录日志', 1162185426314104833, '2019-08-26 18:51:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166156120039309314, '登录日志', 1162185426314104833, '2019-08-27 09:11:00', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166157718362734593, '退出日志', 1162185426314104833, '2019-08-27 09:17:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166157741464961026, '登录日志', 1, '2019-08-27 09:17:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166168828797206529, '登录日志', 1162185426314104833, '2019-08-27 10:01:30', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1166178818211659777, '登录日志', 1162185426314104833, '2019-08-27 10:41:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166182958002290690, '登录日志', 1162185426314104833, '2019-08-27 10:57:38', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1166187192559026178, '登录失败日志', NULL, '2019-08-27 11:14:28', '成功', '账号:admin,账号密码错误', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166187209944416258, '登录日志', 1162185426314104833, '2019-08-27 11:14:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1166198149012209666, '登录日志', 1162185426314104833, '2019-08-27 11:58:00', '成功', NULL, '192.168.101.134');
INSERT INTO `sys_login_log` VALUES (1166324813041995777, '登录日志', 1, '2019-08-27 20:21:19', '成功', NULL, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'url地址',
  `sort` int(65) NULL DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) NULL DEFAULT NULL COMMENT '菜单层级',
  `menu_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否是菜单(字典)',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'ENABLE' COMMENT '菜单状态(字典)',
  `new_page_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否打开新页面的标识(字典)',
  `open_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否打开(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1162169504748765229 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (105, 'system', '0', '[0],', '系统管理', 'layui-icon layui-icon-set', '#', 20, 1, 'Y', NULL, 'ENABLE', NULL, '1', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 1, 2, 'Y', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (114, 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', 2, 2, 'Y', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', NULL, '/menu', 4, 2, 'Y', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (128, 'log', 'system', '[0],[system],', '业务日志', NULL, '/log', 6, 2, 'Y', NULL, 'ENABLE', NULL, '0', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', NULL, '/druid', 7, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', NULL, '/dept', 3, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', '', '/dict', 4, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', 6, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dictType/addItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dictType/editItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dictType/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', 9, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (145, 'sys_message', 'dashboard', '[0],[dashboard],', '消息通知', 'layui-icon layui-icon-tips', '/system/notice', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-04-08 22:49:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (149, 'api_mgr', 'dev_tools', '[0],[dev_tools],', '接口文档', 'fa-leaf', '/swagger-ui.html', 2, 2, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-04-08 22:55:06', NULL, 1);
INSERT INTO `sys_menu` VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 'N', NULL, 'ENABLE', NULL, NULL, NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (171, 'dev_tools', '0', '[0],', 'API管理', 'layui-icon layui-icon-code-circle', '#', 30, 1, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-04-08 22:55:06', NULL, 1);
INSERT INTO `sys_menu` VALUES (172, 'dashboard', '0', '[0],', '主控面板', 'layui-icon layui-icon-home', '#', 10, 1, 'Y', NULL, 'ENABLE', NULL, NULL, NULL, '2019-04-08 22:48:15', NULL, 1);
INSERT INTO `sys_menu` VALUES (1111545968697860098, 'console', 'dashboard', '[0],[dashboard],', '项目介绍', '', '/system/console', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-03-29 16:29:45', '2019-04-09 20:57:08', 1, 1);
INSERT INTO `sys_menu` VALUES (1149241750835384322, 'meta_data', '0', '[0],', '配置管理', 'layui-icon layui-icon-set', '#', 1260, 1, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-07-11 16:59:20', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1149245899933175809, 'sys_config', 'meta_data', '[0],[meta_data],', '系统参数', '', '/config', 1, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-07-11 17:15:49', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1149252216697606145, 'config_add', 'sys_config', '[0],[meta_data],[sys_config],', '参数添加', '', '/config/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-11 17:40:55', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1149252395379150850, 'config_edit', 'sys_config', '[0],[meta_data],[sys_config],', '参数编辑', '', '/config/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-11 17:41:38', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1149252671922196481, 'config_delete', 'sys_config', '[0],[meta_data],[sys_config],', '参数删除', '', '/config/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-11 17:42:44', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1149252756831686658, 'config_list', 'sys_config', '[0],[meta_data],[sys_config],', '参数列表', '', '/config/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-11 17:43:04', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1149500160365518849, 'config_detail', 'sys_config', '[0],[meta_data],[sys_config],', '参数详情', '', '/config/detail', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-12 10:06:10', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1150950637493944321, 'contact_list', 'contact', '[0],[contract],[contact],,', '客服列表', '', '/contact/list', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 10:09:50', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1150950921758703618, 'contact_add', 'contact', '[0],[contract],[contact],,', '客服添加', '', '/contact/add', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 10:10:58', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1150951184716398593, 'contact_edit', 'contact', '[0],[contract],[contact],,', '客服编辑', '', '/contact/edit', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 10:12:01', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1150951353369362434, 'contact_delete', 'contact', '[0],[contract],[contact],,', '客服删除', '', '/contact/delete', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 10:12:41', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1150951627794284545, 'contact_detail', 'contact', '[0],[contract],[contact],,', '客服详情', '', '/contact/detail', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 10:13:46', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1150963764302426114, 'contact_status', 'contact', '[0],[contract],[contact],,', '修改状态', '', '/contact/status', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 11:02:00', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1150966441220452353, 'bul_edit', 'bulletin', '[0],[promotion],[bulletin],', '公告编辑', '', '/bulletin/edit', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 11:12:38', '2019-07-18 09:34:43', 1, 1);
INSERT INTO `sys_menu` VALUES (1150976468895371265, 'bul_content', 'bulletin', '[0],[promotion],[bulletin],', '公告内容信息', '', '/bulletin/content', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-16 11:52:29', '2019-07-18 09:34:43', 1, 1);
INSERT INTO `sys_menu` VALUES (1151298497548816386, 'task', 'meta_data', '[0],[meta_data],', '定时任务', '', '#', 2, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-07-17 09:12:07', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151299051423436802, 'task_info', 'task', '[0],[meta_data],[task],', '任务管理', '', '/task/info', 1, 3, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-07-17 09:14:19', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151299481209573378, 'task_info_list', 'task_info', '[0],[meta_data],[task],[task_info],', '任务列表', '', '/task/info/list', 1, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 09:16:01', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151299731441750018, 'task_record', 'task', '[0],[meta_data],[task],', '执行情况', '', '/task/record', 2, 3, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-07-17 09:17:01', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151300032999624705, 'task_record_list', 'task_record', '[0],[meta_data],[task],[task_record],', '执行列表', '', '/task/record/list', 1, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 09:18:13', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151307792311029761, 'task_info_add', 'task_info', '[0],[meta_data],[task],[task_info],', '任务添加', '', '/task/info/add', 2, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 09:49:03', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151316039642316801, 'task_info_start_now', 'task_info', '[0],[meta_data],[task],[task_info],', '单次立即运行', '', '/task/info/start_now', 3, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 10:21:49', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151316292537876482, 'task_info_edit', 'task_info', '[0],[meta_data],[task],[task_info],', '任务修改', '', '/task/info/edit', 4, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 10:22:49', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151339278661824514, 'task_info_option_task', 'task_info', '[0],[meta_data],[task],[task_info],', '任务操作', '', '/task/info/option_task', 5, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 11:54:10', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1151341217541763074, 'task_info_detail', 'task_info', '[0],[meta_data],[task],[task_info],', '任务详情', '', '/task/info/detail', 6, 4, 'N', NULL, 'ENABLE', NULL, NULL, '2019-07-17 12:01:52', '2019-07-18 09:34:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1161083318982619138, 'article', '0', '[0],', '文章管理', 'layui-icon layui-icon-read', '#', 2300, 1, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-13 09:13:30', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161085383893004289, 'generate', 'meta_data', '[0],[meta_data],', '代码生成', '', '/code', 3, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-13 09:21:42', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161287414551289858, 'ca', '0', '[0],', '轮播图管理', 'layui-icon layui-icon-carousel', '#', 2500, 1, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-13 22:44:30', '2019-08-14 08:55:54', 1, 1);
INSERT INTO `sys_menu` VALUES (1161287661230891010, 'contract', '0', '[0],', '客服设置', 'layui-icon layui-icon-chat', '#', 2700, 1, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-13 22:45:29', '2019-08-15 16:02:02', 1, 1);
INSERT INTO `sys_menu` VALUES (1161287661230891029, 'contact', 'contract', '[0],[contract],', '客服联系方式设置', '', '/contact', 1200, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-14 09:47:22', '2019-08-15 16:02:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1161476427667103745, 'bulletin', 'ca', '[0],[ca],', '轮播图列表', '', '/bulletin', 1, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-14 11:15:34', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161479110171951105, 'bul_list', 'bulletin', '[0],[ca],[bulletin],', '列表', '', '/bulletin/list', NULL, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-14 11:26:14', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161480182831738882, 'bul_add', 'bulletin', '[0],[ca],[bulletin],', '添加', '', '/bulletin/add', NULL, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-14 11:30:30', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161517839653666818, 'bul_delete', 'bulletin', '[0],[ca],[bulletin],', '删除', '', '/bulletin/delete', NULL, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-14 14:00:08', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161885547658403860, 'platform_article', 'article', '[0],[article],', '简介文章', '', '/article', 1300, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-15 17:03:39', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161885547658403861, 'platform_article_list', 'platform_article', '[0],[article],[platform_article],', '列表', '', '/article/list', 1000, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-15 17:03:39', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161885547658403862, 'platform_article_add', 'platform_article', '[0],[article],[platform_article],', '添加', '', '/article/add', 1200, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-15 17:03:39', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161885547658403863, 'platform_article_detail', 'platform_article', '[0],[article],[platform_article],', '详情', '', '/article/detail', 1300, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-15 17:03:39', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161885547658403864, 'platform_article_edit', 'platform_article', '[0],[article],[platform_article],', '编辑', '', '/article/edit', 1400, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-15 17:03:39', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1161885547658403865, 'detect_delete', 'platform_article', '[0],[article],[platform_article],', '删除', '', '/article/delete', 1500, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-15 17:03:39', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1162169504748765186, 'common', '0', '[0],', '公共参数', 'layui-icon layui-icon-tips', '#', 2800, 1, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:09:37', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1162169504748765187, 'com_config', 'common', '[0],[common],', '公共参数', '', '/com_config', 1400, 2, 'Y', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:21:30', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1162169504748765188, 'com_config_list', 'com_config', '[0],[common],[com_config],', '列表', '', '/com_config/comList', 1000, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:21:30', '2019-08-16 09:29:28', 1, 1);
INSERT INTO `sys_menu` VALUES (1162169504748765189, 'com_config_add', 'com_config', '[0],[common],[com_config],', '添加', '', '/com_config/add', 1200, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:21:30', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1162169504748765190, 'com_config_detail', 'com_config', '[0],[common],[com_config],', '详情', '', '/com_config/detail', 1300, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:21:30', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1162169504748765191, 'com_config_edit', 'com_config', '[0],[common],[com_config],', '编辑', '', '/com_config/edit', 1400, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:21:30', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1162169504748765192, 'detect_delete', 'com_config', '[0],[common],[com_config],', '删除', '', '/com_config/delete', 1500, 3, 'N', NULL, 'ENABLE', NULL, NULL, '2019-08-16 09:21:30', '2019-08-16 09:37:37', 1, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '欢迎', 'hi，Guns旗舰版发布了！', '2017-01-11 08:53:20', 1, '2018-12-28 23:24:48', 1);
INSERT INTO `sys_notice` VALUES (8, '你好', '你好，世界！', '2017-05-10 19:28:57', 1, '2018-12-28 23:28:26', 1);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `operation_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志类型(字典)',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(65) NULL DEFAULT NULL COMMENT '用户id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '方法名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否成功(字典)',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备注',
  PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
  `region_id` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `short_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level_type` int(11) NULL DEFAULT NULL,
  `city_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merger_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lng` float NULL DEFAULT NULL,
  `lat` float NULL DEFAULT NULL,
  `pinyin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`region_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation`  (
  `relation_id` bigint(20) NOT NULL COMMENT '主键',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES (1071348922291826689, 105, 5);
INSERT INTO `sys_relation` VALUES (1071348922308603906, 106, 5);
INSERT INTO `sys_relation` VALUES (1071348922316992514, 107, 5);
INSERT INTO `sys_relation` VALUES (1071348922321186818, 108, 5);
INSERT INTO `sys_relation` VALUES (1071348922329575426, 109, 5);
INSERT INTO `sys_relation` VALUES (1071348922337964034, 110, 5);
INSERT INTO `sys_relation` VALUES (1071348922342158337, 111, 5);
INSERT INTO `sys_relation` VALUES (1071348922350546946, 112, 5);
INSERT INTO `sys_relation` VALUES (1071348922354741249, 113, 5);
INSERT INTO `sys_relation` VALUES (1071348922363129858, 165, 5);
INSERT INTO `sys_relation` VALUES (1071348922371518465, 166, 5);
INSERT INTO `sys_relation` VALUES (1071348922375712770, 167, 5);
INSERT INTO `sys_relation` VALUES (1071348922384101377, 114, 5);
INSERT INTO `sys_relation` VALUES (1071348922388295681, 115, 5);
INSERT INTO `sys_relation` VALUES (1071348922396684289, 116, 5);
INSERT INTO `sys_relation` VALUES (1071348922405072897, 117, 5);
INSERT INTO `sys_relation` VALUES (1071348922413461505, 118, 5);
INSERT INTO `sys_relation` VALUES (1071348922417655810, 162, 5);
INSERT INTO `sys_relation` VALUES (1071348922426044418, 163, 5);
INSERT INTO `sys_relation` VALUES (1071348922430238722, 164, 5);
INSERT INTO `sys_relation` VALUES (1071348922430238723, 119, 5);
INSERT INTO `sys_relation` VALUES (1071348922447015937, 120, 5);
INSERT INTO `sys_relation` VALUES (1071348922451210242, 121, 5);
INSERT INTO `sys_relation` VALUES (1071348922459598850, 122, 5);
INSERT INTO `sys_relation` VALUES (1071348922463793154, 150, 5);
INSERT INTO `sys_relation` VALUES (1071348922472181762, 151, 5);
INSERT INTO `sys_relation` VALUES (1071348922476376065, 128, 5);
INSERT INTO `sys_relation` VALUES (1071348922480570369, 134, 5);
INSERT INTO `sys_relation` VALUES (1071348922488958977, 158, 5);
INSERT INTO `sys_relation` VALUES (1071348922497347586, 159, 5);
INSERT INTO `sys_relation` VALUES (1071348922501541890, 130, 5);
INSERT INTO `sys_relation` VALUES (1071348922501541891, 131, 5);
INSERT INTO `sys_relation` VALUES (1071348922518319106, 135, 5);
INSERT INTO `sys_relation` VALUES (1071348922526707713, 136, 5);
INSERT INTO `sys_relation` VALUES (1071348922530902017, 137, 5);
INSERT INTO `sys_relation` VALUES (1071348922535096321, 152, 5);
INSERT INTO `sys_relation` VALUES (1071348922543484930, 153, 5);
INSERT INTO `sys_relation` VALUES (1071348922547679233, 154, 5);
INSERT INTO `sys_relation` VALUES (1071348922556067841, 132, 5);
INSERT INTO `sys_relation` VALUES (1071348922560262146, 138, 5);
INSERT INTO `sys_relation` VALUES (1071348922564456450, 139, 5);
INSERT INTO `sys_relation` VALUES (1071348922568650754, 140, 5);
INSERT INTO `sys_relation` VALUES (1071348922577039361, 155, 5);
INSERT INTO `sys_relation` VALUES (1071348922577039362, 156, 5);
INSERT INTO `sys_relation` VALUES (1071348922577039363, 157, 5);
INSERT INTO `sys_relation` VALUES (1071348922602205185, 133, 5);
INSERT INTO `sys_relation` VALUES (1071348922610593794, 160, 5);
INSERT INTO `sys_relation` VALUES (1071348922610593795, 161, 5);
INSERT INTO `sys_relation` VALUES (1071348922618982402, 141, 5);
INSERT INTO `sys_relation` VALUES (1071348922627371009, 142, 5);
INSERT INTO `sys_relation` VALUES (1071348922631565313, 143, 5);
INSERT INTO `sys_relation` VALUES (1071348922639953922, 144, 5);
INSERT INTO `sys_relation` VALUES (1164165943284637698, 105, 1);
INSERT INTO `sys_relation` VALUES (1164165943293026305, 106, 1);
INSERT INTO `sys_relation` VALUES (1164165943301414913, 107, 1);
INSERT INTO `sys_relation` VALUES (1164165943309803522, 108, 1);
INSERT INTO `sys_relation` VALUES (1164165943318192129, 109, 1);
INSERT INTO `sys_relation` VALUES (1164165943334969346, 110, 1);
INSERT INTO `sys_relation` VALUES (1164165943343357954, 111, 1);
INSERT INTO `sys_relation` VALUES (1164165943347552257, 112, 1);
INSERT INTO `sys_relation` VALUES (1164165943364329474, 113, 1);
INSERT INTO `sys_relation` VALUES (1164165943368523777, 165, 1);
INSERT INTO `sys_relation` VALUES (1164165943376912385, 166, 1);
INSERT INTO `sys_relation` VALUES (1164165943385300994, 167, 1);
INSERT INTO `sys_relation` VALUES (1164165943393689602, 114, 1);
INSERT INTO `sys_relation` VALUES (1164165943397883905, 115, 1);
INSERT INTO `sys_relation` VALUES (1164165943406272514, 116, 1);
INSERT INTO `sys_relation` VALUES (1164165943414661122, 117, 1);
INSERT INTO `sys_relation` VALUES (1164165943431438338, 118, 1);
INSERT INTO `sys_relation` VALUES (1164165943439826945, 162, 1);
INSERT INTO `sys_relation` VALUES (1164165943448215553, 163, 1);
INSERT INTO `sys_relation` VALUES (1164165943452409857, 164, 1);
INSERT INTO `sys_relation` VALUES (1164165943469187073, 119, 1);
INSERT INTO `sys_relation` VALUES (1164165943477575681, 120, 1);
INSERT INTO `sys_relation` VALUES (1164165943485964290, 121, 1);
INSERT INTO `sys_relation` VALUES (1164165943494352897, 122, 1);
INSERT INTO `sys_relation` VALUES (1164165943502741505, 150, 1);
INSERT INTO `sys_relation` VALUES (1164165943511130114, 151, 1);
INSERT INTO `sys_relation` VALUES (1164165943519518721, 128, 1);
INSERT INTO `sys_relation` VALUES (1164165943523713025, 134, 1);
INSERT INTO `sys_relation` VALUES (1164165943532101633, 158, 1);
INSERT INTO `sys_relation` VALUES (1164165943544684545, 159, 1);
INSERT INTO `sys_relation` VALUES (1164165943557267458, 130, 1);
INSERT INTO `sys_relation` VALUES (1164165943561461762, 131, 1);
INSERT INTO `sys_relation` VALUES (1164165943569850369, 135, 1);
INSERT INTO `sys_relation` VALUES (1164165943578238977, 136, 1);
INSERT INTO `sys_relation` VALUES (1164165943586627585, 137, 1);
INSERT INTO `sys_relation` VALUES (1164165943595016193, 152, 1);
INSERT INTO `sys_relation` VALUES (1164165943603404802, 153, 1);
INSERT INTO `sys_relation` VALUES (1164165943611793410, 154, 1);
INSERT INTO `sys_relation` VALUES (1164165943620182017, 132, 1);
INSERT INTO `sys_relation` VALUES (1164165943628570625, 138, 1);
INSERT INTO `sys_relation` VALUES (1164165943636959233, 139, 1);
INSERT INTO `sys_relation` VALUES (1164165943645347841, 140, 1);
INSERT INTO `sys_relation` VALUES (1164165943653736449, 155, 1);
INSERT INTO `sys_relation` VALUES (1164165943666319362, 156, 1);
INSERT INTO `sys_relation` VALUES (1164165943674707970, 157, 1);
INSERT INTO `sys_relation` VALUES (1164165943678902274, 133, 1);
INSERT INTO `sys_relation` VALUES (1164165943695679489, 160, 1);
INSERT INTO `sys_relation` VALUES (1164165943704068098, 161, 1);
INSERT INTO `sys_relation` VALUES (1164165943708262402, 141, 1);
INSERT INTO `sys_relation` VALUES (1164165943716651009, 142, 1);
INSERT INTO `sys_relation` VALUES (1164165943725039617, 143, 1);
INSERT INTO `sys_relation` VALUES (1164165943737622530, 144, 1);
INSERT INTO `sys_relation` VALUES (1164165943746011138, 171, 1);
INSERT INTO `sys_relation` VALUES (1164165943754399745, 149, 1);
INSERT INTO `sys_relation` VALUES (1164165943762788354, 1149241750835384322, 1);
INSERT INTO `sys_relation` VALUES (1164165943771176962, 1149245899933175809, 1);
INSERT INTO `sys_relation` VALUES (1164165943787954177, 1149252216697606145, 1);
INSERT INTO `sys_relation` VALUES (1164165943787954178, 1149252395379150850, 1);
INSERT INTO `sys_relation` VALUES (1164165943796342786, 1149252671922196481, 1);
INSERT INTO `sys_relation` VALUES (1164165943804731393, 1149252756831686658, 1);
INSERT INTO `sys_relation` VALUES (1164165943817314305, 1149500160365518849, 1);
INSERT INTO `sys_relation` VALUES (1164165943834091521, 1151298497548816386, 1);
INSERT INTO `sys_relation` VALUES (1164165943842480129, 1151299051423436802, 1);
INSERT INTO `sys_relation` VALUES (1164165943850868738, 1151299481209573378, 1);
INSERT INTO `sys_relation` VALUES (1164165943855063042, 1151307792311029761, 1);
INSERT INTO `sys_relation` VALUES (1164165943863451649, 1151316039642316801, 1);
INSERT INTO `sys_relation` VALUES (1164165943871840258, 1151316292537876482, 1);
INSERT INTO `sys_relation` VALUES (1164165943880228866, 1151339278661824514, 1);
INSERT INTO `sys_relation` VALUES (1164165943897006081, 1151341217541763074, 1);
INSERT INTO `sys_relation` VALUES (1164165943905394690, 1151299731441750018, 1);
INSERT INTO `sys_relation` VALUES (1164165943913783298, 1151300032999624705, 1);
INSERT INTO `sys_relation` VALUES (1164165943913783299, 1161085383893004289, 1);
INSERT INTO `sys_relation` VALUES (1164165944559706114, 1161083318982619138, 1);
INSERT INTO `sys_relation` VALUES (1164165944626814977, 1161885547658403860, 1);
INSERT INTO `sys_relation` VALUES (1164165944631009282, 1161885547658403861, 1);
INSERT INTO `sys_relation` VALUES (1164165944639397890, 1161885547658403862, 1);
INSERT INTO `sys_relation` VALUES (1164165944647786498, 1161885547658403863, 1);
INSERT INTO `sys_relation` VALUES (1164165944656175105, 1161885547658403864, 1);
INSERT INTO `sys_relation` VALUES (1164165944664563714, 1161885547658403865, 1);
INSERT INTO `sys_relation` VALUES (1164165945029468161, 1161287414551289858, 1);
INSERT INTO `sys_relation` VALUES (1164165945037856769, 1161476427667103745, 1);
INSERT INTO `sys_relation` VALUES (1164165945054633986, 1150966441220452353, 1);
INSERT INTO `sys_relation` VALUES (1164165945063022594, 1150976468895371265, 1);
INSERT INTO `sys_relation` VALUES (1164165945075605505, 1161479110171951105, 1);
INSERT INTO `sys_relation` VALUES (1164165945079799810, 1161480182831738882, 1);
INSERT INTO `sys_relation` VALUES (1164165945088188417, 1161517839653666818, 1);
INSERT INTO `sys_relation` VALUES (1164165945268543490, 1161287661230891010, 1);
INSERT INTO `sys_relation` VALUES (1164165945268543491, 1161287661230891029, 1);
INSERT INTO `sys_relation` VALUES (1164165945276932097, 1150950637493944321, 1);
INSERT INTO `sys_relation` VALUES (1164165945285320706, 1150950921758703618, 1);
INSERT INTO `sys_relation` VALUES (1164165945293709314, 1150951184716398593, 1);
INSERT INTO `sys_relation` VALUES (1164165945310486529, 1150951353369362434, 1);
INSERT INTO `sys_relation` VALUES (1164165945314680833, 1150951627794284545, 1);
INSERT INTO `sys_relation` VALUES (1164165945318875138, 1150963764302426114, 1);
INSERT INTO `sys_relation` VALUES (1164165945327263746, 1162169504748765186, 1);
INSERT INTO `sys_relation` VALUES (1164165945335652353, 1162169504748765187, 1);
INSERT INTO `sys_relation` VALUES (1164165945348235265, 1162169504748765188, 1);
INSERT INTO `sys_relation` VALUES (1164165945356623873, 1162169504748765189, 1);
INSERT INTO `sys_relation` VALUES (1164165945365012482, 1162169504748765190, 1);
INSERT INTO `sys_relation` VALUES (1164165945369206786, 1162169504748765191, 1);
INSERT INTO `sys_relation` VALUES (1164165945377595394, 1162169504748765192, 1);
INSERT INTO `sys_relation` VALUES (1164165973307465730, 1161083318982619138, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973366185986, 1161885547658403860, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973374574593, 1161885547658403861, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973382963201, 1161885547658403862, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973391351809, 1161885547658403863, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973399740418, 1161885547658403864, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973412323330, 1161885547658403865, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973785616386, 1161287414551289858, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973794004993, 1161476427667103745, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973802393602, 1150966441220452353, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973814976513, 1150976468895371265, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973823365121, 1161479110171951105, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973827559425, 1161480182831738882, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165973844336641, 1161517839653666818, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974003720193, 1161287661230891010, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974012108802, 1161287661230891029, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974020497410, 1150950637493944321, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974028886017, 1150950921758703618, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974037274625, 1150951184716398593, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974045663233, 1150951353369362434, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974054051842, 1150951627794284545, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974062440450, 1150963764302426114, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974070829057, 1162169504748765186, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974079217666, 1162169504748765187, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974087606274, 1162169504748765188, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974095994882, 1162169504748765189, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974100189186, 1162169504748765190, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974108577793, 1162169504748765191, 1160803118378016770);
INSERT INTO `sys_relation` VALUES (1164165974116966402, 1162169504748765192, 1160803118378016770);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '提示',
  `sort` int(11) NULL DEFAULT NULL COMMENT '序号',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 0, '超级管理员', 'administrator', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (5, 1, '临时', 'temp', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (1160803118378016770, 0, '后台管理员', 'platform', NULL, NULL, '2019-08-12 14:40:05', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别(字典)',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色id(多个逗号隔开)',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id(多个逗号隔开)',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '1', 'root', 'f96aa420921cbb361c98b523f9b160aa', 'q6taw', '超级用户', '2018-11-16 00:00:00', 'M', 'sn93@qq.com', '18200000000', '1', 27, 'ENABLE', '2016-01-29 08:49:53', NULL, '2019-08-21 10:34:49', 24, 25);
INSERT INTO `sys_user` VALUES (1162185426314104833, NULL, 'admin', '5a93ed45ca79cc9406c9c808cb93d69f', 'g57yc', '管理员', NULL, NULL, NULL, '', '1160803118378016770', 0, 'ENABLE', '2019-08-16 10:12:53', 1, '2019-08-21 10:25:10', 1, NULL);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `del` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '删除标志',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '更新人'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'test' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
