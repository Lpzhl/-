/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : coursechoose

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-01-12 16:34:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c_ccourse`
-- ----------------------------
DROP TABLE IF EXISTS `c_ccourse`;
CREATE TABLE `c_ccourse` (
  `stu_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `stu_name` varchar(32) DEFAULT NULL,
  `ccourse_mark` int(11) DEFAULT '0',
  `ccourse_time` datetime DEFAULT NULL,
  PRIMARY KEY (`stu_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `c_ccourse_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `c_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_ccourse_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `c_student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_ccourse
-- ----------------------------
INSERT INTO `c_ccourse` VALUES ('10004', '1', '陈罗志', '87', '2014-03-05 11:38:13');
INSERT INTO `c_ccourse` VALUES ('10015', '2', '陈皮', '61', '2024-03-05 11:04:57');
INSERT INTO `c_ccourse` VALUES ('10015', '8', '陈皮', '88', '2023-03-05 11:04:45');
INSERT INTO `c_ccourse` VALUES ('10015', '10', '陈皮', '68', '2022-03-05 11:05:05');
INSERT INTO `c_ccourse` VALUES ('10016', '9', '刘流', '100', '2024-01-08 22:07:23');
INSERT INTO `c_ccourse` VALUES ('10016', '10', '刘流', '100', '2024-01-10 19:42:29');
INSERT INTO `c_ccourse` VALUES ('10016', '17', '刘流', '0', '2024-01-10 16:01:35');
INSERT INTO `c_ccourse` VALUES ('10017', '1', '李玉', '99', '2016-03-06 17:10:13');
INSERT INTO `c_ccourse` VALUES ('10017', '3', '李玉', '0', '2018-03-06 17:10:16');
INSERT INTO `c_ccourse` VALUES ('10019', '2', '昭君', '100', '2018-03-06 17:10:27');
INSERT INTO `c_ccourse` VALUES ('10019', '3', '昭君', '100', '2018-03-06 17:10:24');
INSERT INTO `c_ccourse` VALUES ('10019', '5', '昭君', '0', '2018-03-07 10:06:27');
INSERT INTO `c_ccourse` VALUES ('10019', '15', null, '0', '2024-01-11 11:11:10');
INSERT INTO `c_ccourse` VALUES ('10020', '1', null, '0', '2024-01-11 11:15:30');
INSERT INTO `c_ccourse` VALUES ('10020', '9', '王军', '0', '2024-01-08 21:51:11');
INSERT INTO `c_ccourse` VALUES ('10021', '2', '马一', '98', '2018-03-06 16:18:06');
INSERT INTO `c_ccourse` VALUES ('10021', '5', '马一', '98', '2018-03-06 16:17:44');
INSERT INTO `c_ccourse` VALUES ('10021', '9', '马一', '98', '2018-03-07 10:09:42');
INSERT INTO `c_ccourse` VALUES ('10021', '10', '马一', '0', '2018-03-07 10:09:40');
INSERT INTO `c_ccourse` VALUES ('10022', '1', null, '0', '2024-01-11 11:15:02');
INSERT INTO `c_ccourse` VALUES ('10023', '1', null, '0', '2024-01-11 11:15:48');
INSERT INTO `c_ccourse` VALUES ('10023', '5', null, '0', '2024-01-11 11:15:53');
INSERT INTO `c_ccourse` VALUES ('10023', '12', null, '0', '2024-01-11 11:16:00');
INSERT INTO `c_ccourse` VALUES ('10024', '1', null, '0', '2024-01-11 11:33:12');
INSERT INTO `c_ccourse` VALUES ('10025', '5', '仁春', '100', '2024-01-09 20:42:18');

-- ----------------------------
-- Table structure for `c_class`
-- ----------------------------
DROP TABLE IF EXISTS `c_class`;
CREATE TABLE `c_class` (
  `class_id` int(2) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `class_maxnum` int(2) NOT NULL,
  `grade_id` int(2) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `grade_id` (`grade_id`),
  CONSTRAINT `grade_id` FOREIGN KEY (`grade_id`) REFERENCES `c_grade` (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_class
-- ----------------------------
INSERT INTO `c_class` VALUES ('1', '核弹技术07-1', '50', '1');
INSERT INTO `c_class` VALUES ('2', '核弹技术07-2', '50', '1');
INSERT INTO `c_class` VALUES ('3', '软件工程', '25', '2');
INSERT INTO `c_class` VALUES ('4', '信息技术', '55', '2');
INSERT INTO `c_class` VALUES ('5', '计算机技术', '50', '3');
INSERT INTO `c_class` VALUES ('6', '软件工程2', '50', '3');

-- ----------------------------
-- Table structure for `c_course`
-- ----------------------------
DROP TABLE IF EXISTS `c_course`;
CREATE TABLE `c_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(20) NOT NULL,
  `course_credit` float NOT NULL,
  `course_info` varchar(50) NOT NULL,
  `course_begin_time` datetime NOT NULL,
  `teach_id` int(11) NOT NULL,
  `course_finish_time` datetime DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `teach_id` (`teach_id`),
  CONSTRAINT `c_course_ibfk_1` FOREIGN KEY (`teach_id`) REFERENCES `c_teacher` (`teach_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_course
-- ----------------------------
INSERT INTO `c_course` VALUES ('1', '计算机技术', '4', '关于计算机技术的课程', '2011-05-28 12:38:58', '1', null);
INSERT INTO `c_course` VALUES ('2', '核弹技术', '3', '学习核弹技术，关于核弹技术的课程', '2011-05-28 12:39:33', '1', null);
INSERT INTO `c_course` VALUES ('3', '石油化工', '5', '学习石油化工，关于石油化工的课程', '2011-05-28 12:40:09', '2', null);
INSERT INTO `c_course` VALUES ('4', '高等数学', '8', '学习高等数学，很好学的课', '2011-05-28 12:40:30', '3', null);
INSERT INTO `c_course` VALUES ('5', '数据结构与算法', '5', '很好的课程', '2011-06-08 00:00:00', '2', null);
INSERT INTO `c_course` VALUES ('8', '高分子', '5', '对！就是是高分子，而不是高分子材料！', '2008-08-08 00:00:00', '1', null);
INSERT INTO `c_course` VALUES ('9', '航空航天', '6', '世界一流的航空技术', '2009-09-06 00:00:00', '3', null);
INSERT INTO `c_course` VALUES ('10', '潜艇技术', '3', '很强的的技术，专门对付美国', '2011-06-02 00:00:00', '2', null);
INSERT INTO `c_course` VALUES ('11', '软件工程导论', '3', '很强的的技术，专门对付美国', '2018-03-05 00:00:00', '3', null);
INSERT INTO `c_course` VALUES ('12', '人工智能', '4', '学习人工智能', '2018-03-07 00:00:00', '4', null);
INSERT INTO `c_course` VALUES ('13', '计算机网络', '3', '学习计算机网络', '2022-03-07 00:00:00', '6', null);
INSERT INTO `c_course` VALUES ('14', '离散数学', '4', '学习离散数学', '2018-03-07 00:00:00', '3', null);
INSERT INTO `c_course` VALUES ('15', 'Java课程设计', '1', '', '2024-01-07 00:00:00', '7', null);
INSERT INTO `c_course` VALUES ('16', 'java', '3', 'javaaaaaaaaaaaa', '2024-01-10 00:00:00', '4', null);
INSERT INTO `c_course` VALUES ('17', 'C语言程序设计', '3', 'c语言言言言言言言言言言言言言言言言言言言言言言言言言言言言言言言言', '2024-01-10 00:00:00', '8', null);

-- ----------------------------
-- Table structure for `c_grade`
-- ----------------------------
DROP TABLE IF EXISTS `c_grade`;
CREATE TABLE `c_grade` (
  `grade_id` int(2) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_grade
-- ----------------------------
INSERT INTO `c_grade` VALUES ('1', '一年级');
INSERT INTO `c_grade` VALUES ('2', '二年级');
INSERT INTO `c_grade` VALUES ('3', '三年级');
INSERT INTO `c_grade` VALUES ('4', '四年级');
INSERT INTO `c_grade` VALUES ('5', '五年级');
INSERT INTO `c_grade` VALUES ('6', '六年级');
INSERT INTO `c_grade` VALUES ('7', '七年级');

-- ----------------------------
-- Table structure for `c_log`
-- ----------------------------
DROP TABLE IF EXISTS `c_log`;
CREATE TABLE `c_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_operate` varchar(50) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `login_user` varchar(32) NOT NULL,
  `log_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_log
-- ----------------------------
INSERT INTO `c_log` VALUES ('1', '[admin]管理员登陆系统', '2018-03-05 10:48:01', 'admin', null);
INSERT INTO `c_log` VALUES ('2', '[admin]管理员登陆系统', '2018-03-05 10:50:22', 'admin', null);
INSERT INTO `c_log` VALUES ('3', '[admin]管理员登陆系统', '2018-03-05 10:53:41', 'admin', null);
INSERT INTO `c_log` VALUES ('4', '[admin]管理员登陆系统', '2018-03-05 10:56:28', 'admin', null);
INSERT INTO `c_log` VALUES ('5', '[admin]管理员登陆系统', '2018-03-05 11:10:31', 'admin', null);
INSERT INTO `c_log` VALUES ('6', '[10015]号学生登陆系统', '2018-03-05 11:11:56', '10015', null);
INSERT INTO `c_log` VALUES ('7', '[1]号教师用户登陆系统', '2018-03-05 11:12:52', '1', null);
INSERT INTO `c_log` VALUES ('8', '[admin]管理员登陆系统', '2018-03-05 11:30:43', 'admin', null);
INSERT INTO `c_log` VALUES ('9', '[admin]管理员登陆系统', '2018-03-05 11:34:20', 'admin', null);
INSERT INTO `c_log` VALUES ('10', '[admin]管理员登陆系统', '2018-03-05 15:56:50', 'admin', null);
INSERT INTO `c_log` VALUES ('11', '[1]号教师用户登陆系统', '2018-03-05 16:04:24', '1', null);
INSERT INTO `c_log` VALUES ('12', '[1]号教师用户登陆系统', '2018-03-05 16:04:52', '1', null);
INSERT INTO `c_log` VALUES ('13', '[1]号教师用户登陆系统', '2018-03-05 16:08:38', '1', null);
INSERT INTO `c_log` VALUES ('14', '[10015]号学生登陆系统', '2018-03-05 16:10:18', '10015', null);
INSERT INTO `c_log` VALUES ('15', '[admin]管理员登陆系统', '2018-03-05 16:13:47', 'admin', null);
INSERT INTO `c_log` VALUES ('16', '[admin]管理员登陆系统', '2018-03-06 10:05:34', 'admin', null);
INSERT INTO `c_log` VALUES ('17', '[admin]管理员登陆系统', '2018-03-06 10:08:01', 'admin', null);
INSERT INTO `c_log` VALUES ('18', '[admin]管理员登陆系统', '2018-03-06 14:11:53', 'admin', null);
INSERT INTO `c_log` VALUES ('19', '[10016]号学生登陆系统', '2018-03-06 15:07:10', '10016', null);
INSERT INTO `c_log` VALUES ('20', '[10021]号学生登陆系统', '2018-03-06 15:19:25', '10021', null);
INSERT INTO `c_log` VALUES ('21', '[10021]号学生登陆系统', '2018-03-06 16:00:17', '10021', null);
INSERT INTO `c_log` VALUES ('22', '[10021]号学生登陆系统', '2018-03-06 16:01:35', '10021', null);
INSERT INTO `c_log` VALUES ('23', '[10021]号学生登陆系统', '2018-03-06 16:12:52', '10021', null);
INSERT INTO `c_log` VALUES ('24', '[10021]号学生登陆系统', '2018-03-06 16:15:27', '10021', null);
INSERT INTO `c_log` VALUES ('25', '[10021]号学生登陆系统', '2018-03-06 16:17:27', '10021', null);
INSERT INTO `c_log` VALUES ('26', '[10021]号学生登陆系统', '2018-03-06 16:19:51', '10021', null);
INSERT INTO `c_log` VALUES ('27', '[10021]号学生登陆系统', '2018-03-06 16:40:26', '10021', null);
INSERT INTO `c_log` VALUES ('28', '[10021]号学生登陆系统', '2018-03-06 16:42:44', '10021', null);
INSERT INTO `c_log` VALUES ('29', '[10021]号学生登陆系统', '2018-03-06 16:45:49', '10021', null);
INSERT INTO `c_log` VALUES ('30', '[admin]管理员登陆系统', '2018-03-06 17:00:52', 'admin', null);
INSERT INTO `c_log` VALUES ('31', '[admin]管理员登陆系统', '2018-03-06 17:01:05', 'admin', null);
INSERT INTO `c_log` VALUES ('32', '[admin]管理员登陆系统', '2018-03-07 10:01:59', 'admin', null);
INSERT INTO `c_log` VALUES ('33', '[10021]号学生登陆系统', '2018-03-07 10:09:21', '10021', null);
INSERT INTO `c_log` VALUES ('34', '[admin]管理员登陆系统', '2024-01-08 21:42:35', 'admin', null);
INSERT INTO `c_log` VALUES ('35', '[1]号教师用户登陆系统', '2024-01-08 21:50:28', '1', null);
INSERT INTO `c_log` VALUES ('36', '[admin]管理员登陆系统', '2024-01-08 22:01:39', 'admin', null);
INSERT INTO `c_log` VALUES ('37', '[10016]号学生登陆系统', '2024-01-08 22:07:00', '10016', null);
INSERT INTO `c_log` VALUES ('38', '[1]号教师用户登陆系统', '2024-01-08 22:30:58', '1', null);
INSERT INTO `c_log` VALUES ('39', '[admin]管理员登陆系统', '2024-01-08 22:42:26', 'admin', null);
INSERT INTO `c_log` VALUES ('40', '[10016]号学生登陆系统', '2024-01-08 22:57:10', '10016', null);
INSERT INTO `c_log` VALUES ('41', '[1]号教师用户登陆系统', '2024-01-08 23:00:07', '1', null);
INSERT INTO `c_log` VALUES ('42', '[admin]管理员登陆系统', '2024-01-09 10:58:10', 'admin', null);
INSERT INTO `c_log` VALUES ('43', '[10016]号学生登陆系统', '2024-01-09 10:58:36', '10016', null);
INSERT INTO `c_log` VALUES ('44', '[admin]管理员登陆系统', '2024-01-09 11:17:58', 'admin', null);
INSERT INTO `c_log` VALUES ('45', '[admin]管理员登陆系统', '2024-01-09 11:34:49', 'admin', null);
INSERT INTO `c_log` VALUES ('46', '[10016]号学生登陆系统', '2024-01-09 11:39:23', '10016', null);
INSERT INTO `c_log` VALUES ('47', '[10016]号学生登陆系统', '2024-01-09 11:45:00', '10016', null);
INSERT INTO `c_log` VALUES ('48', '[admin]管理员登陆系统', '2024-01-09 14:33:01', 'admin', null);
INSERT INTO `c_log` VALUES ('49', '[admin]管理员登陆系统', '2024-01-09 14:59:18', 'admin', null);
INSERT INTO `c_log` VALUES ('50', '[2]号教师用户登陆系统', '2024-01-09 15:24:49', '2', null);
INSERT INTO `c_log` VALUES ('51', '[admin]管理员登陆系统', '2024-01-09 15:53:11', 'admin', null);
INSERT INTO `c_log` VALUES ('52', '[admin]管理员登陆系统', '2024-01-09 16:14:07', 'admin', null);
INSERT INTO `c_log` VALUES ('53', '[admin]管理员登陆系统', '2024-01-09 16:14:46', 'admin', null);
INSERT INTO `c_log` VALUES ('54', '[admin]管理员登陆系统', '2024-01-09 17:28:17', 'admin', null);
INSERT INTO `c_log` VALUES ('55', '[admin]管理员登陆系统', '2024-01-09 20:06:49', 'admin', null);
INSERT INTO `c_log` VALUES ('56', '[10016]号学生登陆系统', '2024-01-09 20:39:24', '10016', null);
INSERT INTO `c_log` VALUES ('57', '[1]号教师用户登陆系统', '2024-01-09 20:41:11', '1', null);
INSERT INTO `c_log` VALUES ('58', '[admit]管理员登陆系统', '2024-01-09 20:46:19', 'admit', null);
INSERT INTO `c_log` VALUES ('59', '[史蒂夫]管理员登陆系统', '2024-01-09 20:48:14', '史蒂夫', null);
INSERT INTO `c_log` VALUES ('60', '[admit]管理员登陆系统', '2024-01-09 20:49:09', 'admit', null);
INSERT INTO `c_log` VALUES ('61', '[admin]管理员登陆系统', '2024-01-10 08:14:18', 'admin', null);
INSERT INTO `c_log` VALUES ('62', '[admin]管理员登陆系统', '2024-01-10 10:05:28', 'admin', null);
INSERT INTO `c_log` VALUES ('63', '[10016]号学生登陆系统', '2024-01-10 15:57:20', '10016', null);
INSERT INTO `c_log` VALUES ('64', '[10016]号学生登陆系统', '2024-01-10 16:01:07', '10016', null);
INSERT INTO `c_log` VALUES ('65', '[10016]号学生登陆系统', '2024-01-10 18:56:50', '10016', null);
INSERT INTO `c_log` VALUES ('66', '[admin]管理员登陆系统', '2024-01-10 19:43:49', 'admin', null);
INSERT INTO `c_log` VALUES ('67', '[1]号教师用户登陆系统', '2024-01-10 20:36:38', '1', null);
INSERT INTO `c_log` VALUES ('68', '[admin]管理员登陆系统', '2024-01-10 20:42:41', 'admin', null);
INSERT INTO `c_log` VALUES ('69', '[admin]管理员登陆系统', '2024-01-10 21:51:05', 'admin', null);
INSERT INTO `c_log` VALUES ('70', '[admin]管理员登陆系统', '2024-01-10 21:54:39', 'admin', null);
INSERT INTO `c_log` VALUES ('71', '[admin]管理员登陆系统', '2024-01-10 21:56:00', 'admin', null);
INSERT INTO `c_log` VALUES ('72', '[admin]管理员登陆系统', '2024-01-10 21:57:19', 'admin', null);
INSERT INTO `c_log` VALUES ('73', '[admin]管理员登陆系统', '2024-01-10 22:22:55', 'admin', null);
INSERT INTO `c_log` VALUES ('74', '[admin]管理员登陆系统', '2024-01-11 08:08:13', 'admin', null);
INSERT INTO `c_log` VALUES ('75', '[admin]管理员登陆系统', '2024-01-11 08:34:46', 'admin', null);
INSERT INTO `c_log` VALUES ('76', '[admin]管理员登陆系统', '2024-01-11 08:36:27', 'admin', null);
INSERT INTO `c_log` VALUES ('77', '[admin]管理员登陆系统', '2024-01-11 10:45:29', 'admin', null);
INSERT INTO `c_log` VALUES ('78', '[admin]管理员登陆系统', '2024-01-11 10:46:18', 'admin', null);
INSERT INTO `c_log` VALUES ('79', '[admin]管理员登陆系统', '2024-01-11 10:47:58', 'admin', null);
INSERT INTO `c_log` VALUES ('80', '[admin]管理员登陆系统', '2024-01-11 10:53:20', 'admin', null);
INSERT INTO `c_log` VALUES ('81', '[admin]管理员登陆系统', '2024-01-11 14:41:31', 'admin', null);
INSERT INTO `c_log` VALUES ('82', '[admin]管理员登陆系统', '2024-01-11 14:41:48', 'admin', null);
INSERT INTO `c_log` VALUES ('83', '[admin]管理员登陆系统', '2024-01-11 18:10:10', 'admin', null);
INSERT INTO `c_log` VALUES ('84', '[admin]管理员登陆系统', '2024-01-12 01:34:57', 'admin', null);
INSERT INTO `c_log` VALUES ('85', '[admin]管理员登陆系统', '2024-01-12 10:32:19', 'admin', null);
INSERT INTO `c_log` VALUES ('86', '[admin]管理员登陆系统', '2024-01-12 10:45:55', 'admin', null);
INSERT INTO `c_log` VALUES ('87', '[admin]管理员登陆系统', '2024-01-12 10:52:35', 'admin', null);
INSERT INTO `c_log` VALUES ('88', '[史蒂夫]管理员登陆系统', '2024-01-12 11:03:03', '史蒂夫', null);
INSERT INTO `c_log` VALUES ('89', '[史蒂文]管理员登陆系统', '2024-01-12 11:03:47', '史蒂文', null);
INSERT INTO `c_log` VALUES ('90', '[admin]管理员登陆系统', '2024-01-12 11:11:44', 'admin', null);
INSERT INTO `c_log` VALUES ('91', '[admin]管理员登陆系统', '2024-01-12 11:12:44', 'admin', null);
INSERT INTO `c_log` VALUES ('92', '[admin]管理员登陆系统', '2024-01-12 15:38:08', 'admin', null);
INSERT INTO `c_log` VALUES ('93', '[admin]管理员登陆系统', '2024-01-12 15:42:41', 'admin', null);

-- ----------------------------
-- Table structure for `c_student`
-- ----------------------------
DROP TABLE IF EXISTS `c_student`;
CREATE TABLE `c_student` (
  `stu_id` int(8) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stu_sex` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(10) NOT NULL,
  `stu_password` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1',
  `grade_id` int(11) DEFAULT NULL,
  `log_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10028 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_student
-- ----------------------------
INSERT INTO `c_student` VALUES ('10004', '陈罗志', '男', '1', 'chen', '1', '吉首');
INSERT INTO `c_student` VALUES ('10015', '陈皮', '男', '1', '1', '2', '吉首');
INSERT INTO `c_student` VALUES ('10016', '刘流', '女', '2', '1', '3', '吉首');
INSERT INTO `c_student` VALUES ('10017', '李玉', '女', '2', '1', '4', '吉首');
INSERT INTO `c_student` VALUES ('10019', '昭君', '女', '3', '1', '5', '吉首');
INSERT INTO `c_student` VALUES ('10020', '王军', '男', '4', '1', '6', '吉首');
INSERT INTO `c_student` VALUES ('10021', '马一', '男', '3', '1', '7', '吉首');
INSERT INTO `c_student` VALUES ('10022', '赵雅琴', '女', '5', '1', '6', '吉首');
INSERT INTO `c_student` VALUES ('10023', '首发', '男', '5', '1', '5', '吉首');
INSERT INTO `c_student` VALUES ('10024', '人和', '男', '4', '1', '4', '吉首');
INSERT INTO `c_student` VALUES ('10025', '仁春', '女', '5', '1', '3', '吉首');
INSERT INTO `c_student` VALUES ('10026', '东南', '女', '3', '1', '2', '吉首');
INSERT INTO `c_student` VALUES ('10027', '都说服', '男', '1', '1', '1', null);

-- ----------------------------
-- Table structure for `c_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `c_teacher`;
CREATE TABLE `c_teacher` (
  `teach_id` int(11) NOT NULL AUTO_INCREMENT,
  `teach_name` varchar(8) NOT NULL,
  `teach_sex` varchar(2) NOT NULL,
  `teach_education` varchar(8) NOT NULL,
  `teach_password` varchar(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`teach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_teacher
-- ----------------------------
INSERT INTO `c_teacher` VALUES ('1', '李老师', '女', '博士', '1');
INSERT INTO `c_teacher` VALUES ('2', '陈老师', '男', '硕士', '1');
INSERT INTO `c_teacher` VALUES ('3', '吴老师', '女', '硕士', '1');
INSERT INTO `c_teacher` VALUES ('4', '张老师', '男', '学士', '1');
INSERT INTO `c_teacher` VALUES ('5', '钟老师', '女', '博士', '1');
INSERT INTO `c_teacher` VALUES ('6', '薛老师', '女', '博士', '1');
INSERT INTO `c_teacher` VALUES ('7', '何老师', '男', '博士', '1');
INSERT INTO `c_teacher` VALUES ('8', '徐老师', '男', '硕士', '1');

-- ----------------------------
-- Table structure for `c_user`
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(12) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_login_ip` varchar(20) DEFAULT NULL,
  `user_login_time` datetime DEFAULT NULL,
  `user_privilege` varchar(32) NOT NULL DEFAULT '',
  `user_identity` varchar(32) DEFAULT NULL,
  `grade_id` int(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('2', 'admin', '12345', '上海', null, '管理员', '管理员', null);
INSERT INTO `c_user` VALUES ('4', 'admit', '123', null, null, '管理员', '管理员', null);
INSERT INTO `c_user` VALUES ('6', '史蒂夫', '1', null, null, '管理员', '管理员', null);
INSERT INTO `c_user` VALUES ('7', '史蒂文', '1', null, null, '普通用户', null, null);
