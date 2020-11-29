/*
Navicat MySQL Data Transfer

Source Server         : local@docker
Source Server Version : 80022
Source Host           : 192.168.99.100:3306
Source Database       : frontend-growth

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2020-11-25 16:59:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for f_books
-- ----------------------------
DROP TABLE IF EXISTS `f_books`;
CREATE TABLE `f_books` (
  `id` varchar(36) NOT NULL,
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_books
-- ----------------------------
INSERT INTO `f_books` VALUES ('3790ca502ecd11ebb5100242ac110002', '前端', '11', '~', '2020-11-25 11:20:50', '2020-11-25 11:41:16');
INSERT INTO `f_books` VALUES ('4b9bb3332ed011ebb5100242ac110002', '前端入门', null, null, '2020-11-25 11:42:52', '2020-11-25 11:42:52');
INSERT INTO `f_books` VALUES ('9de43c912ed111ebb5100242ac110002', 'Web前端进阶', 'web,前端,html,css,js,javascript,基础,入门,进阶', 'Web前端进阶教程', '2020-11-25 11:52:19', '2020-11-25 16:18:32');
INSERT INTO `f_books` VALUES ('b9b6f1c12ef611ebb5100242ac110002', 'Web前端基础', null, null, '2020-11-25 16:17:57', '2020-11-25 16:17:57');

-- ----------------------------
-- Table structure for f_chapters
-- ----------------------------
DROP TABLE IF EXISTS `f_chapters`;
CREATE TABLE `f_chapters` (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一主键',
  `book_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教程ID',
  `title` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `article` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '文章内容',
  `type` enum('url','article') NOT NULL DEFAULT 'url' COMMENT '当前文章菜单的类型',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'type 为 url 时，frame渲染的目标值',
  `auth` int NOT NULL DEFAULT '0' COMMENT '权限值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '描述信息',
  `recommended_index` int DEFAULT '0' COMMENT '推荐指数',
  `parent_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父节点ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `f_books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_chapters
-- ----------------------------
INSERT INTO `f_chapters` VALUES ('097c36752ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs入门', 'Nodejs入门', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('097c49b22ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Webpack', 'Webpack', 'url', 'javascript:void(0)', '0', 'Webpack', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('097c4cb62ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Rollup', 'Rollup', 'url', 'javascript:void(0)', '0', 'Rollup', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('097c4e3a2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@vue/cli', '@vue/cli', 'url', 'javascript:void(0)', '0', '@vue/cli', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('097c4fa02ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vite', 'vite', 'url', 'javascript:void(0)', '0', 'vite', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('097c51052ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@vue/devtools', '@vue/devtools', 'url', 'javascript:void(0)', '0', '@vue/devtools', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('097c525f2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/cli', '@angular/cli', 'url', 'javascript:void(0)', '0', '@angular/cli', '0', 'c78e39172ef011ebb5100242ac110002', '2020-11-25 15:58:43', '2020-11-25 15:58:43');
INSERT INTO `f_chapters` VALUES ('0e0b28652ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Vue技术栈', 'Vue技术栈', 'url', 'javascript:void(0)', '0', 'Vue技术栈', '0', 'c78e44392ef011ebb5100242ac110002', '2020-11-25 16:06:00', '2020-11-25 16:06:00');
INSERT INTO `f_chapters` VALUES ('0e0b2ca22ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vue-next', 'vue-next', 'url', 'javascript:void(0)', '0', 'vue SSR', '0', 'c78e44392ef011ebb5100242ac110002', '2020-11-25 16:06:00', '2020-11-25 16:06:00');
INSERT INTO `f_chapters` VALUES ('0e0b2e4e2ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'React技术栈', 'React技术栈', 'url', 'javascript:void(0)', '0', 'React技术栈', '0', 'c78e44392ef011ebb5100242ac110002', '2020-11-25 16:06:00', '2020-11-25 16:06:00');
INSERT INTO `f_chapters` VALUES ('0e0b32462ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'next', 'next', 'url', 'javascript:void(0)', '0', 'React SSR', '0', 'c78e44392ef011ebb5100242ac110002', '2020-11-25 16:06:00', '2020-11-25 16:06:00');
INSERT INTO `f_chapters` VALUES ('0e0b33c02ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Angular框架', 'Angular框架', 'url', 'javascript:void(0)', '0', 'Angular框架', '0', 'c78e44392ef011ebb5100242ac110002', '2020-11-25 16:06:00', '2020-11-25 16:06:00');
INSERT INTO `f_chapters` VALUES ('250dbd1a2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'axios', 'axios', 'url', 'javascript:void(0)', '0', '基于Promise的轻量级Ajax库', '0', '5bb8ddc82ef111ebb5100242ac110002', '2020-11-25 15:45:10', '2020-11-25 15:45:10');
INSERT INTO `f_chapters` VALUES ('250dd62c2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Fetch Api', 'Fetch Api', 'url', 'javascript:void(0)', '0', 'Fetch API是XMLHttpRequest的现代替代方法，基于Promise实现，属于现代浏览器BOM标准中的API', '0', '5bb8ddc82ef111ebb5100242ac110002', '2020-11-25 15:45:10', '2020-11-25 15:45:10');
INSERT INTO `f_chapters` VALUES ('250dd86b2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'jQuery ajax', 'jQuery ajax', 'url', 'javascript:void(0)', '0', 'jQuery 封装的ajax请求', '0', '5bb8ddc82ef111ebb5100242ac110002', '2020-11-25 15:45:10', '2020-11-25 15:45:10');
INSERT INTO `f_chapters` VALUES ('250dd9e42ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'SuperAgent', 'SuperAgent', 'url', 'javascript:void(0)', '0', '一个轻量级和渐进式AJAX库，更侧重于可读性和灵活性', '0', '5bb8ddc82ef111ebb5100242ac110002', '2020-11-25 15:45:10', '2020-11-25 15:45:10');
INSERT INTO `f_chapters` VALUES ('41d87c812ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Chimee', 'Chimee', 'url', 'javascript:void(0)', '0', '组件化H5播放器框架', '0', '5bb8f5562ef111ebb5100242ac110002', '2020-11-25 15:53:08', '2020-11-25 15:53:08');
INSERT INTO `f_chapters` VALUES ('41d8809d2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'flv.js', 'flv.js', 'url', 'javascript:void(0)', '0', 'Bilibili 开源纯 JavaScript 编写的 FLV 播放器', '0', '5bb8f5562ef111ebb5100242ac110002', '2020-11-25 15:53:08', '2020-11-25 15:53:08');
INSERT INTO `f_chapters` VALUES ('41d88ad32ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Video.js', 'Video.js', 'url', 'javascript:void(0)', '0', '开源、免费的HTML5和Flash视频播放器', '0', '5bb8f5562ef111ebb5100242ac110002', '2020-11-25 15:53:08', '2020-11-25 15:53:08');
INSERT INTO `f_chapters` VALUES ('41d893b82ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Flash', 'Flash', 'url', 'javascript:void(0)', '0', 'Flash播放器、依赖较多，功能相对比较强大，依赖actionScript开发', '0', '5bb8f5562ef111ebb5100242ac110002', '2020-11-25 15:53:08', '2020-11-25 15:53:08');
INSERT INTO `f_chapters` VALUES ('41d895f22ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'jplayer', 'jplayer', 'url', 'http://www.jplayer.cn/', '0', 'http://www.jplayer.cn/', '0', '5bb8f5562ef111ebb5100242ac110002', '2020-11-25 15:53:08', '2020-11-25 15:53:08');
INSERT INTO `f_chapters` VALUES ('41d897672ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'html5player', 'html5player', 'url', 'https://juejin.im/post/596f536d51882526337caf15', '0', 'https://juejin.im/post/596f536d51882526337caf15', '0', '5bb8f5562ef111ebb5100242ac110002', '2020-11-25 15:53:08', '2020-11-25 15:53:08');
INSERT INTO `f_chapters` VALUES ('43fd2d662ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/core', '@angular/core', 'url', 'javascript:void(0)', '0', 'angular 核心代码', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('43fd399f2ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/common', '@angular/common', 'url', 'javascript:void(0)', '0', 'angular 公共框架库代码，包含 HttpClient 等', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('43fd3b732ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/animations', '@angular/animations', 'url', 'javascript:void(0)', '0', 'angular 动画库', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('43fd3ce82ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/forms', '@angular/forms', 'url', 'javascript:void(0)', '0', 'angular 表单处理库', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('43fd3e4a2ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/router', '@angular/router', 'url', 'javascript:void(0)', '0', 'angular 路由管理', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('43fd3fae2ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'rxjs', 'rxjs', 'url', 'javascript:void(0)', '0', 'RxJS 是一个库，它通过使用 observable 序列来编写异步和基于事件的程序。它提供了一个核心类型 Observable，附属类型 (Observer、 Schedulers、 Subjects) 和受 [Array#extras] 启发的操作符 (map、filter、reduce、every, 等等)，这些数组操作符可以把异步事件作为集合来处理', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('43fd41142ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@angular/compiler-cli', '@angular/compiler-cli', 'url', 'javascript:void(0)', '0', 'angular 打包编译脚手架', '0', '0e0b33c02ef511ebb5100242ac110002', '2020-11-25 16:14:40', '2020-11-25 16:14:40');
INSERT INTO `f_chapters` VALUES ('5bb8ce922ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '函数库', '函数库', 'url', 'javascript:void(0)', '0', '函数库', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8d2a92ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '动画库', '动画库', 'url', 'javascript:void(0)', '0', '动画库', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8ddc82ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Ajax 请求', 'Ajax 请求', 'url', 'javascript:void(0)', '0', 'Ajax 请求', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8e68c2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'echarts', 'echarts', 'url', 'javascript:void(0)', '0', 'echarts', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8e9242ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'UI组件和插件库', 'UI组件和插件库', 'url', 'javascript:void(0)', '0', 'UI组件和插件库', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8eb082ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Vue系列', 'Vue系列', 'url', 'javascript:void(0)', '0', 'Vue系列', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8ed112ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'React系列', 'React系列', 'url', 'javascript:void(0)', '0', 'React系列', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8eee12ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'angular框架', 'angular框架', 'url', 'javascript:void(0)', '0', 'angular框架', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8f09b2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '富文本编辑器', '富文本编辑器', 'url', 'javascript:void(0)', '0', '富文本编辑器', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8f2832ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'lazyload', 'lazyload', 'url', 'javascript:void(0)', '0', 'lazyload', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8f4052ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '瀑布流', '瀑布流', 'url', 'javascript:void(0)', '0', '瀑布流', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8f5562ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '视频播放器', '视频播放器', 'url', 'javascript:void(0)', '0', '视频播放器', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8f6ac2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '弹幕播放器', '弹幕播放器', 'url', 'javascript:void(0)', '0', '弹幕播放器', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8f8002ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '复制粘贴插件', '复制粘贴插件', 'url', 'javascript:void(0)', '0', '复制粘贴插件', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8fa822ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'qrcode2', 'qrcode2', 'url', 'javascript:void(0)', '0', 'qrcode2', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8fbde2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '前端国际化', '前端国际化', 'url', 'javascript:void(0)', '0', '前端国际化', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('5bb8fd232ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '地图', '地图', 'url', 'javascript:void(0)', '0', '地图', '0', 'c78e342d2ef011ebb5100242ac110002', '2020-11-25 15:39:32', '2020-11-25 15:39:32');
INSERT INTO `f_chapters` VALUES ('62a0a8de2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'DanmuPlayer', 'DanmuPlayer', 'url', 'javascript:void(0)', '0', 'Html5弹幕播放器插件', '0', '5bb8f6ac2ef111ebb5100242ac110002', '2020-11-25 15:54:03', '2020-11-25 15:54:03');
INSERT INTO `f_chapters` VALUES ('62a0ad012ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'jquery.danmu.js', 'jquery.danmu.js', 'url', 'javascript:void(0)', '0', 'jQuery弹幕插件', '0', '5bb8f6ac2ef111ebb5100242ac110002', '2020-11-25 15:54:03', '2020-11-25 15:54:03');
INSERT INTO `f_chapters` VALUES ('62a0ae932ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'scroxt', 'scroxt', 'url', 'javascript:void(0)', '0', '字幕字体滚动插件', '0', '5bb8f6ac2ef111ebb5100242ac110002', '2020-11-25 15:54:03', '2020-11-25 15:54:03');
INSERT INTO `f_chapters` VALUES ('7e3b2f7d2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'clipboard.js', 'clipboard.js', 'url', 'javascript:void(0)', '0', '复制粘贴插件', '0', '5bb8f8002ef111ebb5100242ac110002', '2020-11-25 15:54:49', '2020-11-25 15:54:49');
INSERT INTO `f_chapters` VALUES ('7e3b486b2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'ZeroClipboard', 'ZeroClipboard', 'url', 'javascript:void(0)', '0', '复制粘贴插件', '0', '5bb8f8002ef111ebb5100242ac110002', '2020-11-25 15:54:49', '2020-11-25 15:54:49');
INSERT INTO `f_chapters` VALUES ('8074747c2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs 介绍及安装', 'Nodejs 介绍及安装', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('8074788e2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'npm 介绍及常用命令', 'npm 介绍及常用命令', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('80747a272ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs 模块系统', 'Nodejs 模块系统', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('807484e02ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '文件路径和网络路径', '文件路径和网络路径', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('8074872f2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs Web服务介绍', 'Nodejs Web服务介绍', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('807488922ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs 学习方法', 'Nodejs 学习方法', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('807489ec2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs 常用模块介绍', 'Nodejs 常用模块介绍', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('80748b482ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs Web框架之 express', 'Nodejs Web框架之 express', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('80748c9c2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs Web框架之 koa2', 'Nodejs Web框架之 koa2', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('80748de72ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Nodejs Web框架之 Sail.js', 'Nodejs Web框架之 Sail.js', 'url', 'javascript:void(0)', '0', 'Nodejs入门', '0', '097c36752ef411ebb5100242ac110002', '2020-11-25 16:02:02', '2020-11-25 16:02:02');
INSERT INTO `f_chapters` VALUES ('9988d9342ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'bootstrap', 'bootstrap', 'url', 'javascript:void(0)', '0', 'UI库，插件使用依赖jQuery', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988dd3b2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Iconfont', 'Iconfont', 'url', 'javascript:void(0)', '0', '阿里巴巴矢量图标库', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988e9532ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Icons', 'Icons', 'url', 'javascript:void(0)', '0', 'Material Design', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988f1242ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Ionicons', 'Ionicons', 'url', 'javascript:void(0)', '0', '高级设计的图标，用于Web，iOS，Android和桌面应用程序。 支持SVG和Web字体。 完全开源，MIT由Ionic Framework团队授权和构建', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988f2ed2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Font Awesome', 'Font Awesome', 'url', 'javascript:void(0)', '0', '一套绝佳的图标字体库和 CSS 框架。 Font Awesome为您提供可缩放的矢量图标,您可以使用CSS所提供的所有特性对它们进行更改,包括:大小、颜色、阴影或者其它任何支持的效果', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988f4662ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'select2', 'select2', 'url', 'javascript:void(0)', '0', '下拉框组件，比较陈旧的技术', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988f5bc2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'validator.js', 'validator.js', 'url', 'javascript:void(0)', '0', 'jQuery 表单校验', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988f7082ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'pagination', 'pagination', 'url', 'javascript:void(0)', '0', '分页插件', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9988f85b2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'devui', 'devui', 'url', 'javascript:void(0)', '0', '华为开源设计理念及UI方案', '0', '5bb8e9242ef111ebb5100242ac110002', '2020-11-25 15:48:25', '2020-11-25 15:48:25');
INSERT INTO `f_chapters` VALUES ('9c1d30c82ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'i18n', 'i18n', 'url', 'javascript:void(0)', '0', 'i18n前端国际化', '0', '5bb8fbde2ef111ebb5100242ac110002', '2020-11-25 15:55:39', '2020-11-25 15:55:39');
INSERT INTO `f_chapters` VALUES ('9c1d34ea2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vue-i18n', 'vue-i18n', 'url', 'javascript:void(0)', '0', 'vue 前端国际化', '0', '5bb8fbde2ef111ebb5100242ac110002', '2020-11-25 15:55:39', '2020-11-25 15:55:39');
INSERT INTO `f_chapters` VALUES ('9c232e182ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Typescript', 'Typescript', 'url', 'javascript:void(0)', '0', 'Javascript 超集', '0', 'c78e49622ef011ebb5100242ac110002', '2020-11-25 16:17:08', '2020-11-25 16:17:08');
INSERT INTO `f_chapters` VALUES ('9c23324e2ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Scss', 'Scss', 'url', 'javascript:void(0)', '0', 'CSS 扩展语言', '0', 'c78e49622ef011ebb5100242ac110002', '2020-11-25 16:17:08', '2020-11-25 16:17:08');
INSERT INTO `f_chapters` VALUES ('9c2333f82ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Less', 'Less', 'url', 'javascript:void(0)', '0', 'CSS 扩展语言', '0', 'c78e49622ef011ebb5100242ac110002', '2020-11-25 16:17:08', '2020-11-25 16:17:08');
INSERT INTO `f_chapters` VALUES ('9c2335672ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Pug', 'Pug', 'url', 'javascript:void(0)', '0', 'HTML 模板语法', '0', 'c78e49622ef011ebb5100242ac110002', '2020-11-25 16:17:08', '2020-11-25 16:17:08');
INSERT INTO `f_chapters` VALUES ('9c2336c72ef611ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'VSCode', 'VSCode', 'url', 'javascript:void(0)', '0', 'Typescript编写的强大的前端开发编辑器', '0', 'c78e49622ef011ebb5100242ac110002', '2020-11-25 16:17:08', '2020-11-25 16:17:08');
INSERT INTO `f_chapters` VALUES ('a247fda52ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'jQuery', 'jQuery', 'url', 'javascript:void(0)', '0', '过去10多年全球网站使用率最高的函数库', '0', '5bb8ce922ef111ebb5100242ac110002', '2020-11-25 15:41:30', '2020-11-25 15:41:30');
INSERT INTO `f_chapters` VALUES ('a24801a52ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Lodash', 'Lodash', 'url', 'javascript:void(0)', '0', '过去10多年全球网站使用率最高的函数库', '0', '5bb8ce922ef111ebb5100242ac110002', '2020-11-25 15:41:30', '2020-11-25 15:41:30');
INSERT INTO `f_chapters` VALUES ('a24803372ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Underscore', 'Underscore', 'url', 'javascript:void(0)', '0', '过去10多年全球网站使用率最高的函数库', '0', '5bb8ce922ef111ebb5100242ac110002', '2020-11-25 15:41:30', '2020-11-25 15:41:30');
INSERT INTO `f_chapters` VALUES ('a24804a52ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Ramda', 'Ramda', 'url', 'javascript:void(0)', '0', '过去10多年全球网站使用率最高的函数库', '0', '5bb8ce922ef111ebb5100242ac110002', '2020-11-25 15:41:30', '2020-11-25 15:41:30');
INSERT INTO `f_chapters` VALUES ('a2480f0e2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'outils', 'outils', 'url', 'javascript:void(0)', '0', '过去10多年全球网站使用率最高的函数库', '0', '5bb8ce922ef111ebb5100242ac110002', '2020-11-25 15:41:30', '2020-11-25 15:41:30');
INSERT INTO `f_chapters` VALUES ('a24817152ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Moment', 'Moment', 'url', 'javascript:void(0)', '0', '过去10多年全球网站使用率最高的函数库', '0', '5bb8ce922ef111ebb5100242ac110002', '2020-11-25 15:41:30', '2020-11-25 15:41:30');
INSERT INTO `f_chapters` VALUES ('aed5fd292ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Webpack 原理', 'Webpack 原理', 'url', 'javascript:void(0)', '0', 'Webpack', '0', '097c49b22ef411ebb5100242ac110002', '2020-11-25 16:03:20', '2020-11-25 16:03:20');
INSERT INTO `f_chapters` VALUES ('aed601532ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Webpack 配置', '文件路径和网络路径', 'url', 'javascript:void(0)', '0', 'Webpack', '0', '097c49b22ef411ebb5100242ac110002', '2020-11-25 16:03:20', '2020-11-25 16:03:20');
INSERT INTO `f_chapters` VALUES ('aed602f82ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Webpack 插件系统', '文件路径和网络路径', 'url', 'javascript:void(0)', '0', 'Webpack', '0', '097c49b22ef411ebb5100242ac110002', '2020-11-25 16:03:20', '2020-11-25 16:03:20');
INSERT INTO `f_chapters` VALUES ('c39ac0f22ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Bmap', 'Bmap', 'url', 'javascript:void(0)', '0', '百度地图', '0', '5bb8fd232ef111ebb5100242ac110002', '2020-11-25 15:56:45', '2020-11-25 15:56:45');
INSERT INTO `f_chapters` VALUES ('c39ac50a2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Amap', 'Amap', 'url', 'javascript:void(0)', '0', '高德地图', '0', '5bb8fd232ef111ebb5100242ac110002', '2020-11-25 15:56:45', '2020-11-25 15:56:45');
INSERT INTO `f_chapters` VALUES ('c39ac6a92ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'google-maps', 'google-maps', 'url', 'javascript:void(0)', '0', '谷歌地图', '0', '5bb8fd232ef111ebb5100242ac110002', '2020-11-25 15:56:45', '2020-11-25 15:56:45');
INSERT INTO `f_chapters` VALUES ('c39acaec2ef311ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'WeMap', 'WeMap', 'url', 'javascript:void(0)', '0', '腾讯地图', '0', '5bb8fd232ef111ebb5100242ac110002', '2020-11-25 15:56:45', '2020-11-25 15:56:45');
INSERT INTO `f_chapters` VALUES ('c78e342d2ef011ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '前端插件、工具库', '前端插件、工具库', 'url', 'javascript:void(0)', '0', '前端插件、工具库', '0', null, '2020-11-25 15:35:23', '2020-11-25 15:35:23');
INSERT INTO `f_chapters` VALUES ('c78e39172ef011ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '前端工程化', '前端工程化', 'url', 'javascript:void(0)', '0', '前端工程化', '0', null, '2020-11-25 15:35:23', '2020-11-25 15:35:23');
INSERT INTO `f_chapters` VALUES ('c78e44392ef011ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '前端框架', '前端框架', 'url', 'javascript:void(0)', '0', '前端框架', '0', null, '2020-11-25 15:35:23', '2020-11-25 15:35:23');
INSERT INTO `f_chapters` VALUES ('c78e49622ef011ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '更优雅的开发', '更优雅的开发', 'url', 'javascript:void(0)', '0', '更优雅的开发', '0', null, '2020-11-25 15:35:23', '2020-11-25 15:35:23');
INSERT INTO `f_chapters` VALUES ('ca489cde2ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Rollup 原理', 'Rollup 原理', 'url', 'javascript:void(0)', '0', 'Rollup', '0', '097c4cb62ef411ebb5100242ac110002', '2020-11-25 16:04:06', '2020-11-25 16:04:06');
INSERT INTO `f_chapters` VALUES ('ca48a1112ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Rollup 配置', 'Rollup 配置', 'url', 'javascript:void(0)', '0', 'Rollup', '0', '097c4cb62ef411ebb5100242ac110002', '2020-11-25 16:04:06', '2020-11-25 16:04:06');
INSERT INTO `f_chapters` VALUES ('ca48a2b22ef411ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Rollup 插件系统', 'Rollup 插件系统', 'url', 'javascript:void(0)', '0', 'Rollup', '0', '097c4cb62ef411ebb5100242ac110002', '2020-11-25 16:04:06', '2020-11-25 16:04:06');
INSERT INTO `f_chapters` VALUES ('d25a7a8f2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'UEditor', 'UEditor', 'url', 'javascript:void(0)', '0', '百度UEditor', '0', '5bb8f09b2ef111ebb5100242ac110002', '2020-11-25 15:50:01', '2020-11-25 15:50:01');
INSERT INTO `f_chapters` VALUES ('d25a7ead2ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Markdown', 'Markdown', 'url', 'javascript:void(0)', '0', 'Markdown', '0', '5bb8f09b2ef111ebb5100242ac110002', '2020-11-25 15:50:01', '2020-11-25 15:50:01');
INSERT INTO `f_chapters` VALUES ('d25a80472ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Wiki', 'Wiki', 'url', 'javascript:void(0)', '0', 'Wiki', '0', '5bb8f09b2ef111ebb5100242ac110002', '2020-11-25 15:50:01', '2020-11-25 15:50:01');
INSERT INTO `f_chapters` VALUES ('d8f4f0b82ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vue', 'vue', 'url', 'javascript:void(0)', '0', 'vue 核心程序', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f4f4cf2ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vue-router', 'vue-router', 'url', 'javascript:void(0)', '0', 'vue 路由插件', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f4f6712ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vuex', 'vuex', 'url', 'javascript:void(0)', '0', 'vue 状态管理插件', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f502b32ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vue-cli', 'vue-cli', 'url', 'javascript:void(0)', '0', 'vue 工程化脚手架', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f50a842ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vite', 'vite', 'url', 'javascript:void(0)', '0', '使用 ES Module 基于 Vue3 单文件组件的非打包开发服务器', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f50c992ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'vue-next', 'vue-next', 'url', 'javascript:void(0)', '0', 'vue 服务端渲染框架', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f50dfa2ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', '@vue/devtools', '@vue/devtools', 'url', 'javascript:void(0)', '0', 'vue 工程化浏览器调试插件', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f50f512ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'element-ui', 'element-ui', 'url', 'javascript:void(0)', '0', '阿里巴巴饿了么团队开源，基于Vue2的UI组件库，持续维护中', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f510a12ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'iview', 'iview', 'url', 'javascript:void(0)', '0', '优秀的Vue组件库，持续维护中', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f5121e2ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Vux', 'Vux', 'url', 'javascript:void(0)', '0', '优秀的Vue移动端组件库，持续维护中', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f513792ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Mint UI', 'Mint UI', 'url', 'javascript:void(0)', '0', '优秀的Vue移动端组件库，持续维护中', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f514d22ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Bootstrap-Vue UI', 'Bootstrap-Vue UI', 'url', 'javascript:void(0)', '0', '基于Bootstrap的Vue组件库', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f516362ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Ant Design Vue UI', 'Ant Design Vue UI', 'url', 'javascript:void(0)', '0', '基于 Ant Design 的Vue组件库', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f517892ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Vant UI', 'Vant UI', 'url', 'javascript:void(0)', '0', '移动端组件库', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('d8f518d62ef511ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'cube-ui UI', 'cube-ui UI', 'url', 'javascript:void(0)', '0', '滴滴团队开源的移动端组件库', '0', '0e0b28652ef511ebb5100242ac110002', '2020-11-25 16:11:40', '2020-11-25 16:11:40');
INSERT INTO `f_chapters` VALUES ('ef400b762ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Animate.css', 'Animate.css', 'url', 'javascript:void(0)', '0', 'CSS3 动画库，也是目前最通用的动画库', '0', '5bb8d2a92ef111ebb5100242ac110002', '2020-11-25 15:43:40', '2020-11-25 15:43:40');
INSERT INTO `f_chapters` VALUES ('ef400fb22ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Anime.js', 'Anime.js', 'url', 'javascript:void(0)', '0', '一个强大的、轻量级的用来制作动画的javascript库', '0', '5bb8d2a92ef111ebb5100242ac110002', '2020-11-25 15:43:40', '2020-11-25 15:43:40');
INSERT INTO `f_chapters` VALUES ('ef401b4a2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'BetterScroll', 'BetterScroll', 'url', 'javascript:void(0)', '0', 'iscroll 的优化版，使移动端滑动体验更加流畅', '0', '5bb8d2a92ef111ebb5100242ac110002', '2020-11-25 15:43:40', '2020-11-25 15:43:40');
INSERT INTO `f_chapters` VALUES ('ef4023362ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Swiper', 'Swiper', 'url', 'javascript:void(0)', '0', '移动端网站的轮播图，依赖jQuery', '0', '5bb8d2a92ef111ebb5100242ac110002', '2020-11-25 15:43:40', '2020-11-25 15:43:40');
INSERT INTO `f_chapters` VALUES ('ef40251f2ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'slip.js', 'slip.js', 'url', 'javascript:void(0)', '0', '移动端跟随手指滑动组件，零依赖', '0', '5bb8d2a92ef111ebb5100242ac110002', '2020-11-25 15:43:40', '2020-11-25 15:43:40');
INSERT INTO `f_chapters` VALUES ('ef4026962ef111ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'fullpage', 'fullpage', 'url', 'javascript:void(0)', '0', '移动端整屏滚动', '0', '5bb8d2a92ef111ebb5100242ac110002', '2020-11-25 15:43:40', '2020-11-25 15:43:40');
INSERT INTO `f_chapters` VALUES ('f1aebb242ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Masonry', 'Masonry', 'url', 'javascript:void(0)', '0', '瀑布流布局', '0', '5bb8f4052ef111ebb5100242ac110002', '2020-11-25 15:50:53', '2020-11-25 15:50:53');
INSERT INTO `f_chapters` VALUES ('f1aec0d12ef211ebb5100242ac110002', '9de43c912ed111ebb5100242ac110002', 'Flex Api', 'Flex Api', 'url', 'javascript:void(0)', '0', 'CSS3 Flex 布局 Api', '0', '5bb8f4052ef111ebb5100242ac110002', '2020-11-25 15:50:53', '2020-11-25 15:50:53');
DROP TRIGGER IF EXISTS `gen_id`;
DELIMITER ;;
CREATE TRIGGER `gen_id` BEFORE INSERT ON `f_books` FOR EACH ROW set new.id = (replace(uuid(),"-",""))
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `gen_uuid`;
DELIMITER ;;
CREATE TRIGGER `gen_uuid` BEFORE INSERT ON `f_chapters` FOR EACH ROW set new.id = (replace(uuid(),"-",""))
;;
DELIMITER ;
