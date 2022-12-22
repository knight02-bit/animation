[toc]

# 番荒之冢 --番剧灯塔站

*一番桃李花开尽，惟有青青草色齐。——曾巩《城南》*





## 理念

前端追求简洁风格

提供有效廉价的追番姿势

提供资源分享的bbs讨论



## 大致设计

### 权限分配

| 权限分配                     |     普通用户     | 管理员 |
| :--------------------------- | :--------------: | :----: |
| ~~新增用户(暂未开放此功能)~~ | (注册,※邮箱验证) |   ✔    |
| 删除用户                     |   (※自己注销)    |   ✔    |
| 查看/编辑个人资料            |        ✔         |   ✔    |
| 查看他人资料                 |        ✔         |   ✔    |
|                              |                  |        |
| 番剧信息『**增删改**』       |                  |   ✔    |
| 番剧信息『**查**』           |        ✔         |   ✔    |
|                              |                  |        |
| 查看追番清单; 取消/进行追番  |        ✔         |   ✔    |
|                              |                  |        |
| 留言区发言                   |        ✔         |   ✔    |
| 删除留言                     | (仅能删除自己的) |   ✔    |





### 番剧信息

| 番剧信息                                     |                                        |
| -------------------------------------------- | -------------------------------------- |
| 编号                                         |                                        |
| 番名                                         |                                        |
| 封面                                         | 默认路径为:`static/picture/pic404.png` |
| 状态(连载中/ 已完结)                         |                                        |
| 上映年份                                     |                                        |
| 追番人数                                     |                                        |
| 有效跳转链接(null:暂无资源,可以在留言区补充) |                                        |

默认封面![pic404](readme.assets/pic404.png)



### 用户/管理员信息

|              用户              |                                       |
| :----------------------------: | ------------------------------------- |
|             uid号              |                                       |
|  权限等级(1:管理员 / 2:用户)   |                                       |
|              昵称              |                                       |
|              邮箱              |                                       |
|              密码              |                                       |
|        头像(目前为默认)        | 默认路径为:`static/picture/user0.jpg` |
|              简介              |                                       |
| 追番清单(~~json:不便于维护~~ ) |                                       |

默认头像

![user0](readme.assets/user0.jpg)



### 邮箱正则匹配

![image-20221222103512071](readme.assets/image-20221222103512071.png)
### URL正则匹配

![image-20221222103330018](readme.assets/image-20221222103330018.png)


### 留言信息

|        留言        |      |
| :----------------: | ---- |
|        AID         |      |
|        UID         |      |
| 发送时间(自动获取) |      |
|        内容        |      |



## 数据库设计

### user

```sql
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```



### animation

```sql
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
```

### comment

```sql
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
```

### favoranim

```sql
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
```



## 技术栈(无框架)

HTML CSS JSP

JAVA

MYSQL

TOMCAT



## 功能

### 一个简单的登录(进行了路由限制, 若未登录都会跳转至此)

![image-20221222152248875](readme.assets/image-20221222152248875.png)

### 首页

+ 可进行关键字查询

+ 分页展示数据库中的已有番剧

+ 展示最新的三条留言

+ 管理员可在此新增番剧

  

![image-20221222152351026](readme.assets/image-20221222152351026.png)

(管理员视角)![image-20221222153006559](readme.assets/image-20221222153006559.png)

![image-20221222153050436](readme.assets/image-20221222153050436.png)

![image-20221222153250671](readme.assets/image-20221222153250671.png)

![image-20221222153332292](readme.assets/image-20221222153332292.png)



### 我的

![image-20221222153413965](readme.assets/image-20221222153413965.png)



#### 我的资料

![image-20221222153453932](readme.assets/image-20221222153453932.png)



修改资料

![image-20221222153621750](readme.assets/image-20221222153621750.png)

![image-20221222153721241](readme.assets/image-20221222153721241.png)

![image-20221222153653310](readme.assets/image-20221222153653310.png)



#### 追番清单

![image-20221222153831977](readme.assets/image-20221222153831977.png)

### 留言区

+ 可查看最新留言,删除自己的留言

+ 查看他人资料

![image-20221222154001544](readme.assets/image-20221222154001544.png)

![image-20221222154105807](readme.assets/image-20221222154105807.png)



### 番剧详情

![image-20221222154159354](readme.assets/image-20221222154159354.png)

![image-20221222154259076](readme.assets/image-20221222154259076.png)

![image-20221222154236696](readme.assets/image-20221222154236696.png)

管理员可进行编辑

![image-20221222154334266](readme.assets/image-20221222154334266.png)

![image-20221222154359812](readme.assets/image-20221222154359812.png)



### 退出登录



## 待补充功能

### 分页过多

页数太多时的处理方案实现



### 番剧类型

尚未添加



### 图像上传

使用图库的api接口

```python
https://img.ski/page/api-docs.html
https://imgse.com/page/plugin
https://www.kjava.com/
```



### 新用户注册

使用邮箱验证码进行注册



### ...



## 联系作者

📪: tsjkhtfoxmail.com

[泥烟の客栈](https://www.cnblogs.com/knight02)

[凌海逆炎のbilibili](https://space.bilibili.com/398743455)

[仓库已开源: animation: 番荒之冢 - - 番剧灯塔站 (gitee.com)](https://gitee.com/knight-02/animation)

