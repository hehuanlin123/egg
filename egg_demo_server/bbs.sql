-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by szkfzx at 02-06-2020 17:42.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE comment_info
DROP TABLE IF EXISTS comment_info;
CREATE TABLE `comment_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(512) COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `is_removed` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `comment_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_id` (`id`) USING BTREE,
  KEY `author_id` (`author_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `author_id` FOREIGN KEY (`author_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `paper_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 1 row into comment_info
-- Insert batch #1
INSERT INTO comment_info (id, content, createTime, is_removed, author_id, post_id, comment_id, author_name, reply) VALUES
(23, '你二大爷家的大黄', '2020-06-02 16:58:34', 0, 1, 31, '311202062165834', 'cymm', '');

-- END TABLE comment_info

-- BEGIN TABLE friend_info
DROP TABLE IF EXISTS friend_info;
CREATE TABLE `friend_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_removed` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `fans_id` int DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 1 row into friend_info
-- Insert batch #1
INSERT INTO friend_info (id, is_removed, author_id, fans_id, createTime) VALUES
(4, NULL, 5, 6, '2020-05-29 17:19:23');

-- END TABLE friend_info

-- BEGIN TABLE paper_info
DROP TABLE IF EXISTS paper_info;
CREATE TABLE `paper_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_croatian_ci,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `read_count` bigint DEFAULT NULL,
  `is_removed` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `taglist` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `posttype` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '版块',
  `praise_count` bigint DEFAULT NULL,
  `comment_count` bigint DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `imglist` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paper_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 1 row into paper_info
-- Insert batch #1
INSERT INTO paper_info (id, title, content, createTime, updateTime, read_count, is_removed, author_id, taglist, posttype, plate, praise_count, comment_count, href, avatar, author_name, imglist) VALUES
(31, '关系性数据库六大范式-个人理解', 'PHA+55uu5YmN5YWz57O75pWw5o2u5bqT5pyJ5YWt56eN6IyD5byP77yaPC9wPjxwPjHjgIHnrKzkuIDojIPlvI/vvIgxTkbvvIk8L3A+PHA+MuOAgeesrOS6jOiMg+W8j++8iDJORu+8iTwvcD48cD4z44CB56ys5LiJ6IyD5byP77yIM05G77yJPC9wPjxwPjTjgIHlt7Tmlq8t56eR5b636IyD5byP77yIQkNORu+8iTwvcD48cD4144CB56ys5Zub6IyD5byPKDRORu+8iTwvcD48cD4244CB56ys5LqU6IyD5byP77yINU5G77yM5Y+I56ew5a6M576O6IyD5byP77yJPC9wPjxwPjxicj48L3A+PHA+56ys5LiA6IyD5byP77yIMU5G77yJPC9wPjxwPuinhOWumu+8muW8uuiwg+WxnuaAp+eahOWOn+WtkOaAp+e6puadn++8jOimgeaxguWxnuaAp+WFt+acieWOn+WtkOaAp++8jOS4jeWPr+WGjeWIhuinozwvcD48cD7lj6Por63ljJbop6Pph4rvvJrlhbblrp7or7Tnmb3kuobvvIzlsLHmmK/pnIDopoHkv53or4HlnKjmlbDmja7lupPkuK3nmoTkuIDkuKrlrZfmrrXkuI3lj6/lho3liIblibLnmoTnirbmgIHvvJs8L3A+PHA+5aW95q+U6K+077yM5oiR5Lus546w5Zyo5a2Y5YKo5LqG5LiA5Liq5Zyw5Yy65a2X5q6177yM5L6L5aaC77ya5bm/5Lic55yBLeW5v+W3nuW4gi3lpKnmsrPljLrvvJs8L3A+PHA+5aaC5p6c5L2g5bCG6L+Z5LiA5q615L+h5oGv5a2Y5YKo5Zyo5pWw5o2u6KGo5Lit55qE5LiA5Liq5a2X5q615LqG6YeM6Z2i77yM5bCx6KGo56S65LiN5ZCI6KeE6IyD55qE77yM5Zug5Li65Zyo6K+l5q615L+hIOaBr+WGhe+8jOaYr+WPr+S7peWwhuWtl+auteWGjeaLhuWIhueahO+8m+avlOWmgu+8jOWwhuS/oeaBr+aLhuWIhuaIkOS4uiDlub/kuJznnIHjgIHlub/lt57luILjgIHlpKnmsrPljLrvvIzkuInkuKrlrZfmrrXmnaXov5vooYzlrZjlgqjliLDmlbDmja7lupPkuK3ljrvvvJs8L3A+PHA+PGJyPjwvcD48cD7nrKzkuozojIPlvI/vvIgyTkbvvIk8L3A+PHA+6KeE5a6a77ya5ZyoMU5G55qE5Z+656GA5LiK77yM6ZyA6KaB56Gu5L+d5pWw5o2u5bqT6KGo5Lit55qE5q+P5LiA5YiX6YO95ZKM5Li76ZSu55u45YWz77yM6ICM5LiN6IO95Y+q5LiO5Li76ZSu55qE5p+Q5LiA6YOo5YiG55u45YWzPC9wPjxwPuWPo+ivreWMluino+mHiu+8muiusOS9j+esrOS6jOiMg+W8j+eahOaYr+WfuuS6juesrOS4gOiMg+W8j+eahOagh+WHhuS4i++8jOiAjOS4jeiDveiEseemu+esrOS4gOiMg+W8j+eahOiMg+eVtOS5i+Wklu+8mzwvcD48cD7mr5TlpoLvvIznjrDlnKjmiJHku6zmnInkuIDlvKDorqLljZXooajvvIzooajkuK3lrZjlnKjlrZfmrrXvvJrorqLljZVJROOAgeS6p+WTgUlE44CB5Lqn5ZOB5pWw6YeP44CB6K6i5Y2V5oC75Lu35qC844CB6K6i5Y2V5pe26Ze077yM5Lul5LiK5LqU5Liq5a2X5q61PC9wPjxwPumCo+S5iOaIkeS7rOWPr+S7peW+iOa4healmueahOefpemBk++8jOWcqOS4iuihqOS4reaYr+iuouWNleihqOWSjOS6p+WTgeihqOeahOe7k+WQiOiAjOS6p+eUn+eahO+8jOiAjOS4lOWcqOS4iuihqOS4rSDorqLljZXmgLvku7fmoLzlkozorqLljZXml7bpl7TvvIzot5/kuqflk4FJROOAgeS6p+WTgeaVsOmHj++8jOWFtuWunuS8muWvvOiHtOihqOS4reeahOaVsOaNruWtmOWcqOS4pOS4quiBjOiDve+8jOWboOS4uuiuouWNlemHkemineWSjOiuouWNleaXtumXtOWFtuWunuS4juS6p+WTgUlE5ZKM5Lqn5ZOB5pWw6YeP5a2Y5Zyo5LiN5ZCM55qE6IGM6IO977yMIOS4gOS4quaYr+WumuS5ieS6huS6p+WTgeWSjOaVsOmHj++8jOS4gOS4quaYr+WumuS5ieS6huiuouWNlemHkemineOAgeiuouWNleaXtumXtO+8mzwvcD48cD7pgqPkuYjnrKzkuozojIPlvI/nmoTop4TlrprvvIzlsLHmmK/pnIDopoHmiJHku6zljZXkuIDljJbooajph4zpnaLlrZfmrrXnmoTlrprkuYnnmoTogYzog73ojIPlm7TvvJs8L3A+PHA+5qC55o2u56ys5LqM6IyD5byP55qE6KeE5a6a77yM5oiR5Lus5Y+v5Lul5bCG6KGo5ouG5oiQ5Lik5byg6KGo77yaPC9wPjxwPjxicj48L3A+PHA+Me+8ieOAgeiuouWNlUlE44CB5Lqn5ZOBSUTjgIHkuqflk4HmlbDph488L3A+PHA+Mu+8ieOAgeiuouWNlUlE44CB6K6i5Y2V6YeR6aKd44CB6K6i5Y2V5pe26Ze0PC9wPjxwPjxicj48L3A+PHA+56ys5LiJ6IyD5byP77yIM05G77yJPC9wPjxwPuinhOWumu+8muWcqDJORueahOWfuuehgOS4iu+8jOS7u+S9lemdnuS4u+WxnuaAp+S4jeS+nei1luS6juWFtuWug+mdnuS4u+WxnuaApzwvcD48cD7lj6Por63ljJbop6Pph4rvvJrpgJrkv5fngrnorrLvvIzlsLHmmK/miJHku6zmlbDmja7ph4zooajph4zpnaLnmoTku7vkvZXlrZfmrrXpg73lv4Xpobvot5/or6XooajkuK3nmoTkuLvplK7nmoTlkKvkuYnlhbfmnInlvLrlhbPogZTmgKfvvIzogIzmmK/kuI3og73or7TooajkuK3nmoTlrZfmrrXmmK/ot5/kuLvplK7kuYvlpJbnmoTlrZfmrrXlhbfmnInlvLrlhbPogZTmgKfvvJs8L3A+PHA+5q+U5aaC77yM5oiR5Lus546w5Zyo5pyJ5LiA5byg5a2m55Sf6KGo77yaPC9wPjxwPklE44CB5a2m55Sf57yW5Y+344CB5a2m55Sf5ZCN56ew44CB5b2S5bGe54+t57qn44CB54+t57qn6ICB5biIPC9wPjxwPuWcqOS7peS4iueahOihqOS4reaIkeS7rOWumuS5ieeahOaYr+WtpueUn+ihqO+8jOmCo+S5iOWtpueUn+WvueW6lOeahOePree6p+S/oeaBr++8mklE44CB5a2m55Sf57yW5Y+344CB5a2m55Sf5ZCN56ew44CB5b2S5bGe54+t57qn77yM6L+Z5Zub5Liq5a2X5q615pys6Lqr5piv5LiN5a2Y5Zyo6Zeu6aKY55qE77yM5L2G5Zyo54+t57qn6ICB5biI6L+Z5Liq5a2X5q615Lit5bCx5Lya5a2Y5Zyo5LiA5Lqb6Zeu6aKY77yM5oiR5Lus5LiL6Z2i5YiX5Li+6YOo5YiG5pWw5o2u5p2l5L2T546w5LiA5LiL6Zeu6aKYPC9wPjxwPjxicj48L3A+PHA+MeOAgTAwMDHjgIHlvKDkuInjgIHlsI9B6ICB5biI57yW5Y+344CB5bCPQeiAgeW4iOOAgeeUt+OAgTI4PC9wPjxwPjLjgIEwMDAy44CB5p2O5Zub44CB5bCPQeiAgeW4iOe8luWPt+OAgeWwj0HogIHluIjjgIHnlLfjgIEyODwvcD48cD4z44CBMDAwM+OAgeeOi+S6lOOAgeWwj0HogIHluIjnvJblj7fjgIHlsI9B6ICB5biI44CB55S344CBMjg8L3A+PHA+NOOAgTAwMDTjgIHni5fom4vjgIHlsI9C6ICB5biI57yW5Y+344CB5bCPQuiAgeW4iOOAgeWls+OAgTI0PC9wPjxwPjXjgIEwMDA144CB6ZOB6JuL44CB5bCPQuiAgeW4iOe8luWPt+OAgeWwj0LogIHluIjjgIHlpbPjgIEyNDwvcD48cD48YnI+PC9wPjxwPuWcqOS7peS4iuaVsOaNruS4re+8jOaIkeS7rOS8muWPkeeOsO+8jOWtpueUn+ihqOS4reWtmOWcqOWtpueUn+eahOS/oeaBr++8jOS5n+WtmOWcqOiAgeW4iOeahOS/oeaBr++8jOWFtuWunuiAgeW4iOeahOS/oeaBr+i3n+WtpueUn+ayoeacieWkmuWkp+WFs+iBlO+8jOmCo+S5iOaIkeS7rOWPr+S7peWwhuS7peS4iuaVsOaNruihqOaLhuWIhuaIkOS6huS4pOS4quihqDwvcD48cD48YnI+PC9wPjxwPjHjgIEwMDAx44CB5byg5LiJ44CB5bCPQeiAgeW4iOe8luWPtzwvcD48cD4y44CBMDAwMuOAgeadjuWbm+OAgeWwj0HogIHluIjnvJblj7c8L3A+PHA+M+OAgTAwMDPjgIHnjovkupTjgIHlsI9B6ICB5biI57yW5Y+3PC9wPjxwPjTjgIEwMDA044CB54uX6JuL44CB5bCPQeiAgeW4iOe8luWPtzwvcD48cD4144CBMDAwNeOAgemTgeibi+OAgeWwj0HogIHluIjnvJblj7c8L3A+PHA+PGJyPjwvcD48cD4x44CB5bCPQeiAgeW4iOe8luWPt+OAgeWwj0HogIHluIjjgIHnlLfjgIEyODwvcD48cD4y44CB5bCPQuiAgeW4iOe8luWPt+OAgeWwj0LogIHluIjjgIHlpbPjgIEyNDwvcD48cD4mbmJzcDs8L3A+PHA+5Lul5LiK5YaF5a6577yM5bCx5piv5oiR5Lus5bmz5bi45omA5bGe55qE5pWw5o2u5bqT6K6+6K6h5LiJ5aSn6IyD5byP77yM5Z+65pys5LiK6Z2i6K+V55qE5pe25YCZ5b6I5aSa5Y+v6IO95Y+q5piv6Zeu5LqG5L2g5pWw5o2u5bqT6K6+6K6h55qE5LiJ5aSn6IyD5byP5bCxT0vkuobvvIzkvYblhbblrp7lnKjpmaTkuobku6XkuIrnmoTkuInlpKfojIPlvI/kuYvlpJbvvIzlhbblrp7ov5jlrZjlnKjlj6blpJbkuInkuKrojIPlvI88L3A+PHA+PGJyPjwvcD48cD7lt7Tmlq8t56eR5b636IyD5byP77yIQkNORu+8iTwvcD48cD7op4TlrprvvJrlnKjlhbPns7vmqKHlvI/kuK3mr4/kuIDkuKrlhrPlrprlm6DntKDpg73ljIXlkKvlgJnpgInplK48L3A+PHA+5Y+j6K+t5YyW6Kej6YeK77ya6KeE5a6a5b6I5ouX5Y+j77yM5oiR5Lus55So5Y+j6K+t5YyWK+S4vuS+i+adpeivtOaYjuS4gOS4i++8mzwvcD48cD7miJHkuKrkurrlnKjkuIDlvIDlp4vnnIvov5nkuKrojIPlvI/op4TlrprnmoTml7blgJnvvIzlhbblrp7lvojliKvmia3vvIzlm6DkuLrmiJHnnIvnnYDlpb3lg4/ot5/nrKzkuInojIPlvI/msqHmnInllaXljLrliKvvvIzkvYbmnInlpb3lg4/mnInkuIDngrnngrnljLrliKvvvJvlhbblrp7nkIbop6NCQ+iMg+W8j++8jOS9oOWPqumcgOimgeefpemBk0JD5qih5byP6Lef56ys5LiJ6IyD5byP55qE5Yy65Yir77yM5L2g5bCx5b6I5aW955CG6Kej5ZKM6K6w5b+G5LqG44CCPC9wPjxwPuWFtuWunuWcqEJD6IyD5byP5Y+v5Lul6K+05piv5YyF5ZCr5LqG56ys5LiJ6IyD5byP77yM5aaC5p6c5LiA5Liq5pWw5o2u5bqT6K6+6K6h5Lmf6K646IO95aSf5ruh6Laz56ys5LiJ6IyD5byP77yM5L2G5LiN5LiA5a6a5ruh6LazQkPojIPlvI/vvJvlj6/ku6XnkIbop6PkuLpCQ+iMg+W8j+aYrzNORueahOihpeWFhTwvcD48cD7kvovlrZDvvJog5a2m55SfSUTjgIHkuJPkuJrlrabnp5HjgIHlr7zluIhJRO+8jOWFtuWunuWtpueUn0lE5ZKM5LiT5Lia5a2m56eR5Li66IGU5ZCI5Li76ZSuPC9wPjxwPjxicj48L3A+PHA+c3R1ZGVudF8wMeOAgSBqYXZh5byA5Y+R44CBIOWvvOW4iF9BMDE8L3A+PHA+c3R1ZGVudF8wMuOAgSBqYXZh5byA5Y+R44CBIOWvvOW4iF9BMDE8L3A+PHA+c3R1ZGVudF8wM+OAgSBqYXZh5byA5Y+R44CBIOWvvOW4iF9BMDE8L3A+PHA+c3R1ZGVudF8wNOOAgSBD5byA5Y+R44CBIOWvvOW4iF9CMDE8L3A+PHA+c3R1ZGVudF8wNeOAgSBD5byA5Y+R44CBIOWvvOW4iF9CMDE8L3A+PHA+PGJyPjwvcD48cD7lnKjku6XkuIrkvovlrZDkuK3vvIzlpoLmnpzmiJHku6zljrvmoLnmja7nrKzkuInojIPlvI/nmoTop4TlrprmnaXnnIvnmoTvvIzlhbblrp7ov5nkuKrooajnmoTorr7orqHmmK/mu6HotrPnmoTvvJs8L3A+PHA+5a+85biISUTmoLnmja7ogZTlkIjkuLvplK7mmK/lvLrlhbPogZTmgKfnmoTvvIzkvYblpoLmnpzov5novrnooajlsIbogZTlkIjkuLvplK7mi4blvIDkuYvlkI7lkaLvvIzmmK/lrZjlnKjkuKTkuKrlhbPogZTlhbPns7vnmoTvvJs8L3A+PHA+5a2m55SfSUTjgIHkuJPkuJrlrabnp5Eg5Lul5Y+KIOS4k+S4muWtpuenkeOAgeWvvOW4iElEPC9wPjxwPjxicj48L3A+PHA+56ys5Zub6IyD5byPKDRORu+8iTwvcD48cD7op4TlrprvvJrorr7lhbPns7tS77yIWO+8jFnvvIxa77yJ77yM5YW25LitWO+8jFnvvIxa5piv5oiQ5a+555qE44CB5LiN55u45Lqk5bGe5oCn55qE6ZuG5ZCI44CCPC9wPjxwPuWPo+ivreWMluino+mHiu+8muWmguaenOS9oOeQhuino+S6hu+8jOS4iumdoueahOWHoOenjeiMg+W8j++8jOWFtuWunuesrOWbm+iMg+W8j+S5n+W+iOWuueaYk+eQhuino++8jOWwseaYr+ivtOihqOeahOe7k+aehOS7peWPiumDveaYr+espuWQiEJD6IyD5byP5oOF5Ya15LiL77yM5YaN5Y676Zmk5LiN5YyF5ZCr5aSa5Liq5YC855qE5L6d6LWW5YWz57O75bCx5aW95LqGPC9wPjxwPuS+i+WtkO+8muWlveavlOWmguivtO+8jOaIkeS7rOeOsOWcqOS4gOS4quS6uumDveacieS4gOS4quWbuuWumueUteivneWSjOenu+WKqOeUteivne+8m+mCo+S5iOWmguaenOWcqOinhOWumuS4gOS4quS6uuavj+S4quexu+Wei+WPquiDveaLpeacieS4gOS4queahOivne+8jOaIkeS7rOaVsOaNruW6k+ihqOiuvuiuoeW6lOivpeaYrzwvcD48cD51c2VyX2lk44CBaG9tZV9waG9uZeOAgW1vZGlsZV9waG9uZSDov5nkuInkuKrlrZfmrrXmiYDlsZ7lkIzkuIDlvKDooajvvIzkvYbmmK/miJHku6znmoTlrp7pmYXmg4XlhrXlkaLvvIzlvoDlvoDmmK/lm7rlrprnlLXor53lkoznp7vliqjnlLXor53vvIzpg73kuI3lj6/og73mmK/lj6rlrZjlnKjkuIDkuKrnmoTvvIzpgqPkuYjooajlsLHkvJrlj5jmiJDkuIDkuIvov5nnp43mg4XlhrU8L3A+PHA+PGJyPjwvcD48cD7lvKDkuInjgIE4MDAwMDAw44CBMTg4ODg4ODg4ODg8L3A+PHA+5byg5LiJ44CBODAwMDAwMeOAgTE4ODg4ODg4ODg3PC9wPjxwPjxicj48L3A+PHA+5YW25a6e5Zyo5LiK6Z2i55qE5oOF5Ya177yM6KGo55qE6K6+6K6h5qih5byP5piv5ruh6Laz56ys5LiJ6IyD5byP5ZKMQkPojIPlvI/nmoTvvIzkvYbmiJHku6znnIvnnYDmlbDmja7kvZPnjrDlh7rmnaXnmoTor53vvIzlhbblrp7mgKrliKvmia3nmoTvvJvpgqPkuYg0TkbnmoTlrprkuYnlsLHmmK/pmLLmraLov5nnp43mg4XlhrXlh7rnjrDkuIvnmoTop4TlrprvvJs8L3A+PHA+5Zyo5Lul5LiK55qE5oOF5Ya15LiL77yM5YW25a6e5oiR5Lus5bqU6K+l5bCG6KGo5ouG5oiQ5Lik5Liq5oiW6ICF5pS55oiQ5LiA5LiL6L+Z56eN6K6+6K6h77yaPC9wPjxwPjxicj48L3A+PHA+5byg5LiJ44CBODAwMDAwMOOAgeWbuuWumueUteivnTwvcD48cD7lvKDkuInjgIE4MDAwMDAx44CB5Zu65a6a55S16K+dPC9wPjxwPuW8oOS4ieOAgTE4ODg4ODg4ODg444CB56e75Yqo55S16K+dPC9wPjxwPuW8oOS4ieOAgTE4ODg4ODg4ODg344CB56e75Yqo55S16K+dPC9wPjxwPjxicj48L3A+PHA+56ys5LqU6IyD5byP77yINU5G77yM5Y+I56ew5a6M576O6IyD5byP77yJPC9wPjxwPuinhOWumu+8mua2iOmZpOS6hjRORuS4reeahOi/nuaOpeS+nei1ljwvcD48cD7lj6Por63ljJbop6Pph4rvvJrmiJHku6zmnaXlgZrkuIDkuKrkvovlrZDor7TmmI7lk4g8L3A+PHA+5L6L5a2Q77ya6K6i5Y2V6KGo77yI6K6i5Y2VSUTjgIHkuqflk4FJROOAgeeUqOaIt0lE77yJPC9wPjxwPuWFtuWunuWcqOS7peS4iueahOaVsOaNruW6k+ihqOS4reWFtuWunuWQiOS5juaIkeS7rOeahOS7peS4iueahOaJgOiusuiMg+W8j+WumuS5ie+8m+S9huaYr+esrOS6lOiMg+W8j+eahOaEj+aAne+8jOWwseaYr+mcgOimgeS7rOS4jeimgeWGjeWQjOS4gOW8oOihqOmHjOmdou+8jOWwhui/meenjeWFs+ezu+WFqOmDqOWumuS5ieWcqOS4gOS4quWcsOaWue+8jOmcgOimgeaLhuWIhuWHuuadpTwvcD48cD48YnI+PC9wPjxwPuiuouWNlUlE44CB55So5oi3SUQ8L3A+PHA+6K6i5Y2VSUTjgIHkuqflk4FJRDwvcD48cD48YnI+PC9wPjxwPuS9huaYr+WcqOaIkeS7rOWunumZheeahOW8gOWPkeS7peWPiuiuvuiuoeS4re+8jOWFtuWunui/meenjeaDheWGteaIkeS7rOS8muiAg+iZkeWQhOenjeafpeivouaViOeOh+eahOW+l+WkseaDheWGteS4i+WOu+WBmuiuvuiuoe+8jOS4jeS8muS4uuS6huiMg+W8j+iAjOWOu+iuvuiuoe+8m+S4gOiIrOaIkeeahOivne+8jOaxh+iAg+iZkeesrOS4gOenjeiuvuiuoeeahO+8jOWboOS4uuWug+WPr+S7peaPkOmrmOaIkeeahOafpeivouaViOeOh++8mzwvcD48cD7kuKrkurrop4nlvpfnrKzkupTojIPlvI/ov5jmmK/mr5TovoPpuKHogovnmoTvvJvov5nnp43pnIDopoHmjInnhaflrp7pmYXmg4XlhrXmnaXnnIvmmK/lkKbkvb/nlKjvvJsg5L2G5piv5oiR5Lus5omA5pyJ55qE6K6+6K6h77yM5Y+q6KaB5piv5Li65LqG5o+Q6auY5pWI546H5LmL5ZCO77yM5py65Lya6YO95Lya6Kem54qv5Yiw56ys5LqU6IyD5byP77ybPC9wPjxwPjxicj48L3A+PHA+5aaC5p6c5ZOq5L2N5ZCM5a2m6KeJ5b6X5oiR6KGo6L+w55qE5pyJ6Zeu6aKY77yM5qyi6L+O5o+Q5Ye65bu66K6u5ZOI77yM5YWx5ZCM6L+b5q2l44CCPC9wPg==', '2020-06-02 16:42:27', NULL, 0, '0', 1, '范式,ID,NF,老师,订单', '发帖了', '数据库', 0, 0, NULL, NULL, 'cymm', NULL);

-- END TABLE paper_info

-- BEGIN TABLE praise_info
DROP TABLE IF EXISTS praise_info;
CREATE TABLE `praise_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `is_removed` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `praise_id` (`id`) USING BTREE,
  KEY `user_author_id` (`author_id`),
  KEY `user_post_id` (`post_id`),
  CONSTRAINT `user_author_id` FOREIGN KEY (`author_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_post_id` FOREIGN KEY (`post_id`) REFERENCES `paper_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Table praise_info contains no data. No inserts have been genrated.
-- Inserting 0 rows into praise_info


-- END TABLE praise_info

-- BEGIN TABLE reply_info
DROP TABLE IF EXISTS reply_info;
CREATE TABLE `reply_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `comment_id` bigint DEFAULT NULL,
  `is_removed` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `reviewers` varchar(255) DEFAULT NULL,
  `responder` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 5 rows into reply_info
-- Insert batch #1
INSERT INTO reply_info (id, content, comment_id, is_removed, post_id, author_id, reviewers, responder, createTime) VALUES
(6, '去你大爷的', 2162122, 0, 21, 1, 'hwc', 'cymm', '2020-06-02 11:14:17'),
(7, '瞅啥瞅', 29620206215276, 0, 29, 1, 'hwc', 'cymm', '2020-06-02 15:28:24'),
(8, '每天一顿小烧烤', 30202062152858, 0, 29, 1, 'cymm', 'cymm', '2020-06-02 15:43:43'),
(9, '耶耶耶耶耶耶', 29120206215437, 0, 29, 1, 'cymm', 'cymm', '2020-06-02 15:45:52'),
(10, '嘿嘿嘿', 311202062165834, 0, 31, 1, 'cymm', 'cymm', '2020-06-02 16:58:46');

-- END TABLE reply_info

-- BEGIN TABLE tag_info
DROP TABLE IF EXISTS tag_info;
CREATE TABLE `tag_info` (
  `id` int NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `is_removed` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Table tag_info contains no data. No inserts have been genrated.
-- Inserting 0 rows into tag_info


-- END TABLE tag_info

-- BEGIN TABLE topic_info
DROP TABLE IF EXISTS topic_info;
CREATE TABLE `topic_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_removed` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table topic_info contains no data. No inserts have been genrated.
-- Inserting 0 rows into topic_info


-- END TABLE topic_info

-- BEGIN TABLE user_info
DROP TABLE IF EXISTS user_info;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自动递增',
  `cellphone` varchar(30) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `join_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL COMMENT '0-不活跃，1-活跃，默认为0',
  `last_login_time` datetime DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1-男性，2-女性，3-私密，4-未知，默认值为4',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `is_sign_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '登录状态，默认值为false',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `articlecount` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '资源数',
  `fanscount` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '粉丝',
  `praisecount` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '获赞',
  `commentcount` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL COMMENT '评论',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 5 rows into user_info
-- Insert batch #1
INSERT INTO user_info (id, cellphone, email, username, password, join_time, is_active, last_login_time, qq, realname, gender, avatar, signature, is_sign_in, createTime, updateTime, articlecount, fanscount, praisecount, commentcount) VALUES
(1, '15626134259', NULL, 'cymm', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:20:19', NULL, '1', '0', '1', '1'),
(4, '18867252626', NULL, 'ChopinXBP', '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:30:09', NULL, '2', '1', '1', '1'),
(5, '18889990002', NULL, '刘孟德', '555555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-23 20:31:19', NULL, '0', '1', '2', '0'),
(6, '15625075071', '483883748', 'hwc', '123456', NULL, NULL, NULL, '788378', '337737e3yy', 1, NULL, 'hhe88eu38389dde', NULL, '2020-05-29 15:32:06', NULL, '1', '0', '0', '0'),
(7, '18899775544', NULL, '殊途同归123', '666666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-04-25 10:18:59', NULL, '1', '0', '0', '2');

-- END TABLE user_info

