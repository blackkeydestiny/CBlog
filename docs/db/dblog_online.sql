/*
 Navicat Premium Data Transfer

 Source Server         : Kevin@23.91.96.37
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : 23.91.96.37:3306
 Source Schema         : dblog

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 17/09/2018 13:30:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_article
-- ----------------------------
DROP TABLE IF EXISTS `biz_article`;
CREATE TABLE `biz_article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户ID',
  `cover_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章封面图片',
  `cover_image150` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章封面图片(150x150)',
  `qrcode_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章专属二维码地址',
  `is_markdown` tinyint(1) UNSIGNED NULL DEFAULT 1,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `content_md` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'markdown版的文章内容',
  `top` tinyint(1) NULL DEFAULT 0 COMMENT '是否置顶',
  `type_id` bigint(20) UNSIGNED NOT NULL COMMENT '类型',
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `recommended` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否推荐',
  `original` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否原创',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章简介，最多200字',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否开启评论',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_article
-- ----------------------------
INSERT INTO `biz_article` VALUES (2, 'DBlog简介（未开启评论）', 1, 'https://gitee.com/blackkeydestiny/blogAssets/raw/master/article/cover/2018082401.jpg', 'https://gitee.com/blackkeydestiny/blogAssets/raw/master/article/cover/2018082402.jpg', NULL, 1, '<h1 id=\"dblog-\">DBlog简介</h1>\n<p>DBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。</p>\n<p><strong>网站预览</strong>    </p>\n<p><a href=\"https://www.zhyd.me\">https://www.zhyd.me</a>  </p>\n<p><strong>开源地址</strong>   </p>\n<ol>\n<li><a href=\"https://gitee.com/yadong.zhang/DBlog\">Gitee</a>    </li>\n<li><a href=\"https://github.com/zhangyd-c/DBlog\">Github</a>    </li>\n</ol>\n<h2 id=\"-\">写在前面的话</h2>\n<p>ps: 虽然我知道，大部分人都是来了<strong>直接下载源代码</strong>后就潇洒的离开，并且只有等到下次<strong>突然想到</strong>“我天~~我得去看看DBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    </p>\n<p>发现更新代码了 --&gt; 下载源码后重复上面的步骤<br>发现没更新代码 --&gt; 直接关闭浏览器</p>\n<p>虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：</p>\n<p><strong>如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！</strong></p>\n<h3 id=\"-\">开发环境</h3>\n<table>\n<thead>\n<tr>\n<th>工具</th>\n<th>版本或描述</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>OS</td>\n<td>Windows 7</td>\n</tr>\n<tr>\n<td>JDK</td>\n<td>1.7+</td>\n</tr>\n<tr>\n<td>IDE</td>\n<td>IntelliJ IDEA 2017.3</td>\n</tr>\n<tr>\n<td>Maven</td>\n<td>3.3.1</td>\n</tr>\n<tr>\n<td>MySQL</td>\n<td>5.6.4</td>\n</tr>\n</tbody>\n</table>\n<h3 id=\"-\">模块划分</h3>\n<table>\n<thead>\n<tr>\n<th>模块</th>\n<th>释义</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>blog-core</td>\n<td>核心业务类模块，提供基本的数据操作、工具处理等</td>\n</tr>\n<tr>\n<td>blog-admin</td>\n<td>后台管理模块</td>\n</tr>\n<tr>\n<td>blog-web</td>\n<td>前台模块</td>\n</tr>\n</tbody>\n</table>\n<h3 id=\"-\">技术栈</h3>\n<ul>\n<li>Springboot 1.5.9</li>\n<li>Apache Shiro 1.2.2</li>\n<li>Logback</li>\n<li>Redis</li>\n<li>Lombok</li>\n<li>Websocket</li>\n<li>MySQL、Mybatis、Mapper、Pagehelper</li>\n<li>Freemarker</li>\n<li>Bootstrap 3.3.0</li>\n<li>wangEditor</li>\n<li>jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck</li>\n<li>阿里云OSS</li>\n<li>kaptcha</li>\n<li>Qiniu</li>\n<li>...</li>\n</ul>\n<h3 id=\"-\">使用方法</h3>\n<ol>\n<li>使用IDE导入本项目</li>\n<li>新建数据库<code>CREATE DATABASE dblog;</code></li>\n<li>导入数据库<code>docs/db/dblog.sql</code></li>\n<li>修改(<code>resources/application.yml</code>)配置文件<ol>\n<li>数据库链接属性(可搜索<code>datasource</code>或定位到L.19) </li>\n<li>redis配置(可搜索<code>redis</code>或定位到L.69)</li>\n<li>mail配置(可搜索<code>mail</code>或定位到L.89)</li>\n<li>【<a href=\"http://qiniu.com\">七牛云</a>】配置(见sys<em>config表中qiniu</em>*开头的字段)<br>注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的<code>系统配置</code>页面修改相关配置内容</li>\n</ol>\n</li>\n<li>运行项目(三种方式)<ol>\n<li>项目根目录下执行<code>mvn -X clean package -Dmaven.test.skip=true</code>编译打包，然后执行<code>java -jar target/blog-web.jar</code></li>\n<li>项目根目录下执行<code>mvn springboot:run</code></li>\n<li>直接运行<code>BlogWebApplication.java</code></li>\n</ol>\n</li>\n<li>浏览器访问<code>http://127.0.0.1:8443</code></li>\n</ol>\n<p><strong>后台用户</strong></p>\n<p><em>超级管理员</em>： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）</p>\n<p><em>普通管理员</em>： 账号：admin  密码：123456</p>\n<p><em>评论审核管理员</em>： 账号：comment-admin  密码：123456</p>\n<p>注：后台用户的创建，尽可能做到<strong>权限最小化</strong></p>\n<p>更多详情，请参考【<a href=\"https://gitee.com/yadong.zhang/DBlog/wikis\">Wiki</a>】</p>\n', '# DBlog简介\nDBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\n  \n**网站预览**    \n \n[https://www.zhyd.me](https://www.zhyd.me)  \n\n**开源地址**   \n1. [Gitee](https://gitee.com/yadong.zhang/DBlog)    \n2. [Github](https://github.com/zhangyd-c/DBlog)    \n\n## 写在前面的话\nps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看DBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    \n\n发现更新代码了 --> 下载源码后重复上面的步骤    \n发现没更新代码 --> 直接关闭浏览器\n\n虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\n\n**如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\n\n\n### 开发环境\n\n| 工具    | 版本或描述                |\n| ----- | -------------------- |\n| OS    | Windows 7            |\n| JDK   | 1.7+                 |\n| IDE   | IntelliJ IDEA 2017.3 |\n| Maven | 3.3.1                |\n| MySQL | 5.6.4                |\n\n### 模块划分\n\n| 模块         | 释义                      |\n| ---------- | ----------------------- |\n| blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\n| blog-admin | 后台管理模块                  |\n| blog-web   | 前台模块                    |\n\n\n### 技术栈\n\n- Springboot 1.5.9\n- Apache Shiro 1.2.2\n- Logback\n- Redis\n- Lombok\n- Websocket\n- MySQL、Mybatis、Mapper、Pagehelper\n- Freemarker\n- Bootstrap 3.3.0\n- wangEditor\n- jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\n- 阿里云OSS\n- kaptcha\n- Qiniu\n- ...\n\n\n### 使用方法\n\n1. 使用IDE导入本项目\n2. 新建数据库`CREATE DATABASE dblog;`\n3. 导入数据库`docs/db/dblog.sql`\n4. 修改(`resources/application.yml`)配置文件\n   1. 数据库链接属性(可搜索`datasource`或定位到L.19) \n   2. redis配置(可搜索`redis`或定位到L.69)\n   3. mail配置(可搜索`mail`或定位到L.89)\n   4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)    \n   注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\n5. 运行项目(三种方式)\n   1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\n   2. 项目根目录下执行`mvn springboot:run`\n   3. 直接运行`BlogWebApplication.java`\n6. 浏览器访问`http://127.0.0.1:8443`\n\n\n**后台用户**\n\n_超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\n\n_普通管理员_： 账号：admin  密码：123456\n\n_评论审核管理员_： 账号：comment-admin  密码：123456\n\n注：后台用户的创建，尽可能做到**权限最小化**\n\n更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】', 0, 3, 1, 1, 1, 'DBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。', 'DBlog,开源博客', 1, '2018-06-13 09:21:28', '2018-08-20 10:52:20');
INSERT INTO `biz_article` VALUES (3, '三行诗', 1, '', NULL, NULL, 1, '<p>《城》</p>\n<p>你住城东，我住城西<br>我们之间隔了一个东西<br>缺挡不住我们相爱的心</p>\n', '《城》\n\n你住城东，我住城西\n我们之间隔了一个东西\n缺挡不住我们相爱的心', 0, 4, 1, 0, 1, '三行情诗', '三行情诗,城', 1, '2018-08-21 17:42:31', '2018-08-21 17:43:56');

-- ----------------------------
-- Table structure for biz_article_look
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_look`;
CREATE TABLE `biz_article_look`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) UNSIGNED NOT NULL COMMENT '文章ID',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `look_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '浏览时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_article_look
-- ----------------------------
INSERT INTO `biz_article_look` VALUES (1, 4, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:16:24', '2018-04-23 10:16:24', '2018-04-23 10:16:24');
INSERT INTO `biz_article_look` VALUES (2, 3, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:16:41', '2018-04-23 10:16:41', '2018-04-23 10:16:41');
INSERT INTO `biz_article_look` VALUES (3, 2, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:16:55', '2018-04-23 10:16:55', '2018-04-23 10:16:55');
INSERT INTO `biz_article_look` VALUES (5, 4, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:17:39', '2018-04-23 10:17:39', '2018-04-23 10:17:39');
INSERT INTO `biz_article_look` VALUES (6, 3, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:17:43', '2018-04-23 10:17:43', '2018-04-23 10:17:43');
INSERT INTO `biz_article_look` VALUES (7, 3, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:18:17', '2018-04-23 10:18:17', '2018-04-23 10:18:17');
INSERT INTO `biz_article_look` VALUES (8, 3, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:19:39', '2018-04-23 10:19:39', '2018-04-23 10:19:39');
INSERT INTO `biz_article_look` VALUES (9, 3, NULL, '0:0:0:0:0:0:0:1', '2018-04-23 10:19:45', '2018-04-23 10:19:45', '2018-04-23 10:19:45');
INSERT INTO `biz_article_look` VALUES (13, 2, NULL, '127.0.0.1', '2018-08-10 22:04:03', '2018-08-10 22:04:03', '2018-08-10 22:04:03');
INSERT INTO `biz_article_look` VALUES (14, 2, NULL, '127.0.0.1', '2018-08-10 22:11:39', '2018-08-10 22:11:39', '2018-08-10 22:11:39');
INSERT INTO `biz_article_look` VALUES (15, 2, NULL, '127.0.0.1', '2018-08-10 22:38:17', '2018-08-10 22:38:17', '2018-08-10 22:38:17');
INSERT INTO `biz_article_look` VALUES (16, 2, NULL, '104.192.74.31', '2018-08-11 17:11:27', '2018-08-11 17:11:27', '2018-08-11 17:11:27');
INSERT INTO `biz_article_look` VALUES (17, 2, NULL, '104.192.74.31', '2018-08-11 17:11:28', '2018-08-11 17:11:28', '2018-08-11 17:11:28');
INSERT INTO `biz_article_look` VALUES (21, 2, NULL, '119.123.206.175', '2018-08-11 21:41:22', '2018-08-11 21:41:22', '2018-08-11 21:41:22');
INSERT INTO `biz_article_look` VALUES (24, 2, NULL, '119.123.206.175', '2018-08-11 21:50:39', '2018-08-11 21:50:39', '2018-08-11 21:50:39');
INSERT INTO `biz_article_look` VALUES (26, 2, NULL, '119.123.206.175', '2018-08-11 22:27:18', '2018-08-11 22:27:18', '2018-08-11 22:27:18');
INSERT INTO `biz_article_look` VALUES (27, 2, NULL, '119.123.206.175', '2018-08-11 22:50:09', '2018-08-11 22:50:09', '2018-08-11 22:50:09');
INSERT INTO `biz_article_look` VALUES (28, 2, NULL, '119.123.206.175', '2018-08-11 22:52:55', '2018-08-11 22:52:55', '2018-08-11 22:52:55');
INSERT INTO `biz_article_look` VALUES (29, 2, NULL, '119.123.206.175', '2018-08-11 23:03:48', '2018-08-11 23:03:48', '2018-08-11 23:03:48');
INSERT INTO `biz_article_look` VALUES (30, 2, NULL, '104.192.74.46', '2018-08-12 03:35:28', '2018-08-12 03:35:28', '2018-08-12 03:35:28');
INSERT INTO `biz_article_look` VALUES (31, 2, NULL, '104.192.74.46', '2018-08-12 03:35:29', '2018-08-12 03:35:29', '2018-08-12 03:35:29');
INSERT INTO `biz_article_look` VALUES (35, 2, NULL, '119.123.206.191', '2018-08-12 16:34:37', '2018-08-12 16:34:37', '2018-08-12 16:34:37');
INSERT INTO `biz_article_look` VALUES (36, 2, NULL, '119.123.206.191', '2018-08-12 16:36:14', '2018-08-12 16:36:14', '2018-08-12 16:36:14');
INSERT INTO `biz_article_look` VALUES (39, 2, NULL, '119.123.206.191', '2018-08-12 16:36:57', '2018-08-12 16:36:57', '2018-08-12 16:36:57');
INSERT INTO `biz_article_look` VALUES (41, 2, NULL, '119.123.206.191', '2018-08-12 17:30:47', '2018-08-12 17:30:47', '2018-08-12 17:30:47');
INSERT INTO `biz_article_look` VALUES (42, 2, NULL, '119.123.206.191', '2018-08-12 20:04:50', '2018-08-12 20:04:50', '2018-08-12 20:04:50');
INSERT INTO `biz_article_look` VALUES (48, 2, NULL, '37.57.218.243', '2018-08-17 13:04:47', '2018-08-17 13:04:47', '2018-08-17 13:04:47');
INSERT INTO `biz_article_look` VALUES (49, 2, NULL, '113.116.78.108', '2018-08-20 10:52:35', '2018-08-20 10:52:35', '2018-08-20 10:52:35');
INSERT INTO `biz_article_look` VALUES (52, 2, NULL, '113.116.78.108', '2018-08-21 17:20:39', '2018-08-21 17:20:39', '2018-08-21 17:20:39');
INSERT INTO `biz_article_look` VALUES (53, 2, NULL, '113.116.78.108', '2018-08-21 17:21:10', '2018-08-21 17:21:10', '2018-08-21 17:21:10');
INSERT INTO `biz_article_look` VALUES (54, 3, NULL, '113.116.78.108', '2018-08-21 17:43:00', '2018-08-21 17:43:00', '2018-08-21 17:43:00');
INSERT INTO `biz_article_look` VALUES (55, 3, NULL, '113.116.78.108', '2018-08-21 17:44:00', '2018-08-21 17:44:00', '2018-08-21 17:44:00');
INSERT INTO `biz_article_look` VALUES (56, 3, NULL, '113.116.78.108', '2018-08-21 17:50:27', '2018-08-21 17:50:27', '2018-08-21 17:50:27');
INSERT INTO `biz_article_look` VALUES (57, 3, NULL, '119.123.205.220', '2018-08-21 22:13:12', '2018-08-21 22:13:12', '2018-08-21 22:13:12');
INSERT INTO `biz_article_look` VALUES (58, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 14:26:18', '2018-08-22 14:26:18', '2018-08-22 14:26:18');
INSERT INTO `biz_article_look` VALUES (59, 3, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 14:27:04', '2018-08-22 14:27:04', '2018-08-22 14:27:04');
INSERT INTO `biz_article_look` VALUES (60, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 14:27:14', '2018-08-22 14:27:14', '2018-08-22 14:27:14');
INSERT INTO `biz_article_look` VALUES (61, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 14:27:43', '2018-08-22 14:27:43', '2018-08-22 14:27:43');
INSERT INTO `biz_article_look` VALUES (62, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 14:46:29', '2018-08-22 14:46:29', '2018-08-22 14:46:29');
INSERT INTO `biz_article_look` VALUES (63, 3, NULL, '113.116.77.110', '2018-08-22 17:47:57', '2018-08-22 17:47:57', '2018-08-22 17:47:57');
INSERT INTO `biz_article_look` VALUES (64, 2, NULL, '113.116.77.110', '2018-08-22 17:53:59', '2018-08-22 17:53:59', '2018-08-22 17:53:59');
INSERT INTO `biz_article_look` VALUES (65, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 21:18:31', '2018-08-22 21:18:32', '2018-08-22 21:18:32');
INSERT INTO `biz_article_look` VALUES (66, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 21:18:32', '2018-08-22 21:18:32', '2018-08-22 21:18:32');
INSERT INTO `biz_article_look` VALUES (67, 3, NULL, '144.76.7.79', '2018-08-23 16:43:14', '2018-08-23 16:43:14', '2018-08-23 16:43:14');

-- ----------------------------
-- Table structure for biz_article_love
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_love`;
CREATE TABLE `biz_article_love`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) UNSIGNED NOT NULL COMMENT '文章ID',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IP',
  `love_time` datetime(0) NULL DEFAULT NULL COMMENT '浏览时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_article_love
-- ----------------------------
INSERT INTO `biz_article_love` VALUES (1, 2, NULL, '0:0:0:0:0:0:0:1', '2018-08-22 14:28:30', '2018-08-22 14:28:30', '2018-08-22 14:28:30');

-- ----------------------------
-- Table structure for biz_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `biz_article_tags`;
CREATE TABLE `biz_article_tags`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) UNSIGNED NOT NULL COMMENT '标签表主键',
  `article_id` bigint(20) UNSIGNED NOT NULL COMMENT '文章ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_article_tags
-- ----------------------------
INSERT INTO `biz_article_tags` VALUES (4, 2, 4, '2018-04-23 10:15:03', '2018-04-23 10:15:03');
INSERT INTO `biz_article_tags` VALUES (5, 1, 2, '2018-08-20 10:52:20', '2018-08-20 10:52:20');
INSERT INTO `biz_article_tags` VALUES (7, 7, 3, '2018-08-21 17:43:56', '2018-08-21 17:43:56');

-- ----------------------------
-- Table structure for biz_comment
-- ----------------------------
DROP TABLE IF EXISTS `biz_comment`;
CREATE TABLE `biz_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NULL DEFAULT NULL COMMENT '被评论的文章或者页面的ID',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '评论人的ID',
  `pid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` enum('VERIFYING','APPROVED','REJECT','DELETED') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'VERIFYING' COMMENT '评论的状态',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持（赞）',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对（踩）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_comment
-- ----------------------------
INSERT INTO `biz_comment` VALUES (3, -1, NULL, 0, '1973518337', '匿名', 'https://q1.qlogo.cn/g?b=qq&nk=1973518337&s=40', '1973518337@qq.com', 'https://user.qzone.qq.com/1973518337', 'APPROVED', '119.123.207.8', '114.01952603223', '22.539877772522', '广东省深圳市', 'Windows 7', 'win1', 'Chrome 68.0.3440.106', 'chrome', '<p>test拖拖拖</p>\r\n', '', 0, 0, '2018-08-11 10:00:57', '2018-08-11 10:03:59');
INSERT INTO `biz_comment` VALUES (4, -1, 1, NULL, '1973518337', '超级管理员', 'https://gitee.com/blackkeydestiny/blogAssets/raw/master/avators/favicon.ico', '1973518337@qq.com', 'http://www.chuming.online/', 'APPROVED', '119.123.207.8', '114.01952603223', '22.539877772522', '广东省深圳市', 'Windows 10', 'win2', 'Chrome 68.0.3440.106', 'chrome', '回复测试', NULL, 0, 0, '2018-08-11 10:03:13', '2018-08-11 10:03:13');
INSERT INTO `biz_comment` VALUES (7, -1, NULL, 0, NULL, 'yoyo', NULL, NULL, NULL, 'APPROVED', '113.116.77.110', '114.01952603223', '22.539877772522', '广东省深圳市', 'Windows 10', 'win2', 'Chrome 68.0.3440.106', 'chrome', '<p>test os and browser short name</p>\r\n', '', 0, 0, '2018-08-23 09:20:54', '2018-08-23 09:22:19');
INSERT INTO `biz_comment` VALUES (8, -1, 1, 7, '1973518337', '超级管理员', 'https://gitee.com/blackkeydestiny/blogAssets/raw/master/avators/favicon.ico', '1973518337@qq.com', 'https://www.chuming.online/', 'APPROVED', '113.116.77.110', '114.01952603223', '22.539877772522', '广东省深圳市', 'Windows 10', 'win2', 'Chrome 68.0.3440.106', 'chrome', 'yes', '', 0, 0, '2018-08-23 09:22:19', '2018-08-23 09:22:19');
INSERT INTO `biz_comment` VALUES (9, -1, NULL, 0, NULL, 'iPhone6s', NULL, NULL, NULL, 'APPROVED', '113.116.77.110', '114.01952603223', '22.539877772522', '广东省深圳市', 'Mac OS X (iPhone)', 'iphone', 'Mobile Safari 11.0', 'safari', '<p>iphone test</p>\r\n', '', 0, 0, '2018-08-23 09:52:51', '2018-08-23 09:54:03');
INSERT INTO `biz_comment` VALUES (10, -1, 1, 9, '1973518337', '超级管理员', 'https://gitee.com/blackkeydestiny/blogAssets/raw/master/avators/favicon.ico', '1973518337@qq.com', 'https://www.chuming.online/', 'APPROVED', '113.116.77.110', '114.01952603223', '22.539877772522', '广东省深圳市', 'Windows 10', 'win2', 'Chrome 68.0.3440.106', 'chrome', 'test iphone', '', 0, 0, '2018-08-23 09:54:03', '2018-08-23 09:54:03');

-- ----------------------------
-- Table structure for biz_tags
-- ----------------------------
DROP TABLE IF EXISTS `biz_tags`;
CREATE TABLE `biz_tags`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_tags
-- ----------------------------
INSERT INTO `biz_tags` VALUES (1, 'Linux', NULL, '2018-01-14 21:35:31', '2018-01-14 21:35:31');
INSERT INTO `biz_tags` VALUES (2, 'Java', NULL, '2018-01-14 21:35:45', '2018-01-14 21:35:45');
INSERT INTO `biz_tags` VALUES (3, 'Spring', NULL, '2018-01-14 21:35:52', '2018-01-14 21:35:52');
INSERT INTO `biz_tags` VALUES (4, 'Spring Boot', NULL, '2018-01-14 21:36:01', '2018-01-14 21:36:01');
INSERT INTO `biz_tags` VALUES (5, '其他', NULL, '2018-01-14 21:36:07', '2018-01-14 21:36:07');
INSERT INTO `biz_tags` VALUES (6, 'Centos', 'centos', '2018-08-12 17:59:09', '2018-08-12 17:59:09');
INSERT INTO `biz_tags` VALUES (7, '情诗', '三行情书', '2018-08-21 17:41:22', '2018-08-21 17:41:22');
INSERT INTO `biz_tags` VALUES (8, 'test', 'test', '2018-08-21 17:54:07', '2018-08-21 17:54:07');

-- ----------------------------
-- Table structure for biz_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_type`;
CREATE TABLE `biz_type`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型介绍',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `available` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否可用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_type
-- ----------------------------
INSERT INTO `biz_type` VALUES (1, NULL, '前端技术', '主要收集、整理的基础前端类文章，包括JS、jQuery和CSS等Web开发所需的基础的文章总结', 1, 'fa fa-css3', 1, '2018-01-14 21:34:54', '2018-01-14 21:34:54');
INSERT INTO `biz_type` VALUES (2, NULL, '后端技术', '网站中记录的后端类文章，包括Java、SSM、MySQL和其他在日常工作学习中所用的后端技术', 2, 'fa fa-coffee', 1, '2018-01-14 21:34:57', '2018-01-14 21:34:57');
INSERT INTO `biz_type` VALUES (3, NULL, '其他文章', '记录网站建设以及日常工作、学习中的闲言碎语和个人笔记等文章', 4, 'fa fa-folder-open-o', 1, '2018-01-20 22:28:03', '2018-08-20 21:50:13');
INSERT INTO `biz_type` VALUES (4, 3, '三行', '三行情书', 1, 'fa fa-heart', 1, '2018-08-20 21:46:38', '2018-08-22 17:40:39');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `home_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页描述',
  `home_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页关键字',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '根域名',
  `cms_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理系统的url',
  `site_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站地址',
  `site_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `site_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点描述',
  `site_motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座右铭',
  `site_favicon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点LOGO',
  `static_web_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源文件（js、css等的路径）',
  `author_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站长名称',
  `author_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站长邮箱',
  `wx_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信二维码地址',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `weibo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微博',
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github',
  `theme_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '主题颜色（1：绿色；2：紫色：3灰色）',
  `maintenance` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否开启维护通知',
  `maintenance_data` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '系统维护时间',
  `comment` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否开启评论',
  `qiuniu_base_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛路径',
  `qiniu_access_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛ACCESS_KEY',
  `qiniu_secret_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛SECRET_KEY',
  `qiniu_bucket_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛BUCKET_NAME',
  `baidu_push_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '百度推送的token',
  `wx_praise_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信赞赏码',
  `zfb_praise_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝赞赏码',
  `baidu_api_ak` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '百度api授权AK(获取地址：http://lbsyun.baidu.com/apiconsole/key)',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'DBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能', 'DBlog,开源博客', 'chuming.online', 'https://admin.chuming.online/', 'https://www.chuming.online/', '陈楚明博客', 'DBlog是一款简洁美观、自适应的Java博客系统', '/favicon.ico', 'https://www.chuming.online/', '陈楚明', '17688759175@163.com', '17688759175', '1973518337', 'https://weibo.com/2805182893', 'https://github.com/blackkeydestiny', '1', 0, '2018-12-19 23:07:52', 1, 'http://pd30jcp5o.bkt.clouddn.com/', 'tG14mrgbcnh_W2A8GuziXMnmlpl_izg3t9-G8gxh', 'po4DtK6qcAN-r8cYVrMinLClzTEnVH3V-gBfs_6B', 'chumingonline', 'jo6ROMOC0prChbS2', 'img/wx_reward_code.png', 'img/zfb_code.png', 'AAlutUTEUxOSBIZdc9YPytjcE5ODltmx', '2018-08-11 23:07:52', '2018-09-17 13:21:17');

-- ----------------------------
-- Table structure for sys_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态',
  `home_page_display` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否首页显示',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
INSERT INTO `sys_link` VALUES (1, 'https://www.zhyd.me', '张亚东博客', '一个程序员的个人博客', 'yadong.zhang0415@gmail.com', NULL, 'https://static.zhyd.me/static/img/favicon.ico', 1, 1, NULL, 'ADMIN', '2016-11-16 23:32:03', '2018-01-23 11:27:19');
INSERT INTO `sys_link` VALUES (13, 'http://tool.zhyd.me', '在线工具', '在线工具，只做最有用、最简单、最干净、最方便的工具网站。', 'yadong.zhang0415@gmail.com', NULL, 'https://static.zhyd.me/static/img/favicon.ico', 1, 1, NULL, 'ADMIN', '2017-05-04 11:22:29', '2017-05-09 09:11:35');
INSERT INTO `sys_link` VALUES (35, 'http://music.zhyd.me', '我的音乐馆', '我的音乐馆', 'yadong.zhang0415@gmail.com', '', 'http://music.zhyd.me/images/favicon.ico', 0, 0, '', 'ADMIN', '2018-04-19 20:01:35', '2018-08-15 13:37:02');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '被通知的用户ID',
  `status` enum('RELEASE','NOT_RELEASE') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NOT_RELEASE' COMMENT '通知状态',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知的内容',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, 1, 'RELEASE', '大喇叭', '上邪，我欲与君相知，长命无绝衰', '2018-05-22 10:26:26', '2018-08-11 23:03:27');
INSERT INTO `sys_notice` VALUES (2, 1, 'RELEASE', '大喇叭2', '大风起兮云飞扬，威加海内兮归故乡，\r\n安得猛士兮守四方！', '2018-08-11 23:04:58', '2018-08-11 23:04:58');

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT 0,
  `sort` int(10) UNSIGNED NULL DEFAULT NULL,
  `external` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否外部链接',
  `available` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_resource_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES (1, '用户管理', 'menu', NULL, NULL, 0, 1, 0, 1, 'fa fa-users', '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (2, '用户列表', 'menu', '/users', 'users', 1, 1, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (3, '新增用户', 'button', NULL, 'user:add', 2, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (4, '批量删除用户', 'button', '', 'user:batchDelete', 2, 3, 0, 1, '', '2018-05-22 10:08:05', '2018-08-12 15:34:40');
INSERT INTO `sys_resources` VALUES (5, '编辑用户', 'button', NULL, 'user:edit,user:get', 2, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (6, '删除用户', 'button', NULL, 'user:delete', 2, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (7, '分配用户角色', 'button', NULL, 'user:allotRole', 2, 6, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (8, '资源角色管理', 'menu', NULL, NULL, 0, 2, 0, 1, 'fa fa-cogs', '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (9, '资源管理', 'menu', '/resources', 'resources', 8, 1, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (10, '新增资源', 'button', NULL, 'resource:add', 9, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (11, '批量删除资源', 'button', NULL, 'resource:batchDelete', 9, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (12, '编辑资源', 'button', NULL, 'resource:edit,resource:get', 9, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (13, '删除资源', 'button', NULL, 'resource:delete', 9, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (14, '角色管理', 'menu', '/roles', 'roles', 8, 2, 0, 1, '', '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (15, '新增角色', 'button', NULL, 'role:add', 14, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (16, '批量删除角色', 'button', NULL, 'role:batchDelete', 14, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (17, '编辑角色', 'button', NULL, 'role:edit,role:get', 14, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (18, '删除角色', 'button', NULL, 'role:delete', 14, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (19, '分配角色资源', 'button', NULL, 'role:allotResource', 14, 6, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (20, '文章管理', 'menu', NULL, NULL, 0, 3, 0, 1, 'fa fa-list', '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (21, '文章列表', 'menu', '/articles', 'articles', 20, 1, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (22, '发表文章', 'button', NULL, 'article:publish', 21, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (23, '批量删除文章', 'button', NULL, 'article:batchDelete', 21, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (24, '批量推送文章', 'button', NULL, 'article:batchPush', 21, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (25, '推送文章', 'button', NULL, 'article:push', 21, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (26, '置顶文章', 'button', NULL, 'article:top', 21, 6, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (27, '推荐文章', 'button', NULL, 'article:recommend', 21, 7, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (28, '编辑文章', 'button', NULL, 'article:edit,article:get', 21, 8, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (29, '删除文章', 'button', NULL, 'article:delete', 21, 9, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (30, '分类列表', 'menu', '/article/types', 'types', 20, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (31, '添加分类', 'button', NULL, 'type:add', 30, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (32, '批量删除分类', 'button', NULL, 'type:batchDelete', 30, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (33, '编辑分类', 'button', NULL, 'type:edit,type:get', 30, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (34, '删除分类', 'button', NULL, 'type:delete', 30, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (35, '标签列表', 'menu', '/article/tags', 'tags', 20, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (36, '添加标签', 'button', NULL, 'tag:add', 35, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (37, '批量删除标签', 'button', NULL, 'tag:batchDelete', 35, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (38, '编辑标签', 'button', NULL, 'tag:edit,tag:get', 35, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (39, '删除标签', 'button', NULL, 'tag:delete', 35, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (40, '网站管理', 'menu', NULL, NULL, 0, 4, 0, 1, 'fa fa-globe', '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (41, '友情链接', 'menu', '/links', 'links', 40, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (42, '添加友情链接', 'button', NULL, 'link:add', 41, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (43, '批量删除友情链接', 'button', NULL, 'link:batchDelete', 41, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (44, '编辑友情链接', 'button', NULL, 'link:edit,link:get', 41, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (45, '删除友情链接', 'button', NULL, 'link:delete', 41, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (46, '评论管理', 'menu', '/comments', 'comments', 40, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (47, '批量删除评论', 'button', NULL, 'comment:batchDelete', 46, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (48, '回复评论', 'button', NULL, 'comment:reply', 46, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (49, '审核评论', 'button', NULL, 'comment:audit', 46, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (50, '删除评论', 'button', NULL, 'comment:delete', 46, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (51, '模板管理', 'menu', '/templates', 'templates', 40, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (52, '添加模板', 'button', NULL, 'template:add', 51, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (53, '批量删除模板', 'button', NULL, 'template:batchDelete', 51, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (54, '编辑模板', 'button', NULL, 'template:edit,template:get', 51, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (55, '删除模板', 'button', NULL, 'template:delete', 51, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (56, '更新日志', 'menu', '/updates', 'updateLogs', 40, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (57, '添加更新日志', 'button', NULL, 'updateLog:add', 51, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (58, '批量删除更新日志', 'button', NULL, 'updateLog:batchDelete', 51, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (59, '编辑更新日志', 'button', NULL, 'updateLog:edit,updateLog:get', 51, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (60, '删除更新日志', 'button', NULL, 'updateLog:delete', 51, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (61, '公告管理', 'menu', '/notices', 'notices', 40, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (62, '添加公告', 'button', NULL, 'notice:add', 61, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (63, '批量删除公告', 'button', NULL, 'notice:batchDelete', 61, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (64, '编辑公告', 'button', NULL, 'notice:edit,notice:get', 61, 4, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (65, '删除公告', 'button', NULL, 'notice:delete', 61, 5, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (66, '发布公告', 'button', NULL, 'notice:release', 61, 6, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (67, '撤回公告', 'button', NULL, 'notice:withdraw', 61, 7, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (68, '测试页面', 'menu', '', '', 0, 5, 0, 1, 'fa fa-desktop', '2018-05-22 10:08:05', '2018-08-12 15:33:27');
INSERT INTO `sys_resources` VALUES (69, 'icons图标', 'menu', '/icons', 'icons', 68, 2, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (70, 'shiro测试', 'menu', '/shiro', 'shiro', 68, 3, 0, 1, NULL, '2018-05-22 10:08:05', '2018-05-22 10:08:05');
INSERT INTO `sys_resources` VALUES (71, '推送消息', 'menu', '/notice', 'notice', 40, NULL, 0, 1, '', '2018-07-05 11:30:24', '2018-07-05 11:30:24');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` tinyint(1) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'role:root', '超级管理员', 1, '2017-12-20 16:40:24', '2017-12-20 16:40:26');
INSERT INTO `sys_role` VALUES (2, 'role:admin', '管理员', 1, '2017-12-22 13:56:39', '2017-12-22 13:56:39');
INSERT INTO `sys_role` VALUES (3, 'role:comment', '评论审核管理员', 1, '2018-05-22 11:37:37', '2018-05-22 11:37:37');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `resources_id` bigint(20) UNSIGNED NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES (1, 1, 1, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (2, 1, 2, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (3, 1, 3, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (4, 1, 4, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (5, 1, 5, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (6, 1, 6, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (7, 1, 7, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (8, 1, 8, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (9, 1, 9, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (10, 1, 10, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (11, 1, 11, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (12, 1, 12, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (13, 1, 13, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (14, 1, 14, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (15, 1, 15, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (16, 1, 16, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (17, 1, 17, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (18, 1, 18, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (19, 1, 19, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (20, 1, 20, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (21, 1, 21, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (22, 1, 22, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (23, 1, 23, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (24, 1, 24, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (25, 1, 25, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (26, 1, 26, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (27, 1, 27, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (28, 1, 28, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (29, 1, 29, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (30, 1, 30, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (31, 1, 31, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (32, 1, 32, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (33, 1, 33, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (34, 1, 34, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (35, 1, 35, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (36, 1, 36, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (37, 1, 37, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (38, 1, 38, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (39, 1, 39, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (40, 1, 40, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (41, 1, 41, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (42, 1, 42, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (43, 1, 43, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (44, 1, 44, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (45, 1, 45, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (46, 1, 46, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (47, 1, 47, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (48, 1, 48, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (49, 1, 49, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (50, 1, 50, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (51, 1, 51, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (52, 1, 52, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (53, 1, 57, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (54, 1, 53, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (55, 1, 58, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (56, 1, 54, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (57, 1, 59, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (58, 1, 55, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (59, 1, 60, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (60, 1, 56, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (61, 1, 61, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (62, 1, 62, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (63, 1, 63, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (64, 1, 64, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (65, 1, 65, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (66, 1, 66, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (67, 1, 67, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (68, 1, 68, '2018-05-22 09:28:07', '2018-05-22 09:28:07');
INSERT INTO `sys_role_resources` VALUES (84, 2, 20, '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES (85, 2, 21, '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES (86, 2, 24, '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES (87, 2, 25, '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES (88, 2, 26, '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES (89, 2, 27, '2018-05-22 10:13:40', '2018-05-22 10:13:40');
INSERT INTO `sys_role_resources` VALUES (93, 3, 40, '2018-05-22 11:37:48', '2018-05-22 11:37:48');
INSERT INTO `sys_role_resources` VALUES (94, 3, 46, '2018-05-22 11:37:48', '2018-05-22 11:37:48');
INSERT INTO `sys_role_resources` VALUES (95, 3, 48, '2018-05-22 11:37:48', '2018-05-22 11:37:48');
INSERT INTO `sys_role_resources` VALUES (96, 3, 49, '2018-05-22 11:37:48', '2018-05-22 11:37:48');

-- ----------------------------
-- Table structure for sys_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_template`;
CREATE TABLE `sys_template`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键',
  `ref_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板内容',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_template
-- ----------------------------
INSERT INTO `sys_template` VALUES (1, 'TM_SITEMAP_XML', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n	<url>\r\n		<loc>${config.siteUrl}</loc>\r\n		<priority>1.0</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/about</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/links</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/guestbook</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/updateLog</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/recommended</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<#list articleList as item>\r\n		<url>\r\n			<loc>${config.siteUrl}/article/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	<#list articleTypeList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/type/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	\r\n	<#list articleTagsList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/tag/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n</urlset>', '2018-01-19 10:47:06', '2018-03-13 17:41:31');
INSERT INTO `sys_template` VALUES (2, 'TM_SITEMAP_TXT', '${config.siteUrl}\r\n${config.siteUrl}/about\r\n${config.siteUrl}/links\r\n${config.siteUrl}/guestbook\r\n${config.siteUrl}/updateLog\r\n${config.siteUrl}/recommended\r\n<#list articleList as item>\r\n${config.siteUrl}/article/${item.id}\r\n</#list>\r\n<#list articleTypeList as item>\r\n${config.siteUrl}/type/${item.id}\r\n</#list>\r\n<#list articleTagsList as item>\r\n${config.siteUrl}/tag/${item.id}\r\n</#list>', '2018-01-19 10:47:12', '2018-02-28 12:11:59');
INSERT INTO `sys_template` VALUES (3, 'TM_SITEMAP_HTML', '<!DOCTYPE html>\r\n<html lang=\"zh-CN\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n    <title>${config.siteName} 网站地图</title>\r\n    <meta name=\"author\" content=\"SiteMapX.com\"/>\r\n    <meta name=\"robots\" content=\"index,follow\"/>\r\n    <style type=\"text/css\">\r\n        body {\r\n            color: #000000;\r\n            background: #ffffff;\r\n            margin: 20px;\r\n            font-family: Verdana, Arial, Helvetica, sans-serif;\r\n            font-size: 12px;\r\n        }\r\n\r\n        #myTable {\r\n            list-style: none;\r\n            margin: 10px 0px 10px 0px;\r\n            padding: 0px;\r\n            width: 100%;\r\n            min-width: 804px;\r\n        }\r\n\r\n        #myTable li {\r\n            list-style-type: none;\r\n            width: 100%;\r\n            min-width: 404px;\r\n            height: 20px;\r\n            line-height: 20px;\r\n        }\r\n\r\n        .pull-left{\r\n            float: left!important;\r\n        }\r\n        .pull-right{\r\n            float: right!important;\r\n        }\r\n\r\n        #myTable li .T1-h {\r\n            font-weight: bold;\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T3-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T4-h {\r\n            width: 100px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T1 {\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T3 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T4 {\r\n            width: 100px;\r\n        }\r\n\r\n        #footer {\r\n            padding: 2px;\r\n            margin: 0px;\r\n            font-size: 8pt;\r\n            color: gray;\r\n            min-width: 900px;\r\n        }\r\n\r\n        #footer a {\r\n            color: gray;\r\n        }\r\n\r\n        .myClear {\r\n            clear: both;\r\n        }\r\n\r\n        #nav, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 95%; margin: auto; margin-top: 10px;}\r\n\r\n    </style>\r\n</head>\r\n<body>\r\n<h2 style=\"text-align: center; margin-top: 20px\">${config.siteName?if_exists} 网站地图 </h2>\r\n<div id=\"nav\"><a href=\"${config.siteUrl?if_exists}\"><strong>${config.siteName?if_exists}</strong></a> &raquo; <a href=\"${config.siteUrl?if_exists}/sitemap.html\">站点地图</a></div>\r\n<div id=\"content\">\r\n    <h3>最新文章</h3>\r\n    <ul id=\"myTable\">\r\n        <li>\r\n            <div class=\"T1-h pull-left\">URL</div>\r\n            <div class=\"T2-h pull-right\">Last Change</div>\r\n            <div class=\"T3-h pull-right\">Change Frequency</div>\r\n            <div class=\"T4-h pull-right\">Priority</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName} | 一个程序员的个人博客</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">1</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/about\" title=\"${config.siteName}\">关于 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/links\" title=\"${config.siteName}\">友情链接 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/guestbook\" title=\"${config.siteName}\">留言板 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/updateLog\" title=\"${config.siteName}\">网站更新记录 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n		<div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/recommended\" title=\"${config.siteName}\">站长推荐 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <#list articleList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/article/${item.id}\" title=\"${item.title}\">${item.title} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>分类目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTypeList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/type/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>标签目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTagsList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/tag/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"footer\">\r\n    该文件由<a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName}</a>网站自动生成。\r\n</div>\r\n</body>\r\n</html>', '2018-01-19 10:47:43', '2018-03-13 17:40:52');
INSERT INTO `sys_template` VALUES (4, 'TM_ROBOTS', 'Crawl-delay: 5\r\nSitemap: https://www.chuming.online/sitemap.txt\r\nSitemap: https://www.chuming.online/sitemap.xml\r\nSitemap: https://www.chuming.online/sitemap.html\r\n', '2018-01-19 10:48:27', '2018-01-19 10:48:27');
INSERT INTO `sys_template` VALUES (5, 'TM_LINKS', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>站长<a href=\"${link.url?if_exists}\" target=\"_blank\">${link.name?if_exists}</a>，您好!</p>\r\n        <p>您于 ${link.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <li>${link.email?if_exists}</li>\r\n            <li>${link.qq?if_exists}</li>\r\n            <li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li>\r\n        </ul>\r\n        </p>\r\n        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>\r\n        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>\r\n        <ul>\r\n            <li>私自取消本站友情链接</li>\r\n            <li>更换域名且未通知本站</li>\r\n            <li>网站内容长期不更新</li>\r\n            <li>友链上使用诸如nofollow之类的属性</li>\r\n        </ul>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl?if_exists}\" target=\"_blank\">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-01-19 10:48:54', '2018-01-19 10:48:54');
INSERT INTO `sys_template` VALUES (6, 'TM_COMMENT_AUDIT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论审核结果通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论审核结果通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname?if_exists}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <#if comment.status == \'APPROVED\'>\r\n        <p>已通过管理员审核并显示。</p>\r\n        <p>\r\n            您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <#elseif comment.status == \'REJECT\'>\r\n        <p>审核失败！失败原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#elseif comment.status == \'DELETED\'>\r\n        <p>已被管理员删除！删除原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#else>\r\n        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>\r\n        </#if>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-01-26 21:17:38', '2018-01-26 21:17:38');
INSERT INTO `sys_template` VALUES (7, 'TM_COMMENT_REPLY', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论回复通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论回复通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl}${comment.sourceUrl}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <p>\r\n            有了 <strong>新的回复</strong>！您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-01-26 21:17:55', '2018-01-26 21:17:55');
INSERT INTO `sys_template` VALUES (8, 'TM_LINKS_TO_ADMIN', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>有新的友情链接加入，信息如下</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <#if link.favicon?exists><li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li></#if>\r\n        </ul>\r\n        </p>\r\n        <p><a style=\"text-decoration:none;\" href=\"https://admin.chuming.online\" target=\"_blank\">去后台继续审核</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-03-31 14:14:11', '2018-03-31 14:14:11');
INSERT INTO `sys_template` VALUES (9, 'TM_NEW_COMMENT', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>新评论通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            新评论通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>\r\n            评论内容：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>\r\n        <p>\r\n            <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">查看完整评论</a>\r\n        </p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>', '2018-03-31 14:19:04', '2018-03-31 14:19:04');

-- ----------------------------
-- Table structure for sys_update_recorde
-- ----------------------------
DROP TABLE IF EXISTS `sys_update_recorde`;
CREATE TABLE `sys_update_recorde`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新版本',
  `description` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新记录备注',
  `recorde_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '项目更新时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_update_recorde
-- ----------------------------
INSERT INTO `sys_update_recorde` VALUES (1, '1.0.1', '第一版', '2018-08-01 22:16:40', '2018-08-01 22:16:40', '2018-08-15 00:15:50');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `gender` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `user_type` enum('ROOT','ADMIN','USER') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ADMIN' COMMENT '超级管理员、管理员、普通用户',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `blog` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人博客地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `source` enum('GITHUB','WEIBO','QQ','CCM') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CCM' COMMENT '用户来源(默认CCM=本网站注册用户)',
  `privacy` tinyint(2) NULL DEFAULT NULL COMMENT '隐私（1：公开，0：不公开）',
  `notification` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '通知：(1：通知显示消息详情，2：通知不显示详情)',
  `score` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '金币值',
  `experience` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '经验值',
  `reg_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', 'CGUx1FN++xS+4wNDFeN6DA==', '超级管理员', '17588759175', '1973518337@qq.com', '1973518337', NULL, NULL, 'https://gitee.com/blackkeydestiny/blogAssets/raw/master/avators/favicon.ico', 'ROOT', NULL, NULL, NULL, 'CCM', NULL, NULL, 0, 0, NULL, '113.116.77.65', '2018-09-17 13:00:43', 317, NULL, 1, '2018-01-02 09:32:15', '2018-09-17 13:00:43');
INSERT INTO `sys_user` VALUES (2, 'admin', 'ZFhLG9pRCV7p/nQuqnqmawxJAgxlQFZvxpGshHsg37c=', '管理员', '17588759175', '1973518337@qq.com', '1973518337', NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, 'CCM', 1, 1, 0, 0, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2018-08-10 20:29:45', 3, NULL, 1, '2018-01-02 15:56:34', '2018-08-15 13:47:25');
INSERT INTO `sys_user` VALUES (3, 'comment-admin', 'mW8nbvEeP0akZEQZS5u/ZKji/0iEzAPyUK2R0d6VKQY=', '评论审核管理员', '112313213213', '1973518337@qq.com', '19735183372', NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, 'CCM', 1, 1, 0, 0, '0:0:0:0:0:0:0:1', '183.14.110.209', '2018-08-15 14:46:01', 3, NULL, 1, '2018-05-22 11:43:22', '2018-08-15 14:46:01');
INSERT INTO `sys_user` VALUES (4, 'test', 'V99y9i6Ch8f6A/I4TB9hvg==', 'test', '17688759175', '1973518337@qq.com', '1973518337', NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, 'CCM', 1, 1, 0, 0, '113.116.76.175', NULL, NULL, 0, NULL, 1, '2018-08-17 14:17:47', '2018-08-17 14:17:47');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2018-01-02 10:47:27', '2018-01-02 10:47:27');
INSERT INTO `sys_user_role` VALUES (3, 3, 3, '2018-05-22 11:43:31', '2018-05-22 11:43:31');
INSERT INTO `sys_user_role` VALUES (4, 2, 1, '2018-08-12 15:18:12', '2018-08-12 15:18:12');

SET FOREIGN_KEY_CHECKS = 1;
