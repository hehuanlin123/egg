/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 14/04/2020 22:15:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `is_removed` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `author_id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_id` (`id`) USING BTREE,
  KEY `author_id` (`author_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `paper_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for paper_info
-- ----------------------------
DROP TABLE IF EXISTS `paper_info`;
CREATE TABLE `paper_info` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `read_count` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `is_removed` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `author_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paper_id` (`id`) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for praise_info
-- ----------------------------
DROP TABLE IF EXISTS `praise_info`;
CREATE TABLE `praise_info` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `author_id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `praise_id` (`id`) USING BTREE,
  KEY `user_author_id` (`author_id`),
  KEY `user_post_id` (`post_id`),
  CONSTRAINT `user_author_id` FOREIGN KEY (`author_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_post_id` FOREIGN KEY (`post_id`) REFERENCES `paper_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for tag_info
-- ----------------------------
DROP TABLE IF EXISTS `tag_info`;
CREATE TABLE `tag_info` (
  `id` int(100) NOT NULL,
  `tag_name` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `is_removed` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键，自动递增',
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `join_time` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '0-不活跃，1-活跃，默认为0',
  `last_login_time` datetime DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '1-男性，2-女性，3-私密，4-未知，默认值为4',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `is_sign_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL COMMENT '登录状态，默认值为false',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

SET FOREIGN_KEY_CHECKS = 1;
