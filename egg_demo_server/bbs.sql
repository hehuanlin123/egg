-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by szkfzx at 26-08-2020 14:52.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE attachment_info
DROP TABLE IF EXISTS attachment_info;
CREATE TABLE `attachment_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint DEFAULT NULL,
  `uploadTitle` text,
  `uploadFile` blob,
  `uploadPath` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 7 rows into attachment_info
-- Insert batch #1
INSERT INTO attachment_info (id, post_id, uploadTitle, uploadFile, uploadPath, createTime) VALUES
(65, 3591598424142435, 'eb9iyz9lxs91598424143044.png', '[object Object]', 'public/img/eb9iyz9lxs91598424143044.png', '2020-08-26 14:42:23'),
(66, 5391598424388445, 's1vanxgwyrs1598424388463.png', '[object Object]', 'public/img/s1vanxgwyrs1598424388463.png', '2020-08-26 14:46:28'),
(67, 5391598424388445, '3vqz0h4b61w1598424388466.png', '[object Object]', 'public/img/3vqz0h4b61w1598424388466.png', '2020-08-26 14:46:28'),
(68, 5391598424388445, 'db48hzz7f991598424388482.png', '[object Object]', 'public/img/db48hzz7f991598424388482.png', '2020-08-26 14:46:28'),
(69, 5391598424388445, 'ql5mthwtmkp1598424388480.png', '[object Object]', 'public/img/ql5mthwtmkp1598424388480.png', '2020-08-26 14:46:28'),
(70, 5391598424388445, '3m9tr7r1ryf1598424388478.png', '[object Object]', 'public/img/3m9tr7r1ryf1598424388478.png', '2020-08-26 14:46:28'),
(71, 5391598424388445, '1dbfq7p3x231598424388468.png', '[object Object]', 'public/img/1dbfq7p3x231598424388468.png', '2020-08-26 14:46:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 3 rows into comment_info
-- Insert batch #1
INSERT INTO comment_info (id, post_id, content, createTime, is_removed, author_id, comment_id, author_name, reply) VALUES
(1, 3271597288774284, '23333', '2020-08-13 15:44:06', 0, 1, '3271597288774285202081315446', 'cymm', ''),
(2, 4681597307918798, '草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马草泥马', '2020-08-13 16:39:10', 0, 1, '46815973079187992020813163910', 'cymm', ''),
(3, 1081598320174438, '2333333', '2020-08-25 09:49:57', 0, 1, '1081598320174439202082594957', 'cymm', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 3 rows into paper_info
-- Insert batch #1
INSERT INTO paper_info (id, post_id, title, content, createTime, updateTime, read_count, is_removed, author_id, taglist, posttype, plate, praise_count, comment_count, href, avatar, author_name, imglist) VALUES
(83, 1081598320174438, '16款优秀的Vue UI组件库推荐', 'PHA+VnVlIOaYr+S4gOS4qui9u+W3p+OAgemrmOaAp+iDveOAgeWPr+e7hOS7tuWMlueahE1WVk3lupPvvIxBUEnnroDmtIHmmI7kuobvvIzkuIrmiYvlv6vjgILku45WdWXmjqjlh7rku6XmnaXvvIzlvpfliLDkvJflpJpXZWLlvIDlj5HogIXnmoTorqTlj6/jgII8L3A+PHA+5Zyo5YWs5Y+455qEV2Vi5YmN56uv6aG555uu5byA5Y+R5Lit77yM5aSa5Liq6aG555uu6YeH55So5Z+65LqOVnVl55qEVUnnu4Tku7bmoYbmnrblvIDlj5HvvIzlubbmipXlhaXmraPlvI/kvb/nlKjjgII8L3A+PHA+5byA5Y+R5Zui6Zif5Zyo5L2/55SoVnVlLmpz5qGG5p625ZKMVUnnu4Tku7blupPku6XlkI7vvIzlvIDlj5HmlYjnjoflpKflpKfmj5Dpq5jvvIzoh6rlt7HlhpnnmoTku6PnoIHkuZ/lsJHkuobvvIzlvojlpJrnlYzpnaLmlYjmnpznu4Tku7blt7Lnu4/lsIHoo4Xlpb3kuobjgII8L3A+PHA+5Zyo6YCJ5oupVnVlIFVJ57uE5Lu25bqT55qE6L+H56iL5Lit77yM6YCa6L+HR2l0SHVi5LiK5qC55o2uc3RhcuaVsOmHj+OAgeaWh+aho+S4sOWvjOeoi+W6puOAgeabtOaWsOeahOmikeeOh+S7peWPiue7tOaKpOetieWboOe0oO+8jOS5n+aUtumbhuaVtOeQhuS6huS4gOS6m+S8mOengOeahFZ1ZSBVSee7hOS7tuW6k+OAgjwvcD48cD48c3Ryb25nPlBT77ya5Zu95YaF55qEVUnnu4Tku7blpKfpg6jliIbpg73lj6rmnInkuIDpg6jliIbnmoTvvIzluLjnlKjnmoTlpLTpg6jlr7zoiKrvvIzlupXpg6jlr7zoiKrvvIxsaXN0dmlld++8jGdyaWTooajmoLzlvojlpJrpg73mmK/msqHmnInnmoTjgII8L3N0cm9uZz48L3A+PHA+PHN0cm9uZyBzdHlsZT0iY29sb3I6IHJnYigxMjgsIDAsIDApOyI+5ZCO6Z2i5omN5Y+R546w77yM5Z+65LqOVnVl55qEUXVhc2FyIEZyYW1ld29yayDku4vnu40g6L+Z5Liq5qGG5p62VUnnu4Tku7blvojlhajpnaLvvIzlh4blpIfkuIvmrKHkvb/nlKjov5nkuKrmoYbmnrbkuoY8L3N0cm9uZz48L3A+PHA+5Z+65LqOVnVl55qEUXVhc2FyIEZyYW1ld29yayDkuK3mlofnvZE8L3A+PHA+PGEgaHJlZj0iaHR0cDovL3d3dy5xdWFzYXJjaHMuY29tLyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwOi8vd3d3LnF1YXNhcmNocy5jb20vPC9hPjwvcD48cD5xdWFzYXJmcmFtZXdvcmsvcXVhc2FyOiBRdWFzYXIgRnJhbWV3b3JrPC9wPjxwPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9xdWFzYXJmcmFtZXdvcmsvcXVhc2FyIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IHJnYigxMDAsIDEwMiwgMTc5KTsiPmh0dHBzOi8vZ2l0aHViLmNvbS9xdWFzYXJmcmFtZXdvcmsvcXVhc2FyPC9hPjwvcD48cD5RdWFzYXLvvIjlj5Hpn7PkuLova3dlyaouesmRybkvKeaYr01JVOiuuOWPr+eahOW8gOa6kOahhuaetu+8iOWfuuS6jlZ1Ze+8ie+8jOWPr+W4ruWKqVdlYuW8gOWPkeS6uuWRmOWIm+W7uu+8mjwvcD48cD7lk43lupTlvI/nvZHnq5k8L3A+PHA+UFdB77yIUHJvZ3Jlc3NpdmUgV2ViIEFwcO+8iTwvcD48cD7pgJrov4dBcGFjaGUgQ29yZG92YeaehOW7uuenu+WKqEFQUO+8iEFuZHJvaWTvvIxpT1PvvIzigKbvvIk8L3A+PHA+5aSa5bmz5Y+w5qGM6Z2i5bqU55So56iL5bqP77yI5L2/55SoRWxlY3Ryb27vvIk8L3A+PHA+UXVhc2Fy5YWB6K645byA5Y+R5Lq65ZGY57yW5YaZ5LiA5qyh5Luj56CB77yM54S25ZCO5L2/55So55u45ZCM55qE5Luj56CB5bqT5ZCM5pe26YOo572y5Li6572R56uZ44CBUFdB44CBTW9iaWxlIEFwcOWSjEVsZWN0cm9uIEFwcOOAguS9v+eUqOacgOWFiOi/m+eahENMSeiuvuiuoeW6lOeUqOeoi+W6j++8jOW5tuaPkOS+m+eyvuW/g+e8luWGme+8jOmAn+W6pumdnuW4uOW/q+eahFF1YXNhciBXZWLnu4Tku7bjgII8L3A+PHA+5b2T5L2/55SoUXVhc2Fy5pe277yM5L2g5LiN6ZyA6KaB5YOPSGFtbWVyanPvvIxNb21lbnRqc+aIlkJvb3RzdHJhcOi/meagt+eahOmineWklumHjeWei+W6k+OAguWug+aLpeaciei/meS6m+WKn+iDve+8jOiAjOS4lOS9k+enr+W+iOWwj++8gTwvcD48cD48c3Ryb25nPj09PT09PT09PT09PT09PC9zdHJvbmc+PC9wPjxwPjHjgIEgaVZpZXcgVUnnu4Tku7blupM8L3A+PHA+aVZpZXcg5piv5LiA5aWX5Z+65LqOIFZ1ZS5qcyDnmoTlvIDmupAgVUkg57uE5Lu25bqT77yM5Li76KaB5pyN5Yqh5LqOIFBDIOeVjOmdoueahOS4reWQjuWPsOS6p+WTgeOAgmlWaWV355qE57uE5Lu26L+Y5piv5q+U6L6D6b2Q5YWo55qE77yM5pu05paw5Lmf5b6I5b+r77yM5paH5qGj5YaZ5b6X5b6I6K+m57uG44CC5pyJ5YWs5Y+45Zui6Zif57u05oqk77yM5q+U6L6D5Y+v6Z2g55qEVnVlIFVJ57uE5Lu25qGG5p6244CCaVZpZXfnlJ/mgIHkuZ/lgZrlvpflvojlpb3vvIzov5jmnInlvIDmupDkuobkuIDkuKppVmlldyBBZG1pbu+8jOWBmuWQjuWPsOmdnuW4uOaWueS+v+OAguWumOe9keS4iuS7i+e7je+8jGlWaWV35bey57uP5bqU55So5ZyoVGFsa2luZ0RhdGHjgIHpmL/ph4zlt7Tlt7TjgIHnmb7luqbjgIHohb7orq/jgIHku4rml6XlpLTmnaHjgIHkuqzkuJzjgIHmu7Tmu7Tlh7rooYzjgIHnvo7lm6LjgIHmlrDmtarjgIHogZTmg7PnrYnlpKflnovlhazlj7jnmoTkuqflk4HkuK3jgII8L3A+PHA+aVZpZXflrpjnvZHvvJo8YSBocmVmPSJodHRwczovL3d3dy5pdmlld3VpLmNvbS8iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDEwMCwgMTAyLCAxNzkpOyI+aHR0cHM6Ly93d3cuaXZpZXd1aS5jb20vPC9hPjwvcD48cD4y44CBVnV4IFVJ57uE5Lu25bqTPC9wPjxwPlZ1eOaYr+WfuuS6jldlVUnlkoxWdWUyLnjlvIDlj5HnmoTnp7vliqjnq69VSee7hOS7tuW6k++8jOS4u+imgeacjeWKoeS6juW+ruS/oemhtemdouOAglZ1eOeahOWumuS9jeW3sue7j+W+iOaYjuehruS6hu+8jOS4gOaYr++8mlZ1Zeenu+WKqOerr1VJ57uE5Lu25bqT77yM5LqM5piv77yaV2VVSeeahOWfuuehgOagt+W8j+W6k+OAglZ1eOeahOe7hOS7tua2teebluS6huaJgOacieeahFdlVUnnmoTlhoXlrrnvvIzov5jmianlsZXkuobkuIDkupvluLjnlKjnmoTnu4Tku7bjgILmr5TlpoLvvJpTdGlja3njgIF0aW1lbGluZeOAgXYtY2hhcnTjgIFYQ2lyY2xl44CCVnV45piv5Liq5Lq657u05oqk55qE44CC5L2G5pivR2l0SHVi5LiKc3Rhcui/mOaYr+W+iOmrmOeahO+8jOi+vuWIsDEza+OAguWcqEdpdEh1YuS4iueci+WIsOWvuWlzc3Vl55qE5YWz6Zet6L+Y5piv5b6I6L+F6YCf55qE44CCVnV45paH5qGj5Z+65pys55qE57uE5Lu255So5rOV5ZKM5pWI5p6c6YO96K6y6Kej5Yiw5L2N5LqG44CC5ZyodnV45a6Y572R5LiK5Lmf5bGV56S65LqG5b6I5aSaVnV455qE5L2/55So5qGI5L6L44CC5Zyo5b6u5L+h6aG16Z2i5byA5Y+R5Lit77yM5Z+65pys5rKh5pyJ5aSq5aSa55qEYnVn77yM5byA5Y+R6L+Y5piv5q+U6L6D6aG65omL55qE44CCPC9wPjxwPlZ1eOWumOe9ke+8mjxhIGhyZWY9Imh0dHBzOi8vdnV4LmxpLyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwczovL3Z1eC5saS88L2E+PC9wPjxwPjPjgIFFbGVtZW50IFVJ57uE5Lu25bqTPC9wPjxwPkVsZW1lbnTvvIzkuIDlpZfkuLrlvIDlj5HogIXjgIHorr7orqHluIjlkozkuqflk4Hnu4/nkIblh4blpIfnmoTln7rkuo4gVnVlIDIuMCDnmoTmoYzpnaLnq6/nu4Tku7blupPjgIJFbGVtZW505piv6aW/5LqG5LmI5YmN56uv5byA5rqQ57u05oqk55qEVnVlIFVJ57uE5Lu25bqT77yM5pu05paw6aKR546H6L+Y5piv5b6I6auY55qE77yM5Z+65pys5LiA5ZGo5Yiw5Y2K5Liq5pyI6YO95Lya5Y+R5biD5LiA5Liq5paw54mI5pys44CC57uE5Lu26b2Q5YWo77yM5Z+65pys5ra155uW5ZCO5Y+w5omA6ZyA55qE5omA5pyJ57uE5Lu277yM5paH5qGj6K6y6Kej6K+m57uG77yM5L6L5a2Q5Lmf5b6I5Liw5a+M44CC5rKh5pyJ5a6e6ZmF5L2/55So6L+H77yM572R5LiK55qERWxlbWVudOaVmeeoi+WSjOaWh+eroOavlOi+g+WkmuOAgkVsZW1lbnTlupTor6XmmK/kuIDkuKrotKjph4/mr5TovoPpq5jnmoRWdWUgVUnnu4Tku7blupPjgII8L3A+PHA+RWxlbWVudOWumOe9ke+8mjxhIGhyZWY9Imh0dHA6Ly9lbGVtZW50LmVsZW1lLmlvLyMvemgtQ04iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDEwMCwgMTAyLCAxNzkpOyI+aHR0cDovL2VsZW1lbnQuZWxlbWUuaW8vIy96aC1DTjwvYT48L3A+PHA+NOOAgU1pbnQgVUnnu4Tku7blupM8L3A+PHA+TWludCBVSeWfuuS6jiBWdWUuanMg55qE56e75Yqo56uv57uE5Lu25bqT77yM5ZCM5qC35Ye66Ieq6aW/5LqG5LmI5YmN56uv55qE6aG555uu44CCTWludCBVSeaYr+ecn+ato+aEj+S5ieS4iueahOaMiemcgOWKoOi9vee7hOS7tuOAguWPr+S7peWPquWKoOi9veWjsOaYjui/h+eahOe7hOS7tuWPiuWFtuagt+W8j+aWh+S7tuOAgk1pbnQgVUkg6YeH55SoIENTUzMg5aSE55CG5ZCE56eN5Yqo5pWI77yM6YG/5YWN5rWP6KeI5Zmo6L+b6KGM5LiN5b+F6KaB55qE6YeN57uY5ZKM6YeN5o6S77yM5LuO6ICM5L2/55So5oi36I635b6X5rWB55WF6aG65ruR55qE5L2T6aqM44CC572R5LiK55qE6KeG6aKR5pWZ56iL5b6I5aSa6YO95piv5Z+65LqOTWludCBVSeadpeiusueahO+8jOW8gOWPkeenu+WKqOerr3dlYumhueebrui/mOaYr+W+iOaWueS+v++8jOaWh+aho+S5n+W+iOeugOS7i+aYjuS6huOAguW+iOWkmumhtemdok1pbnQgVUnnu4Tku7bpg73lt7Lnu4/lsIHoo4Xlpb3vvIzln7rmnKzlj6/ku6XnhafnnYDkvovlrZDlhpnvvIznroDljZXnmoTosIPmlbTkuIDkuIvlsLHlj6/ku6Xlrp7njrDjgILkuI3ov4fvvIzlnKhHaXRIdWLkuIrnnIvmnIDlkI7kuIDmrKHku6PnoIHmj5DkuqTlnKgyMDE45bm0MeaciDE25pel44CC5LiN55+l6YGT5piv6aG555uu5q+U6L6D56iz5a6a5rKh5pyJ5pu05paw77yM6L+Y5piv6aG555uu5pyJ6KKr5bqf5byD55qE5Y+v6IO944CCPC9wPjxwPk1pbnQgVUnlrpjnvZHvvJo8YSBocmVmPSJodHRwOi8vbWludC11aS5naXRodWIuaW8vIyEvemgtY24iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDEwMCwgMTAyLCAxNzkpOyI+aHR0cDovL21pbnQtdWkuZ2l0aHViLmlvLyMhL3poLWNuPC9hPjwvcD48cD4144CBQm9vdHN0cmFwLVZ1ZSBVSee7hOS7tuW6kzwvcD48cD5Cb290c3RyYXAtVlVF5o+Q5L6b5LqG5Z+65LqOdnVlMueahEJvb3RzdHJhcCBWNOe7hOS7tuWSjOe9keagvOezu+e7n+eahOWunueOsO+8jOWujOaIkOS6huW5v+azm+WSjOiHquWKqOWMlueahFdBSSBBUkHlj6/orr/pl67mgKfmoIforrDjgIJCb290c3RyYXAgNOaYr+acgOaWsOWPkeW4g+eahOeJiOacrO+8jOS4jiBCb290c3RyYXAzIOebuOavlOaLpeacieS6huabtOWkmueahOWFt+S9k+eahOexu+S7peWPiuaKiuS4gOS6m+acieWFs+eahOmDqOWIhuWPmOaIkOS6huebuOWFs+eahOe7hOS7tuOAguWQjOaXtiBCb290c3RyYXAubWluLmNzcyDnmoTkvZPnp6/lh4/lsJHkuoY0MCXku6XkuIrjgIJCb290c3RyYXA0IOaUvuW8g+S6huWvuSBJRTgg5Lul5Y+KIGlPUyA2IOeahOaUr+aMge+8jOeOsOWcqOS7heS7heaUr+aMgSBJRTkg5Lul5LiKIOS7peWPiiBpT1MgNyDku6XkuIrniYjmnKznmoTmtY/op4jlmajjgILmg7PlvZPliJ3liJrmtYHooYzlk43lupTlvI/nvZHnq5nnmoTml7blgJnvvIxCb290c3RyYXDmmK/kuJbnlYzkuIrmnIDlj5fmrKLov47nmoTlu7rnq4vnp7vliqjkvJjlhYjnvZHnq5nnmoTmoYbmnrbvvIxCb290c3RyYXDlj6/ku6Xor7Tpo47pnaHlhajnkIPjgILlsLHnrpfmlL7lnKjnjrDlnKjlvojlpJrkvIHkuJrnvZHnq5npg73mmK/ph4fnlKhCb290c3RyYXDlgZrnmoTlk43lupTlvI/jgIJCb290c3RyYXAtVnVl5Y+v5Lul6K6p5L2g5ZyoVnVl5Lit5Lmf5a6e546wQm9vdHN0cmFw55qE5pWI5p6c44CCPC9wPjxwPkJvb3RzdHJhcC1WdWXlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL2Jvb3RzdHJhcC12dWUuanMub3JnLyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwczovL2Jvb3RzdHJhcC12dWUuanMub3JnLzwvYT48L3A+PHA+NuOAgUFudCBEZXNpZ24gVnVlIFVJ57uE5Lu25bqTPC9wPjxwPkFudCBEZXNpZ24gVnVl5pivIEFudCBEZXNpZ24gMy5YIOeahCBWdWUg5a6e546w77yM5byA5Y+R5ZKM5pyN5Yqh5LqO5LyB5Lia57qn5ZCO5Y+w5Lqn5ZOB44CC5ZyoR2l0SHVi5LiK5Y+v5Lul5om+5Yiw5Yeg5LiqQW50IERlc2lnbueahFZ1Zee7hOS7tuOAguS4jei/h+ebuOavlOi+g+iAjOiogO+8jEFudCBEZXNpZ24gVnVl5pu06IOc5LiA562544CCQW50IERlc2lnbiBWdWXlhbHkuqtBbnQgRGVzaWduIG9mIFJlYWN06K6+6K6h5bel5YW35L2T57O777yM5a6e546w5LqG5omA5pyJQW50IERlc2lnbiBvZiBSZWFjdOeahOe7hOS7tu+8jOaUr+aMgeeOsOS7o+a1j+iniOWZqOWSjCBJRTkg5Y+K5Lul5LiK77yI6ZyA6KaBIHBvbHlmaWxsc++8ieOAguWPr+S7peiuqeeGn+aCiUFudCBEZXNpZ27nmoTlnKjkvb/nlKhWdWXml7bvvIzlvojlrrnmmJPnmoTkuIrmiYvjgII8L3A+PHA+QW50IERlc2lnbiBWdWXlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL3Z1ZWNvbXBvbmVudC5naXRodWIuaW8vYW50LWRlc2lnbi12dWUvZG9jcy92dWUvaW50cm9kdWNlLWNuLyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwczovL3Z1ZWNvbXBvbmVudC5naXRodWIuaW8vYW50LWRlc2lnbi12dWUvZG9jcy92dWUvaW50cm9kdWNlLWNuLzwvYT48L3A+PHA+N+OAgUFULVVJIFVJ57uE5Lu25bqTPC9wPjxwPkFULVVJIOaYr+S4gOasvuWfuuS6jiBWdWUuanMgMi4wIOeahOWJjeerryBVSSDnu4Tku7blupPvvIzkuLvopoHnlKjkuo7lv6vpgJ/lvIDlj5EgUEMg572R56uZ5Lit5ZCO5Y+w5Lqn5ZOB77yM5pSv5oyB546w5Luj5rWP6KeI5Zmo5ZKMIElFOSDlj4rku6XkuIrjgIJBVC1VSSDmm7TliqDnsr7nroDvvIzlrp7njrDkuoblkI7lj7DluLjnlKjnmoTnu4Tku7bjgII8L3A+PHA+QVRfVUnlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL2F0LXVpLmdpdGh1Yi5pby9hdC11aS8jL3poIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IHJnYigxMDAsIDEwMiwgMTc5KTsiPmh0dHBzOi8vYXQtdWkuZ2l0aHViLmlvL2F0LXVpLyMvemg8L2E+PC9wPjxwPjjjgIFWYW50IFVJ57uE5Lu25bqTPC9wPjxwPlZhbnTmmK/kuIDkuKrovbvph4/jgIHlj6/pnaDnmoTnp7vliqjnq68gVnVlIOe7hOS7tuW6k+OAglZhbnTmmK/mnInotZ7lm6LpmJ/lvIDmupDnmoTvvIzkuLvopoHnu7TmiqTkuZ/mmK/mnInotZ7lm6LpmJ/jgIJWYW50IFdlYXBwIOaYr+aciei1nuenu+WKqOerr+e7hOS7tuW6kyBWYW50IOeahOWwj+eoi+W6j+eJiOacrO+8jOS4pOiAheWfuuS6juebuOWQjOeahOinhuinieinhOiMg++8jOaPkOS+m+S4gOiHtOeahCBBUEkg5o6l5Y+j77yM5Yqp5Yqb5byA5Y+R6ICF5b+r6YCf5pCt5bu65bCP56iL5bqP5bqU55So44CC5oiq5q2i5Yiw55uu5YmN77yMVmFudOW3sue7j+W8gOa6kOS6hjUwKyDkuKrnu4/ov4fmnInotZ7nur/kuIrkuJrliqHmo4DpqoznmoTnu4Tku7bjgILmr5TlpoLvvJrjgIFBZGRyZXNzRWRpdCDlnLDlnYDnvJbovpHjgIFBZGRyZXNzTGlzdCDlnLDlnYDliJfooajjgIFBcmVhIOecgeW4guWMuumAieaLqeOAgUNhcmQg5Y2h54mH44CBQ29udGFjdCDogZTns7vkurrjgIFDb3Vwb24g5LyY5oOg5Yi444CBR29vZHNBY3Rpb24g5ZWG5ZOB6aG16KGM5Yqo54K544CBU3VibWl0QmFyIOaPkOS6pOiuouWNleagj+OAgVNrdSDllYblk4Hop4TmoLzlvLnlsYLjgILlpoLmnpzlgZrllYbln47nmoTvvIzkuI3lpKrlnKjmhI/nlYzpnaLvvIzlrp7njrDkuJrliqHpgLvovpHnmoTor53vvIznlKhWYW5057uE5Lu25bqT5byA5Y+R6L+Y5piv5b6I5b+r55qE44CCPC9wPjxwPlZhbnTlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL3lvdXphbi5naXRodWIuaW8vdmFudC8jL3poLUNOL2ludHJvIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IHJnYigxMDAsIDEwMiwgMTc5KTsiPmh0dHBzOi8veW91emFuLmdpdGh1Yi5pby92YW50LyMvemgtQ04vaW50cm88L2E+PC9wPjxwPjnjgIFjdWJlLXVpIFVJ57uE5Lu25bqTPC9wPjxwPmN1YmUtdWkg5piv5Z+65LqOIFZ1ZS5qcyDlrp7njrDnmoTnsr7oh7Tnp7vliqjnq6/nu4Tku7blupPjgILnlLHmu7Tmu7TlhoXpg6jnu4Tku7blupPnsr7nroDmj5DngrzogIzmnaXvvIznu4/ljobkuobkuJrliqHkuIDlubTlpJrnmoTogIPpqozvvIzlubbkuJTmr4/kuKrnu4Tku7bpg73mnInlhYXliIbljZXlhYPmtYvor5XvvIzkuLrlkI7nu63pm4bmiJDmj5Dkvpvkv53pmpzjgILlnKjkuqTkupLkvZPpqozmlrnpnaLov73msYLmnoHoh7TjgILpgbXlvqrnu5/kuIDnmoTorr7orqHkuqTkupLmoIflh4bvvIzpq5jluqbov5jljp/orr7orqHmlYjmnpzvvJvmjqXlj6PmoIflh4bljJbvvIznu5/kuIDop4TojIPkvb/nlKjmlrnlvI/vvIzlvIDlj5Hmm7TliqDnroDljZXpq5jmlYjjgILmlK/mjIHmjInpnIDlvJXlhaXlkozlkI7nvJbor5HvvIzovbvph4/ngbXmtLvvvJvmianlsZXmgKflvLrvvIzlj6/ku6Xmlrnkvr/lnLDln7rkuo7njrDmnInnu4Tku7blrp7njrDkuozmrKHlvIDlj5HjgII8L3A+PHA+Y3ViZS11aeWumOe9ke+8mjxhIGhyZWY9Imh0dHBzOi8vZGlkaS5naXRodWIuaW8vY3ViZS11aS8jL3poLUNOIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IHJnYigxMDAsIDEwMiwgMTc5KTsiPmh0dHBzOi8vZGlkaS5naXRodWIuaW8vY3ViZS11aS8jL3poLUNOPC9hPjwvcD48cD4xMOOAgU11c2UtVUkgVUnnu4Tku7blupM8L3A+PHA+TXVzZS1VSeWfuuS6jiBWdWUgMi4wIOS8mOmbheeahCBNYXRlcmlhbCBEZXNpZ24gVUkg57uE5Lu25bqT44CCTXVzZSBVSSDmi6XmnIk0MOWkmuS4qlVJIOe7hOS7tu+8jOeUqOS6jumAguW6lOS4jeWQjOS4muWKoeeOr+Wig+OAgk11c2UgVUkg5LuF6ZyA5bCR6YeP5Luj56CB5Y2z5Y+v5a6M5oiQ5Li76aKY5qC35byP5pu/5o2i44CCTXVzZSBVSSDlj6/nlKjkuo7lvIDlj5HnmoTlpI3mnYLljZXpobXlupTnlKg8L3A+PHA+TXVzZS1VSeWumOe9ke+8mjxhIGhyZWY9Imh0dHBzOi8vbXVzZS11aS5vcmcvIy96aC1DTiIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwczovL211c2UtdWkub3JnLyMvemgtQ048L2E+PC9wPjxwPjEx44CBTjMtY29tcG9uZW50cyBVSee7hOS7tuW6kzwvcD48cD5OM+e7hOS7tuW6k+aYr+WfuuS6jlZ1ZS5qc+aehOW7uueahO+8jOiuqeWJjeerr+W3peeoi+W4iOWSjOWFqOagiOW3peeoi+W4iOiDveW/q+mAn+aehOW7uumhtemdouWSjOW6lOeUqOOAgk4zLWNvbXBvbmVudHPotoXov4c2MOS4que7hOS7tiDnu4Tku7bliJfooajjgIHoh6rlrprkuYnmoLflvI/jgIHmlK/mjIHlpJrnp43mqKHljJbojIPlvI/vvIhVTUTvvInjgIHkvb/nlKhFUzbov5vooYzlvIDlj5HjgII8L3A+PHA+TjPlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL24zLWNvbXBvbmVudHMuZ2l0aHViLmlvL04zLWNvbXBvbmVudHMvY29tcG9uZW50Lmh0bWwiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDEwMCwgMTAyLCAxNzkpOyI+aHR0cHM6Ly9uMy1jb21wb25lbnRzLmdpdGh1Yi5pby9OMy1jb21wb25lbnRzL2NvbXBvbmVudC5odG1sPC9hPjwvcD48cD4xMuOAgU1hbmQgTW9iaWxlPC9wPjxwPk1hbmQgTW9iaWxl5piv6Z2i5ZCR6YeR6J6N5Zy65pmv55qEVnVl56e75Yqo56uvVUnnu4Tku7blupPvvIzkuLDlr4zjgIHngbXmtLvjgIHlrp7nlKjvvIzlv6vpgJ/mkK3lu7rkvJjotKjnmoTph5Hono3nsbvkuqflk4HvvIzorqnlpI3mnYLnmoTph5Hono3lnLrmma/lj5jnroDljZXjgIJNYW5kIE1vYmlsZeWQq+acieS4sOWvjOeahOe7hOS7tjMwK+eahOWfuuehgOe7hOS7tu+8jOimhueblumHkeiejeWcuuaZr++8jOaegemrmOeahOaYk+eUqOaAp+e7hOS7tuWdh+acieivpue7huivtOaYjuaWh+aho+OAgeahiOS+i+a8lOekuu+8jOaxsuWPluacgOWJjeayv+aKgOacr++8jOe7hOS7tuWMlui9u+mHj+WMluWunueOsO+8jOWFvOmhvueos+WumuWSjOWTgei0qO+8jOWKquWKm+WunueOsOmHkeiejeWcuuaZr+eahOWFqOimhuebluOAgjwvcD48cD5NYW5kIE1vYmlsZeWumOe9ke+8mjxhIGhyZWY9Imh0dHBzOi8vZGlkaS5naXRodWIuaW8vbWFuZC1tb2JpbGUvIy96aC1DTi9ob21lIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IHJnYigxMDAsIDEwMiwgMTc5KTsiPmh0dHBzOi8vZGlkaS5naXRodWIuaW8vbWFuZC1tb2JpbGUvIy96aC1DTi9ob21lPC9hPjwvcD48cD7kuIvpnaLmmK8xLnjnmoTmlofmoaPlkozmvJTnpLrlnLDlnYDvvJrvvIjmlofmoaPlnLDlnYDlt7Lnu4/ov4Hnp7vkuobvvIk8L3A+PHA+PGEgaHJlZj0iaHR0cHM6Ly9tYW5kLW1vYmlsZS5naXRodWIuaW8vMXgtZG9jLyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwczovL21hbmQtbW9iaWxlLmdpdGh1Yi5pby8xeC1kb2MvPC9hPjwvcD48cD48YSBocmVmPSJodHRwczovL21hbmQtbW9iaWxlLmdpdGh1Yi5pby8yeC1kb2MvIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0iY29sb3I6IHJnYigxMDAsIDEwMiwgMTc5KTsiPmh0dHBzOi8vbWFuZC1tb2JpbGUuZ2l0aHViLmlvLzJ4LWRvYy88L2E+PC9wPjxwPjxzdHJvbmc+5LmL5YmN55qE5Zyw5Z2A5omT5LiN5byA5LqGPC9zdHJvbmc+PC9wPjxwPjEz44CBd2UtdnVlIFVJ57uE5Lu25bqTPC9wPjxwPndlLXZ1ZSDmmK/kuIDlpZfln7rkuo4gVnVlLmpzIOeahOenu+WKqOWFs+e7hOS7tuW6k++8jOe7k+WQiCB3ZXVpLmNzcyDmoLflvI/lupPvvIzlsIHoo4XkuobkuIDns7vliJfnu4Tku7bvvIzpnZ7luLjpgILkuo7lvq7kv6HlhazkvJflj7fnrYnnp7vliqjnq6/lvIDlj5HjgIJ3ZS12dWUg5YyF5ZCrMzUrIOS4que7hOS7tu+8jOWNleWFg+a1i+ivleimhueblueOh+i2hSA5OCXvvIzmlK/mjIEgYmFiZWwtcGx1Z2luLWltcG9ydO+8jOWujOWWhOeahOWcqOe6v+aWh+aho++8jOivpue7hueahOWcqOe6v+ekuuS+i+OAgjwvcD48cD53ZS12dWXlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL3dldnVlLm9yZy8iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDEwMCwgMTAyLCAxNzkpOyI+aHR0cHM6Ly93ZXZ1ZS5vcmcvPC9hPjwvcD48cD4xNOOAgXZldWkgVUnnu4Tku7blupM8L3A+PHA+dmV1aeaYr+S4gOS4queUseeZvuW6pkVGRSB0ZWFt5byA5Y+R55qEVnVl5LyB5Lia57qnVUnnu4Tku7blupPjgILnm67liY3mlofmoaPov5jmsqHmnInvvIzlj6rmnIlkZW1v44CCPC9wPjxwPkdpdEh1YuS4iuivtOaYr+ato+WcqOi/m+ihjOeahOS4gOmhueW3peS9nOOAgumCo+aIkeS7rOWwseiAkOW/g+etieW+heWQp+OAgjwvcD48cD52ZXVp5a6Y572R77yaPGEgaHJlZj0iaHR0cHM6Ly9lY29tZmUuZ2l0aHViLmlvL3ZldWkvY29tcG9uZW50cy8jLyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij5odHRwczovL2Vjb21mZS5naXRodWIuaW8vdmV1aS9jb21wb25lbnRzLyMvPC9hPjwvcD48cD4xNeOAgVNlbWFudGljLVVJLVZ1ZSBVSee7hOS7tuW6kzwvcD48cD5TZW1hbnRpYy1VSS1WdWXmmK/ln7rkuo4gVnVlLmpz5a+5U2VtYW50aWMtVUkg5qGG5p6255qE5a6e546w44CCPC9wPjxwPlNlbWFudGlj5L2c5Li65LiA5qy+5byA5Y+R5qGG5p6277yM5biu5Yqp5byA5Y+R6ICF5L2/55So5a+55Lq657G75Y+L5aW955qESFRNTOivreiogOaehOW7uuS8mOmbheeahOWTjeW6lOW8j+W4g+WxgOOAglNlbWFudGljLVVJLVZ1ZeaPkOS+m+S6huS4gOS4quexu+S8vOS6jiBTZW1hbnRpYy1VSSDnmoQgQVBJIOS7peWPiuS4gOe7hOWPr+WumuWItueahOS4u+mimOOAgjwvcD48cD5TZW1hbnRpYy1VSS1WdWXlrpjnvZHvvJo8YSBocmVmPSJodHRwczovL3NlbWFudGljLXVpLXZ1ZS5naXRodWIuaW8vIy8iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJjb2xvcjogcmdiKDEwMCwgMTAyLCAxNzkpOyI+aHR0cHM6Ly9zZW1hbnRpYy11aS12dWUuZ2l0aHViLmlvLyMvPC9hPjwvcD48cD7lnKjpgInmi6nmoYbmnrbnmoTml7blgJnkuIDlrpropoHmoLnmja7lrp7pmYVXZWLlvIDlj5Hmg4XlhrXlkozlm6LpmJ/nmoTnhp/mgonnqIvluqbmnaXpgInmi6njgILkuIDkuKrlpb3nmoRVSee7hOS7tuW6k+WvueS4gOS4qldlYumhueebruadpeivtOW+iOmHjeimgTwvcD48cD4xNi5WdWUuanMgTWF0ZXJpYWwgQ29tcG9uZW50IEZyYW1ld29yayDigJQgVnVldGlmeS5qczwvcD48cD48YSBocmVmPSJodHRwczovL3Z1ZXRpZnlqcy5jb20vemgtSGFucyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9ImNvbG9yOiByZ2IoMTAwLCAxMDIsIDE3OSk7Ij48ZW0+aHR0cHM6Ly92dWV0aWZ5anMuY29tL3poLUhhbnM8L2VtPjwvYT48L3A+PHA+VnVldGlmeeWujOWFqOagueaNrk1hdGVyaWFsIERlc2lnbuinhOiMg+W8gOWPkeOAguavj+S4que7hOS7tumDveaYr+aJi+W3peWItuS9nOeahO+8jOS4uuaCqOeahOS4i+S4gOS4quS8n+Wkp+eahOW6lOeUqOeoi+W6j+W4puadpeacgOWlveeahFVJ5bel5YW344CC5byA5Y+R5bm25rKh5pyJ5YGc55WZ5ZyoR29vZ2xl6KeE6IyD5Lit55qE5qC45b+D57uE5Lu25LiK44CC6YCa6L+H56S+5Yy65oiQ5ZGY5ZKM6LWe5Yqp5ZWG55qE5pSv5oyB77yM5pu05aSa55qE57uE5Lu25bCG6KKr6K6+6K6h5bm25o+Q5L6b57uZ5aSn5a625Lqr5Y+X44CCPC9wPjxwPui/meS4quS4u+imgeaYr+WbveWkluavlOi+g+a1geihjOeahHZ1ZSB1aee7hOS7tu+8jOWQhOenjeWKn+iDvemDveacie+8jOacieS4reaWh+e/u+ivkeeahO+8jOS9huacieS6m+i/mOaYr+iLseaWh+eahO+8jOe/u+ivkeW+l+S4jeaYr+W+iOWlvTwvcD48cD5QU++8muWbveWGheeahFVJ57uE5Lu25aSn6YOo5YiG6YO95Y+q5pyJ5LiA6YOo5YiG55qE77yM5bi455So55qE5aS06YOo5a+86Iiq77yM5bqV6YOo5a+86Iiq77yMbGlzdHZpZXfvvIxncmlk6KGo5qC85b6I5aSa6YO95piv5rKh5pyJ55qE44CCPC9wPjxwPjxicj48L3A+', '2020-08-25 09:49:34', NULL, 1, '0', 1, '组件,UI,Vue,官网,https', '发帖了', '', 1, 1, NULL, NULL, 'cymm', NULL),
(102, 3591598424142435, NULL, '6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams', '2020-08-26 14:42:23', NULL, 0, '0', 1, '草泥马', '说', NULL, 0, 0, NULL, NULL, NULL, ''),
(103, 5391598424388445, NULL, '6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams6I2J5rOl6ams', '2020-08-26 14:46:28', NULL, 0, '0', 1, '草泥马', '说', NULL, 0, 0, NULL, NULL, NULL, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- Inserting 3 rows into praise_info
-- Insert batch #1
INSERT INTO praise_info (id, post_id, createTime, author_id, is_removed) VALUES
(19, 3271597288774284, '2020-08-13 15:19:36', 1, 0),
(20, 4681597307918798, '2020-08-13 16:38:50', 1, 0),
(21, 1081598320174438, '2020-08-25 09:49:48', 1, 0);

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

