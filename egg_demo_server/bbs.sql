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

 Date: 27/04/2020 00:22:18
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
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_croatian_ci,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `read_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `is_removed` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `author_id` varchar(100) COLLATE utf8_croatian_ci DEFAULT NULL,
  `taglist` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `posttype` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '版块',
  `praise_count` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `comment_count` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `href` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paper_id` (`id`) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of paper_info
-- ----------------------------
BEGIN;
INSERT INTO `paper_info` VALUES (1, NULL, 'ZWVlZWVlZWU=', '2020-04-25 10:17:33', NULL, NULL, '0', '1', '心情,工作', '说', 'Python', NULL, NULL, 'http://localhost:8080/bbs/detail?id=1', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png');
INSERT INTO `paper_info` VALUES (2, NULL, 'Z3NnaHNneXdzeXdzeXV3', '2020-04-25 10:19:31', NULL, NULL, '0', '7', '心情,工作', '说', 'Java', NULL, NULL, 'http://localhost:8080/bbs/detail?id=2', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png');
INSERT INTO `paper_info` VALUES (3, NULL, 'd3d3d3d3dw==', '2020-04-25 10:19:50', NULL, NULL, '0', '7', '心情,工作', '说', '5G', NULL, NULL, 'http://localhost:8080/bbs/detail?id=3', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png');
INSERT INTO `paper_info` VALUES (4, '111', 'PHA+MTExMTwvcD4=', '2020-04-25 11:48:43', NULL, NULL, '0', '7', 'Java,云计算大数据,5G', '发帖了', '程序人生', NULL, NULL, 'http://localhost:8080/bbs/detail?id=4', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png');
INSERT INTO `paper_info` VALUES (5, '11', 'PGgxPjExMTE8L2gxPjxwPnNnaHNnaHNzdXVzdXNodXN1d3VzPC9wPjxwPjxzcGFuIGNsYXNzPSJxbC1mb250LVNpbUhlaSI+c2d3c3dzdXd1c3d1dXdzPC9zcGFuPjwvcD4=', '2020-04-25 11:52:51', NULL, NULL, '0', '1', 'Java,云计算大数据,5G,gshgswusuws', '发帖了', '前端', NULL, NULL, 'http://localhost:8080/bbs/detail?id=5', 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png');
INSERT INTO `paper_info` VALUES (7, '数仓分层的意义价值及如何设计数据分层', 'PGgyPuaWh+eroOebruW9lTwvaDI+PHA+PGVtPuS4gOOAgeWJjeiogDwvZW0+PC9wPjxwPjxlbT7kuozjgIHmlbDku5Plu7rmqKE8L2VtPjwvcD48cD48ZW0+5LiJ44CB5pWw5LuT5YiG5bGCPC9lbT48L3A+PHA+PGVtPuWbm+OAgeaVsOS7k+eahOWfuuacrOeJueW+gTwvZW0+PC9wPjxwPjxlbT7kupTjgIHmlbDmja7ku5PlupPnlKjpgJQ8L2VtPjwvcD48cD48ZW0+5YWt44CB5pWw5LuT5YiG5bGC55qE5aW95aSEPC9lbT48L3A+PHA+PGVtPuS4g+OAgeWmguS9leWIhuWxgjwvZW0+PC9wPjxwPjxlbT5SZWZlcjwvZW0+PC9wPjxoMj7kuIDjgIHliY3oqIA8L2gyPjxwPueOsOWcqOivtOaVsOS7k++8jOabtOWkmueahOS8muWSjOaVsOaNruW5s+WPsOaIluiAheWfuuehgOaetuaehOaQreS4iu+8jOW3sue7j+iejeWQiOWIsOaVtOS4quWfuuehgOiuvuaWveeahOaQreW7uuS4iuOAgui/memHjOWRou+8jOaIkeS7rOS4jeivtEhhZG9vcOWQhOenjee7hOS7tuS5i+mXtOeahOmFjeWQiO+8jOaIkeS7rOWwseeugOWNleivtOS4i+aVsOS7k+WIhuWxgueahOaEj+S5ieS7t+WAvOWSjOivpeWmguS9leiuvuiuoeWIhuWxgu+8jOWQjumdouWvueS6juaVsOS7k+eahOeQhuino++8jOWFtuWunumDveaYr+W3peS9nOS4reS4gOeCueS4gOeCueWunui3teWSjOaRuOe0ouW+l+adpeeahOOAgjwvcD48cD48YnI+PC9wPjxoMj7kuozjgIHmlbDku5Plu7rmqKE8L2gyPjxwPuivtOWIsOaVsOS7k+W7uuaooe+8jOWwseW+l+aPkOS4i+e7j+WFuOeahDLlpZfnkIborrrvvJo8L3A+PHA+PGJyPjwvcD48cD7ojIPlvI/lu7rmqKE8L3A+PHA+SW5tb27mj5Dlh7rnmoTpm4bnur/lmajnmoToh6rkuIrogIzkuIvvvIhFRFctRE3vvInnmoTmlbDmja7ku5PlupPmnrbmnoTjgII8L3A+PHA+PGJyPjwvcD48cD7nu7Tluqblu7rmqKE8L3A+PHA+S2ltYmFsbOaPkOWHuueahOaAu+e6v+W8j+eahOiHquS4i+iAjOS4iu+8iERNLURX77yJ55qE5pWw5o2u5LuT5bqT5p625p6E44CCPC9wPjxwPjxicj48L3A+PHA+5pWw5LuT55qE5bu65qih5oiW6ICF5YiG5bGC77yM5YW25a6e6YO95piv5Li65LqG5pu05aW955qE5Y6757uE57uH44CB566h55CG44CB57u05oqk5pWw5o2u77yM5a6e6ZmF5byA5Y+R5pe25Lya5pW05ZCIMuenjeaWueW8j+WOu+S9v+eUqO+8jOW9k+eEtu+8jOi/mOacieS6m+WFtuS7lueahO+8jOWDj0RhdGEgVmF1bHTmqKHlnovjgIFBbmNob3LmqKHlnovvvIzmmoLml7bov5jmsqHmnInlupTnlKjov4fvvIzlsLHkuI3or7TkuobjgII8L3A+PHA+PGJyPjwvcD48cD7nu7Tluqblu7rmqKHvvIzkuIDoiKzpg73kvJrmj5DliLDmmJ/lnovmqKHlnovjgIHpm6roirHmqKHlnovvvIzmmJ/lnovmqKHlnovlgZpPTEFQ5YiG5p6Q5b6I5pa55L6/44CCPC9wPjxwPjxicj48L3A+PGgyPuS4ieOAgeaVsOS7k+WIhuWxgjwvaDI+PHA+566A5Y2V54K55YS/77yM55u05o6lT0RTK0RN5bCx5Y+v5Lul5LqG77yM5bCG5omA5pyJ5pWw5o2u5ZCM5q2l6L+H5p2l77yM54S25ZCO55u05o6l5byA5Y+R5Lqb5bqU55So5bGC55qE5oql6KGo77yM6L+Z5piv5pyA566A5Y2V55qE5LqG77yb5b2TRE3lsYLnmoTlhoXlrrnlpJrkuobku6XlkI7vvIzmg7PopoHph43nlKjvvIzlsLHkvJrlho3mi4bliIbkuIDkuKrlhazlhbHlsYLlh7rmnaXvvIzlj5jmiJAz5bGC5p625p6E77yM5pyA6L+R55yL5LqG5pys6Zi/6YeM55qE5Lmm77yM44CK5aSn5pWw5o2u5LmL6Lev44CL77yM6YeM6Z2i5pyJ5b6I5aSa5pWw5LuT55u45YWz55qE5YaF5a6577yM5b6I5LiN6ZSZ77yM5Y+C6ICD5ZCO77yM55uu5YmN5L2/55So55qE5YiG5bGC5qih5byP5aaC5LiL77yaPC9wPjxwPjxicj48L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPjxwPuaMieeFp+i/meenjeWIhuWxguaWueW8j++8jOaIkeS7rOeahOW8gOWPkemHjeW/g+WwseWcqGR3ZOWxgu+8jOWwseaYr+aYjue7huaVsOaNruWxgu+8jOi/memHjOS4u+imgeaYr+S4gOS6m+WuveihqO+8jOWtmOWCqOeahOi/mOaYr+aYjue7huaVsOaNru+8m+WIsOS6hmR3c+Wxgu+8jOaIkeS7rOWwseS8mumSiOWvueS4jeWQjOeahOe7tOW6pu+8jOWvueaVsOaNrui/m+ihjOiBmuWQiOS6hu+8jOaMiemBk+eQhuivtO+8jGR3c+Wxgueul+aYr+mbhuW4guWxgu+8jOi/memHjOS4gOiIrOaMieeFp+S4u+mimOi/m+ihjOWIkuWIhu+8jOWxnuS6jue7tOW6puW7uuaooeeahOiMg+eVtO+8m2Fkc+WwseaYr+WBj+W6lOeUqOWxgu+8jOWQhOenjeaKpeihqOeahOi+k+WHuuS6huOAgjwvcD48cD48YnI+PC9wPjxoMj7lm5vjgIHmlbDku5PnmoTln7rmnKznibnlvoE8L2gyPjxwPuaVsOaNruS7k+W6k+aciTTkuKrln7rmnKznibnlvoHvvJrpnaLlkJHkuLvpopjnmoTjgIHpm4bmiJDnmoTjgIHnm7jlr7nnqLPlrprnmoTjgIHorrDlvZXljoblj7LnmoTvvIzogIzmlbDmja7ku5PlupPnmoTku7flgLzmraPmmK/ln7rkuo7ov5k05Liq54m55b6B5L2T546w55qE44CCPC9wPjxwPjxicj48L3A+PHA+MeOAgemrmOaViOeahOaVsOaNrue7hOe7h+WSjOeuoeeQhjwvcD48cD7pnaLlkJHkuLvpopjnmoTnibnmgKflhrPlrprkuobmlbDmja7ku5PlupPmi6XmnInkuJrliqHmlbDmja7lupPmiYDml6Dms5Xmi6XmnInnmoTpq5jmlYjnmoTmlbDmja7nu4Tnu4flvaLlvI/vvIzmm7TliqDlrozmlbTnmoTmlbDmja7kvZPns7vvvIzmuIXmmbDnmoTmlbDmja7liIbnsbvlkozliIblsYLmnLrliLbjgILlm6DkuLrmiYDmnInmlbDmja7lnKjov5vlhaXmlbDmja7ku5PlupPkuYvliY3pg73nu4/ov4fmuIXmtJflkozov4fmu6TvvIzkvb/ljp/lp4vmlbDmja7kuI3lho3mnYLkubHml6Dnq6DvvIzln7rkuo7kvJjljJbmn6Xor6LnmoTnu4Tnu4flvaLlvI/vvIzmnInmlYjmj5Dpq5jmlbDmja7ojrflj5bjgIHnu5/orqHlkozliIbmnpDnmoTmlYjnjofjgII8L3A+PHA+PGJyPjwvcD48cD4y44CB5pe26Ze05Lu35YC8PC9wPjxwPuaVsOaNruS7k+W6k+eahOaehOW7uuWwhuWkp+Wkp+e8qeefreiOt+WPluS/oeaBr+eahOaXtumXtO+8jOaVsOaNruS7k+W6k+S9nOS4uuaVsOaNrueahOmbhuWQiO+8jOaJgOacieeahOS/oeaBr+mDveWPr+S7peS7juaVsOaNruS7k+W6k+ebtOaOpeiOt+WPlu+8jOaVsOaNruS7k+W6k+eahOacgOWkp+S8mOWKv+WcqOS6juS4gOaXpuW6leWxguS7juWQhOexu+aVsOaNrua6kOWIsOaVsOaNruS7k+W6k+eahEVUTOa1geeoi+aehOW7uuaIkOWei++8jOmCo+S5iOavj+WkqeWwseS8muacieadpeiHquWQhOaWuemdoueahOS/oeaBr+mAmui/h+iHquWKqOS7u+WKoeiwg+W6pueahOW9ouW8j+a1geWFpeaVsOaNruS7k+W6k++8jOS7juiAjOS9v+S4gOWIh+WfuuS6jui/meS6m+W6leWxguS/oeaBr+eahOaVsOaNruiOt+WPlueahOaViOeOh+i+vuWIsOi/hemAn+aPkOWNh+OAgjwvcD48cD7ku47lupTnlKjmnaXnnIvvvIzkvb/nlKjmlbDmja7ku5PlupPlj6/ku6XlpKflpKfmj5Dpq5jmlbDmja7nmoTmn6Xor6LmlYjnjofvvIzlsKTlhbblr7nkuo7mtbfph4/mlbDmja7nmoTlhbPogZTmn6Xor6LlkozlpI3mnYLmn6Xor6LvvIzmiYDku6XmlbDmja7ku5PlupPmnInliKnkuo7lrp7njrDlpI3mnYLnmoTnu5/orqHpnIDmsYLvvIzmj5Dpq5jmlbDmja7nu5/orqHnmoTmlYjnjofjgII8L3A+PHA+PGJyPjwvcD48cD4z44CB6ZuG5oiQ5Lu35YC8PC9wPjxwPuaVsOaNruS7k+W6k+aYr+aJgOacieaVsOaNrueahOmbhuWQiO+8jOWMheaLrOaXpeW/l+S/oeaBr+OAgeaVsOaNruW6k+aVsOaNruOAgeaWh+acrOaVsOaNruOAgeWklumDqOaVsOaNruetiemDvembhuaIkOWcqOaVsOaNruS7k+W6k+S4re+8jOWvueS6juW6lOeUqOadpeivtO+8jOWunueOsOWQhOenjeS4jeWQjOaVsOaNrueahOWFs+iBlOW5tuS9v+Wkmue7tOWIhuaekOabtOWKoOaWueS+v++8jOS4uuS7juWkmuinkuW6puWkmuWxguasoeWcsOaVsOaNruWIhuaekOWSjOWGs+etluWItuWumuaPkOS+m+eahOWPr+iDveOAgjwvcD48cD48YnI+PC9wPjxwPjTjgIHljoblj7LntK/np6/ku7flgLw8L3A+PHA+6K6w5Y6G5Y+y5piv5pWw5o2u5LuT5bqT55qE54m55oCn5LmL5LiA77yM5pWw5o2u5LuT5bqT6IO95aSf6L+Y5Y6f5Y6G5Y+y5pe26Ze054K55LiK55qE5Lqn5ZOB54q25oCB44CB55So5oi354q25oCB44CB55So5oi36KGM5Li6562J77yM5Lul5L6/5LqO6IO95pu05aW955qE5Zue5rqv5Y6G5Y+y77yM5YiG5p6Q5Y6G5Y+y77yM6Lef6Liq55So5oi355qE5Y6G5Y+y6KGM5Li677yM5pu05aW95Zyw5q+U6L6D5Y6G5Y+y5ZKM5oC757uT5Y6G5Y+y77yM5ZCM5pe25qC55o2u5Y6G5Y+y6aKE5rWL5pyq5p2l44CCPC9wPjxwPjxicj48L3A+PGgyPuS6lOOAgeaVsOaNruS7k+W6k+eUqOmAlDwvaDI+PHA+5pW05ZCI5YWs5Y+45omA5pyJ5Lia5Yqh5pWw5o2u77yM5bu656uL57uf5LiA55qE5pWw5o2u5Lit5b+DPC9wPjxwPuS6p+eUn+S4muWKoeaKpeihqO+8jOeUqOS6juS9nOWHuuWGs+etljwvcD48cD7kuLrnvZHnq5nov5DokKXmj5Dkvpvov5DokKXkuIrnmoTmlbDmja7mlK/mjIE8L3A+PHA+5Y+v5Lul5L2c5Li65ZCE5Liq5Lia5Yqh55qE5pWw5o2u5rqQ77yM5b2i5oiQ5Lia5Yqh5pWw5o2u5LqS55u45Y+N6aaI55qE6Imv5oCn5b6q546vPC9wPjxwPuWIhuaekOeUqOaIt+ihjOS4uuaVsOaNru+8jOmAmui/h+aVsOaNruaMluaOmOadpemZjeS9juaKleWFpeaIkOacrO+8jOaPkOmrmOaKleWFpeaViOaenDwvcD48cD7lvIDlj5HmlbDmja7kuqflk4HvvIznm7TmjqXmiJbpl7TmjqXlnLDkuLrlhazlj7jnm4jliKk8L3A+PGgyPuWFreOAgeaVsOS7k+WIhuWxgueahOWlveWkhDwvaDI+PHA+5a+55pWw5o2u6L+b6KGM5YiG5bGC55qE5LiA5Liq5Li76KaB5Y6f5Zug5bCx5piv5biM5pyb5Zyo566h55CG5pWw5o2u55qE5pe25YCZ77yM6IO95a+55pWw5o2u5pyJ5LiA5Liq5pu05Yqg5riF5pmw55qE5o6M5o6n77yM6K+m57uG5p2l6K6y77yM5Li76KaB5pyJ5LiL6Z2i5Yeg5Liq5Y6f5Zug44CCPC9wPjxwPjxicj48L3A+PHA+5riF5pmw5pWw5o2u57uT5p6E77ya5q+P5LiA5Liq5pWw5o2u5YiG5bGC6YO95pyJ5a6D55qE5L2c55So5Z+f77yM6L+Z5qC35oiR5Lus5Zyo5L2/55So6KGo55qE5pe25YCZ6IO95pu05pa55L6/5Zyw5a6a5L2N5ZKM55CG6Kej44CCPC9wPjxwPuaVsOaNruihgOe8mOi/vei4qu+8mueugOWNleadpeiusuWPr+S7pei/meagt+eQhuino++8jOaIkeS7rOacgOe7iOe7meS4muWKoeWRiOeOsOeahOaYr+S4gOW8oOiDveebtOaOpeS9v+eUqOeahOW8oOS4muWKoeihqO+8jOS9huaYr+Wug+eahOadpea6kOacieW+iOWkmu+8jOWmguaenOacieS4gOW8oOadpea6kOihqOWHuumXrumimOS6hu+8jOaIkeS7rOW4jOacm+iDveWkn+W/q+mAn+WHhuehruWcsOWumuS9jeWIsOmXrumimO+8jOW5tua4healmuWug+eahOWNseWus+iMg+WbtOOAgjwvcD48cD7lh4/lsJHph43lpI3lvIDlj5HvvJrop4TojIPmlbDmja7liIblsYLvvIzlvIDlj5HkuIDkupvpgJrnlKjnmoTkuK3pl7TlsYLmlbDmja7vvIzog73lpJ/lh4/lsJHmnoHlpKfnmoTph43lpI3orqHnrpfjgII8L3A+PHA+5oqK5aSN5p2C6Zeu6aKY566A5Y2V5YyW77ya5bCG5LiA5Liq5aSN5p2C55qE5Lu75Yqh5YiG6Kej5oiQ5aSa5Liq5q2l6aqk5p2l5a6M5oiQ77yM5q+P5LiA5bGC5Y+q5aSE55CG5Y2V5LiA55qE5q2l6aqk77yM5q+U6L6D566A5Y2V5ZKM5a655piT55CG6Kej44CC6ICM5LiU5L6/5LqO57u05oqk5pWw5o2u55qE5YeG56Gu5oCn77yM5b2T5pWw5o2u5Ye6546w6Zeu6aKY5LmL5ZCO77yM5Y+v5Lul5LiN55So5L+u5aSN5omA5pyJ55qE5pWw5o2u77yM5Y+q6ZyA6KaB5LuO5pyJ6Zeu6aKY55qE5q2l6aqk5byA5aeL5L+u5aSN44CCPC9wPjxwPuWxj+iUveWOn+Wni+aVsOaNrueahOW8guW4uO+8muWxj+iUveS4muWKoeeahOW9seWTje+8jOS4jeW/heaUueS4gOasoeS4muWKoeWwsemcgOimgemHjeaWsOaOpeWFpeaVsOaNruOAgjwvcD48cD7mlbDmja7kvZPns7vkuK3nmoTlkITkuKrooajnmoTkvp3otZblsLHlg4/mmK/nlLXnur/nmoTmtYHlkJHkuIDmoLfvvIzmiJHku6zpg73luIzmnJvlroPmmK/op4TmlbTjgIHmtYHlkJHmuIXmmbDjgIHkvr/kuo7nrqHnkIbnmoTvvIzlpoLkuIvlm77jgII8L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPjxwPuS9huaYr++8jOacgOe7iOeahOe7k+aenOWkp+WkmuWNtOaYr+S+nei1luWkjeadguOAgeWxgue6p+a3t+S5se+8jOaDs+ais+eQhua4healmuS4gOW8oOihqOeahOeUn+aIkOmAlOW+hOS8muavlOi+g+WbsOmavu+8jOWmguS4i+Wbvu+8mjwvcD48cD48YnI+PC9wPjxwPjxicj48L3A+PHA+PGJyPjwvcD48aDI+5LiD44CB5aaC5L2V5YiG5bGCPC9oMj48cD7nkIborrrmir3osaE8L3A+PHA+PGJyPjwvcD48cD7miJHku6zlj6/ku6Xku47nkIborrrkuIrlr7nmlbDku5PmnaXlgZrkuIDkuKrmir3osaHvvIzlj6/ku6XmiormlbDmja7ku5PlupPliIbkuLrkuIvpnaLkuInkuKrlsYLvvIzljbPvvJrmlbDmja7ov5DokKXlsYLjgIHmlbDmja7ku5PlupPlsYLlkozmlbDmja7kuqflk4HlsYLjgII8L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPjxwPjxicj48L3A+PHA+T0RTIOWFqOensOaYryBPcGVyYXRpb25hbCBEYXRhIFN0b3Jl77yM5pON5L2c5pWw5o2u5a2Y5YKo44CC4oCc6Z2i5ZCR5Li76aKY55qE4oCd77yM5pWw5o2u6L+Q6JCl5bGC77yM5Lmf5Y+rT0RT5bGC77yM5piv5pyA5o6l6L+R5pWw5o2u5rqQ5Lit5pWw5o2u55qE5LiA5bGC77yM5pWw5o2u5rqQ5Lit55qE5pWw5o2u77yM57uP6L+H5oq95Y+W44CB5rSX5YeA44CB5Lyg6L6T77yM5Lmf5bCx6K+05Lyg6K+05Lit55qEIEVUTCDkuYvlkI7vvIzoo4XlhaXmnKzlsYLjgILmnKzlsYLnmoTmlbDmja7vvIzmgLvkvZPkuIrlpKflpJrmmK/mjInnhafmupDlpLTkuJrliqHns7vnu5/nmoTliIbnsbvmlrnlvI/ogIzliIbnsbvnmoTjgILkvYbmmK/vvIzov5nkuIDlsYLpnaLnmoTmlbDmja7ljbTkuI3nrYnlkIzkuo7ljp/lp4vmlbDmja7jgILlnKjmupDmlbDmja7oo4XlhaXov5nkuIDlsYLml7bvvIzopoHov5vooYzor7jlpoLljrvlmaoo5L6L5aaC5pyJ5LiA5p2h5pWw5o2u5Lit5Lq655qE5bm06b6E5pivIDMwMCDlsoHvvIzov5nnp43lsZ7kuo7lvILluLjmlbDmja7vvIzlsLHpnIDopoHmj5DliY3lgZrkuIDkupvlpITnkIYp44CB5Y676YeNKOS+i+WmguWcqOS4quS6uui1hOaWmeihqOS4re+8jOWQjOS4gCBJRCDljbTmnInkuKTmnaHph43lpI3mlbDmja7vvIzlnKjmjqXlhaXnmoTml7blgJnpnIDopoHlgZrkuIDmraXljrvph40p44CB5a2X5q615ZG95ZCN6KeE6IyD562J5LiA57O75YiX5pON5L2c44CCPC9wPjxwPjxicj48L3A+PHA+5pWw5o2u5LuT5bqT5bGCKERXKe+8jOaYr+aVsOaNruS7k+W6k+eahOS4u+S9ky4g5Zyo6L+Z6YeM77yM5LuOIE9EUyDlsYLkuK3ojrflvpfnmoTmlbDmja7mjInnhafkuLvpopjlu7rnq4vlkITnp43mlbDmja7mqKHlnovjgILov5nkuIDlsYLlkoznu7Tluqblu7rmqKHkvJrmnInmr5TovoPmt7HnmoTogZTns7vjgII8L3A+PHA+PGJyPjwvcD48cD7mlbDmja7kuqflk4HlsYIoQVBQKe+8jOi/meS4gOWxguaYr+aPkOS+m+S4uuaVsOaNruS6p+WTgeS9v+eUqOeahOe7k+aenOaVsOaNru+8jOWcqOi/memHjO+8jOS4u+imgeaYr+aPkOS+m+e7meaVsOaNruS6p+WTgeWSjOaVsOaNruWIhuaekOS9v+eUqOeahOaVsOaNru+8jOS4gOiIrOS8muWtmOaUvuWcqCBFU+OAgU15U1FM562J57O757uf5Lit5L6b57q/5LiK57O757uf5L2/55So77yM5Lmf5Y+v6IO95Lya5a2Y5ZyoIEhpdmUg5oiW6ICFIERydWlkIOS4reS+m+aVsOaNruWIhuaekOWSjOaVsOaNruaMluaOmOS9v+eUqOOAguWmguaIkeS7rOe7j+W4uOivtOeahOaKpeihqOaVsOaNru+8jOaIluiAheivtOmCo+enjeWkp+WuveihqO+8jOS4gOiIrOWwseaUvuWcqOi/memHjOOAgjwvcD48cD48YnI+PC9wPjxwPuWPpuWklu+8jOaIkeS7rOWcqOWunumZheWIhuWxgui/h+eoi+S4re+8jOS5n+WPr+S7peagueaNruaIkeS7rOeahOWunumZheaVsOaNruWkhOeQhueahOa1geeoi+i/m+ihjOWIhuWxguOAgjwvcD48cD48YnI+PC9wPjxoMj7lhavjgIHkuL7kuKrkvovlrZA8L2gyPjxwPue9keS4iueahOS+i+WtkOW+iOWkmu+8jOS7peS4i+aYr+afkOS9jeWkp+eJm+aXqeacn+WPguS4juiuvuiuoeeahOaVsOaNruWIhuWxguS+i+WtkOOAguaIkeS7rOWIhuaekOS4gOS4i+W9k+WIneeahOaDs+azle+8jOS7peWPiui/meenjeiuvuiuoeeahOe8uumZt+OAguS4iuWOn+WbvuWSjOWGheWuueOAgjwvcD48cD48YnI+PC9wPjxwPuWkp+S9rOW9k+WIneeahOiuvuiuoeaAu+WFseWIhuS6hiA2IOWxgu+8jOWFtuS4reWOu+aOieWFg+aVsOaNruWQju+8jOi/mOaciTXlsYLjgILkuIvpnaLliIbmnpDkuIDkuIvlvZPliJ3nmoTkuIDkuKrorr7orqHmgJ3ot6/jgII8L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPjxwPue8k+WGsuWxgihidWZmZXIpPC9wPjxwPjxicj48L3A+PHA+5qaC5b+177ya5Y+I56ew5Li65o6l5Y+j5bGCKHN0YWdlKe+8jOeUqOS6juWtmOWCqOavj+WkqeeahOWinumHj+aVsOaNruWSjOWPmOabtOaVsOaNru+8jOWmgkNhbmFs5o6l5pS255qE5Lia5Yqh5Y+Y5pu05pel5b+X44CCPC9wPjxwPuaVsOaNrueUn+aIkOaWueW8j++8muebtOaOpeS7jmthZmth5o6l5pS25rqQ5pWw5o2u77yM6ZyA6KaB5Lia5Yqh6KGo5q+P5aSp55Sf5oiQdXBkYXRlLGRlbGV0ZSxpbnNlcmV05pWw5o2u77yM5Y+q55Sf5oiQaW5zZXJ05pWw5o2u55qE5Lia5Yqh6KGo77yM5pWw5o2u55u05o6l5YWl5piO57uG5bGCPC9wPjxwPuiuqOiuuuaWueahiO+8muWPquaKimNhbmFs5pel5b+X55u05o6l5YWl57yT5Yay5bGC77yM5aaC5p6c5YW25a6D5pyJ5ouJ6ZO+5pWw5o2u55qE5Lia5Yqh77yM5Lmf5YWl57yT5Yay5bGC44CCPC9wPjxwPuaXpeW/l+WtmOWCqOaWueW8j++8muS9v+eUqGltcGFsYeWkluihqO+8jHBhcnF1ZXTmlofku7bmoLzlvI/vvIzmlrnkvr/pnIDopoFNUuWkhOeQhueahOaVsOaNruivu+WPluOAgjwvcD48cD7ml6Xlv5fliKDpmaTmlrnlvI/vvJrplb/kuYXlrZjlgqjvvIzlj6/lj6rlrZjlgqjmnIDov5Hlh6DlpKnnmoTmlbDmja7jgILorqjorrrmlrnmoYjvvJrnm7TmjqXplb/kuYXlrZjlgqg8L3A+PHA+6KGoc2NoZW1h77ya5LiA6Iis5oyJ5aSp5Yib5bu65YiG5Yy65bqT5LiO6KGo5ZG95ZCN44CC5bqT5ZCN77yaYnVmZmVyLOihqOWQje+8muWIneatpeiAg+iZkeagvOW8j+S4uu+8mmJ1ZmZlcuaXpeacn+S4muWKoeihqOWQjSzlvoXlrprjgII8L3A+PHA+PGJyPjwvcD48cD7mmI7nu4blsYIoT0RTLCBPcGVyYXRpb25hbCBEYXRhIFN0b3JlLERXRDogZGF0YSB3YXJlaG91c2UgZGV0YWlsKTwvcD48cD48YnI+PC9wPjxwPuamguW/te+8muaYr+aVsOaNruS7k+W6k+eahOe7huiKguaVsOaNruWxgu+8jOaYr+WvuVNUQUdF5bGC5pWw5o2u6L+b6KGM5rKJ5reA77yM5YeP5bCR5LqG5oq95Y+W55qE5aSN5p2C5oCn77yM5ZCM5pe2T0RTL0RXROeahOS/oeaBr+aooeWei+e7hOe7h+S4u+imgemBteW+quS8geS4muS4muWKoeS6i+WKoeWkhOeQhueahOW9ouW8j++8jOWwhuWQhOS4quS4k+S4muaVsOaNrui/m+ihjOmbhuS4re+8jOaYjue7huWxgui3n3N0YWdl5bGC55qE57KS5bqm5LiA6Ie077yM5bGe5LqO5YiG5p6Q55qE5YWs5YWx6LWE5rqQPC9wPjxwPuaVsOaNrueUn+aIkOaWueW8j++8mumDqOWIhuaVsOaNruebtOaOpeadpeiHqmthZmth77yM6YOo5YiG5pWw5o2u5Li65o6l5Y+j5bGC5pWw5o2u5LiO5Y6G5Y+y5pWw5o2u5ZCI5oiQ44CCPC9wPjxwPmNhbmFs5pel5b+X5ZCI5oiQ5pWw5o2u55qE5pa55byP5b6F56CU56m244CCPC9wPjxwPjxicj48L3A+PHA+6K6o6K665pa55qGI77yaY2FuYWzmlbDmja7nmoTlkIjmiJDmlrnlvI/kuLrvvJrmr4/lpKnmiormmI7nu4blsYLnmoTliY3lpKnlhajph4/mlbDmja7lkozmmKjlpKnmlrDmlbDmja7lkIjmiJDkuIDkuKrmlrDnmoTmlbDmja7ooajvvIzopobnm5bml6fooajjgILlkIzml7bkvb/nlKjljoblj7LplZzlg4/vvIzmjInlkagv5oyJ5pyIL+aMieW5tCDlrZjlgqjkuIDkuKrljoblj7LplZzlg4/liLDmlrDooajjgII8L3A+PHA+5pel5b+X5a2Y5YKo5pa55byP77ya55u05o6l5pWw5o2u5L2/55SoaW1wYWxh5aSW6KGo77yMcGFycXVldOaWh+S7tuagvOW8j++8jGNhbmFs5ZCI5oiQ5pWw5o2u5Li65LqM5qyh55Sf5oiQ5pWw5o2u77yM5bu66K6u5L2/55So5YaF6KGo77yM5LiL6Z2i5Yeg5bGC6YO95piv5LuOaW1wYWxh55Sf5oiQ55qE5pWw5o2u77yM5bu66K6u6YO955So5YaF6KGoK+mdmeaAgS/liqjmgIHliIbljLrjgII8L3A+PHA+5pel5b+X5Yig6Zmk5pa55byP77ya6ZW/5LmF5a2Y5YKo44CCPC9wPjxwPuihqHNjaGVtYe+8muS4gOiIrOaMieWkqeWIm+W7uuWIhuWMuu+8jOayoeacieaXtumXtOamguW/teeahOaMieWFt+S9k+S4muWKoemAieaLqeWIhuWMuuWtl+auteOAgjwvcD48cD7lupPkuI7ooajlkb3lkI3vvJrlupPlkI3vvJpvZHMs6KGo5ZCN77ya5Yid5q2l6ICD6JmR5qC85byP5Li6b2Rz5pel5pyf5Lia5Yqh6KGo5ZCNLOW+heWumuOAgjwvcD48cD7ml6fmlbDmja7mm7TmlrDmlrnlvI/vvJrnm7TmjqXopobnm5Y8L3A+PHA+PGJyPjwvcD48cD7ovbvluqbmsYfmgLvlsYIoTUlE5oiWRFdCLCBkYXRhIHdhcmVob3VzZSBiYXNpcyk8L3A+PHA+PGJyPjwvcD48cD7mpoLlv7XvvJrovbvluqbmsYfmgLvlsYLmlbDmja7ku5PlupPkuK1EV0TlsYLlkoxETeWxguS5i+mXtOeahOS4gOS4qui/h+a4oeWxguasoe+8jOaYr+WvuURXROWxgueahOeUn+S6p+aVsOaNrui/m+ihjOi9u+W6pue7vOWQiOWSjOaxh+aAu+e7n+iuoSjlj6/ku6XmiorlpI3mnYLnmoTmuIXmtJfvvIzlpITnkIbljIXlkKvvvIzlpoLmoLnmja5QVuaXpeW/l+eUn+aIkOeahOS8muivneaVsOaNrinjgILovbvluqbnu7zlkIjlsYLkuI5EV0TnmoTkuLvopoHljLrliKvlnKjkuo7kuozogIXnmoTlupTnlKjpoobln5/kuI3lkIzvvIxEV0TnmoTmlbDmja7mnaXmupDkuo7nlJ/kuqflnovns7vnu5/vvIzlubbmnKrmu6HmhI/kuIDkupvkuI3lj6/pooTop4HnmoTpnIDmsYLogIzov5vooYzmsonmt4A76L275bqm57u85ZCI5bGC5YiZ6Z2i5ZCR5YiG5p6Q5Z6L5bqU55So6L+b6KGM57uG57KS5bqm55qE57uf6K6h5ZKM5rKJ5reAPC9wPjxwPuaVsOaNrueUn+aIkOaWueW8j++8mueUseaYjue7huWxguaMieeFp+S4gOWumueahOS4muWKoemcgOaxgueUn+aIkOi9u+W6puaxh+aAu+ihqOOAguaYjue7huWxgumcgOimgeWkjeadgua4hea0l+eahOaVsOaNruWSjOmcgOimgU1S5aSE55CG55qE5pWw5o2u5Lmf57uP6L+H5aSE55CG5ZCO5o6l5YWl5Yiw6L275bqm5rGH5oC75bGC44CCPC9wPjxwPuaXpeW/l+WtmOWCqOaWueW8j++8muWGheihqO+8jHBhcnF1ZXTmlofku7bmoLzlvI/jgII8L3A+PHA+5pel5b+X5Yig6Zmk5pa55byP77ya6ZW/5LmF5a2Y5YKo44CCPC9wPjxwPuihqHNjaGVtYe+8muS4gOiIrOaMieWkqeWIm+W7uuWIhuWMuu+8jOayoeacieaXtumXtOamguW/teeahOaMieWFt+S9k+S4muWKoemAieaLqeWIhuWMuuWtl+auteOAgjwvcD48cD7lupPkuI7ooajlkb3lkI3vvJrlupPlkI3vvJpkd2Is6KGo5ZCN77ya5Yid5q2l6ICD6JmR5qC85byP5Li677yaZHdi5pel5pyf5Lia5Yqh6KGo5ZCNLOW+heWumuOAgjwvcD48cD7ml6fmlbDmja7mm7TmlrDmlrnlvI/vvJrnm7TmjqXopobnm5Y8L3A+PHA+PGJyPjwvcD48cD7kuLvpopjlsYIoRE3vvIxkYXRhIG1hcmtldOaIlkRXUywgZGF0YSB3YXJlaG91c2Ugc2VydmljZSk8L3A+PHA+PGJyPjwvcD48cD7mpoLlv7XvvJrlj4jnp7DmlbDmja7pm4bluILmiJblrr3ooajjgILmjInnhafkuJrliqHliJLliIbvvIzlpoLmtYHph4/jgIHorqLljZXjgIHnlKjmiLfnrYnvvIznlJ/miJDlrZfmrrXmr5TovoPlpJrnmoTlrr3ooajvvIznlKjkuo7mj5DkvpvlkI7nu63nmoTkuJrliqHmn6Xor6LvvIxPTEFQ5YiG5p6Q77yM5pWw5o2u5YiG5Y+R562J44CCPC9wPjxwPuaVsOaNrueUn+aIkOaWueW8j++8mueUsei9u+W6puaxh+aAu+WxguWSjOaYjue7huWxguaVsOaNruiuoeeul+eUn+aIkOOAgjwvcD48cD7ml6Xlv5flrZjlgqjmlrnlvI/vvJrkvb/nlKhpbXBhbGHlhoXooajvvIxwYXJxdWV05paH5Lu25qC85byP44CCPC9wPjxwPuaXpeW/l+WIoOmZpOaWueW8j++8mumVv+S5heWtmOWCqOOAgjwvcD48cD7ooahzY2hlbWHvvJrkuIDoiKzmjInlpKnliJvlu7rliIbljLrvvIzmsqHmnInml7bpl7TmpoLlv7XnmoTmjInlhbfkvZPkuJrliqHpgInmi6nliIbljLrlrZfmrrXjgII8L3A+PHA+5bqT5LiO6KGo5ZG95ZCN77ya5bqT5ZCN77yaZG0s6KGo5ZCN77ya5Yid5q2l6ICD6JmR5qC85byP5Li677yaZG3ml6XmnJ/kuJrliqHooajlkI0s5b6F5a6a44CCPC9wPjxwPuaXp+aVsOaNruabtOaWsOaWueW8j++8muebtOaOpeimhuebljwvcD48cD48YnI+PC9wPjxwPuW6lOeUqOWxgihBcHApPC9wPjxwPjxicj48L3A+PHA+5qaC5b+177ya5bqU55So5bGC5piv5qC55o2u5Lia5Yqh6ZyA6KaB77yM55Sx5YmN6Z2i5LiJ5bGC5pWw5o2u57uf6K6h6ICM5Ye655qE57uT5p6c77yM5Y+v5Lul55u05o6l5o+Q5L6b5p+l6K+i5bGV546w77yM5oiW5a+85YWl6IezTXlzcWzkuK3kvb/nlKjjgII8L3A+PHA+5pWw5o2u55Sf5oiQ5pa55byP77ya55Sx5piO57uG5bGC44CB6L275bqm5rGH5oC75bGC77yM5pWw5o2u6ZuG5biC5bGC55Sf5oiQ77yM5LiA6Iis6KaB5rGC5pWw5o2u5Li76KaB5p2l5rqQ5LqO6ZuG5biC5bGC44CCPC9wPjxwPuaXpeW/l+WtmOWCqOaWueW8j++8muS9v+eUqGltcGFsYeWGheihqO+8jHBhcnF1ZXTmlofku7bmoLzlvI/jgII8L3A+PHA+5pel5b+X5Yig6Zmk5pa55byP77ya6ZW/5LmF5a2Y5YKo44CCPC9wPjxwPuihqHNjaGVtYe+8muS4gOiIrOaMieWkqeWIm+W7uuWIhuWMuu+8jOayoeacieaXtumXtOamguW/teeahOaMieWFt+S9k+S4muWKoemAieaLqeWIhuWMuuWtl+auteOAgjwvcD48cD7lupPkuI7ooajlkb3lkI3vvJrlupPlkI3vvJrmmoLlrpphcGzvvIzlj6blpJbmoLnmja7kuJrliqHkuI3lkIzvvIzkuI3pmZDlrprkuIDlrpropoHkuIDkuKrlupPjgII8L3A+PHA+5pen5pWw5o2u5pu05paw5pa55byP77ya55u05o6l6KaG55uW44CCPC9wPjxwPjxicj48L3A+PGgyPuS5neOAgeWmguS9leabtOS8mOmbheS4gOS6mzwvaDI+PHA+5YmN6Z2i5o+Q5Yiw55qE5LiA56eN6K6+6K6h5YW25a6e55u45a+55p2l6K6y5bey57uP5b6I6K+m57uG5LqG77yM5L2G5piv5Y+v6IO95bGC5qyh5Lya5pyJ5LiA54K55aSa77yM6ICM5LiU5Zyo5Yy65YiG5LiA5byg6KGo5Yiw5bqV6K+l5a2Y5pS+5Zyo5LuA5LmI5L2N572u55qE5pe25YCZ5Y+v6IO96L+Y5pyJ5LiN5bCP55qE55aR5oOR44CC5oiR5Lus5Y+v5Lul5YaN6K6+6K6h5LiA5aWX5pWw5o2u5LuT5bqT55qE5YiG5bGC77yM5ZCM5pe25Zyo5YmN6Z2i55qE5Z+656GA5LiK5Yqg5LiK57u06KGo5ZKM5LiA5Lqb5Li05pe26KGo55qE6ICD6JmR77yM5p2l6K6p5oiR5Lus55qE5pa55qGI5pu05LyY6ZuF5LiA5Lqb44CCPC9wPjxwPjxicj48L3A+PHA+5LiL5Zu+77yM5YGa5LqG5LiA5Lqb5bCP55qE5pS55Yqo77yM5oiR5Lus5Y675o6J5LqG5LiK5LiA6IqC55qEQnVmZmVy5bGC77yM5oqK5pWw5o2u6ZuG5biC5bGC5ZKM6L275bqm5rGH5oC75bGC5pS+5Zyo5ZCM5LiA5Liq5bGC57qn5LiK77yM5ZCM5pe254us56uL5Ye65p2l5LqG57u06KGo5ZKM5Li05pe26KGo44CCPC9wPjxwPjxicj48L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPjxwPui/memHjOino+mHiuS4gOS4i0RXU+OAgURXROOAgURJTeWSjFRNUOeahOS9nOeUqOOAgjwvcD48cD48YnI+PC9wPjxwPkRXU++8mui9u+W6puaxh+aAu+Wxgu+8jOS7jk9EU+WxguS4reWvueeUqOaIt+eahOihjOS4uuWBmuS4gOS4quWIneatpeeahOaxh+aAu++8jOaKveixoeWHuuadpeS4gOS6m+mAmueUqOeahOe7tOW6pu+8muaXtumXtOOAgWlw44CBaWTvvIzlubbmoLnmja7ov5nkupvnu7TluqblgZrkuIDkupvnu5/orqHlgLzvvIzmr5TlpoLnlKjmiLfmr4/kuKrml7bpl7TmrrXlnKjkuI3lkIznmbvlvZVpcOi0reS5sOeahOWVhuWTgeaVsOetieOAgui/memHjOWBmuS4gOWxgui9u+W6pueahOaxh+aAu+S8muiuqeiuoeeul+abtOWKoOeahOmrmOaViO+8jOWcqOatpOWfuuehgOS4iuWmguaenOiuoeeul+S7hTflpKnjgIEzMOWkqeOAgTkw5aSp55qE6KGM5Li655qE6K+d5Lya5b+r5b6I5aSa44CC5oiR5Lus5biM5pybODAl55qE5Lia5Yqh6YO96IO96YCa6L+H5oiR5Lus55qERFdT5bGC6K6h566X77yM6ICM5LiN5pivT0RT44CCPC9wPjxwPjxicj48L3A+PHA+RFdE77ya6L+Z5LiA5bGC5Li76KaB6Kej5Yaz5LiA5Lqb5pWw5o2u6LSo6YeP6Zeu6aKY5ZKM5pWw5o2u55qE5a6M5pW05bqm6Zeu6aKY44CC5q+U5aaC55So5oi355qE6LWE5paZ5L+h5oGv5p2l6Ieq5LqO5b6I5aSa5LiN5ZCM6KGo77yM6ICM5LiU57uP5bi45Ye6546w5bu26L+f5Lii5pWw5o2u562J6Zeu6aKY77yM5Li65LqG5pa55L6/5ZCE5Liq5L2/55So5pa55pu05aW955qE5L2/55So5pWw5o2u77yM5oiR5Lus5Y+v5Lul5Zyo6L+Z5LiA5bGC5YGa5LiA5Liq5bGP6JS944CCPC9wPjxwPkRJTe+8mui/meS4gOWxguavlOi+g+WNlee6r++8jOS4vuS4quS+i+WtkOWwseaYjueZve+8jOavlOWmguWbveWutuS7o+eggeWSjOWbveWutuWQjeOAgeWcsOeQhuS9jee9ruOAgeS4reaWh+WQjeOAgeWbveaXl+WbvueJh+etieS/oeaBr+WwseWtmOWcqERJTeWxguS4reOAgjwvcD48cD5UTVDvvJrmr4/kuIDlsYLnmoTorqHnrpfpg73kvJrmnInlvojlpJrkuLTml7booajvvIzkuJPorr7kuIDkuKpEV1RNUOWxguadpeWtmOWCqOaIkeS7rOaVsOaNruS7k+W6k+eahOS4tOaXtuihqOOAgjwvcD48cD48YnI+PC9wPjxoMj5SZWZlcjwvaDI+PHA+aHR0cDovL2JpZ2RhdGEuNTFjdG8uY29tL2FydC8yMDE3MTAvNTU0ODEwLmh0bTwvcD48cD48YnI+PC9wPjxwPmh0dHBzOi8vYmxvZy5jc2RuLm5ldC9oYWRvb3BkZXZlbG9wL2FydGljbGUvZGV0YWlscy83OTI4Mjg0NDwvcD4=', '2020-04-26 21:53:49', NULL, NULL, NULL, '1', 'Java,云计算大数据,数据库', '发帖了', '数据库', NULL, NULL, NULL, NULL);
COMMIT;

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
  `cellphone` varchar(30) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `join_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL COMMENT '0-不活跃，1-活跃，默认为0',
  `last_login_time` datetime DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1-男性，2-女性，3-私密，4-未知，默认值为4',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `is_sign_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '登录状态，默认值为false',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES (1, '15626134259', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:20:19', NULL);
INSERT INTO `user_info` VALUES (2, '15626134259', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:20:28', NULL);
INSERT INTO `user_info` VALUES (3, '15626134259', NULL, NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:22:25', NULL);
INSERT INTO `user_info` VALUES (4, '18867252626', NULL, NULL, '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:30:09', NULL);
INSERT INTO `user_info` VALUES (5, '18889990002', NULL, NULL, '555555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:31:19', NULL);
INSERT INTO `user_info` VALUES (6, '15625075071', NULL, NULL, '676767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:46:43', NULL);
INSERT INTO `user_info` VALUES (7, '18899775544', NULL, NULL, '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-25 10:18:59', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
