/*
Navicat MySQL Data Transfer

Source Server         : my-mysql
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : dm

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-12-22 15:20:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for animation
-- ----------------------------
DROP TABLE IF EXISTS `animation`;
CREATE TABLE `animation` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `aname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'static/picture/pic404.png',
  `link` varchar(255) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`aname`),
  UNIQUE KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of animation
-- ----------------------------
INSERT INTO `animation` VALUES ('3', 'Re:Stage! Dream Days?', '1', '2019', 'https://tva4.sinaimg.cn/large/008kBpBlgy1h0j6jegg74j305i07nwew.jpg', 'https://www.yhdmp.net/showp/19270.html', '私立稀星学园高尾分校初中部，那是与有着表演系的本校不同的非常普通的学校。某一天，一名放弃了梦想的少女转入这所学校时，这个故事便开始了。\r\n少女的名字叫做式宫舞菜。\r\n她有着超人的歌舞感，因为某件事从本校转到了高尾分校。舞菜虽然打算在这里平凡度日，却遇上了谣舞蹈部这个濒临废部的社团。原本进行舞蹈活动的这个社团为了避免被废部打算展开偶像活动——\r\n舞菜与同伴们一起，再次踏上了自己一度放弃的梦想之路。');
INSERT INTO `animation` VALUES ('11', 'Slow Loop', '1', '2017', 'https://tva4.sinaimg.cn/large/008kBpBlgy1gwpbxx7fgxj305i07n3yt.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/1052.html', '在海边，少女日和独自享受过世的父亲教给她的飞钓。和往常一样钓鱼的时候，突然遇到准备下水的天真烂漫的少女小春。\r\n两个人决定一起钓鱼，但她们实际上是父母再婚对象的女儿……\r\n要不要和因为意外的相遇而成为“姐妹”的日和与小春一起，一边钓鱼一边悠闲地度过呢？');
INSERT INTO `animation` VALUES ('17', '化物语 化物語', '2', '2009', 'https://tva4.sinaimg.cn/large/008kBpBlgy1h0j87318bij305i07ndg1.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/2322.html', '三年同班同学却没有说过一句话，这指得就是阿良良木历（神谷浩史 配音）和战场原黑仪（斋藤千和 配音）。二人虽是同班同学，但可以说没有任何交集。本以为就会这样一直下去的阿良良木历因为一次偶然接住了意外从楼梯上跌下来的黑仪。而这次意外的从天而降，让历知道了黑仪的秘密。而这个秘密牵扯到众多事情，虽然历发誓自己绝不会把这件事告诉任何人，但黑仪还是表示怀疑。而历也向黑仪透露出自己的小秘密。但这个城市并不是只有二人拥有神奇的力量。许多奇怪的生物和事情正在向二人靠拢。                                                                    　　本剧根据日本小说家西尾维新的同名轻小说改编。《化物语》曾获得2009年“这本轻小说真厉害！”票选活动第六名。');
INSERT INTO `animation` VALUES ('1', '孤独摇滚', '2', '2022', 'https://tva4.sinaimg.cn/large/008v6dp8gy1h67mhfxanbj305i07ndg3.jpg', 'https://www.yhdmp.net/showp/22203.html', '绰号“小孤独”的后藤独，是一个喜爱吉他的孤独少女。经常在家里独自弹奏吉他，但因为一些事情，加入了伊地知虹夏领衔的“纽带乐队”。不敢在他人面前演奏的后藤，能否成为一个出色的乐队成员呢？');
INSERT INTO `animation` VALUES ('12', '我家师傅没有尾巴', '2', '2022', 'https://tva4.sinaimg.cn/large/008v6dp8gy1h61zmniro7j305i07naad.jpg', 'https://www.yhdmp.net/showp/22234.html', '梦想着有一天能捉弄人类的豆狸的女孩·小豆来到大阪后处处碰壁 还被自称是“落语家”的黑发美女一眼就识破了真身 “落语家”毫不留情地说:“赶紧滚回到乡下去” 看了之后会露出笑容的大正落语幻想。');
INSERT INTO `animation` VALUES ('10', '杜鹃的婚约', '2', '2022', 'https://tva4.sinaimg.cn/large/008kBpBlgy1h4hc9dkoewj305i07ndg1.jpg', 'https://www.yhdmp.net/showp/21252.html', '刚出生时被抱错的高中生海野凪终于要和亲生父母见面了。 当天，凪偶然遇到名门女子学校的女高中生天野绘里香，为了帮助不想和未婚夫结婚的她，他答应了她的请求，半强行地扮演了她男朋友这一角色…… 然而，这两个人刚好是当时被抱错的孩子，两人之间已经定下了婚约。 父母之间为了让彼此都能保有这两个孩子，为他们两人订下婚约，让他们开始同居生活。 喜欢同班同学濑川弥的凪和反对父亲决定的绘里香，两人定下了“相互之间不干涉”这一规矩。 未曾见过的，命运交错的恋爱喜剧，就此开幕');
INSERT INTO `animation` VALUES ('2', '海贼王', '1', '1999', 'https://tva4.sinaimg.cn/large/008kBpBlgy1grtfflf7cxj305i07nq3y.jpg', 'https://www.yhdmp.net/showp/83.html', '拥有财富、名声、权力，这世界上的一切的男人 “海贼王”哥尔·D·罗杰，在被行刑受死之前说了一句话，让全世界的人都涌向了大海。“想要我的宝藏吗？如果想要的话，那就到海上去找吧，我全部都放在那里。”，世界开始迎接“大海贼时代”的来临 。\r\n时值“大海贼时代”，为了寻找传说中海贼王罗杰所留下的大秘宝“ONE PIECE”，无数海贼扬起旗帜，互相争斗。有一个梦想成为海贼王的少年叫路飞，他因误食“恶魔果实”而成为了橡皮人，在获得超人能力的同时付出了一辈子无法游泳的代价。十年后，路飞为实现与因救他而断臂的香克斯的约定而出海，他在旅途中不断寻找志同道合的伙伴，开始了以成为海贼王为目标的冒险旅程  。');
INSERT INTO `animation` VALUES ('6', '海贼王女', '2', '2022', 'https://pic.feisuimg.com/upload/vod/20220419-1/3c825de4941505554dacc76c8fffdff2.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/639.html', '《海贼王女》是以主角“菲娜·豪特曼（フェナ?ハウトマン）”的旅途以及成长之路为主轴展开。故事描述，菲娜在与她父亲乘船旅行时受到海贼袭击，仅她一人靠着小艇漂流到了国家公认的风化岛“香格里拉（シャングリラ）”。10 年后，亭亭玉立的菲娜准备展开她首次“工作”的同时，她下定了逃离这座岛的决心。 ');
INSERT INTO `animation` VALUES ('9', '独自生活的小学生', '2', '2017', 'https://pic.img.ski/1671267009.jpg', 'https://www.bilibili.com/bangumi/play/ss22288', '时值1980年代，江之岛的小学四年级的女生铃音凛（鈴音リン）父母双亡，她独自经营着食堂生活下去。');
INSERT INTO `animation` VALUES ('8', '玉子爱情故事', '2', '2014', 'https://tva4.sinaimg.cn/large/008kBpBlgy1h0j7q6m6vzj305i07nq37.jpg', 'https://www.bilibili.com/bangumi/media/md4155/', '时已入春，已经进入高中三年级的北白川玉子仍然总是想着打糕的事情。春天傍晚的放学路上，玉子好友四人组谈论着关于将来出路的事情。大家虽然对此感到不安，但似乎对将来的事情都有好好地考虑过。玉子也无意中说出自己将来想要继承家业。同时，住在玉子家的对面、一直和她在一起的饼藏，也下定了某种决心。——周围的各种事物都在逐渐改变着，一点一点地动摇着玉子的心。');
INSERT INTO `animation` VALUES ('14', '番剧a', '2', '2011', 'static/picture/pic404.png', '', 'aaa');
INSERT INTO `animation` VALUES ('15', '番剧b', '1', '1999', 'static/picture/pic404.png', '', 'bbb');
INSERT INTO `animation` VALUES ('13', '秋叶原冥途战争', '2', '2022', 'https://tva4.sinaimg.cn/large/9a6d8579gy1h5lfqmfirej205i07ngm1.jpg', 'https://www.yhdmp.net/showp/22438.html', '由开发过《赛马娘 Pretty Derby》和《公主连结！Re:Dive》的游戏公司 Cygames 与 P.A.WORKS 联合推出全新原创动画《秋叶原冥途战争》将于 2022 年 10 月 6 日开始放送。近藤玲奈、佐藤利奈、高垣彩阳等声优参与出演。 标题中 \" 冥途（めいど）\" 与 \" 女仆（メイド）\" 同音，本片讲述一位憧憬可爱女仆的少女 —— 和平和美，为追逐梦想来到秋叶原后一系列 \" 萌与暴力 \" 的故事。');
INSERT INTO `animation` VALUES ('21', '赛博朋克：边缘跑手 Cyberpunk: Edgerunners', '2', '2022', 'https://tva4.sinaimg.cn/large/008v6dp8gy1h656dczb78j305i07nq37.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/1967.html', '《赛博朋克：浪客》是与《赛博朋克2077》共享同一世界观的原创动画项目，为一部十集的独立故事剧集，讲述了一名街头小子尝试在技术高度繁荣、人体改造盛行的未来城市中挣扎求生的故事。冒着失去一切的风险，他选择成为一名浪客 —— 游走于法外的雇佣兵。 据介绍，该动画剧集将是一个与游戏《赛博朋克2077》剧情完全不同的独立故事，舞台依然是夜之城，但会有新的角色新的剧情，并非将游戏故事再演绎一次。');
INSERT INTO `animation` VALUES ('19', '进击的巨人 最终季 Part.2 進撃の巨人 The Final Season Part.2', '2', '2022', 'https://tva4.sinaimg.cn/large/008kBpBlgy1gwn5sssk2wj305i07ndg5.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/2059.html', '在艾伦他们居住的帕拉迪岛之外，还存在一个其他人类居住的世界。当中一个国家「玛雷」与其他各国爆发战争。陷入苦战之际，他们决定要攻进帕拉迪岛，把「始祖的巨人」抢过来。在这里又看到另一群孩子们拼命求生存的身影……。');
INSERT INTO `animation` VALUES ('18', '进击的巨人 最终季 進撃の巨人 The Final Season Part.1', '2', '2020', 'https://tva4.sinaimg.cn/large/008kBpBlgy1h0x2fvwh61j305i07njro.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/2058.html', '在艾伦他们居住的帕拉迪岛之外，还存在一个其他人类居住的世界。当中一个国家「玛雷」与其他各国爆发战争。陷入苦战之际，他们决定要攻进帕拉迪岛，把「始祖的巨人」抢过来。在这里又看到另一群孩子们拼命求生存的身影……。');
INSERT INTO `animation` VALUES ('20', '间谍过家家', '2', '2022', 'https://tva4.sinaimg.cn/large/008kBpBlgy1gw1s5ts4v6j305i07nmxe.jpg', 'http://www.sakanaaa.com/index.php/vod/detail/id/458.html', '每个人都有不可告人的一面——\r\n这是一个世界各国均暗地里进行激烈情报战的时代。东国（Ostania）与西国（Westalis）的冷战状态已经持续数十年。\r\n“黄昏”是西国情报局东国对策科“WISE”的一名优秀间谍。为调查威胁东西两国和平的人物——东国国家统一党总裁多诺万·德斯蒙，上级给予了他一个绝密任务。\r\n任务名为：“枭”（Strix）行动。\r\n内容是“一周之内组建家庭，潜入德斯蒙儿子就读的名门学校的联谊会”。\r\n于是“黄昏”扮演成精神科医生劳埃德·福杰，开始组建家庭。\r\n然而，他找来的女儿阿尼亚是个能读心的超能力者，妻子约尔是个杀手。三人利害关系一致，便互相隐瞒身份，开始了共同生活。\r\n世界的和平，就掌握在这意外不断的临时一家人手中.');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `uid` int NOT NULL,
  `time` datetime NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`uid`,`time`),
  CONSTRAINT `user-comment` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2022-12-16 18:06:02', '登山少女这部作品，从第一季的泡面番到第二季第三季，12分钟。最后终于在第四季变成24分钟，这些例子无一不在说明登山少女这部日常番的成功之处。\r\n即使你对登山一点也不了解。但是里面的内容对于你来说也肯定不是枯燥的。里面有很大一部分都描写写了，主角团他们之间的友谊(主要是葵和日向)，无论你是喜欢日常还是喜欢轻百的绝对不能错过这个作品。\r\n而那些喜欢热血战斗的，也不妨进入试一试。他肯定会给你带来意想不到的收获。\r\n而只看了第四季的，也无妨，把前三季补一补。\r\n注:本人最喜欢的是第三部，而最喜欢的ED是第二部。');
INSERT INTO `comment` VALUES ('1', '2022-12-20 22:58:58', 'fsadsfsaf');
INSERT INTO `comment` VALUES ('3', '2022-12-08 16:32:55', '有没有摇滚歌手的链接啊');
INSERT INTO `comment` VALUES ('4', '2022-10-11 23:55:44', '《飞翔的魔女》首先来说，这部番气绝对是一部非常合格的养老番。少有的没有卖肉，没有恋爱的番剧。而且制作十分精良，每一首配曲简直卡点到已到极致。尤其是女主的各种表情包，实在是好玩儿。那么我就开始认真点评一下。 按我以前的风格，首先来用剧情的方式来看。本方的题目是飞翔的魔女。那么自然就少不了魔女的概念。但其番剧主要内容以日常为主。将魔女的概念浅显化，只有在咖啡馆和最后一两集是集中体现的。整部剧情以单元剧为主题。每一集相关联度不高。是很适合每一集讲故事的那一种人看。但本剧情应没有什么关联度，对于那种剧情党来说是很不友好的。这也是养老番的特质。如果你不喜欢请再看第一集之前就选择是最好的方式。 再说画面方面。本文的画面简直是以业界标杆的方式去了。作画全程在线。没有一处崩坏，也没有一处掉帧。让人看得很温馨轻松，尤其是在河边的时候，流水都可以看得非常清晰的流动。可见画质的精美和帧数的恰当。对于那一类非常喜欢动画的画面的人来说，是一部一定要补的番剧。');
INSERT INTO `comment` VALUES ('5', '2022-10-11 23:55:44', '有妹妹，有青梅，有天降——还是对姐妹花，但只想过佛系生活的男主');
INSERT INTO `comment` VALUES ('5', '2022-12-19 08:54:07', '额飞洒发撒');
INSERT INTO `comment` VALUES ('5', '2022-12-19 08:54:21', '测试留言功能1');
INSERT INTO `comment` VALUES ('5', '2022-12-20 22:16:11', '✔查看他人留言');
INSERT INTO `comment` VALUES ('5', '2022-12-22 14:08:23', '求《赛博朋克：边缘跑手 Cyberpunk: Edgerunners》资源');
INSERT INTO `comment` VALUES ('6', '2022-12-07 17:16:37', '我好饿');
INSERT INTO `comment` VALUES ('7', '2022-05-19 17:17:01', '玛卡巴卡,欧卡米卡');
INSERT INTO `comment` VALUES ('7', '2022-12-20 08:13:56', '碗上好');
INSERT INTO `comment` VALUES ('7', '2022-12-20 08:14:36', 'whatever');
INSERT INTO `comment` VALUES ('7', '2022-12-20 11:10:20', '追番清单功能测试中');
INSERT INTO `comment` VALUES ('7', '2022-12-20 20:18:21', '1111');
INSERT INTO `comment` VALUES ('7', '2022-12-21 23:51:21', '修改个人资料');
INSERT INTO `comment` VALUES ('7', '2022-12-22 14:03:54', '大概是,,完成力');
INSERT INTO `comment` VALUES ('7', '2022-12-22 14:11:00', '赛博朋克已补充');

-- ----------------------------
-- Table structure for favoranim
-- ----------------------------
DROP TABLE IF EXISTS `favoranim`;
CREATE TABLE `favoranim` (
  `uid` int NOT NULL,
  `aid` int NOT NULL,
  PRIMARY KEY (`uid`,`aid`),
  KEY `favor-anim` (`aid`),
  CONSTRAINT `favor-anim` FOREIGN KEY (`aid`) REFERENCES `animation` (`aid`) ON DELETE CASCADE,
  CONSTRAINT `favor-user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of favoranim
-- ----------------------------
INSERT INTO `favoranim` VALUES ('1', '1');
INSERT INTO `favoranim` VALUES ('7', '1');
INSERT INTO `favoranim` VALUES ('7', '2');
INSERT INTO `favoranim` VALUES ('1', '3');
INSERT INTO `favoranim` VALUES ('7', '3');
INSERT INTO `favoranim` VALUES ('1', '10');
INSERT INTO `favoranim` VALUES ('4', '10');
INSERT INTO `favoranim` VALUES ('7', '10');
INSERT INTO `favoranim` VALUES ('7', '11');
INSERT INTO `favoranim` VALUES ('7', '12');
INSERT INTO `favoranim` VALUES ('7', '14');
INSERT INTO `favoranim` VALUES ('5', '21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` int NOT NULL DEFAULT '2',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'static/picture/user0.jpg',
  `intro` text,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'k@11.com', '123456', 'k', '2', 'static/picture/user0.jpg', '老K, 非酋一枚');
INSERT INTO `user` VALUES ('2', 'jiejie@gmail.com', '123456', 'jiejie', '1', 'static/picture/user0.jpg', null);
INSERT INTO `user` VALUES ('3', 'shie@s.com', '123456', 'shiein', '1', 'static/picture/user0.jpg', null);
INSERT INTO `user` VALUES ('4', 'tom@qq.com', '234567', '汤姆杰瑞的狗', '1', 'static/picture/user0.jpg', '哦, 我可怜的上帝');
INSERT INTO `user` VALUES ('5', 'sala@qq.com', '123123', '萨拉低昂的魔咒', '1', 'static/picture/user0.jpg', '生前何必久睡, 死后自会长眠');
INSERT INTO `user` VALUES ('6', 'hali@163.com', '123234', '哈利', '1', 'static/picture/user0.jpg', '阿瓦达啃大瓜!!');
INSERT INTO `user` VALUES ('7', 'linghai@qq.com', '234234', '凌海逆炎yep', '2', 'static/picture/user0.jpg', '  “朱泙漫学屠龙于支离益,弹千金之家,三年技成,而无所用其巧。”这是《庄子》里关于“屠龙之技”的故事。故事里的朱泙漫,像是如堂吉诃德一般的愚者,而支离益则像是揣着大力丸的神棍。《庄子》在问朱泙漫和支离益:世间无龙,纵屠龙技早,何用做?后来我想明白了,我为什么渴望逆转时空。我在记忆里检索,发现自己对于时间旅行最初的认知,源于漫画《龙珠》。其中有一章描绘到:负道的少年从支离破碎的未来逆行至另一段平行的历史里,只为拯救一个注定没有他归属的世界。\r\n  真酷!\r\n  无论是少年悲伤却坚毅的眼神、那句“我来自来来”的出场白,还是刻印在时序下不可更迭的孑然宿命,都酷到经历十余年岁月洪流的磨洗后依然闪耀的程度。而我所渴望的理由,从年少时就存放于此。谁说屠龙之技定要屠龙?也许朱泙漫独行过千山,终于找到了可以睥睨这迍邅世局的峰巅。此刻他正架地弹铗长歌,等待终殁之刻,再骄傲地将自己的生命和屠龙之技一同埋葬。而支离益,也许正握着那块古意盎然、装饰繁复的怀表,平静地守望着下一个愿意学屠龙之技的少年。');
INSERT INTO `user` VALUES ('8', 'aaa@qq.com', '111111', '测试1', '1', 'static/picture/user0.jpg', '测试测试1');
