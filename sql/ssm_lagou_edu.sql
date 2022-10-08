/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : ssm_lagou_edu

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 08/10/2022 17:45:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课程一句话简介',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `price_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '原价标签',
  `discounts` double(10, 2) NULL DEFAULT NULL COMMENT '优惠价',
  `discounts_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠标签',
  `course_description_mark_down` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述markdown',
  `course_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程描述',
  `course_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程分享图片url',
  `is_new` tinyint(1) NULL DEFAULT NULL COMMENT '是否新品',
  `is_new_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告语',
  `last_operator_id` int(11) NULL DEFAULT NULL COMMENT '最后操作者',
  `auto_online_time` datetime NULL DEFAULT NULL COMMENT '自动上架时间',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `total_duration` int(11) NULL DEFAULT NULL COMMENT '总时长(分钟)',
  `course_list_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程列表展示图片',
  `status` int(2) NULL DEFAULT 0 COMMENT '课程状态，0-草稿，1-上架',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '课程排序，用于后台保存草稿时用到',
  `preview_first_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程预览第一个字段',
  `preview_second_field` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程预览第二个字段',
  `sales` int(11) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (7, '文案高手的18项修炼', '手把手教你写出实用的高转化文案', 263.00, '', 100.00, '成就自己', '<p>背景介绍<br>\n自媒体时代，无论你是做新媒体编辑、运营，还是市场营销、电商，微信推文、推广海报、产品详情页、朋友圈话术……文案需求无处不在。</p>\n<p>写出价值百万的文案，其实并不难，因为它们背后都有可总结、可借鉴的规律。只要通过系统学习和刻意训练，你也能创造出爆款文案，掌握可复用的硬通货技能，轻松获得职场晋升，或者开拓副业，实现财务自由！</p>\n<p>专栏解读<br>\n这是一个零基础就能学会的爆款文案写作与变现路径，专栏共分为三大模块：入门基础篇、高手实战篇、进阶拓展篇。从入门写作到如何变现，让你成为赚钱达人。</p>\n<p>第一部分：掌握写作基础，夯实文字功底。这一模块会带你如何深入了解产品、洞悉用户需求，告诉你如何搭建文章框架，积累文字素材，做好动笔前的准备工作，只有掌握了这些，你对文案才有更深刻的理解。</p>\n<p>第二部分：爆款文案写作法，让你成为文案操盘手。这一模块为你拆解爆款文案的组成，手把手教你写作的5个步骤，从爆款标题的写作，到让用户爽快下单的技巧，从文字构建信任，到文案促成下单，这些技巧足以让你成为爆款文案操盘手。</p>\n<p>第三部分：如何让你的文案变成钱？带你搞定文案写作之后，为你提供4大变现路径，让你用文案打造个人影响力，并找到利用文案轻松赚钱的方法。</p>\n<p>18讲的内容，每一讲都汇集了爆款文案写作经验和实战技巧，每一讲都是经过验证的经验复用，每个文字都来自文案人深夜的凝思和血泪。</p>\n', '<p>背景介绍<br> 自媒体时代，无论你是做新媒体编辑、运营，还是市场营销、电商，微信推文、推广海报、产品详情页、朋友圈话术……文案需求无处不在。</p> \n<p>写出价值百万的文案，其实并不难，因为它们背后都有可总结、可借鉴的规律。只要通过系统学习和刻意训练，你也能创造出爆款文案，掌握可复用的硬通货技能，轻松获得职场晋升，或者开拓副业，实现财务自由！</p> \n<p>专栏解读<br> 这是一个零基础就能学会的爆款文案写作与变现路径，专栏共分为三大模块：入门基础篇、高手实战篇、进阶拓展篇。从入门写作到如何变现，让你成为赚钱达人。</p> \n<p>第一部分：掌握写作基础，夯实文字功底。这一模块会带你如何深入了解产品、洞悉用户需求，告诉你如何搭建文章框架，积累文字素材，做好动笔前的准备工作，只有掌握了这些，你对文案才有更深刻的理解。</p> \n<p>第二部分：爆款文案写作法，让你成为文案操盘手。这一模块为你拆解爆款文案的组成，手把手教你写作的5个步骤，从爆款标题的写作，到让用户爽快下单的技巧，从文字构建信任，到文案促成下单，这些技巧足以让你成为爆款文案操盘手。</p> \n<p>第三部分：如何让你的文案变成钱？带你搞定文案写作之后，为你提供4大变现路径，让你用文案打造个人影响力，并找到利用文案轻松赚钱的方法。</p> \n<p>18讲的内容，每一讲都汇集了爆款文案写作经验和实战技巧，每一讲都是经过验证的经验复用，每个文字都来自文案人深夜的凝思和血泪。</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943482627237468.jpg', NULL, NULL, NULL, NULL, '2020-07-10 10:33:56', '2022-09-25 15:54:26', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/1594348262748358.jpg', 0, 1, '100讲', '50课时', 1314);
INSERT INTO `course` VALUES (8, 'Vue.js 3.0 核心源码解析', '掌握框架原理，精通经典应用场景', 99.00, '', 88.00, '', '<p>背景介绍<br>\n在过去的几年里，Vue、React、Angular 一直是国内前端的三大主流框架。在 2019 年 Vue 就像一匹黑马力压群雄，独占前端er 的宠爱，Github Star 排名荣登第一也反映了国内开发者对 Vue 的喜爱。</p>\n<p>最近，Vue 的作者尤雨溪在 Github 上介绍了 Vue 3.0 的最新进展，目标发布日期是 7 月中旬发布 RC 版本，8 月初发布正式版，也就是说 Vue 3.0 就在眼前！</p>\n<p>专栏解读<br>\n专栏将对 Vue.js 3.0 的框架源码进行系统、细致地分析。 深入到内核剖析实现原理，探究源码背后的设计思想。一方面帮你夯实 Vue.js 开发技能，一方面帮你理解源码分析的方式与编程思路，为你从底层逻辑理解优秀框架背后的技术思想。</p>\n<p>专栏主要分为以下3个部分：</p>\n<p>第一部分核心模块，这个部分会带你去分析 Vue.js 3.0 最核心的组件的实现原理以及 Vue.js 3.0 新特性 Composition API 的实现原理。掌握这个部分，可以让你对组件如何渲染和更新能有深刻的理解，并掌握 Composition API 背后的实现原理和应用场景。</p>\n<p>第二部分进阶模块，这个部分会带你分析 Vue.js 3.0 模板的编译和优化过程。带你了解 Vue.js 是如何编译模板并生成代码的，以及编译过程背后的性能优化思想是怎样的。</p>\n<p>第三部分扩展模块，将带你分析 Vue.js 3.0 的内置组件的实现原理、Vue.js 3.0 一些实用特性的实现原理以及 Vue.js 3.0 官方生态实现原理。经过学习，你可以了解这些功能的实现原理和职责边界，在平时工作中应用起来更加得心应手。</p>\n<p>在学习这门课程后，不仅可以了解 Vue.js 3.0 核心实现原理，还能一定程度地了解背后的设计思想。源码中一些好的编程思路和优秀的代码可以吸收来为自己的工作所用，修炼内功，提升技术能力。</p>\n<p>讲师简介<br>\n黄轶（ustbhuangyi） Zoom 前端架构师，前百度、滴滴资深技术专家</p>\n<p>现任 Zoom 前端架构师，主要负责推进前后端分离架构方案和 Zoom 自研组件库，不仅将Vue.js 带入 Zoom，而且通过魔改 Vue.js 源码开发了 Vue.js 2.x 的 CSP 兼容版本，并稳定服务于几十个用 Vue.js 做增强开发的页面。之前，他先后在百度和滴滴担任前端资深技术专家，并曾使用 Vue.js 重构了滴滴出行WebApp，主导开发 Vue.js 开源组件库 cube-ui。</p>\n<p>课程大纲</p>\n', '<p>背景介绍<br> 在过去的几年里，Vue、React、Angular 一直是国内前端的三大主流框架。在 2019 年 Vue 就像一匹黑马力压群雄，独占前端er 的宠爱，Github Star 排名荣登第一也反映了国内开发者对 Vue 的喜爱。</p> \n<p>最近，Vue 的作者尤雨溪在 Github 上介绍了 Vue 3.0 的最新进展，目标发布日期是 7 月中旬发布 RC 版本，8 月初发布正式版，也就是说 Vue 3.0 就在眼前！</p> \n<p>专栏解读<br> 专栏将对 Vue.js 3.0 的框架源码进行系统、细致地分析。 深入到内核剖析实现原理，探究源码背后的设计思想。一方面帮你夯实 Vue.js 开发技能，一方面帮你理解源码分析的方式与编程思路，为你从底层逻辑理解优秀框架背后的技术思想。</p> \n<p>专栏主要分为以下3个部分：</p> \n<p>第一部分核心模块，这个部分会带你去分析 Vue.js 3.0 最核心的组件的实现原理以及 Vue.js 3.0 新特性 Composition API 的实现原理。掌握这个部分，可以让你对组件如何渲染和更新能有深刻的理解，并掌握 Composition API 背后的实现原理和应用场景。</p> \n<p>第二部分进阶模块，这个部分会带你分析 Vue.js 3.0 模板的编译和优化过程。带你了解 Vue.js 是如何编译模板并生成代码的，以及编译过程背后的性能优化思想是怎样的。</p> \n<p>第三部分扩展模块，将带你分析 Vue.js 3.0 的内置组件的实现原理、Vue.js 3.0 一些实用特性的实现原理以及 Vue.js 3.0 官方生态实现原理。经过学习，你可以了解这些功能的实现原理和职责边界，在平时工作中应用起来更加得心应手。</p> \n<p>在学习这门课程后，不仅可以了解 Vue.js 3.0 核心实现原理，还能一定程度地了解背后的设计思想。源码中一些好的编程思路和优秀的代码可以吸收来为自己的工作所用，修炼内功，提升技术能力。</p> \n<p>讲师简介<br> 黄轶（ustbhuangyi） Zoom 前端架构师，前百度、滴滴资深技术专家</p> \n<p>现任 Zoom 前端架构师，主要负责推进前后端分离架构方案和 Zoom 自研组件库，不仅将Vue.js 带入 Zoom，而且通过魔改 Vue.js 源码开发了 Vue.js 2.x 的 CSP 兼容版本，并稳定服务于几十个用 Vue.js 做增强开发的页面。之前，他先后在百度和滴滴担任前端资深技术专家，并曾使用 Vue.js 重构了滴滴出行WebApp，主导开发 Vue.js 开源组件库 cube-ui。</p> \n<p>课程大纲</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949659206804677.png', NULL, NULL, NULL, NULL, '2020-07-10 11:20:43', '2020-07-17 14:05:25', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943511296066408.png', 1, 7, '共22节', '更新10节', 100);
INSERT INTO `course` VALUES (9, '秒杀11', '秒杀11', 200.00, '', 100.00, '11', '<p>11111</p>\n', '<p>11111</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943514165219908.jpg', NULL, NULL, NULL, NULL, '2020-07-10 11:24:31', '2020-07-17 12:31:23', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943514200926156.jpg', 1, 1, '秒杀', '秒杀', 10);
INSERT INTO `course` VALUES (10, 'React 入门', 'React 入门', 164.00, '', 100.00, '', '<p>React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门</p>\n', '<p>React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949603348287878.png', NULL, NULL, NULL, NULL, '2020-07-17 12:32:43', '2020-07-17 12:33:59', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949603393915818.png', 1, 12, 'React 入门', 'React 入门', 2323);
INSERT INTO `course` VALUES (11, '文案高手的18项修炼', '手把手教你写出实用的高转化文案', 263.00, '', 100.00, '成就自己', '<p>背景介绍<br>\n自媒体时代，无论你是做新媒体编辑、运营，还是市场营销、电商，微信推文、推广海报、产品详情页、朋友圈话术……文案需求无处不在。</p>\n<p>写出价值百万的文案，其实并不难，因为它们背后都有可总结、可借鉴的规律。只要通过系统学习和刻意训练，你也能创造出爆款文案，掌握可复用的硬通货技能，轻松获得职场晋升，或者开拓副业，实现财务自由！</p>\n<p>专栏解读<br>\n这是一个零基础就能学会的爆款文案写作与变现路径，专栏共分为三大模块：入门基础篇、高手实战篇、进阶拓展篇。从入门写作到如何变现，让你成为赚钱达人。</p>\n<p>第一部分：掌握写作基础，夯实文字功底。这一模块会带你如何深入了解产品、洞悉用户需求，告诉你如何搭建文章框架，积累文字素材，做好动笔前的准备工作，只有掌握了这些，你对文案才有更深刻的理解。</p>\n<p>第二部分：爆款文案写作法，让你成为文案操盘手。这一模块为你拆解爆款文案的组成，手把手教你写作的5个步骤，从爆款标题的写作，到让用户爽快下单的技巧，从文字构建信任，到文案促成下单，这些技巧足以让你成为爆款文案操盘手。</p>\n<p>第三部分：如何让你的文案变成钱？带你搞定文案写作之后，为你提供4大变现路径，让你用文案打造个人影响力，并找到利用文案轻松赚钱的方法。</p>\n<p>18讲的内容，每一讲都汇集了爆款文案写作经验和实战技巧，每一讲都是经过验证的经验复用，每个文字都来自文案人深夜的凝思和血泪。</p>\n', '<p>背景介绍<br> 自媒体时代，无论你是做新媒体编辑、运营，还是市场营销、电商，微信推文、推广海报、产品详情页、朋友圈话术……文案需求无处不在。</p> \n<p>写出价值百万的文案，其实并不难，因为它们背后都有可总结、可借鉴的规律。只要通过系统学习和刻意训练，你也能创造出爆款文案，掌握可复用的硬通货技能，轻松获得职场晋升，或者开拓副业，实现财务自由！</p> \n<p>专栏解读<br> 这是一个零基础就能学会的爆款文案写作与变现路径，专栏共分为三大模块：入门基础篇、高手实战篇、进阶拓展篇。从入门写作到如何变现，让你成为赚钱达人。</p> \n<p>第一部分：掌握写作基础，夯实文字功底。这一模块会带你如何深入了解产品、洞悉用户需求，告诉你如何搭建文章框架，积累文字素材，做好动笔前的准备工作，只有掌握了这些，你对文案才有更深刻的理解。</p> \n<p>第二部分：爆款文案写作法，让你成为文案操盘手。这一模块为你拆解爆款文案的组成，手把手教你写作的5个步骤，从爆款标题的写作，到让用户爽快下单的技巧，从文字构建信任，到文案促成下单，这些技巧足以让你成为爆款文案操盘手。</p> \n<p>第三部分：如何让你的文案变成钱？带你搞定文案写作之后，为你提供4大变现路径，让你用文案打造个人影响力，并找到利用文案轻松赚钱的方法。</p> \n<p>18讲的内容，每一讲都汇集了爆款文案写作经验和实战技巧，每一讲都是经过验证的经验复用，每个文字都来自文案人深夜的凝思和血泪。</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943482627237468.jpg', NULL, NULL, NULL, NULL, '2020-07-10 10:33:56', '2020-07-10 10:45:38', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/1594348262748358.jpg', 1, 1, '100讲', '50课时', 1314);
INSERT INTO `course` VALUES (12, 'Vue.js 3.0 核心源码解析', '掌握框架原理，精通经典应用场景', 99.00, '', 88.00, '', '<p>背景介绍<br>\n在过去的几年里，Vue、React、Angular 一直是国内前端的三大主流框架。在 2019 年 Vue 就像一匹黑马力压群雄，独占前端er 的宠爱，Github Star 排名荣登第一也反映了国内开发者对 Vue 的喜爱。</p>\n<p>最近，Vue 的作者尤雨溪在 Github 上介绍了 Vue 3.0 的最新进展，目标发布日期是 7 月中旬发布 RC 版本，8 月初发布正式版，也就是说 Vue 3.0 就在眼前！</p>\n<p>专栏解读<br>\n专栏将对 Vue.js 3.0 的框架源码进行系统、细致地分析。 深入到内核剖析实现原理，探究源码背后的设计思想。一方面帮你夯实 Vue.js 开发技能，一方面帮你理解源码分析的方式与编程思路，为你从底层逻辑理解优秀框架背后的技术思想。</p>\n<p>专栏主要分为以下3个部分：</p>\n<p>第一部分核心模块，这个部分会带你去分析 Vue.js 3.0 最核心的组件的实现原理以及 Vue.js 3.0 新特性 Composition API 的实现原理。掌握这个部分，可以让你对组件如何渲染和更新能有深刻的理解，并掌握 Composition API 背后的实现原理和应用场景。</p>\n<p>第二部分进阶模块，这个部分会带你分析 Vue.js 3.0 模板的编译和优化过程。带你了解 Vue.js 是如何编译模板并生成代码的，以及编译过程背后的性能优化思想是怎样的。</p>\n<p>第三部分扩展模块，将带你分析 Vue.js 3.0 的内置组件的实现原理、Vue.js 3.0 一些实用特性的实现原理以及 Vue.js 3.0 官方生态实现原理。经过学习，你可以了解这些功能的实现原理和职责边界，在平时工作中应用起来更加得心应手。</p>\n<p>在学习这门课程后，不仅可以了解 Vue.js 3.0 核心实现原理，还能一定程度地了解背后的设计思想。源码中一些好的编程思路和优秀的代码可以吸收来为自己的工作所用，修炼内功，提升技术能力。</p>\n<p>讲师简介<br>\n黄轶（ustbhuangyi） Zoom 前端架构师，前百度、滴滴资深技术专家</p>\n<p>现任 Zoom 前端架构师，主要负责推进前后端分离架构方案和 Zoom 自研组件库，不仅将Vue.js 带入 Zoom，而且通过魔改 Vue.js 源码开发了 Vue.js 2.x 的 CSP 兼容版本，并稳定服务于几十个用 Vue.js 做增强开发的页面。之前，他先后在百度和滴滴担任前端资深技术专家，并曾使用 Vue.js 重构了滴滴出行WebApp，主导开发 Vue.js 开源组件库 cube-ui。</p>\n<p>课程大纲</p>\n', '<p>背景介绍<br> 在过去的几年里，Vue、React、Angular 一直是国内前端的三大主流框架。在 2019 年 Vue 就像一匹黑马力压群雄，独占前端er 的宠爱，Github Star 排名荣登第一也反映了国内开发者对 Vue 的喜爱。</p> \n<p>最近，Vue 的作者尤雨溪在 Github 上介绍了 Vue 3.0 的最新进展，目标发布日期是 7 月中旬发布 RC 版本，8 月初发布正式版，也就是说 Vue 3.0 就在眼前！</p> \n<p>专栏解读<br> 专栏将对 Vue.js 3.0 的框架源码进行系统、细致地分析。 深入到内核剖析实现原理，探究源码背后的设计思想。一方面帮你夯实 Vue.js 开发技能，一方面帮你理解源码分析的方式与编程思路，为你从底层逻辑理解优秀框架背后的技术思想。</p> \n<p>专栏主要分为以下3个部分：</p> \n<p>第一部分核心模块，这个部分会带你去分析 Vue.js 3.0 最核心的组件的实现原理以及 Vue.js 3.0 新特性 Composition API 的实现原理。掌握这个部分，可以让你对组件如何渲染和更新能有深刻的理解，并掌握 Composition API 背后的实现原理和应用场景。</p> \n<p>第二部分进阶模块，这个部分会带你分析 Vue.js 3.0 模板的编译和优化过程。带你了解 Vue.js 是如何编译模板并生成代码的，以及编译过程背后的性能优化思想是怎样的。</p> \n<p>第三部分扩展模块，将带你分析 Vue.js 3.0 的内置组件的实现原理、Vue.js 3.0 一些实用特性的实现原理以及 Vue.js 3.0 官方生态实现原理。经过学习，你可以了解这些功能的实现原理和职责边界，在平时工作中应用起来更加得心应手。</p> \n<p>在学习这门课程后，不仅可以了解 Vue.js 3.0 核心实现原理，还能一定程度地了解背后的设计思想。源码中一些好的编程思路和优秀的代码可以吸收来为自己的工作所用，修炼内功，提升技术能力。</p> \n<p>讲师简介<br> 黄轶（ustbhuangyi） Zoom 前端架构师，前百度、滴滴资深技术专家</p> \n<p>现任 Zoom 前端架构师，主要负责推进前后端分离架构方案和 Zoom 自研组件库，不仅将Vue.js 带入 Zoom，而且通过魔改 Vue.js 源码开发了 Vue.js 2.x 的 CSP 兼容版本，并稳定服务于几十个用 Vue.js 做增强开发的页面。之前，他先后在百度和滴滴担任前端资深技术专家，并曾使用 Vue.js 重构了滴滴出行WebApp，主导开发 Vue.js 开源组件库 cube-ui。</p> \n<p>课程大纲</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949659206804677.png', NULL, NULL, NULL, NULL, '2020-07-10 11:20:43', '2020-07-17 14:05:25', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943511296066408.png', 1, 7, '共22节', '更新10节', 100);
INSERT INTO `course` VALUES (13, '秒杀11', '秒杀11', 200.00, '', 100.00, '11', '<p>11111</p>\n', '<p>11111</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943514165219908.jpg', NULL, NULL, NULL, NULL, '2020-07-10 11:24:31', '2020-08-13 10:40:28', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943514200926156.jpg', 0, 1, '秒杀', '秒杀', 10);
INSERT INTO `course` VALUES (14, 'React 入门', 'React 入门', 164.00, '', 100.00, '', '<p>React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门</p>\n', '<p>React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门React 入门</p>', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949603348287878.png', NULL, NULL, NULL, NULL, '2020-07-17 12:32:43', '2020-07-17 12:33:59', 0, NULL, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949603393915818.png', 1, 12, 'React 入门', 'React 入门', 2323);
INSERT INTO `course` VALUES (15, '全栈工程师', '掌握多种技能，胜任前端与后端', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2020-08-04 15:15:06', '2022-10-01 13:55:40', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲', '每周四更新', 100);
INSERT INTO `course` VALUES (16, '全栈工程师', '掌握多种技能，胜任前端与后端', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2020-08-04 15:23:17', '2020-08-04 16:54:00', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲', '每周四更新', 100);
INSERT INTO `course` VALUES (17, '全栈工程师', '掌握多种技能，胜任前端与后端', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2020-08-04 15:29:26', '2020-08-04 16:53:27', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲', '每周四更新', 100);
INSERT INTO `course` VALUES (18, '全栈工程师', '掌握多种技能，胜任前端与后端', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2020-08-04 16:54:45', '2020-08-04 16:54:45', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲', '每周四更新', 100);
INSERT INTO `course` VALUES (19, '全栈工程师aaa', '掌握多种技能，胜任前端与后端aaa', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2020-08-04 16:56:41', '2020-08-04 16:56:41', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲aaa', '每周四更新aa', 100);
INSERT INTO `course` VALUES (20, 'Java基础', '掌握多种技能，胜任前端与后端aaa', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2020-08-05 13:42:08', '2020-08-05 13:42:08', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲aaa', '每周四更新aa', 100);
INSERT INTO `course` VALUES (27, '一拳超人2', '一拳超人2', 188.00, '', 88.00, '一拳超人', '<p>一拳超人一拳超人一拳超人一拳超人一拳超人一拳超人一拳超人一拳超人一拳超人一拳超人</p>\n', NULL, 'http://localhost:8080/upload/1597227595417.jpg', NULL, NULL, NULL, NULL, '2020-08-12 18:19:16', '2020-08-19 13:44:09', 0, NULL, '', 0, 0, '一拳超人', '一拳超人', 10);
INSERT INTO `course` VALUES (28, '大是大非三1111111', '大是大非三1111', 120.00, '', 111.00, '的飞洒', '<p>富士达发萨发是发送到发as佛挡杀佛四大</p>\n', NULL, 'http://localhost:8080/upload/1597229733992.jpg', NULL, NULL, NULL, NULL, '2020-08-12 18:53:42', '2020-08-13 10:40:49', 0, NULL, '', 1, 0, '大是大非三', '大是大非三', 12);
INSERT INTO `course` VALUES (29, '溜达秘籍', '溜达秘籍', 12.00, '', 12.00, '溜达秘籍', '<p>溜达秘籍溜达秘籍溜达秘籍溜达秘籍溜达秘籍溜达秘籍溜达秘籍</p>\n', NULL, 'http://localhost:8080/upload/1597399694960.jpg', NULL, NULL, NULL, NULL, '2020-08-14 18:08:24', '2020-08-14 18:08:24', 0, NULL, '', 0, 0, '溜达秘籍', '溜达秘籍', 10);
INSERT INTO `course` VALUES (30, '鹿鼎记', '鹿鼎记', 13.00, '', 12.00, '天下刀宗', '<p>天下刀宗天下刀宗天下刀宗天下刀宗天下刀宗天下刀宗天下刀宗</p>\n', NULL, 'http://localhost:8080/upload/1597809189909.jpg', NULL, NULL, NULL, NULL, '2020-08-19 11:53:13', '2020-08-19 11:54:02', 0, NULL, '', 0, 0, '天下刀宗天下刀宗天下刀宗', '天下刀宗天下刀宗天下刀宗', 9);
INSERT INTO `course` VALUES (36, 'Domenic大数据云计算', '海量大数据课程', 88.00, '', 66.60, '先到先得', '介绍当前流行大数据技术，数据技术原理，并介绍其思想，介绍大数据技术培训课程，概要介绍。', NULL, 'http://localhost:8080/upload/1596520226925.jpg', NULL, NULL, NULL, NULL, '2022-10-01 13:54:40', '2022-10-01 13:54:40', 0, NULL, 'http://localhost:8080/upload/1596520226925.jpg', 0, 1, '共10讲', '每周四更新', 100);

-- ----------------------------
-- Table structure for course_lesson
-- ----------------------------
DROP TABLE IF EXISTS `course_lesson`;
CREATE TABLE `course_lesson`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `section_id` int(11) NOT NULL DEFAULT 0 COMMENT '章节id',
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课时主题',
  `duration` int(11) NOT NULL DEFAULT 0 COMMENT '课时时长(分钟)',
  `is_free` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否免费',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序字段',
  `status` int(2) NULL DEFAULT 0 COMMENT '课时状态,0-隐藏，1-未发布，2-已发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id_index`(`course_id`, `section_id`) USING BTREE,
  INDEX `idx_sectionId_orderNum`(`section_id`, `order_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程节内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_lesson
-- ----------------------------
INSERT INTO `course_lesson` VALUES (8, 7, 7, '从小白到文案高手', 0, 1, '2020-07-10 10:35:30', '2020-07-27 14:26:47', 0, 1, 2);
INSERT INTO `course_lesson` VALUES (9, 7, 7, '手把手教你写出爆款文案', 0, 0, '2020-07-10 10:35:53', '2020-07-27 14:26:47', 0, 0, 2);
INSERT INTO `course_lesson` VALUES (10, 7, 8, '重点内容', 0, 0, '2020-07-10 10:36:09', '2020-07-27 14:26:52', 0, 1, 2);
INSERT INTO `course_lesson` VALUES (11, 7, 8, '内容总结', 0, 0, '2020-07-10 10:36:21', '2020-07-27 14:26:52', 0, 0, 2);
INSERT INTO `course_lesson` VALUES (12, 8, 9, '开篇词 | 解析 Vue.js 源码，提升编码能力', 0, 1, '2020-07-10 11:21:49', '2020-07-22 12:10:49', 0, 0, 2);
INSERT INTO `course_lesson` VALUES (13, 8, 9, '导读 | 一文看懂 Vue.js 3.0 的优化', 0, 0, '2020-07-10 11:22:13', '2020-07-22 12:10:49', 0, 1, 2);
INSERT INTO `course_lesson` VALUES (14, 9, 10, '11111', 0, 0, '2020-07-10 11:30:47', '2020-07-13 15:54:52', 0, 0, 2);
INSERT INTO `course_lesson` VALUES (15, 10, 11, '撒短发', 0, 1, '2020-07-17 12:33:20', '2020-07-17 12:35:23', 0, 22, 2);
INSERT INTO `course_lesson` VALUES (16, 7, 7, '文案高手养成', 15, 0, '2020-08-05 11:52:24', '2020-08-05 11:52:24', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (17, 20, 16, '第一讲 什么是Java', 15, 0, '2020-08-05 13:45:01', '2020-08-05 13:45:01', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (18, 20, 16, '第二讲 Java环境安装', 15, 0, '2020-08-05 13:45:33', '2020-08-05 13:45:33', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (19, 20, 16, '第三讲 HelloWord', 15, 0, '2020-08-05 13:45:51', '2020-08-05 13:45:51', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (20, 20, 17, '第一讲 Java中的变量', 15, 0, '2020-08-05 13:46:41', '2020-08-05 13:46:41', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (21, 20, 17, '第二讲 Java中的数据类型', 15, 0, '2020-08-05 13:47:06', '2020-08-05 13:47:48', 0, 3, 0);
INSERT INTO `course_lesson` VALUES (22, 27, 19, '第一讲 我是琦玉01', 2, 0, '2020-08-13 15:11:27', '2020-08-14 10:33:37', 0, 1, 0);
INSERT INTO `course_lesson` VALUES (23, 27, 19, '第二讲 琦玉是我', 10, 1, '2020-08-13 15:12:41', '2020-08-13 15:12:41', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (24, 27, 20, '第一讲 琦玉打怪兽一打二', 18, 1, '2020-08-13 15:13:12', '2020-08-13 15:16:58', 0, 2, 0);
INSERT INTO `course_lesson` VALUES (25, 27, 20, '第二讲 旗鱼', 15, 0, '2020-08-13 15:13:33', '2020-08-13 15:13:33', 0, 3, 0);

-- ----------------------------
-- Table structure for course_media
-- ----------------------------
DROP TABLE IF EXISTS `course_media`;
CREATE TABLE `course_media`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程媒体主键ID',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程Id',
  `section_id` int(11) NULL DEFAULT NULL COMMENT '章ID',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课时ID',
  `cover_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面图URL',
  `duration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时长（06:02）',
  `file_edk` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '媒体资源文件对应的EDK',
  `file_size` double(10, 2) NULL DEFAULT NULL COMMENT '文件大小MB',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_dk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '媒体资源文件对应的DK',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除，0未删除，1删除',
  `duration_num` int(11) NULL DEFAULT NULL COMMENT '时长，秒数（主要用于音频在H5控件中使用）',
  `file_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '媒体资源文件ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_lessonid_channel_mediatype_idx`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_media
-- ----------------------------
INSERT INTO `course_media` VALUES (5, 7, 7, 8, 'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/7FDABE200A424897A7ED5CE05764BB4C-6-2.png?Expires=1594363749&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=dqBQJCvfJY1wDCBgCGnI5cPInww%3D', '00:11', 'YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlRjdaVUlmYTUwYWkwR3pwK1YzZENnUjExMnI1VkxiVFhBQUFBQUFBQUFBQ3FJN3pnZnFQUndad24rT2djTmM4MkxXb3ZXcDNNNkk0RENXeW9NRDVrZFNucHFiaUxRNm4r', 1.90, '屏幕录制2020-07-10 13.48.08.mov', 'JPagaxcX6Ihpn5nu+dLi0Q==', '2020-07-10 11:14:51', '2020-07-10 13:49:14', 0, 11, '4f0dfb878a4d4d4881428b950396228a');
INSERT INTO `course_media` VALUES (6, 7, 8, 10, 'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/DBA8C56E2EA44F6382DCF5B7AD5763E6-6-2.png?Expires=1594356125&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=s5jKXcyQzw%2BjJKah75oBobYEy3g%3D', '00:08', 'YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlNDlJL3pGM0dvS1IzSFhxMkFzNnYwcnhBelB6bUU3NENBQUFBQUFBQUFBQkxYTzQ4Q2JyK05XTHRoKzZiWmpoZG55azJ5NFVYUWtIRUhWb1BuQ3FZd2FPTVhPM2d6UDJ4', 0.64, '测试视频课程.mp4', 'T3q/VVunsKwx7aNeRtaLGg==', '2020-07-10 11:17:38', '2020-07-10 11:42:10', 0, 8, '8dbf98ac948a4b389f99f17034c998cd');
INSERT INTO `course_media` VALUES (7, 8, 9, 12, 'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/07ED3325C001418AA46A95F88B1DA6C8-6-2.png?Expires=1594969610&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=biyZXbn1V2gY4GxmPiXKBME3E7I%3D', '00:05', 'YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlaWxjVHdDaW5NSDJGTWdqZnYxWFg1YWZ6OUJXc0cvS3FBQUFBQUFBQUFBQzVwV2NTQUh4NjhiaU1YZ1drYlFZQnlVKyt0YkdTRzdlVXJmRFVOZHRESWM3T3ZSdEwwM1hN', 11.37, 'test.mov', 'BRRHQV/DivcEwf0Zosn9dA==', '2020-07-10 11:40:29', '2020-07-17 14:06:55', 0, 5, 'a029c496959a457e92eb9e4f480e0018');
INSERT INTO `course_media` VALUES (8, 7, 8, 11, 'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/8D2E8BB920F94ECAB32CCAA73222DF32-6-2.png?Expires=1594625842&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=H2rqXRF0a%2FjY1dnrVtACXinwBRI%3D', '00:08', 'YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlQnBqQnBlU042WEd4UWx2eVEwV1hZS2JQdE5PS1dBYVpBQUFBQUFBQUFBQ0ViRHkrd0U1WWVLRGhObFJGOFE5OGJMYlppRzNwdnVWc2xuUnpINnVhN3dkay9QMDlucXhR', 0.64, '测试视频课程.mp4', 'MWGs74Qco6LYjlCXc7ymEg==', '2020-07-10 11:43:10', '2020-07-13 14:37:27', 0, 8, 'bb7d23a9334c4b07abb1187a2c61ce1f');
INSERT INTO `course_media` VALUES (9, 8, 9, 13, 'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/1B8791F4BC4B48B08A37C2B7B669FE52-6-2.png?Expires=1594356307&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=QISH8TpvWX%2F0G%2B%2F1rA0OJqTug3g%3D', '00:08', 'YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlSHk2RWhDUURHejlyYzN1cnNNaE9ubG9jVUZlb2NTbFFBQUFBQUFBQUFBQjRRV0lGOHRvUGxIcCtINGhTdWxBR3JWV1ZmR3ZDT3R2YnVJcDlkS0NjSWxoL1EwMmpHcVdK', 0.64, '测试视频课程.mp4', 'B0CqECTjmT1JeCVndYvXtg==', '2020-07-10 11:45:13', '2020-07-10 11:45:13', 0, 8, '717bc01edbb24283937d7fa903f06d60');
INSERT INTO `course_media` VALUES (10, 9, 10, 14, 'http://outin-61fd129aa62411eaa4ef00163e1c94a4.oss-cn-shanghai.aliyuncs.com/image/cover/EEB28294E90F4D85A2609A2A978A9264-6-2.png?Expires=1594356669&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=wR9JpRJp6UMBs%2B55QSWSFYBM%2FCs%3D', '00:08', 'YTU5ZGFkM2ItOGI0Mi00NWFmLWJiMGItMTI4YWRjNjQzOWFlajlJcXU0RGYyc0V2blZ5c0pXMGVDaUdNT0ZVZlNYODVBQUFBQUFBQUFBQjFKWCtoZGU4WDZPTXM3RnZmanFXTWxzVVh0Uy80OEt6U2ttY1h1TDJURlJ6dlJ3V2ZpcjFT', 0.64, '测试视频课程.mp4', '6I5a1R2dG/WrUCQotk6Uxw==', '2020-07-10 11:51:14', '2020-07-10 11:51:14', 0, 8, '451d48ec785646b8ab1aa97ae3741100');

-- ----------------------------
-- Table structure for course_section
-- ----------------------------
DROP TABLE IF EXISTS `course_section`;
CREATE TABLE `course_section`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `section_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '章节名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '章节描述',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_de` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序字段',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态，0:隐藏；1：待更新；2：已发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id_index`(`course_id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_section
-- ----------------------------
INSERT INTO `course_section` VALUES (7, 7, '开篇词 | 从小白到文案高手，手把手教你写出爆款文案', '你好，我是兔妈！第一次见面，我用几句话简单介绍下自己', '2020-07-10 10:34:47', '2020-08-05 11:10:21', 0, 1, 1);
INSERT INTO `course_section` VALUES (8, 7, '重点内容总结', '重点内容总结', '2020-07-10 10:35:05', '2020-07-10 17:08:57', 0, 2, 2);
INSERT INTO `course_section` VALUES (9, 8, '开篇词', 'Vue的简单介绍', '2020-07-10 11:21:35', '2020-07-10 11:41:05', 0, 1, 2);
INSERT INTO `course_section` VALUES (10, 9, '1111', '1111', '2020-07-10 11:30:38', '2020-07-10 11:51:46', 0, 1111, 2);
INSERT INTO `course_section` VALUES (11, 10, '第一章', '第一章', '2020-07-17 12:33:00', '2020-07-17 12:33:07', 0, 12, 2);
INSERT INTO `course_section` VALUES (12, 0, '微服务架构', '跟着药水一起学习如何使用微服务', '2020-08-05 10:26:32', '2020-08-05 10:26:32', 0, 0, 0);
INSERT INTO `course_section` VALUES (13, 8, 'Vue路由', '单页面应用导航', '2020-08-05 10:28:40', '2022-10-01 14:08:13', 0, 0, 0);
INSERT INTO `course_section` VALUES (14, 8, 'VueCLI脚手架', '快速搭建Vue项目', '2020-08-05 10:30:06', '2020-08-05 10:30:06', 0, 2, 0);
INSERT INTO `course_section` VALUES (15, 8, 'VueCLI脚手架', '快速搭建Vue项目', '2020-08-05 10:47:08', '2020-08-05 10:47:08', 0, 2, 0);
INSERT INTO `course_section` VALUES (16, 20, 'Java入门', 'Java入门', '2020-08-05 13:42:56', '2020-08-05 13:42:56', 0, 2, 0);
INSERT INTO `course_section` VALUES (17, 20, 'Java基础1', 'Java基础1', '2020-08-05 13:43:53', '2020-08-05 13:43:53', 0, 2, 0);
INSERT INTO `course_section` VALUES (18, 20, 'Java基础2', 'Java基础2', '2020-08-05 13:43:57', '2020-08-05 13:43:57', 0, 2, 0);
INSERT INTO `course_section` VALUES (19, 27, '第一集', '琦玉买菜回家', '2020-08-13 14:14:08', '2020-08-13 15:01:46', 0, 1, 1);
INSERT INTO `course_section` VALUES (20, 27, '第二集', '琦玉打怪02', '2020-08-13 14:15:50', '2020-08-13 14:53:44', 0, 2, 1);
INSERT INTO `course_section` VALUES (21, 27, '第三集', '琦玉玩牌', '2020-08-13 14:22:17', '2020-08-13 14:31:15', 0, 3, 0);
INSERT INTO `course_section` VALUES (22, 8, 'SpringBoot基础', 'SpringBoot入门使用', '2022-10-01 14:08:01', '2022-10-01 14:08:01', 0, 4, 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL COMMENT '父菜单id',
  `href` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `shown` tinyint(2) NULL DEFAULT 1 COMMENT '是否展示',
  `level` int(11) NOT NULL COMMENT '菜单层级，从0开始',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, -1, '', 'lock', '权限管理', '管理系统角色、菜单、资源', 1, 1, 0, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (2, 1, 'Role', 'lock', '角色列表', '管理系统角色', 1, 1, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (3, 1, 'Menu', 'lock', '菜单列表', '管理系统菜单', 2, 1, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (4, 1, 'Resource', 'lock', '资源列表', '管理系统资源', 3, 1, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (5, -1, 'Courses', 'film', '课程管理', '课程的新增、修改、查看、发布、上下架', 2, 1, 0, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (6, -1, 'Users', 'user', '用户管理', '用户的查询、禁用、启用', 3, 1, 0, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (7, -1, '', 'setting', '广告管理', '广告、广告位管理', 4, 1, 0, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (8, 7, 'Advertise', 'setting', '广告列表', '广告管理', 1, 1, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (9, 7, 'AdvertiseSpace', 'setting', '广告位列表', '广告位管理', 2, 1, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (10, 1, 'AllocMenu', 'setting', '给角色分配菜单页面', '给角色分配菜单页面路由', 4, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (11, 1, 'AllocResource', 'setting', '给角色分配资源页面', '给角色分配资源页面路由', 5, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (12, 1, 'AddMenu', 'setting', '添加菜单页面', '添加菜单页路由', 6, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (13, 1, 'UpdateMenu', 'setting', '更新菜单页面', '更新菜单页路由', 7, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (14, 1, 'ResourceCategory', 'setting', '资源分类列表页面', '资源分类列表页面路由', 8, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (15, 7, 'AddAdvertise', 'setting', '添加广告页面', '添加广告页面路由', 3, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (16, 7, 'UpdateAdvertise', 'setting', '编辑广告页面', '编辑广告页面路由', 4, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (17, 7, 'AddAdvertiseSpace', 'setting', '添加广告位页面', '添加广告位页面路由', 5, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (18, 7, 'UpdateAdvertiseSpace', 'setting', '更新广告位页面', '更新广告位页面路由', 6, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (19, 5, 'CourseItem', 'setting', '课程详情页面', '课程详情页面路由', 1, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (20, 5, 'CourseSections', 'setting', '课时信息页面', '课时信息页面路由', 2, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (21, 5, 'VideoOptions', 'setting', '课时上传视频', '课时上传视频页面路由', 3, 0, 1, '2020-07-20 15:41:38', '2020-07-20 15:41:38', 'system', 'system');
INSERT INTO `menu` VALUES (22, 1, 'addOrder', 'lock', '订单管理修改', '订单系统管理修改', 1, 0, 0, '2020-08-10 20:32:41', '2020-08-10 20:32:41', 'system', 'system');
INSERT INTO `menu` VALUES (23, 5, 'updateStatus修改', 'lock', '课程管理状态修改', '设置课程状态修改', 3, 1, 0, '2020-08-11 04:32:41', '2020-08-11 04:32:41', 'system', 'system');
INSERT INTO `menu` VALUES (24, 5, 'sectionAndLesson', 'setting', '章节内容与课时内容管理', '管理章节与课时内容内容', 2, 1, 1, '2020-08-17 18:11:25', '2020-08-17 18:15:00', 'system', 'system');
INSERT INTO `menu` VALUES (25, -1, 'user', 'icon', '人员管理', '管理员工', 1, 1, 0, '2020-08-17 18:12:22', '2020-08-17 18:12:22', 'system', 'system');
INSERT INTO `menu` VALUES (26, 25, 'guanli', 'set', '管理客服人员', '管理客服人员', 0, 1, 1, '2020-08-17 18:17:13', '2020-08-17 18:17:13', 'system', 'system');

-- ----------------------------
-- Table structure for promotion_ad
-- ----------------------------
DROP TABLE IF EXISTS `promotion_ad`;
CREATE TABLE `promotion_ad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名',
  `space_id` int(11) NULL DEFAULT NULL COMMENT '广告位id',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '精确搜索关键词',
  `html_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '静态广告的内容',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文字一',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接一',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '0 下线,1 上线',
  `priority` int(4) NULL DEFAULT 0 COMMENT '优先级',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告图片地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `promotion_ad_SEG`(`space_id`, `start_time`, `end_time`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1096 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of promotion_ad
-- ----------------------------
INSERT INTO `promotion_ad` VALUES (1074, 'java高级训练营2期', 1, NULL, NULL, 'Java高级训练营 Java高级训练营 Java高级训练营', 'https://localhost:8080/upload', '2020-08-17 11:21:27', '2020-08-18 17:03:45', '2020-07-14 14:28:34', '2022-09-27 21:56:14', 1, 0, 'http://localhost:8080/upload/1597634499619.jpg');
INSERT INTO `promotion_ad` VALUES (1075, '精选课程', 2, NULL, NULL, NULL, 'http://edufront.lagou.com/#/content?courseId=1', '2020-06-29 17:03:25', '2020-07-29 17:03:45', '2020-07-14 14:28:34', '2020-07-17 13:13:51', 1, 0, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949580209796992.png');
INSERT INTO `promotion_ad` VALUES (1076, 'java训练营2', 3, NULL, NULL, NULL, 'http://edufront.lagou.com/#/content?courseId=1', '2020-06-29 17:03:25', '2020-07-29 17:03:45', '2020-07-14 14:28:34', '2020-07-17 13:14:11', 1, 0, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949583460826312.jpeg');
INSERT INTO `promotion_ad` VALUES (1077, '轮播广告2', 3, NULL, NULL, NULL, 'http://edufront.lagou.com/#/content?courseId=1', '2020-06-29 17:03:25', '2020-07-29 17:03:45', '2020-07-14 14:28:34', '2020-07-17 13:07:52', 0, 0, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949624525374063.png');
INSERT INTO `promotion_ad` VALUES (1078, '广告3333', 162, NULL, NULL, '这是文本内容111', 'http://www.163.com111', '2020-01-01 00:00:00', '2020-09-30 00:00:00', '2020-07-14 14:28:34', '2020-08-20 11:43:18', 1, 2, 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/17/15949561472241579.jpg');
INSERT INTO `promotion_ad` VALUES (1079, '广告', 162, NULL, NULL, '这是文本内容111', 'http://www.163.com111', '2020-07-01 00:00:00', '2020-08-01 00:00:00', '2020-07-14 14:30:48', '2020-07-14 14:30:48', 0, 2, 'http://www.baidu.com111');
INSERT INTO `promotion_ad` VALUES (1080, '广告名称111', 169, NULL, NULL, 'text', 'link1', '2030-01-10 01:01:01', '2030-01-02 12:12:12', '2020-07-14 16:38:03', '2020-07-14 17:36:34', 0, 0, 'img1');
INSERT INTO `promotion_ad` VALUES (1081, '广告名称111', 169, NULL, NULL, 'text', 'link1', '2030-01-10 01:01:01', '2030-01-02 12:12:12', '2020-07-14 17:36:50', '2020-07-14 17:36:50', 0, 0, 'img1');
INSERT INTO `promotion_ad` VALUES (1082, '111', NULL, NULL, NULL, NULL, NULL, '2020-07-14 16:00:00', '2020-07-15 16:00:00', '2020-07-15 11:57:23', '2020-07-15 11:57:23', 0, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1083, '222', NULL, NULL, NULL, NULL, NULL, '2020-07-14 16:00:00', '2020-07-16 16:00:00', '2020-07-15 11:58:00', '2020-07-15 11:58:00', 0, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1084, '123123', NULL, NULL, NULL, NULL, NULL, '2020-07-15 16:00:00', '2020-07-16 16:00:00', '2020-07-16 15:52:30', '2020-07-16 15:52:30', 1, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1085, 'storm', NULL, NULL, NULL, NULL, NULL, '2020-07-15 15:06:02', '2020-07-30 16:00:00', '2020-07-16 21:48:26', '2020-07-16 21:48:26', 0, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1086, 'stormtest', 3, NULL, NULL, NULL, NULL, '2020-07-16 16:00:00', '2020-07-17 16:00:00', '2020-07-16 22:16:48', '2020-07-16 22:16:48', 0, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1087, '撒短发', 3, NULL, NULL, NULL, 'sdfasdfasdfssss', '2020-07-14 16:00:00', '2020-07-16 16:00:00', '2020-07-16 22:22:47', '2020-07-16 22:22:47', 0, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1088, '冰淇淋套餐', NULL, NULL, NULL, NULL, 'sdfdasdf', '2020-01-01 00:00:00', '2020-02-01 01:00:00', '2020-07-17 10:07:39', '2020-07-17 11:10:51', 0, 0, NULL);
INSERT INTO `promotion_ad` VALUES (1089, 'Java高级训练营', 3, NULL, NULL, '广告保存', 'http://localhost:8080/upload/1597400130127.jpg', '2020-08-14 18:15:15', '2020-08-15 00:00:00', NULL, '2020-08-17 11:23:48', 0, NULL, 'http://localhost:8080/upload/1597400130127.jpg');
INSERT INTO `promotion_ad` VALUES (1090, '大数据高薪训练营', 3, NULL, NULL, '添加广告添加广告添加广告添加广告添加广告', 'http://localhost:8080/upload/1597400677132.jpg', '2020-08-14 18:24:09', '2020-08-15 00:00:00', '2020-08-14 18:25:02', '2020-08-14 18:25:02', 1, NULL, 'http://localhost:8080/upload/1597400677132.jpg');
INSERT INTO `promotion_ad` VALUES (1091, 'Python高级训练营01', 2, NULL, NULL, '大家一起学Python1111', 'www.xxxx.com', '2020-08-18 14:12:08', '2020-08-20 00:00:00', '2020-08-18 14:13:01', '2020-08-18 14:18:05', 1, NULL, 'http://localhost:8080/upload/1597731135966.jpg');
INSERT INTO `promotion_ad` VALUES (1092, 'Hadoop生态', 2, NULL, NULL, '大数据Hadoop大数据Hadoop大数据Hadoop大数据Hadoop', 'www.xxx.com', '2020-08-20 11:36:49', '2020-08-21 00:00:00', '2020-08-20 11:37:49', '2020-08-20 11:38:24', 1, NULL, 'http://localhost:8080/upload/1597894666846.jpg');
INSERT INTO `promotion_ad` VALUES (1093, 'Spark实时分析2期', 160, NULL, NULL, 'Spark实时分析Spark实时分析Spark实时分析Spark实时分析', 'www.1234.com', '2020-08-20 11:42:20', '2020-08-25 00:00:00', '2020-08-20 11:42:50', '2020-08-20 11:43:07', 1, NULL, 'http://localhost:8080/upload/1597894966218.jpg');
INSERT INTO `promotion_ad` VALUES (1095, 'C++ 训练营', 1, NULL, NULL, '大家一起学C++', 'www.domenic.com', '2020-08-18 06:12:08', '2020-08-19 16:00:00', '2022-10-01 14:29:25', '2022-10-01 14:29:25', 1, NULL, 'http://localhost:8080/upload/1597731135966.jpg');

-- ----------------------------
-- Table structure for promotion_space
-- ----------------------------
DROP TABLE IF EXISTS `promotion_space`;
CREATE TABLE `promotion_space`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `space_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位key',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `promotion_space_key_isDel`(`space_key`, `is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of promotion_space
-- ----------------------------
INSERT INTO `promotion_space` VALUES (1, '首页顶部推荐位', '666', '2020-07-14 13:03:31', '2020-07-17 13:13:21', 0);
INSERT INTO `promotion_space` VALUES (2, '首页侧边广告位', '888', '2020-07-14 13:03:31', '2020-07-17 11:53:02', 0);
INSERT INTO `promotion_space` VALUES (3, '首页顶部轮播', '999', '2020-07-14 13:03:31', '2020-07-17 13:13:03', 0);
INSERT INTO `promotion_space` VALUES (160, '首页中部轮播图', '123', '2020-07-14 13:03:31', '2020-08-17 14:19:23', 0);
INSERT INTO `promotion_space` VALUES (161, '课程页面轮播图', '456', '2020-07-14 13:03:31', '2020-08-17 14:19:47', 0);
INSERT INTO `promotion_space` VALUES (162, '广告名称', '789', '2020-07-14 13:03:31', '2020-07-14 13:03:11', 0);
INSERT INTO `promotion_space` VALUES (163, '广告名称', '78911111', '2020-07-14 13:03:31', '2020-07-14 13:03:11', 0);
INSERT INTO `promotion_space` VALUES (164, '广告名称', '78911111', '2020-07-14 13:03:31', '2020-07-14 13:03:11', 0);
INSERT INTO `promotion_space` VALUES (165, '广告名称', '78911111', '2020-07-14 13:03:31', '2020-07-14 13:03:11', 0);
INSERT INTO `promotion_space` VALUES (166, '广告名称', '78911111', '2020-07-14 13:03:31', '2020-07-14 13:03:11', 0);
INSERT INTO `promotion_space` VALUES (167, '广告名称', '78911111', '2020-07-14 13:03:31', '2020-07-14 13:03:11', 0);
INSERT INTO `promotion_space` VALUES (168, '广告名称111', '33333', '2020-07-14 13:03:31', '2020-07-14 13:03:49', 0);
INSERT INTO `promotion_space` VALUES (169, '名称', 'abcd', '2020-07-14 16:30:38', '2020-07-14 16:31:31', 0);
INSERT INTO `promotion_space` VALUES (170, '冰淇淋套餐', NULL, '2020-07-14 17:39:19', '2020-07-14 17:40:24', 0);
INSERT INTO `promotion_space` VALUES (171, '12111111', NULL, '2020-07-15 12:18:47', '2020-07-15 12:19:06', 0);
INSERT INTO `promotion_space` VALUES (172, '首页底部页脚位置', 'a718dfbc-3d9b-40a0-be53-c57712b1a4e4', '2020-08-17 13:56:41', '2020-08-17 13:56:41', NULL);
INSERT INTO `promotion_space` VALUES (173, '搜素页面顶部', 'f22e659c-2077-409d-a07b-c1f4aed58e52', '2020-08-18 13:55:14', '2020-08-18 13:55:14', NULL);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源url',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类id',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (2, '给用户分配角色', '/boss/role/allocateUserRoles', 1, '给用户分配角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (3, '按条件查询角色', '/boss/role/getRolePages', 1, '按条件查询角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (4, '列出所有角色并标记用户是否拥有', '/boss/role/getRolesWithUserPermission', 1, '列出所有角色并标记用户是否拥有', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (5, '保存或者更新角色', '/boss/role/saveOrUpdate', 1, '保存或者更新角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (6, '查询用户角色', '/boss/role/user/{userId}', 1, '查询用户角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (7, '获取角色', '/boss/role/{id}', 1, '获取角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (8, '删除角色', '/boss/role/{id}', 1, '删除角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (9, '给角色分配菜单', '/boss/menu/allocateRoleMenus', 2, '给角色分配菜单', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (10, '获取所有菜单', '/boss/menu/getAll', 2, '获取所有菜单', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (11, '获取编辑菜单页面信息', '/boss/menu/getEditMenuInfo', 2, '获取编辑菜单页面信息', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (12, '获取所有菜单并按层级展示', '/boss/menu/getMenuNodeList', 2, '获取所有菜单并按层级展示', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (13, '按条件分页查询菜单', '/boss/menu/getMenuPages', 2, '按条件分页查询菜单', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (14, '获取角色拥有的菜单列表', '/boss/menu/getRoleMenus', 2, '获取角色拥有的菜单列表', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (15, '保存或新增菜单', '/boss/menu/saveOrUpdate', 2, '保存或新增菜单', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (16, '是否显示开关', '/boss/menu/switchShown', 2, '是否显示开关', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (17, '根据ID查询菜单', '/boss/menu/{id}', 2, '根据ID查询菜单', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (18, '删除菜单', '/boss/menu/{id}', 2, '删除菜单', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (19, '给角色分配资源', '/boss/resource/allocateRoleResources', 3, '给角色分配资源', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (20, '查询资源分类列表', '/boss/resource/category/getAll', 3, '查询资源分类列表', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (21, '保存或更新资源分类', '/boss/resource/category/saveOrderUpdate', 3, '保存或更新资源分类', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (22, '删除资源分类', '/boss/resource/category/{id}', 3, '删除资源分类', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (23, '获取所有资源', '/boss/resource/getAll', 3, '获取所有资源', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (24, '按条件分页查询资源', '/boss/resource/getResourcePages', 3, '按条件分页查询资源', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (25, '获取角色拥有的资源列表', '/boss/resource/getRoleResources', 3, '获取角色拥有的资源列表', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (26, '保存或者更新资源', '/boss/resource/saveOrUpdate', 3, '保存或者更新资源', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (27, '获取资源', '/boss/resource/{id}', 3, '获取资源', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (28, '删除资源', '/boss/resource/{id}', 3, '删除资源', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (29, '封禁用户', '/boss/user/forbidUser', 5, '封禁用户', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (30, '分页查询用户信息', '/boss/user/getUserPages', 5, '分页查询用户信息', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (31, '获取用户菜单和资源权限列表', '/boss/permission/getUserPermissions', 5, '获取用户菜单和资源权限列表', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (32, '查询用户角色', '/boss/role/user/{userId}', 1, '查询用户角色', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (33, '课程上下架', '/boss/course/changeState', 4, '课程上下架', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (34, '新建课程页面路由', '/#/courses/new', 4, '新建课程页面路由', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (35, '通过课程Id获取课程信息', '/boss/course/getCourseById', 4, '通过课程Id获取课程信息', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (36, '分页查询课程信息', '/boss/course/getQueryCourses', 4, '分页查询课程信息', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (37, '保存或者更新课程信息', '/boss/course/saveOrUpdateCourse', 4, '保存或者更新课程信息', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (38, '上传图片', '/boss/course/upload', 4, '上传图片', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (39, '保存活动商品', '/boss/activityCourse/save', 4, '保存活动商品', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (40, '更新活动商品状态', '/boss/activityCourse/updateStatus', 4, '更新活动商品状态', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (41, '获取章节', '/boss/course/section/getBySectionId', 4, '获取章节', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (42, '获取章节和课时', '/boss/course/section/getSectionAndLesson', 4, '获取章节和课时', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (43, '保存或更新章节', '/boss/course/section/saveOrUpdateSection', 4, '保存或更新章节', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (44, '获取课时内容', '/boss/course/lesson/getById', 4, '获取课时内容', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (45, '保存或更新课时', '/boss/course/lesson/saveOrUpdate', 4, '保存或更新课时', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (46, '获取阿里云图片上传凭证', '/boss/course/upload/aliyunImagUploadAddressAdnAuth.json', 6, '获取阿里云图片上传凭证', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (47, '阿里云转码请求', '/boss/course/upload/aliyunTransCode.json', 6, '阿里云转码请求', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (48, '阿里云转码进度', '/boss/course/upload/aliyunTransCodePercent.json', 6, '阿里云转码进度', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (49, '获取阿里云视频上传凭证', '/boss/course/upload/aliyunVideoUploadAddressAdnAuth.json', 6, '获取阿里云视频上传凭证', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (50, '获取媒体信息', '/boss/course/upload/getMediaByLessonId.json', 6, '获取媒体信息', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');
INSERT INTO `resource` VALUES (51, '刷新阿里云视频上传凭证', '/boss/course/upload/refreshAliyunVideoUploadAddressAdnAuth.json', 6, '刷新阿里云视频上传凭证', '2020-07-20 15:41:57', '2020-07-20 15:41:57', 'system', 'system');

-- ----------------------------
-- Table structure for resource_category
-- ----------------------------
DROP TABLE IF EXISTS `resource_category`;
CREATE TABLE `resource_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) NULL DEFAULT NULL COMMENT '排序',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_category
-- ----------------------------
INSERT INTO `resource_category` VALUES (1, '角色管理', 1, '2020-07-20 15:41:46', '2020-07-20 15:41:46', 'system', 'system');
INSERT INTO `resource_category` VALUES (2, '菜单管理', 2, '2020-07-20 15:41:46', '2020-07-20 15:41:46', 'system', 'system');
INSERT INTO `resource_category` VALUES (3, '资源管理', 3, '2020-07-20 15:41:46', '2020-07-20 15:41:46', 'system', 'system');
INSERT INTO `resource_category` VALUES (4, '课程管理', 4, '2020-07-20 15:41:46', '2020-07-20 15:41:46', 'system', 'system');
INSERT INTO `resource_category` VALUES (5, '用户管理', 5, '2020-07-20 15:41:46', '2020-07-20 15:41:46', 'system', 'system');
INSERT INTO `resource_category` VALUES (6, '阿里上传', 6, '2020-07-20 15:41:46', '2020-07-20 15:41:46', 'system', 'system');
INSERT INTO `resource_category` VALUES (7, '广告管理', 0, '2020-07-20 07:57:10', '2020-07-20 07:57:10', '15510792994', '15510792994');
INSERT INTO `resource_category` VALUES (9, '废品管理', 7, '2020-08-18 13:38:23', '2020-08-18 13:38:23', 'system', 'system');

-- ----------------------------
-- Table structure for role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `role_menu_relation`;
CREATE TABLE `role_menu_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 316 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu_relation
-- ----------------------------
INSERT INTO `role_menu_relation` VALUES (22, 1, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (23, 2, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (24, 3, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (25, 4, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (26, 6, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (27, 10, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (28, 11, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (29, 12, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (30, 13, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (31, 14, 2, '2020-07-20 07:48:06', '2020-07-20 07:48:06', '15510792994', '15510792994');
INSERT INTO `role_menu_relation` VALUES (242, 1, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (243, 2, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (244, 3, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (245, 4, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (246, 10, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (247, 11, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (248, 12, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (249, 13, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (250, 14, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (251, 22, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (252, 5, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (253, 19, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (254, 20, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (255, 21, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (256, 23, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (257, 6, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (258, 7, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (259, 8, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (260, 9, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (261, 15, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (262, 16, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (263, 17, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (264, 18, 1, '2020-08-17 16:28:07', '2020-08-17 16:28:07', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (282, 7, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (283, 8, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (284, 9, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (285, 15, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (286, 16, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (287, 17, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (288, 18, 4, '2020-08-17 16:28:42', '2020-08-17 16:28:42', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (289, 5, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (290, 19, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (291, 20, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (292, 21, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (293, 23, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (294, 6, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (295, 7, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (296, 8, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (297, 9, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (298, 15, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (299, 16, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (300, 17, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (301, 18, 7, '2020-08-17 16:29:35', '2020-08-17 16:29:35', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (309, 7, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (310, 8, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (311, 9, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (312, 15, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (313, 16, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (314, 17, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');
INSERT INTO `role_menu_relation` VALUES (315, 18, 3, '2022-09-30 03:02:11', '2022-09-30 03:02:11', 'system', 'system');

-- ----------------------------
-- Table structure for role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `role_resource_relation`;
CREATE TABLE `role_resource_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和资源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource_relation
-- ----------------------------
INSERT INTO `role_resource_relation` VALUES (1, 1, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (2, 2, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (3, 3, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (4, 4, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (5, 5, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (6, 6, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (7, 7, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (8, 8, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (9, 9, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (10, 10, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (11, 11, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (12, 12, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (13, 13, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (14, 14, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (15, 15, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (16, 16, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (17, 17, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (18, 18, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (19, 19, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (20, 20, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (21, 21, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (22, 22, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (23, 23, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (24, 24, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (25, 25, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (26, 26, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (27, 27, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (28, 28, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (29, 29, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (30, 30, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (31, 31, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (32, 32, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (33, 33, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (34, 34, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (35, 35, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (36, 36, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (37, 37, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (38, 38, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (39, 39, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (40, 40, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (41, 41, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (42, 42, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (43, 43, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (44, 44, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (45, 45, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (46, 46, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (47, 47, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (48, 48, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (49, 49, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (50, 50, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (51, 51, 1, '2020-07-20 15:42:11', '2020-07-20 15:42:11', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (52, 1, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (53, 2, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (54, 3, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (55, 4, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (56, 5, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (57, 6, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (58, 7, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (59, 8, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (60, 9, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (61, 10, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (62, 11, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (63, 12, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (64, 13, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (65, 14, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (66, 15, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (67, 16, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (68, 17, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (69, 18, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (70, 19, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (71, 20, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (72, 21, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (73, 22, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (74, 23, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (75, 24, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (76, 25, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (77, 26, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (78, 27, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (79, 28, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (80, 29, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (81, 30, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (82, 31, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (83, 32, 2, '2020-07-20 07:50:39', '2020-07-20 07:50:39', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (84, 33, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (85, 34, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (86, 35, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (87, 36, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (88, 37, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (89, 38, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (90, 39, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (91, 40, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (92, 41, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (93, 42, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (94, 43, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (95, 44, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (96, 45, 3, '2020-07-20 07:55:32', '2020-07-20 07:55:32', '15510792994', '15510792994');
INSERT INTO `role_resource_relation` VALUES (97, 32, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (98, 1, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (99, 2, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (100, 3, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (101, 4, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (102, 5, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (103, 6, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (104, 7, 4, '2020-07-22 04:23:25', '2020-07-22 04:23:25', '15321919577', '15321919577');
INSERT INTO `role_resource_relation` VALUES (105, 1, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (106, 2, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (107, 9, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (108, 10, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (109, 11, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (110, 12, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (111, 13, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (112, 14, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (113, 15, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (114, 16, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (115, 17, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');
INSERT INTO `role_resource_relation` VALUES (116, 18, 5, '2022-10-08 15:54:56', '2022-10-08 15:54:56', 'system', 'system');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色code',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'ADMIN', '超级管理员', '后台管理员，初始拥有权限管理功能', '2020-07-20 15:41:29', '2020-07-20 15:41:29', 'system', 'system');
INSERT INTO `roles` VALUES (2, 'AUTHORITY_MANAGER', '权限管理员', '管理权限相关数据，如角色、菜单、资源。可以给用户分配角色。', '2020-07-20 07:47:55', '2020-07-20 07:47:55', '15510792994', '15510792994');
INSERT INTO `roles` VALUES (3, 'COURSE_MANAGER', '课程管理员', '管理课程信息，对课程、课时、章节进行管理。', '2020-07-20 07:52:04', '2020-07-20 07:52:04', '15510792994', '15510792994');
INSERT INTO `roles` VALUES (4, 'AD_MANAGER', '广告管理员', '管理广告、广告位信息', '2020-07-20 07:55:56', '2020-07-20 07:55:56', '15510792994', '15510792994');
INSERT INTO `roles` VALUES (7, 'UESR', '普通用户', '普通用户只能查询', '2020-08-17 16:29:23', '2020-08-17 16:29:23', 'system', 'system');
INSERT INTO `roles` VALUES (9, 'RESOURCE_MANAGER', '资源管理员', '管理资源', '2022-10-01 12:08:33', '2022-10-01 12:09:04', 'system', 'system');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) NULL DEFAULT 0 COMMENT '课程ID',
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师姓名',
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '职务',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '讲师介绍',
  `create_time` datetime NOT NULL COMMENT '记录创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_courseId`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (158, 7, '兔妈', '有赞高级讲师', '多家平台的头部商家文案顾问，有赞高级讲师，具有 8 年文案营销实战经验', '2020-07-10 10:33:56', '2020-07-10 10:33:56', 0);
INSERT INTO `teacher` VALUES (159, 8, '那朋', '前京东资深', '掌握框架原理，精通经典应用场景', '2020-07-10 11:20:43', '2020-07-17 14:05:25', 0);
INSERT INTO `teacher` VALUES (160, 9, '秒杀11', '秒杀', '秒杀1', '2020-07-10 11:24:31', '2020-07-10 11:24:31', 0);
INSERT INTO `teacher` VALUES (161, 10, 'React 入门', 'React 入门', 'React 入门', '2020-07-17 12:32:43', '2020-07-17 12:32:43', 0);
INSERT INTO `teacher` VALUES (162, 15, '药水哥', '高级讲师', '多年企业实战经验', '2020-08-04 15:15:06', '2022-10-01 13:55:40', 0);
INSERT INTO `teacher` VALUES (163, 16, '药水哥', '超级讲师', '多年药水企业实战经验', '2020-08-04 15:23:17', '2020-08-04 16:54:00', 0);
INSERT INTO `teacher` VALUES (164, 17, '药水哥', '超级讲师', '多年药水企业实战经验', '2020-08-04 15:29:26', '2020-08-04 16:53:27', 0);
INSERT INTO `teacher` VALUES (165, 18, '药水哥', '超级讲师', '多年药水企业实战经验', '2020-08-04 16:54:45', '2020-08-04 16:54:45', 0);
INSERT INTO `teacher` VALUES (166, 19, '药水哥aaa', '超级讲师aa', '多年药水企业实战经验aaa', '2020-08-04 16:56:41', '2020-08-04 16:56:41', 0);
INSERT INTO `teacher` VALUES (167, 20, '药水哥aaa', '超级讲师aa', '多年药水企业实战经验aaa', '2020-08-05 13:42:08', '2020-08-05 13:42:08', 0);
INSERT INTO `teacher` VALUES (168, 21, '一拳超人一拳超人', '一拳超人', '一拳超人', '2020-08-12 17:34:26', '2020-08-12 17:34:26', 0);
INSERT INTO `teacher` VALUES (169, 22, '岸本齐史', '高级讲师', '高级讲师', '2020-08-12 17:44:39', '2020-08-12 17:44:39', 0);
INSERT INTO `teacher` VALUES (170, 23, '卡卡西', '高级讲师', '木叶 卡卡西', '2020-08-12 18:08:57', '2020-08-12 18:08:57', 0);
INSERT INTO `teacher` VALUES (171, 24, '药水哥', '超级讲师', '多年药水企业实战经验', '2020-08-12 18:12:44', '2020-08-12 18:12:44', 0);
INSERT INTO `teacher` VALUES (172, 25, '一拳超人一拳超人', '一拳超人', '一拳超人', '2020-08-12 18:13:57', '2020-08-12 18:13:57', 0);
INSERT INTO `teacher` VALUES (173, 26, '岸本齐史', '高级讲师', '高级讲师', '2020-08-12 18:15:16', '2020-08-12 18:15:16', 0);
INSERT INTO `teacher` VALUES (174, 27, '琦玉2', '高级讲师', '一拳超人', '2020-08-12 18:19:16', '2020-08-12 18:20:00', 0);
INSERT INTO `teacher` VALUES (175, 28, '大是大非三11111', '大是大非三1111', '大是大非三111', '2020-08-12 18:53:42', '2020-08-12 18:55:41', 0);
INSERT INTO `teacher` VALUES (176, 29, '好大哥', '高级讲师', '溜达秘籍溜达秘籍', '2020-08-14 18:08:24', '2020-08-14 18:08:24', 0);
INSERT INTO `teacher` VALUES (177, 30, '燕寄雨', '掌门', '天下刀宗天下刀宗天下刀宗', '2020-08-19 11:53:13', '2020-08-19 11:54:02', 0);
INSERT INTO `teacher` VALUES (180, 33, '维尼', '高级讲师', '多年企业实战经验', '2022-09-24 19:40:23', '2022-09-24 19:40:23', 0);
INSERT INTO `teacher` VALUES (183, 36, 'Domenic', '高级讲师', '多年企业实战经验', '2022-10-01 13:54:41', '2022-10-01 13:54:41', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册手机',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码（可以为空，支持只用验证码注册、登录）',
  `reg_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `account_non_expired` bit(1) NULL DEFAULT b'1' COMMENT '是否有效用户',
  `credentials_non_expired` bit(1) NULL DEFAULT b'1' COMMENT '账号是否未过期',
  `account_non_locked` bit(1) NULL DEFAULT b'1' COMMENT '是否未锁定',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '用户状态：ENABLE能登录，DISABLE不能登录',
  `is_del` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_phone_is_del`(`phone`, `is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100030024 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (100030011, '15321919577', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/06/28/15933251448762927.png', '15321919577', '$2a$10$hvQ3jPvB.pMEA2IvcQNkUumCivXtd47mQqSmqD0.5Ej2AuuS0ciQu', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 10:19:15', '2020-07-10 10:19:15');
INSERT INTO `user` VALUES (100030012, '15510792994', NULL, '15510792994', '$2a$10$h815kSB3UYIct1lPk7tybesRd.JdAPvnJKwSBkauGlNiIJHKpUsuS', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 10:43:01', '2020-07-10 10:43:01');
INSERT INTO `user` VALUES (100030013, '15801363456', NULL, '15801363456', '$2a$10$JsBLd.2kpFjPWx4dGev1Mut..mLLTTXrM2qVb6nCPhOhgFu7RoGmK', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 11:09:11', '2020-07-10 11:09:11');
INSERT INTO `user` VALUES (100030014, '15321919571', NULL, '15321919571', '$2a$10$.15BYpIXvEyUIpcuAEKdN.AcVGWjs7gi4KXTzGMh15aDabkM0LZMe', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 11:10:26', '2020-07-10 11:10:26');
INSERT INTO `user` VALUES (100030015, '15801363195', NULL, '15801363195', '$2a$10$FWWb4sULtpEr72mRfrEWFO5Wxxxfu0gnk8jJvtvmyUgHV7y.AysOm', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 11:21:50', '2020-07-10 11:21:50');
INSERT INTO `user` VALUES (100030016, '15510792995', NULL, '15510792995', '$2a$10$DDOW0oJO9cNm.ZEDNmJmF.AZhsQxoyQ84zSx.UKZBbc58qJWh9HSy', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 11:23:56', '2020-07-10 11:23:56');
INSERT INTO `user` VALUES (100030017, '15811111111', NULL, '15811111111', '$2a$10$j08ZtKUfYeQ5cTCRLoeFeuNDmob1DnLRK7Mfkdhr1/SuUKhqkwkCC', NULL, b'1', b'1', b'1', 'DISABLE', b'1', '2020-07-10 11:25:45', '2020-07-13 10:56:31');
INSERT INTO `user` VALUES (100030018, '15813795039', NULL, '15813795039', '$2a$10$dudhkaLfSJJhpy7q5dqX4uEbmWk9XpS8UcpmzGIM8YI3UWGzOcMHm', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 12:17:35', '2020-07-10 12:17:35');
INSERT INTO `user` VALUES (100030019, '18201288771', 'https://edu-lagou.oss-cn-beijing.aliyuncs.com/images/2020/07/10/15943594999396473.png', '18201288771', '$2a$10$XmknffykNPNMs97wJKtOwem6tR8HGMQTx0PfALGA66311pzrW8rq2', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 12:20:16', '2020-07-10 12:20:16');
INSERT INTO `user` VALUES (100030020, '18211111111', NULL, '18211111111', '$2a$10$zwz0Qp6H0TYZjDs0hKwiU.wKb91ws4xYkfFf1tujgPg/AcPXTChN2', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-10 13:57:41', '2020-07-10 13:57:41');
INSERT INTO `user` VALUES (100030021, '15811111111', NULL, '15811111111', '$2a$10$LeMiCC/TNUXdvSAaXmUmn.WAGcmkcBVKG4oAhbqZDAneCBOUgVc1.', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-13 11:35:20', '2020-07-13 11:35:20');
INSERT INTO `user` VALUES (100030022, '用户8666', NULL, '18201288666', '$2a$10$zO8M7N/f53OAuyo1GqlW5ujlj3KSeb9lKMwNCNVyuLPNtTfKddo2.', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2020-07-13 17:43:52', '2020-07-13 17:43:52');
INSERT INTO `user` VALUES (100030023, 'Domenic', NULL, '12638672950', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, b'1', b'1', b'1', 'ENABLE', b'0', '2022-10-04 14:22:21', '2022-10-04 14:22:29');

-- ----------------------------
-- Table structure for user_phone_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `user_phone_verification_code`;
CREATE TABLE `user_phone_verification_code`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `verification_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '验证码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `isCheck` bit(1) NULL DEFAULT b'0' COMMENT '验证码是否校验过',
  `check_times` int(2) NULL DEFAULT 0 COMMENT '校验次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `l_phone_verification_code_ind_01`(`phone`, `create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33317 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_phone_verification_code
-- ----------------------------
INSERT INTO `user_phone_verification_code` VALUES (33305, '18201288775', '111111', '2020-07-03 23:59:31', b'1', 80);
INSERT INTO `user_phone_verification_code` VALUES (33306, '008615321919577', '472148', '2020-07-17 16:41:21', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33307, '008615321919577', '254709', '2020-07-17 16:53:02', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33308, '0086', '149696', '2020-07-17 17:33:19', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33309, '0086', '164595', '2020-07-17 18:00:48', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33310, '008615321919577', '994241', '2020-07-17 18:01:27', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33311, '008615321919577', '775431', '2020-07-17 18:04:31', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33312, '008615321919577', '610538', '2020-07-17 18:06:45', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33313, '008615321919577', '317040', '2020-07-17 18:17:05', b'0', 0);
INSERT INTO `user_phone_verification_code` VALUES (33314, '008618201288770', '956444', '2020-07-23 16:18:56', b'1', 2);
INSERT INTO `user_phone_verification_code` VALUES (33315, '18201288771', '029570', '2020-07-23 18:01:20', b'1', 2);
INSERT INTO `user_phone_verification_code` VALUES (33316, '18201288771', '058365', '2020-07-23 19:11:35', b'1', 2);

-- ----------------------------
-- Table structure for user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_role_relation`;
CREATE TABLE `user_role_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role_relation
-- ----------------------------
INSERT INTO `user_role_relation` VALUES (1, 100030012, 1, '2020-07-20 15:42:57', '2020-07-20 15:42:57', 'system', 'system');
INSERT INTO `user_role_relation` VALUES (3, 100030014, 1, '2020-07-20 07:57:58', '2020-07-20 07:57:58', '15510792995', '15510792995');
INSERT INTO `user_role_relation` VALUES (4, 100030019, 1, '2020-07-20 07:58:05', '2020-07-20 07:58:05', '15510792995', '15510792995');
INSERT INTO `user_role_relation` VALUES (6, 100030011, 3, '2020-07-20 07:58:17', '2020-07-20 07:58:17', '15510792995', '15510792995');
INSERT INTO `user_role_relation` VALUES (7, 100030011, 4, '2020-07-20 07:58:17', '2020-07-20 07:58:17', '15510792995', '15510792995');
INSERT INTO `user_role_relation` VALUES (8, 100030011, 1, '2020-07-21 02:30:19', '2020-07-21 02:30:19', '15510792995', '15510792995');
INSERT INTO `user_role_relation` VALUES (9, 100030016, 1, '2020-07-28 03:55:44', '2020-07-28 03:55:44', '15510792995', '15510792995');
INSERT INTO `user_role_relation` VALUES (19, 100030023, 1, '2022-10-04 20:03:58', '2022-10-04 20:03:58', 'system', 'system');
INSERT INTO `user_role_relation` VALUES (20, 100030023, 3, '2022-10-04 20:03:58', '2022-10-04 20:03:58', 'system', 'system');
INSERT INTO `user_role_relation` VALUES (21, 100030023, 4, '2022-10-04 20:03:58', '2022-10-04 20:03:58', 'system', 'system');

-- ----------------------------
-- Table structure for user_weixin
-- ----------------------------
DROP TABLE IF EXISTS `user_weixin`;
CREATE TABLE `user_weixin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `union_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '认证id,微信对应的时unionId',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openId',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `portrait` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别, 1-男，2-女',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_del` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oauthId_and_oauthType_unique`(`union_id`, `open_id`, `is_del`) USING BTREE,
  UNIQUE INDEX `userId_and_oauthType_unique_index`(`user_id`, `open_id`, `is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 506562 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user_weixin
-- ----------------------------
INSERT INTO `user_weixin` VALUES (506561, 100030019, 'oXEX_svcbl-mCDhWloqlEFNVHgP8', 'oGYgl0u0vZMKVAByQ3hR0i7jpKew', 'leo', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epKy1c3YeeI5vRqSxqDkaYc9XDuPao1BRLFKGf65SiaRIFqHTpeJg90RfrCXCo7WkicpfsPdKTdNTpA/132', '', 1, '2020-07-23 19:12:21', '2020-07-23 19:12:21', b'0');

SET FOREIGN_KEY_CHECKS = 1;
