/*
 Navicat Premium Data Transfer

 Source Server         : 916
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : professional_streaming

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 30/09/2020 14:38:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `admin_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `charge` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业负责人姓名',
  `institute` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院',
  `major` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分流专业',
  `major_categories` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大类专业',
  PRIMARY KEY (`major_id`) USING BTREE,
  INDEX `idx_major`(`major`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专业负责人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sno` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `sname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `institute` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院',
  `major` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `classname` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级',
  `grade` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年级',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `gpa` int(1) NOT NULL COMMENT '绩点',
  PRIMARY KEY (`sno`) USING BTREE,
  INDEX `idx_insititute`(`institute`) USING BTREE,
  INDEX `idx_majot`(`major`) USING BTREE,
  INDEX `idx_class`(`classname`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('111111', '潘杰才五五五五五五', '信息科学与工程学院', '软件工程', '1', '2020', '1597470774@qq.com', 3);
INSERT INTO `student` VALUES ('222222', '曹磊', '信息学院', '软件工程', '1', '2020', '22', 1);
INSERT INTO `student` VALUES ('333333', '岑展宇', '信息学院', '软件工程', '2', '2020', '33', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '用户名 对学生来说是学号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '111111' COMMENT '密码',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '用户类型：1学生，2专业负责人，0管理员',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号密码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111111', '111111', 1);
INSERT INTO `user` VALUES ('222222', '111111', 1);
INSERT INTO `user` VALUES ('333333', '111111', 1);

-- ----------------------------
-- Table structure for wish
-- ----------------------------
DROP TABLE IF EXISTS `wish`;
CREATE TABLE `wish`  (
  `wish_id` int(8) NOT NULL AUTO_INCREMENT,
  `sno` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `wish_major` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '志愿专业',
  `wish_level` int(1) NOT NULL COMMENT '志愿等级1，2，3',
  PRIMARY KEY (`wish_id`) USING BTREE,
  INDEX `idx_sno`(`sno`) USING BTREE,
  INDEX `idx_wish_major_id`(`wish_major`) USING BTREE,
  CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '志愿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wish
-- ----------------------------

-- ----------------------------
-- Triggers structure for table admin
-- ----------------------------
DROP TRIGGER IF EXISTS `admin_insert_tigger`;
delimiter ;;
CREATE TRIGGER `admin_insert_tigger` AFTER INSERT ON `admin` FOR EACH ROW BEGIN
INSERT INTO USER(username,password,type) values(new.admin_id,'000000','0');
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_tigger`;
delimiter ;;
CREATE TRIGGER `insert_tigger` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
INSERT INTO USER(username,password,type) values(new.sno,'111111','1');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
