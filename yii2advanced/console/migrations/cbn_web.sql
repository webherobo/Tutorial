/*
Navicat MySQL Data Transfer

Source Server         : 116.62.200.83_3306
Source Server Version : 50711
Source Host           : 116.62.200.83:3306
Source Database       : webherboo

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-07-07 10:50:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cbn_admin
-- ----------------------------
DROP TABLE IF EXISTS `cbn_admin`;
CREATE TABLE `cbn_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '名称',
  `useravatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `password_reset_token` varchar(256) DEFAULT NULL,
  `email` varchar(256) NOT NULL COMMENT '邮箱',
  `role` smallint(8) DEFAULT NULL COMMENT '角色等级',
  `status` tinyint(2) NOT NULL DEFAULT '10' COMMENT '状态（10：正常2：关闭）',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='平台管理员';

-- ----------------------------
-- Table structure for cbn_article_category
-- ----------------------------
DROP TABLE IF EXISTS `cbn_article_category`;
CREATE TABLE `cbn_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(30) NOT NULL COMMENT '栏目标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '显示顺序',
  `type` varchar(15) NOT NULL COMMENT '类型（1.普通文章2.新闻3.系统通知协议4.系统公告）',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cbn_article_news
-- ----------------------------
DROP TABLE IF EXISTS `cbn_article_news`;
CREATE TABLE `cbn_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL COMMENT '分类id',
  `owner_id` int(10) unsigned DEFAULT NULL COMMENT '文章所属者id',
  `title` varchar(100) NOT NULL COMMENT '文章标题',
  `content` mediumtext COMMENT '内容',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `news_summary` varchar(255) DEFAULT NULL COMMENT '简要概述',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `displayorder` tinyint(3) unsigned DEFAULT '0' COMMENT '文章排序',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '是否显示(1:显示2:不显示)',
  `recommend` varchar(255) DEFAULT '2' COMMENT '1推荐2不推荐',
  `click` int(11) unsigned DEFAULT '0' COMMENT '点击量',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='新闻列表';

-- ----------------------------
-- Table structure for cbn_memberuser
-- ----------------------------
DROP TABLE IF EXISTS `cbn_memberuser`;
CREATE TABLE `cbn_memberuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联附属表字段identification',
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `auth_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `access_token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowance` int(10) unsigned DEFAULT '10' COMMENT 'restful剩余的允许的请求数',
  `allowance_updated_at` int(10) unsigned DEFAULT '0' COMMENT 'restful请求的UNIX时间戳数',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for cbn_national_address
-- ----------------------------
DROP TABLE IF EXISTS `cbn_national_address`;
CREATE TABLE `cbn_national_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) DEFAULT NULL COMMENT '简称',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `merger_name` varchar(255) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) DEFAULT NULL COMMENT '长途区号',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3750 DEFAULT CHARSET=utf8 COMMENT='中国地区表';

-- ----------------------------
-- Table structure for cbn_permanent_member
-- ----------------------------
DROP TABLE IF EXISTS `cbn_permanent_member`;
CREATE TABLE `cbn_permanent_member` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '无符号0到2^64-1',
  `identification` varchar(128) NOT NULL DEFAULT '' COMMENT '账号(系统统一生产)国家代码(CHN)+省代码p+地州市代码c+所在区县代码a+cbnid',
  `id_card_no` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `realname` varchar(12) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称',
  `label_motto` varchar(255) DEFAULT NULL COMMENT '座右铭',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别（0：不详1：男 2：女）',
  `stature` tinyint(5) DEFAULT '0' COMMENT '身高：单位厘米',
  `weight` tinyint(5) DEFAULT '0' COMMENT '体重单位：克',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `group_id` int(10) DEFAULT NULL COMMENT '小组',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '层级等级',
  `left_node` bigint(32) DEFAULT NULL COMMENT '左节点',
  `right_node` bigint(32) DEFAULT NULL COMMENT '右节点',
  `historical_relation` varchar(255) DEFAULT NULL COMMENT '历史左右层级关系{t0_l1_r2:t3_l4_r5}',
  `money` decimal(2,0) DEFAULT '0' COMMENT '累计资金',
  `monetary` decimal(2,0) DEFAULT NULL COMMENT '消费金额',
  `integraph` double DEFAULT NULL COMMENT '积分器',
  `contribution_degree` int(10) DEFAULT NULL COMMENT '贡献度',
  `spread_number` int(10) DEFAULT '0' COMMENT '推广数',
  `country` tinyint(5) DEFAULT NULL COMMENT '国家',
  `province` tinyint(5) DEFAULT NULL COMMENT '省',
  `city` varchar(5) DEFAULT NULL COMMENT '城市',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `lng_lat` varchar(255) DEFAULT NULL COMMENT '经纬度分隔符_',
  `access_token` varchar(128) DEFAULT NULL COMMENT 'api授权',
  `auth_refresh_token` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `ip` varchar(128) DEFAULT NULL COMMENT '登录ip',
  `third_party` tinyint(5) DEFAULT '0' COMMENT '第三方（0平台1：微信2：支付宝：3百度4：qq 5：新浪）',
  `openid` varchar(255) DEFAULT NULL COMMENT '第三方用户唯一值',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identification` (`identification`),
  KEY `left_node` (`left_node`),
  KEY `right_node` (`right_node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COMMENT='永久会员';

-- ----------------------------
-- Table structure for cbn_special_topic
-- ----------------------------
DROP TABLE IF EXISTS `cbn_special_topic`;
CREATE TABLE `cbn_special_topic` (
  `id` int(11) NOT NULL COMMENT '专题',
  `cate_id` int(11) DEFAULT NULL COMMENT '分类id',
  `owner_id` int(11) DEFAULT NULL COMMENT '拥有者',
  `title` varchar(255) DEFAULT NULL COMMENT '专题名称',
  `label` varchar(255) DEFAULT NULL COMMENT '标签',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `specialpic` varchar(255) DEFAULT NULL COMMENT '专题图',
  `seo_information` varchar(255) DEFAULT NULL COMMENT '优化信息{title:"",keywords:"",description:""}',
  `content` text COMMENT '专题内容',
  `accessory` varchar(255) DEFAULT NULL COMMENT '附件',
  `discuss_several` int(10) DEFAULT NULL COMMENT '讨论数',
  `heat` int(10) DEFAULT NULL COMMENT '热度关注度',
  `pageview` int(255) DEFAULT NULL COMMENT '浏览数',
  `clicks` int(10) DEFAULT NULL COMMENT '点击数',
  `charge` decimal(2,0) DEFAULT NULL COMMENT '浏览费用',
  `ispremium` tinyint(255) unsigned DEFAULT '0' COMMENT '是否需要额外收费默认0 是1',
  `is_check` tinyint(1) unsigned DEFAULT NULL COMMENT '是否审核默认0 审核：1  审核失败：2',
  `is_show` tinyint(1) unsigned DEFAULT '0' COMMENT '是否显示 默认0 显示1',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 默认0 删除1',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- ----------------------------
-- Table structure for cbn_tmessage
-- ----------------------------
DROP TABLE IF EXISTS `cbn_tmessage`;
CREATE TABLE `cbn_tmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言表',
  `pid` int(10) DEFAULT NULL COMMENT '父id 0为留言 否则为回复留言id',
  `cate_id` int(10) DEFAULT '0' COMMENT '分组、分类id',
  `fromid` int(11) DEFAULT NULL COMMENT '留言的主人',
  `toid` int(11) DEFAULT NULL COMMENT '对方的ID',
  `sender_name` varchar(64) DEFAULT NULL COMMENT '留言发送者',
  `sender_useravatar` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(64) DEFAULT NULL COMMENT '留言接收者',
  `receiver_useravatar` varchar(255) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '留言类型（1普通消息、0系统消息）',
  `msgtype` tinyint(2) DEFAULT '1' COMMENT '1:公告 Announce 2:提醒 Remind 3:私信 Message',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` text COMMENT '留言内容',
  `send_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '留言状态(0未读1:已读)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- ----------------------------
-- Table structure for cbn_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cbn_topic_comment`;
CREATE TABLE `cbn_topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned DEFAULT NULL COMMENT '主题id',
  `topic_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1为课程，2为集会，3为商品',
  `content` text COMMENT '评论内容',
  `from_uid` int(10) unsigned DEFAULT NULL COMMENT '评论者id，一般为会员表的id',
  `nickname` varchar(60) DEFAULT NULL COMMENT '冗余用户昵称',
  `thumb_img` varchar(255) DEFAULT NULL COMMENT '冗余用户头像',
  `is_top` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶评论，1为置顶，0为不置顶',
  `is_hot` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否为热评，1为热评',
  `like_num` int(5) unsigned DEFAULT '0' COMMENT '评论被点赞的次数',
  `reply_num` int(5) unsigned DEFAULT '0' COMMENT '评论被回复的次数',
  `is_reply` tinyint(2) unsigned DEFAULT '0' COMMENT '是否回复',
  `status` tinyint(2) unsigned NOT NULL COMMENT '评论状态，-1为删除，0为待审核，1为已发布',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`) USING BTREE,
  KEY `topic_type` (`topic_type`) USING BTREE,
  KEY `from_id` (`from_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cbn_topic_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `cbn_topic_comment_reply`;
CREATE TABLE `cbn_topic_comment_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned DEFAULT NULL COMMENT '评论id',
  `reply_type` tinyint(2) unsigned DEFAULT '1' COMMENT '1为回复评论，2为回复别人的回复',
  `reply_id` int(10) unsigned DEFAULT NULL COMMENT '回复目标id，reply_type为1时，是comment_id，reply_type为2时为回复表的id',
  `content` text COMMENT '回复内容',
  `to_uid` int(10) unsigned DEFAULT NULL COMMENT '回复目标id',
  `from_uid` int(10) unsigned DEFAULT NULL COMMENT '回复用户id',
  `from_thumb_img` varchar(255) DEFAULT NULL COMMENT '回复者的头像',
  `from_nickname` varchar(50) DEFAULT NULL COMMENT '回复者的昵称',
  `to_thumb_img` varchar(255) DEFAULT NULL COMMENT '冗余回复对象的头像',
  `to_nickname` varchar(50) DEFAULT NULL COMMENT '冗余回复对象的昵称',
  `is_author` tinyint(2) unsigned DEFAULT NULL COMMENT '0为普通回复，1为后台管理员回复',
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`) USING BTREE,
  KEY `from_uid` (`from_uid`) USING BTREE,
  KEY `to_uid` (`to_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
