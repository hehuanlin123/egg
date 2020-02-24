/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : egg_demo

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 25/02/2020 00:14:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for news_detail
-- ----------------------------
DROP TABLE IF EXISTS `news_detail`;
CREATE TABLE `news_detail` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of news_detail
-- ----------------------------
BEGIN;
INSERT INTO `news_detail` VALUES (1, '标题', 'http://localhost:63342/egg_demo_client/src/assets/demo.jpg', '简介', '文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容', '2020-02-25 00:07:50');
INSERT INTO `news_detail` VALUES (2, '标题', 'http://localhost:63342/egg_demo_client/src/assets/demo.jpg', '简介', '文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容', '2020-02-25 00:07:50');
INSERT INTO `news_detail` VALUES (3, '标题', 'http://localhost:63342/egg_demo_client/src/assets/demo.jpg', '简介', '文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容', '2020-02-25 00:07:50');
INSERT INTO `news_detail` VALUES (4, '标题', 'http://localhost:63342/egg_demo_client/src/assets/demo.jpg', '简介', '文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容', '2020-02-25 00:07:50');
INSERT INTO `news_detail` VALUES (5, '标题', 'http://localhost:63342/egg_demo_client/src/assets/demo.jpg', '简介', '文章内容，文章内容，文章内容，文章内容，文章内容，文章内容，文章内容', '2020-02-25 00:07:50');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
