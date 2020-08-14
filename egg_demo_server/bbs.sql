-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by szkfzx at 14-08-2020 09:55.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE attachment_info
DROP TABLE IF EXISTS attachment_info;
CREATE TABLE `attachment_info` (
  `id` bigint NOT NULL,
  `post_id` bigint DEFAULT NULL,
  `imageText1` text,
  `imageText2` text,
  `imageText3` text,
  `imageText4` text,
  `imageText5` text,
  `imageText6` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table attachment_info contains no data. No inserts have been genrated.
-- Inserting 0 rows into attachment_info


-- END TABLE attachment_info

-- BEGIN TABLE comment_info
DROP TABLE IF EXISTS comment_info;
CREATE TABLE `comment_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `content` varchar(512) COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `is_removed` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `comment_id` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 2 rows into comment_info
-- Insert batch #1
INSERT INTO comment_info (id, post_id, content, createTime, is_removed, author_id, comment_id, author_name, reply) VALUES
(1, 3271597288774284, '23333', '2020-08-13 15:44:06', 0, 1, '3271597288774285202081315446', 'cymm', ''),
(2, 4681597307918798, '草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马', '2020-08-13 16:39:10', 0, 1, '46815973079187992020813163910', 'cymm', '');

-- END TABLE comment_info

-- BEGIN TABLE friend_info
DROP TABLE IF EXISTS friend_info;
CREATE TABLE `friend_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_removed` bigint DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `fans_id` bigint DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 3 rows into friend_info
-- Insert batch #1
INSERT INTO friend_info (id, is_removed, author_id, fans_id, createTime) VALUES
(23, 0, 4, 1, '2020-08-05 11:09:35'),
(24, 0, 1, 1, '2020-08-10 15:50:42'),
(25, 1, 5, 1, '2020-08-11 10:24:19');

-- END TABLE friend_info

-- BEGIN TABLE paper_info
DROP TABLE IF EXISTS paper_info;
CREATE TABLE `paper_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
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
  UNIQUE KEY `paper_postid` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 1 row into paper_info
-- Insert batch #1
INSERT INTO paper_info (id, post_id, title, content, createTime, updateTime, read_count, is_removed, author_id, taglist, posttype, plate, praise_count, comment_count, href, avatar, author_name, imglist) VALUES
(43, 4681597307918798, '华为初面+综合面试（技术面）', 'PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPuWNjuS4uumdouivleaVtOS9k+a1geeoi+Wkp+iHtOWIhuS4ujwvc3Bhbj48c3Ryb25nIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nrJTor5XvvIzmgKfmoLzmtYvor5XvvIzpnaLor5XvvIznu7zlkIjpnaLor5U8L3N0cm9uZz48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+77yM5Zue5a2m5qCh562J57uT5p6c44CC56yU6K+V5p2l6K+077yM5Y2O5Li655qE6Zq+5bqm6L6D5Lit562J77yM6YCJ5oup6aKY6Zq+5bqm5ZKM572R5piT6IW+6K6v5beu5LiN5aSa44CC5pyA5ZCO55qE5Luj56CB6aKY77yM55u45q+U5LiL5p2l5bCx566A5Y2V5b6I5aSa77yM5LiA5YWxM+mBk+mimOebru+8jOWJjTLpopjlvojlrrnmmJPlsLFBQ++8jOmimOebruW3sue7j+iusOS4jeWkqua4healmu+8jOS4jei/h+mavuW6puehruWunuS4jeWkp+OAguacgOWQjuS4gOmimOacgOWQjuaPkOS6pOeahOS7o+eggei/h+S6hjc1JeeahOagt+S+i++8jOS4gOebtOayoeacieWPkeeOsOWJqeS4i+eahDI1JeWPr+iDveWtmOWcqOS7gOS5iOWdkeOAgjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPueslOivlemDqOWIhuWkquS5hei/nO+8jOaIkeWwseS4jeaAjuS5iOWbnuW/huS6huOAguebtOaOpeWwhumdouivleOAgjwvc3Bhbj48L3A+PHA+PHN0cm9uZyBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+6Z2i6K+VPC9zdHJvbmc+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7lpoLmnpzor7Tohb7orq/nmoTpnaLor5XmmK/mjKXph5HlpoLlnJ/vvIjmr5Xnq5/mr4/kuKrpnaLor5Xlrpjpg73phY3kuobkuIDku7bljZXni6znmoTmiL/pl7TvvInvvIzpgqPljY7kuLrlsLHmmK/miJLlpaLlroHkv63jgILkuKTkuKrlpKfkvJrorq7ljoXlnZDmu6HkuobpnaLor5XlrpjvvIzlhbbkuK3kuIDkuKrmmK/liJ3pnaLpnaLor5XljLrvvIzlj6bkuIDovrnmmK/nu7zlkIjpnaLor5XljLrjgILliJ3pnaLljLrnmoTpnaLor5XlrpjkvJrmnaXnrYnlvoXljLrkuIDkuKrkuIDkuKrlj6vmiJHku6zov4fljrvpnaLor5XjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7pnaLor5XmoYzph4flj5bkuIDlr7nkuIDnmoTlvaLlvI/vvIzmioDmnK/lspfnmoTpnaLor5XpgJrnn6Xnn63kv6Homb3nhLbmsqHmnInpgJrnn6Xor7TopoHluKbnroDljobvvIzkvYbmmK/ku43nhLbluKbkuobkuIDku73ku6XlhY3kuK3pgJTpnIDopoHjgILvvIjkuovlrp7or4HmmI7ov5nmmK/kuIDkuKrmmI7mmbrnmoTpgInmi6nvvIk8L3NwYW4+PC9wPjxwPjxzdHJvbmcgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPuWInemdojwvc3Ryb25nPjwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+5Yid6Z2i6Z2i6K+V5a6Y54K55Yiw5oiR55qE5ZCN5a2X5LmL5ZCO77yM5oiR6Lef552A6Z2i6K+V5a6Y5Y675LuW55qE6YKj5Liq5L2N572u44CCPC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+6Z2i6K+V5rWB56iL5ZKM5aSn5aSa5pWw5LqS6IGU572R5YWs5Y+45rWB56iL5beu5LiN5aSa77yM6aaW5YWI6K6p6Ieq5bex5LuL57uN5LiA5Liq5q+U6L6D5ruh5oSP55qE6aG555uu44CC77yI5Y+v6IO95oOz6YCa6L+H6L+Z5Liq6aG555uu5LqG6Kej5oiR5Lus55qE5oqA6IO956iL5bqm77yJ5Zyo5oiR6Z2i6K+V5YeG5aSH5pe277yM5YW25a6e5oiR5bCx57qg57uT6L+H6L+Z5Liq6Zeu6aKY44CC5Zug5Li65Zyo5oiR55qE6aG555uu5Lit77yM5pyJ5Lik5Liq6aG555uu5piv5oiR5q+U6L6D5ruh5oSP55qE77yM56ys5LiA5Liq5Li76KaB5YGa5ZCO5Y+w77yM56ys5LqM5Liq5Li76KaB5YGa6Jma5ouf546v5aKD5ZKM5pWw5o2u5Lqk5LqS44CCPC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+4oCc5oiR5pyJ5Lik5Liq6aG555uu5piv5q+U6L6D5ruh5oSP55qE4oCd77yM5oiR5YWI5oqb5Ye66L+Z5Y+l6K+d77yM5biM5pyb6Z2i6K+V5a6Y6IO95aSf57uZ5py65Lya6K6p5oiR5bCG5Lik5Liq6aG555uu6YO96K6y5LiA5LiL77yM4oCc5oiR5YWI6K6y5LiA5LiL56ys5LiA5Liq5oiR5Lus5b2T5pe25YGa55qE5o2i6K++5bmz5Y+w77yM5b2T5pe25pys5p2l5piv5LiA5Liq6K++56iL6aG555uu77yM5L2G5piv5oiR5Lus5Zyo6L+Z5Liq6K++56iL6aG555uu5LmL5LiK77yM57uT5ZCI5b2T5pe25qCh5YaF5oCl6ZyA5o2i6K++6L+Z5Liq6ZyA5rGC77yM5YGa5Ye65LqG6L+Z5LmI5LiA5Liq5o2i6K++5bmz5Y+w4oCdLDwvc3Bhbj48c3Ryb25nIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7vvIjpppblhYjmj5Dlh7rpobnnm67nm67nmoTvvIk8L3N0cm9uZz48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+77yM4oCc54S25ZCO6L+Z5Liq6aG555uu5aSn5qaC5a6e546w5LqG5LiA5Liq5oCO5qC35oCO5qC355qE5Yqf6IO94oCdPC9zcGFuPjxzdHJvbmcgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPu+8iOaKm+WHuuS6p+WTgeWKn+iDve+8iTwvc3Ryb25nPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7vvIzigJzmiJHlnKjpobnnm67kuK3kuLvopoHotJ/otKPlkI7lj7DlvIDlj5HlkozmlbDmja7lupPkuqTkupLlip/og73igJ08L3NwYW4+PHN0cm9uZyBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+77yI6K+05LiL5Zyo6aG555uu5Lit55qE6KeS6Imy77yJPC9zdHJvbmc+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPu+8jOKAnOaVtOS4qumhueebrueahOaetuaehOWkp+iHtOWmguS4i+OAguOAguOAguOAguKAnTwvc3Bhbj48c3Ryb25nIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7vvIjpobnnm67lpoLkvZXlrp7njrDvvIk8L3N0cm9uZz48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+77yM5oiR5ou/552A57q456yU5Zyo6I2J56i/5LiK57uZ6Z2i6K+V5a6Y55S7552A5ZCO5Y+w5omA5pyJ55qE57O757uf5p625p6E5ZKM5pWw5o2u5rWB5Yqo5pa55byP77yM5ZCM5pe25bCG5raJ5Y+K5Yiw55qE6YeN6KaB54K555qE5oqA5pyv54K56YO96K+05LqG5LiL44CCPC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+5oyJ54Wn5LmL5YmN5pW055CG6L+H55qE5o+P6L+w5rWB56iL77yM5oiR5bCG5pW05Liq5o2i6K++5bmz5Y+w6aG555uu5o+P6L+w5LqG5LiA6YGN77yM5Lit6YCU5YG25bCU6Z2i6K+V5a6Y5Lya6Zeu5LiA5LiL5oqA5pyv57uG6IqC77yM5LiN6L+H6YO95LiN5piv5b6I6Zq+77yM5Y+v6IO95Zug5Li65oiR5rKh5pyJ5L2/55So4oCcU1NI4oCd5LiJ5aSn5qGG5p6277yM6ICM5piv5L2/55So57qvSlNQ6L+b6KGM55qE5bqV5bGC5byA5Y+R77yM5omA5Lul6Z2i6K+V5a6Y5Lmf5LiN5piv5aSq5aW95o+Q6Zeu44CCPC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+5LiN6L+H5pyJ5oSP5oCd55qE5piv77yM5Zyo5oiR5LuL57uN5Yiw6aG555uu5Lit5a6e546w5LqG5a6e5pe26IGK5aSp55qE5pe25YCZ77yM6Z2i6K+V5a6Y5o+Q5LqG5Lik5Liq5bCP6Zeu6aKY77yM5piv5oiR5LmL5YmN6aG555uu5Lit5rKh56Kw5Yiw77yM6ICM5a6e6ZmF55Sf5Lqn5Lqn5ZOB5Lit5Y+v6IO96YGH5Yiw55qE6Zeu6aKY77ya56ys5LiA77yM5oiR5Lus55qE5a6e5pe26IGK5aSp5piv55u05o6lUDJQ77yM6L+Z5qC36ZyA6KaB5Y+M5pa55Zyo5ZCM5LiA5a2Q572R5LiL77yM6YKj5aaC5p6c546w5Zyo5Y+M5pa55LiN5Zyo5ZCM5LiA5a2Q572R5LiL77yM5aSW572R5p+Q5Liq56e75Yqo56uv5a6i5oi3QeWPr+S7peiuv+mXruWQjuWPsOacjeWKoeWZqELvvIzov5nml7blgJnmn5DkuKp3ZWLnq69D5ZCM5pe25Lmf5Y+v5Lul6K6/6Zeu5pyN5Yqh5Zmo77yM6L+Z5Liq5pe25YCZQeWSjEPmmK/kupLnm7jkuI3lkIznmoTvvIznjrDlnKjlpoLmnpzmiJHku6zku43nhLbmg7Porqnku5bku6zpgJrkv6HmgI7kuYjlip7vvJvnrKzkuozvvIzogIPomZHlpKfph4/nlKjmiLflkIzml7borr/pl67lkI7lj7DmnI3liqHlmajnmoTml7blgJnvvIzor6XlpoLkvZXlpITnkIbjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nrKzkuIDkuKrmiJHpppblhYjogIPomZHliLDnlKjmnI3liqHlmajkvZzkuLrkuK3ku4vvvIzkvYbmmK/lvZPml7bogIHmmK/mg7PnnYDlj6/og73miZPkuKTkuKrogYrlpKnkv6Hmga/kvJrlr7nmnI3liqHlmajpgKDmiJDljovlipvvvIzmiYDku6XkuIDnm7TlvojnirnosavopoHkuI3opoHnlKjlkI7lj7DmnI3liqHlmajkvZzkuLrkuK3ovazvvIzku6Xlj4rvvIzkvZzkuLrkuK3ovazor6XlpoLkvZXmk43kvZzjgILkuI3ov4fpnaLor5XlrpjnqI3lvq7mj5DphpLmiJHlj6/ku6XnlKjmnI3liqHlmajkvZzkuLrkuK3ovazvvIzov5nml7blgJnmiJHnqoHnhLbmhI/or4bliLDlj6ropoHmnI3liqHlmajmlLbliLDkuYvlkI7vvIznq4vliLvlsIbmtojmga/ovazlj5Hlh7rljrvlsLHlj6/ku6XkuobvvIzkuI3nlKjotbDmlbDmja7lupPjgILov5nml7blgJnmiJHkuZ/miY3kuIDnm7TliLDkuLrku4DkuYjmiJHku6XliY3liIbmnpDlvq7kv6HnmoTogYrlpKnmnI3liqHml7bvvIzkvJrlsIbmiYDmnInnmoTmlofmnKzmtojmga/lkozlm77niYfmtojmga/lj5HpgIHliLDlvq7kv6HnmoTlkI7lj7DmnI3liqHlmajvvIzogIzkuJTnroDljZXnmoTnm7TmjqVQMlDlr7nor53vvIzkuLvopoHov5jmmK/kuLrkuoblhYvmnI3nvZHnu5zpl67popg8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nrKzkuozkuKrkuI3pmr7vvIzogIPomZHkupHorqHnrpfkuK3nmoTotJ/ovb3lnYfooaHvvIzmiJHlpKfoh7Tor7TkuobkuIvmgJ3ot6/vvIzpgInlj5bkuIDlj7DkuLvmnLrkvZzkuLrotJ/ovb3lnYfooaHosIPluqbmnLrvvIzlhbbku5bnmoTkvZzkuLrlt6XkvZzmnLrljbPlj6/jgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nrKzkuIDkuKrpobnnm67lpKfmpoLorrLkuobljYHliIbpkp/vvIzkuI3nn6XpgZPmmK/lm6DkuLrliJrlvIDlp4vpnaLor5Xov5jmmK/miJHpobnnm67noa7lrp7lr7npnaLor5XlrpjnmoTog4Plj6PjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nrKzkuIDkuKrpobnnm67lrozkuobku6XlkI7vvIzpnaLor5Xlrpjnv7vkuobkuIvmiJHnmoTnroDljobvvIzigJzkvaDopoHkuI3or7TkuIvkvaDlj6bkuIDkuKrpobnnm67vvJ/igJ3miJHmnIlibGFibGHor7TkuobkuIDpgJrjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7igJzmnInku4DkuYjpmr7ngrnvvJ/igJ3igJzpobnnm67kuK3pgYfliLDov4flk6rkupvpl67popjvvJ/igJ08L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7or7TlrozkuYvlkI7vvIzliJ3pnaLln7rmnKzkuZ/lsLHnu5PmnZ/kuobvvIzmlbTkuKrov4fnqIvljYHliIblkozosJDvvIjlj6/og73miJHpgYfliLDnmoTpnaLor5Xlrpjmr5TovoNuaWNl77yJ44CC5pyA5ZCO6K6p5oiR5o+Q5LiA5Liq6Zeu6aKY77yM5oiR5aSn5qaC6Zeu5LqG5LiL5oqV6YCS55qE6L+Z5Liq5bKX5L2N5LuK5ZCO5YW35L2T5Lya5piv5LuA5LmI5bel5L2c77yM6Z2i6K+V5a6Y5aSn6Ie057uZ5oiR6K6y5LqG5LiL44CC77yI5oiR5oqV6YCS55qE5LqR6K6h566X5byA5Y+R5bKX77yMUGFhU+aWueWQke+8iTwvc3Bhbj48L3A+PHA+PHN0cm9uZyBzdHlsZT0iZm9udC1zaXplOiAxMnB4OyI+57u85ZCI6Z2i6K+VPC9zdHJvbmc+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7liJ3pnaLlrozkuYvlkI7vvIzpnaLor5XlrpjmjIflvJXmiJHljrvnu7zlkIjpnaLor5XljLrnrYnlvoXnu7zlkIjpnaLor5XjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nu7zlkIjpnaLor5XmlbTkvZPmhJ/op4nlkozliJ3pnaLlt67kuI3lpJrvvIzkuI3ov4flnKjnu7zlkIjpnaLor5XpmLbmrrXpnaLor5XlrpjpppblhYjpl67kuobmiJHnmoTnsY3otK/vvIzlt6XkvZzmhI/lkJHlkoznkIbmg7PnmoTlt6XkvZzlnLDngrnjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7ov5nph4zmiJHooajnpLrlubbkuI3mjJHvvIzlm6DkuLrkvZzkuLrkuIDkuKrlpJbnnIHkurrvvIzoh6rku47kuIDkuKrkurrlh7rnnIHor7vkuabku6XlkI7vvIzlsLHlt7Lnu4/lr7nlnKjlk6rnlJ/mtLvlnKjlk6rkuIrnj63msqHmnInlpKrlpJrpob7omZHjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7mjqXnnYDpnaLor5Xlrpjpl67kuobmiJHkuIDkupvmiJDnu6nmgI7moLfvvIzlrrbluq3mg4XlhrXkuYvnsbvpl67popjkuYvlkI7vvIzlvIDlp4vpl67miJHnmoTpobnnm67nu4/pqozjgILvvIjomb3nhLbmiJHkuI3lpKrmmI7nmb3vvIzkuLrku4DkuYjnu7zlkIjpnaLor5Xov5jkvJrpl67liJ3pnaLkuK3pl67ov4fnmoTlhbPkuo7pobnnm67nu4/pqoznmoTpl67popjvvInov5nph4zmiJHlsLHkuI3lnKjph43lpI3kuobvvIzkvZXlpITmmK/kuIDmoLfvvIzmiJHlpKfoh7TlkozpnaLor5XlrpjkuqTmtYHkuobkuIDkuIvmiJHku6znmoTpobnnm67lhoXlrrnjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7ov5nkuIDlnZflhoXlrrnlrozmiJDkuYvlkI7vvIzmhJ/op4nnu7zlkIjpnaLor5XmlbTkuKrmtYHnqIvlt7Lnu4/ln7rmnKznu5PmnZ/kuobvvIzpnaLor5XlrpjlvIDlp4vot5/miJHku4vnu43ku5bku6zpobnnm67nu4TnmoTlt6XkvZzlnLDngrnvvIjmt7HlnLPvvInvvIzlt6XkvZzlhoXlrrnvvIzku6Xlj4rlubPluLjnmoTkuIDkupvlt6XkvZzvvIzlkIzml7bov5jnu5nmiJHku4vnu43kuobkuIDkupvlsIbmnaXlt6XkvZzkuK3pnIDopoHkuobop6PnmoTln7rmnKznn6Xor4bigJTigJTmr5TlpoJkb2NrZXLlrrnlmajvvIxrOHPvvIzpg6jliIblm73lhoXlm73lpJbnmoTlhazmnInkupHnmoTov5DooYzljp/nkIbvvIzorqnmiJHlm57ljrvkuYvlkI7mj5DliY3oh6rlrabkuIDkuIvjgILvvIjliLDov5nph4zmiJHlvIDlp4vmhJ/op4nmnInmiI/kuobvvIk8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7lhbblrp7vvIznu7zpnaLlkozliJ3pnaLlt67liKvlhbblrp7msqHmnInlpKrlpKfvvIzkuI3ov4fmhJ/op4nov5nov5jmmK/lkozpnaLor5XlrpjmnInlhbPns7vvvIzlm6DkuLrlnKjmiJHlkIzooYznmoTpmJ/lj4vkuK3vvIzku5bku6zmnInnmoTlsLHooqvpl67liLDkuobkuIDkupvmr5TovoPlupXlsYLnmoTnn6Xor4bngrnmr5TlpoJKYXZh5pyJ5LuA5LmI54m554K55LmL57G777yM5Lmf5pyJ6KKr6Zeu5Y+K6Z2i5ZCR5a+56LGh55qE5LyY54K5562J562J77yI6L+Z5Lqb5oiR6YO95rKh6KKr6Zeu5Yiw77yJ44CCPC9zcGFuPjwvcD48cD48c3Ryb25nIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nu7zov7A8L3N0cm9uZz48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPuaAu+eahOadpeivtO+8jOWFtuWunuWNjuS4uueahOmdouivleW5tuayoeacieaIkeaDs+ixoeS4reeahOWbsOmavu+8iOWboOS4uuWQrOivtOWNjuS4uuS7iuW5tOe8qeaLm++8jOaIkei/mOS7peS4uumdouivleS8muaVheaEj+W+iOmavu+8ieOAgjwvc3Bhbj48c3Ryb25nIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7nroDljoblh4blpIflvojph43opoHvvIwg5bCk5YW25piv6aG555uu57uP5Y6G77yM5Liq5Lq6YmxvZ++8jGdpdGh1Yui/meexu+WuueaYk+WKoOWIhueahOWGheWuue+8jOacgOWlveiDveWkn+WGmeWHuuadpTwvc3Ryb25nPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7jgILkuKTlnLrpnaLor5Xnm7jmr5TovoPlkIzkvLTmm7TliqDpobrliKnvvIzmnInkuIDlrprnqIvluqbkuIrlsLHmmK/nroDljobnu5nmiJHliqDkuobliIbjgII8L3NwYW4+PC9wPjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHg7Ij7lm6DkuLrmiJHpnaLor5XnmoTmmK/kupHorqHnrpflvIDlj5HlspfvvIzmiYDku6XmiJHlnKjpobnnm67kuK3ph43mlrDmt7vliqDkuoblvojlpJpKYXZh55u45YWz55qE6aG555uu57uP5Y6G77yM6Jm954S25LiN5piv5b6I6YeN6KaB77yM5L2G5piv6Iez5bCR6IO96K6p6Z2i6K+V5a6Y5LuO5Lit5LqG6Kej5oiR5ZyoSmF2YeaWuemdouacieS4jeWwkee7j+mqjOOAgjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPumdouivleaXtuWAmeS4jeeUqOWkque0p+W8oO+8jOWcqOS5i+WJjeiFvuiur+mdouivleS4reaIkeWwseaYjuaYvuW+iOe0p+W8oO+8jOiEkeWtkOS4gOeJh+WPkeiSme+8jOiAjOi/measoeWNjuS4uumdouivleWwseaEn+inieeojeW+ruiIkuacjeW+iOWkmu+8jOS4jeefpemBk+aYr+WboOS4uuW3sue7j+e7j+WOhui/h+WHoOasoemdouivle+8jOi/mOaYr+WboOS4uumdouivleWumOW4puWKqOeahOavlOi+g+WlveOAgjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPuacgOWQjui/mOaMuumHjeimgeeahOimgeiDveWkn+WPiuaXtua4healmuWcsOaPj+i/sOiHquW3seaDs+ivtOeahOWGheWuueOAguavleern+WwhuadpeW3peS9nOWyl+S9jeS4re+8jOWwkeS4jeS6huWSjOWQjOS6i+eahOS6pOa1geOAguWPpuWklua4heaZsOeahOaPj+ivieWvuemdouivleWumOS6huino+S9oO+8jOS6huino+S9oOeahOmhueebruS8muW+iOacieW4ruWKqeOAguWboOatpO+8jOS4jeiuuuaYr+WcqOe7memdouivleWumOiusui/sOiHquW3semhueebrueahOaXtuWAme+8jOi/mOaYr+WcqOWbnuetlOmdouivleWumOmXrumimO+8jOS6puaIluaYr+aDs+ihqOi+vuiHquW3seingueCueeahOaXtuWAme+8jOmDvemcgOimgea4heaZsOeahOihqOi+vuOAguWmguaenOS4gOaXtuivreWhnu+8jOWPr+S7peWwneivleWBnOmhv+S4gOS4i++8jOaVtOeQhuS4i+aAnei3r+eEtuWQjumHjeaWsOaPj+i/sO+8jOWPquimgemdouivleWumOiDveWkn+eQhuino+S9oOeahOivne+8jOS4gOiIrOacieS6m+WBnOmhv+aYr+S4jeS8muacieS7gOS5iOWkp+eijeOAgjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsiPuacgOWQjueahOacgOWQju+8jOW4jOacm+iDveWkn+aUtuWIsOWNjuS4uueahG9mZmVy5ZCnXyg60Lfjgp3iiKApX+ebruWJjeato+WcqOKAnOaOkumYn+W+heW9leWPluKAneS4reOAgjwvc3Bhbj48L3A+', '2020-08-13 16:38:38', NULL, 1, '0', 1, '面试官,面试,项目,服务器,初面', '发帖了', '', 1, 1, NULL, NULL, 'cymm', NULL);

-- END TABLE paper_info

-- BEGIN TABLE praise_info
DROP TABLE IF EXISTS praise_info;
CREATE TABLE `praise_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `is_removed` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 2 rows into praise_info
-- Insert batch #1
INSERT INTO praise_info (id, post_id, createTime, author_id, is_removed) VALUES
(19, 3271597288774284, '2020-08-13 15:19:36', 1, 0),
(20, 4681597307918798, '2020-08-13 16:38:50', 1, 0);

-- END TABLE praise_info

-- BEGIN TABLE reply_info
DROP TABLE IF EXISTS reply_info;
CREATE TABLE `reply_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `content` text,
  `comment_id` bigint DEFAULT NULL,
  `is_removed` int DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `reviewers` varchar(255) DEFAULT NULL,
  `responder` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table reply_info contains no data. No inserts have been genrated.
-- Inserting 0 rows into reply_info


-- END TABLE reply_info

-- BEGIN TABLE tag_info
DROP TABLE IF EXISTS tag_info;
CREATE TABLE `tag_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `is_removed` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Table tag_info contains no data. No inserts have been genrated.
-- Inserting 0 rows into tag_info


-- END TABLE tag_info

-- BEGIN TABLE topic_info
DROP TABLE IF EXISTS topic_info;
CREATE TABLE `topic_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_removed` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `topic_id` bigint DEFAULT NULL,
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
  PRIMARY KEY (`id`)
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

