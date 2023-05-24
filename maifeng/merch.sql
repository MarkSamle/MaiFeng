/*
 Navicat Premium Data Transfer

 Source Server         : mypc
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : maifeng

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 05/02/2022 16:53:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for merch_merchset
-- ----------------------------
DROP TABLE IF EXISTS `merch_merchset`;
CREATE TABLE `merch_merchset`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merch_merchset_created_by_id_1d644d74_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `merch_merchset_last_edited_by_id_e27e0b76_fk_users_use`(`last_edited_by_id`) USING BTREE,
  CONSTRAINT `merch_merchset_created_by_id_1d644d74_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchset_last_edited_by_id_e27e0b76_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchset
-- ----------------------------
INSERT INTO `merch_merchset` VALUES (1, '季节社', '', '2022-02-05 08:01:27.297460', '2022-02-05 08:01:27.297460', '0', 2, 2);
INSERT INTO `merch_merchset` VALUES (2, '杂货社', '', '2022-02-05 08:01:41.684607', '2022-02-05 08:01:41.684607', '0', 2, 2);
INSERT INTO `merch_merchset` VALUES (3, '发饰链', '', '2022-02-05 08:01:52.872137', '2022-02-05 08:01:52.872137', '0', 2, 2);

-- ----------------------------
-- Table structure for merch_merchtype
-- ----------------------------
DROP TABLE IF EXISTS `merch_merchtype`;
CREATE TABLE `merch_merchtype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  `typeset_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merch_merchtype_typeset_id_0b178166_fk_merch_typeset_id`(`typeset_id`) USING BTREE,
  INDEX `merch_merchtype_created_by_id_390b83ae_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `merch_merchtype_last_edited_by_id_52d4b4c8_fk_users_use`(`last_edited_by_id`) USING BTREE,
  CONSTRAINT `merch_merchtype_created_by_id_390b83ae_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtype_last_edited_by_id_52d4b4c8_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtype_typeset_id_0b178166_fk_merch_typeset_id` FOREIGN KEY (`typeset_id`) REFERENCES `merch_typeset` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchtype
-- ----------------------------
INSERT INTO `merch_merchtype` VALUES (1, '帽子', '', '2022-02-05 08:05:19.733243', '2022-02-05 08:05:19.733243', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (2, '手套', '', '2022-02-05 08:05:30.523088', '2022-02-05 08:05:30.523088', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (3, '围巾', '', '2022-02-05 08:05:41.530811', '2022-02-05 08:05:41.530811', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (4, '眼镜', '', '2022-02-05 08:05:53.957101', '2022-02-05 08:05:53.957101', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (5, '冬暖', '', '2022-02-05 08:06:07.237494', '2022-02-05 08:06:07.237494', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (6, '夏凉', '', '2022-02-05 08:06:16.867979', '2022-02-05 08:06:16.867979', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (7, '日用', '', '2022-02-05 08:06:25.614861', '2022-02-05 08:06:25.614861', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (8, '雨具', '', '2022-02-05 08:06:40.468187', '2022-02-05 08:06:40.468187', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (9, '时尚杯', '', '2022-02-05 08:11:19.186174', '2022-02-05 08:11:19.186174', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (10, '家居拖鞋', '', '2022-02-05 08:12:04.108969', '2022-02-05 08:12:04.108969', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (11, '迷你包', '', '2022-02-05 08:12:11.573350', '2022-02-05 08:12:11.573350', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (12, '小家电', '', '2022-02-05 08:12:19.157377', '2022-02-05 08:12:19.157377', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (13, '毛绒玩具', '', '2022-02-05 08:12:26.225918', '2022-02-05 08:12:26.225918', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (14, '枕垫', '', '2022-02-05 08:12:33.387362', '2022-02-05 08:12:33.387362', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (15, '防护', '', '2022-02-05 08:12:40.352885', '2022-02-05 08:12:40.352885', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (16, '小帮手', '', '2022-02-05 08:12:47.532364', '2022-02-05 08:12:47.532364', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (17, '环保袋', '', '2022-02-05 08:12:54.900674', '2022-02-05 08:12:54.900674', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (18, '浴厨用品', '', '2022-02-05 08:13:02.073584', '2022-02-05 08:13:02.073584', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (19, '功能性摆件', '', '2022-02-05 08:13:09.337538', '2022-02-05 08:13:09.337538', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (20, '装饰性摆件', '', '2022-02-05 08:13:17.744498', '2022-02-05 08:13:17.744498', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (21, '动漫IP', '', '2022-02-05 08:13:45.347890', '2022-02-05 08:13:45.347890', '0', 2, 2, 4);
INSERT INTO `merch_merchtype` VALUES (22, '玩具', '', '2022-02-05 08:13:52.156080', '2022-02-05 08:13:52.156080', '0', 2, 2, 4);
INSERT INTO `merch_merchtype` VALUES (23, '电子烟', '', '2022-02-05 08:14:02.977761', '2022-02-05 08:14:02.977761', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (24, '手表', '', '2022-02-05 08:14:10.264234', '2022-02-05 08:14:10.264234', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (25, '耳机', '', '2022-02-05 08:14:16.698063', '2022-02-05 08:14:16.698063', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (26, '手机周边', '', '2022-02-05 08:14:25.073943', '2022-02-05 08:14:25.073943', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (27, '数据线', '', '2022-02-05 08:14:32.440967', '2022-02-05 08:14:32.440967', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (28, '包装工具', '', '2022-02-05 08:14:38.784631', '2022-02-05 08:14:38.784631', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (29, '笔', '', '2022-02-05 08:14:45.949531', '2022-02-05 08:14:45.949531', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (30, '笔袋', '', '2022-02-05 08:14:52.392894', '2022-02-05 08:14:52.392894', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (31, '贴纸', '', '2022-02-05 08:14:59.345723', '2022-02-05 08:14:59.345723', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (32, '文本', '', '2022-02-05 08:15:08.866641', '2022-02-05 08:15:08.866641', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (33, '文具周边', '', '2022-02-05 08:15:16.156655', '2022-02-05 08:15:16.156655', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (34, '发夹', '', '2022-02-05 08:16:03.346858', '2022-02-05 08:16:03.346858', '0', 2, 2, 7);
INSERT INTO `merch_merchtype` VALUES (35, '头饰', '', '2022-02-05 08:16:10.684313', '2022-02-05 08:16:10.684313', '0', 2, 2, 7);
INSERT INTO `merch_merchtype` VALUES (36, '耳环', '', '2022-02-05 08:16:18.326686', '2022-02-05 08:16:18.326686', '0', 2, 2, 8);
INSERT INTO `merch_merchtype` VALUES (37, '戒指', '', '2022-02-05 08:16:26.161601', '2022-02-05 08:16:26.161601', '0', 2, 2, 8);
INSERT INTO `merch_merchtype` VALUES (38, '链', '', '2022-02-05 08:16:32.698394', '2022-02-05 08:16:32.698394', '0', 2, 2, 8);

-- ----------------------------
-- Table structure for merch_merchtypechild
-- ----------------------------
DROP TABLE IF EXISTS `merch_merchtypechild`;
CREATE TABLE `merch_merchtypechild`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  `merchtype_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merch_merchtypechild_created_by_id_4d025ee4_fk_users_use`(`created_by_id`) USING BTREE,
  INDEX `merch_merchtypechild_last_edited_by_id_d5618ed9_fk_users_use`(`last_edited_by_id`) USING BTREE,
  INDEX `merch_merchtypechild_merchtype_id_9cb5d80e_fk_merch_merchtype_id`(`merchtype_id`) USING BTREE,
  CONSTRAINT `merch_merchtypechild_created_by_id_4d025ee4_fk_users_use` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtypechild_last_edited_by_id_d5618ed9_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtypechild_merchtype_id_9cb5d80e_fk_merch_merchtype_id` FOREIGN KEY (`merchtype_id`) REFERENCES `merch_merchtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchtypechild
-- ----------------------------
INSERT INTO `merch_merchtypechild` VALUES (1, '八角帽', '', '2022-02-05 08:21:14.847128', '2022-02-05 08:21:14.848125', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (2, '渔夫帽', '', '2022-02-05 08:21:29.492152', '2022-02-05 08:21:29.492152', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (3, '棒球帽', '', '2022-02-05 08:21:39.347845', '2022-02-05 08:21:39.347845', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (4, '草帽', '', '2022-02-05 08:21:51.843978', '2022-02-05 08:21:51.843978', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (5, '礼帽', '', '2022-02-05 08:22:14.831515', '2022-02-05 08:22:14.831515', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (6, '西瓜帽', '', '2022-02-05 08:22:26.335208', '2022-02-05 08:22:26.335208', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (7, '半指手套', '', '2022-02-05 08:22:37.500514', '2022-02-05 08:22:37.500514', '0', 2, 2, 2);
INSERT INTO `merch_merchtypechild` VALUES (8, '包指手套', '', '2022-02-05 08:22:44.922205', '2022-02-05 08:22:44.922205', '0', 2, 2, 2);
INSERT INTO `merch_merchtypechild` VALUES (9, '五指手套', '', '2022-02-05 08:22:53.708807', '2022-02-05 08:22:53.708807', '0', 2, 2, 2);
INSERT INTO `merch_merchtypechild` VALUES (10, '方巾', '', '2022-02-05 08:23:12.515904', '2022-02-05 08:23:12.515904', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (11, '围巾', '', '2022-02-05 08:23:20.749332', '2022-02-05 08:23:20.749332', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (12, '披肩', '', '2022-02-05 08:23:27.531531', '2022-02-05 08:23:27.531531', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (13, '长巾', '', '2022-02-05 08:23:36.558400', '2022-02-05 08:23:36.558400', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (14, '儿童镜', '', '2022-02-05 08:24:13.853374', '2022-02-05 08:24:13.853374', '0', 2, 2, 4);
INSERT INTO `merch_merchtypechild` VALUES (15, '平光镜', '', '2022-02-05 08:24:24.916779', '2022-02-05 08:24:24.916779', '0', 2, 2, 4);
INSERT INTO `merch_merchtypechild` VALUES (16, '太阳镜', '', '2022-02-05 08:24:34.512204', '2022-02-05 08:24:34.512204', '0', 2, 2, 4);
INSERT INTO `merch_merchtypechild` VALUES (17, '电暖袋', '', '2022-02-05 08:25:51.184887', '2022-02-05 08:25:51.184887', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (18, '耳罩', '', '2022-02-05 08:26:00.875714', '2022-02-05 08:26:00.875714', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (19, '暖身贴', '', '2022-02-05 08:26:11.682808', '2022-02-05 08:26:11.682808', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (20, '热水袋', '', '2022-02-05 08:26:23.516336', '2022-02-05 08:26:23.516336', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (21, '扇子', '', '2022-02-05 08:27:11.044004', '2022-02-05 08:27:11.044004', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (22, '冰垫', '', '2022-02-05 08:27:19.493316', '2022-02-05 08:27:19.493316', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (23, '风衣', '', '2022-02-05 08:27:28.494158', '2022-02-05 08:27:28.495164', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (24, '小风扇', '', '2022-02-05 08:27:35.301950', '2022-02-05 08:27:35.301950', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (25, '口罩', '', '2022-02-05 08:27:47.322442', '2022-02-05 08:27:47.322442', '0', 2, 2, 7);
INSERT INTO `merch_merchtypechild` VALUES (26, '袖套', '', '2022-02-05 08:27:58.378626', '2022-02-05 08:27:58.378626', '0', 2, 2, 7);
INSERT INTO `merch_merchtypechild` VALUES (27, '防雨伞', '', '2022-02-05 08:28:08.592514', '2022-02-05 08:28:08.592514', '0', 2, 2, 8);
INSERT INTO `merch_merchtypechild` VALUES (28, '防紫外伞', '', '2022-02-05 08:28:17.700140', '2022-02-05 08:28:17.700140', '0', 2, 2, 8);
INSERT INTO `merch_merchtypechild` VALUES (29, '雨具', '', '2022-02-05 08:28:24.890387', '2022-02-05 08:28:24.890387', '0', 2, 2, 8);
INSERT INTO `merch_merchtypechild` VALUES (30, '杯子周边', '', '2022-02-05 08:21:14.847128', '2022-02-05 08:21:14.848125', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (31, '玻璃杯', '', '2022-02-05 08:21:29.492152', '2022-02-05 08:21:29.492152', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (32, '不锈钢杯', '', '2022-02-05 08:21:39.347845', '2022-02-05 08:21:39.347845', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (33, '塑料杯', '', '2022-02-05 08:21:51.843978', '2022-02-05 08:21:51.843978', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (34, '陶瓷杯', '', '2022-02-05 08:22:14.831515', '2022-02-05 08:22:14.831515', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (35, '半包拖', '', '2022-02-05 08:22:26.335208', '2022-02-05 08:22:26.335208', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (36, '开口拖', '', '2022-02-05 08:22:37.500514', '2022-02-05 08:22:37.500514', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (37, '全包拖', '', '2022-02-05 08:22:44.922205', '2022-02-05 08:22:44.922205', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (38, '人字拖', '', '2022-02-05 08:22:53.708807', '2022-02-05 08:22:53.708807', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (39, '一字拖', '', '2022-02-05 08:23:12.515904', '2022-02-05 08:23:12.515904', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (40, '卡包', '', '2022-02-05 08:23:20.749332', '2022-02-05 08:23:20.749332', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (41, '卡套', '', '2022-02-05 08:23:27.531531', '2022-02-05 08:23:27.531531', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (42, '零钱包', '', '2022-02-05 08:23:36.558400', '2022-02-05 08:23:36.558400', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (43, '手机包', '', '2022-02-05 08:24:13.853374', '2022-02-05 08:24:13.853374', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (44, '锁包扣', '', '2022-02-05 08:24:24.916779', '2022-02-05 08:24:24.916779', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (45, '电吹风', '', '2022-02-05 08:24:34.512204', '2022-02-05 08:24:34.512204', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (46, '加湿器', '', '2022-02-05 08:25:51.184887', '2022-02-05 08:25:51.184887', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (47, '卷发棒', '', '2022-02-05 08:26:00.875714', '2022-02-05 08:26:00.875714', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (48, '毛衣美容器', '', '2022-02-05 08:26:11.682808', '2022-02-05 08:26:11.682808', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (49, '排插', '', '2022-02-05 08:26:23.516336', '2022-02-05 08:26:23.516336', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (50, '直发器', '', '2022-02-05 08:27:11.044004', '2022-02-05 08:27:11.044004', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (51, '按摩棒', '', '2022-02-05 08:27:19.493316', '2022-02-05 08:27:19.493316', '0', 2, 2, 13);
INSERT INTO `merch_merchtypechild` VALUES (52, '公仔', '', '2022-02-05 08:27:28.494158', '2022-02-05 08:27:28.495164', '0', 2, 2, 13);
INSERT INTO `merch_merchtypechild` VALUES (53, '抱枕', '', '2022-02-05 08:27:35.301950', '2022-02-05 08:27:35.301950', '0', 2, 2, 14);
INSERT INTO `merch_merchtypechild` VALUES (54, '颈枕', '', '2022-02-05 08:27:47.322442', '2022-02-05 08:27:47.322442', '0', 2, 2, 14);
INSERT INTO `merch_merchtypechild` VALUES (55, '其他枕垫', '', '2022-02-05 08:27:58.378626', '2022-02-05 08:27:58.378626', '0', 2, 2, 14);
INSERT INTO `merch_merchtypechild` VALUES (56, '眼镜盒', '', '2022-02-05 08:28:08.592514', '2022-02-05 08:28:08.592514', '0', 2, 2, 15);
INSERT INTO `merch_merchtypechild` VALUES (57, '眼罩', '', '2022-02-05 08:28:17.700140', '2022-02-05 08:28:17.700140', '0', 2, 2, 15);
INSERT INTO `merch_merchtypechild` VALUES (58, '服饰用品', '', '2022-02-05 08:28:24.890387', '2022-02-05 08:28:24.890387', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (59, '驱蚊虫', '', '2022-02-05 08:21:14.847128', '2022-02-05 08:21:14.848125', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (60, '收纳', '', '2022-02-05 08:21:29.492152', '2022-02-05 08:21:29.492152', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (61, '鞋用品', '', '2022-02-05 08:21:39.347845', '2022-02-05 08:21:39.347845', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (62, '车载', '', '2022-02-05 08:21:51.843978', '2022-02-05 08:21:51.843978', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (63, '充电宝', '', '2022-02-05 08:22:14.831515', '2022-02-05 08:22:14.831515', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (64, '充电头', '', '2022-02-05 08:22:26.335208', '2022-02-05 08:22:26.335208', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (65, '电池', '', '2022-02-05 08:22:37.500514', '2022-02-05 08:22:37.500514', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (66, '手机壳', '', '2022-02-05 08:22:44.922205', '2022-02-05 08:22:44.922205', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (67, '手机绳', '', '2022-02-05 08:22:53.708807', '2022-02-05 08:22:53.708807', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (68, '手机支架', '', '2022-02-05 08:23:12.515904', '2022-02-05 08:23:12.515904', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (69, '手游工具', '', '2022-02-05 08:23:20.749332', '2022-02-05 08:23:20.749332', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (70, '音箱', '', '2022-02-05 08:23:27.531531', '2022-02-05 08:23:27.531531', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (71, '组合套装', '', '2022-02-05 08:23:36.558400', '2022-02-05 08:23:36.558400', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (72, 'Type-c数据线', '', '2022-02-05 08:24:13.853374', '2022-02-05 08:24:13.853374', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (73, '安卓数据线', '', '2022-02-05 08:24:24.916779', '2022-02-05 08:24:24.916779', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (74, '苹果数据线', '', '2022-02-05 08:24:34.512204', '2022-02-05 08:24:34.512204', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (75, '组合数据线', '', '2022-02-05 08:25:51.184887', '2022-02-05 08:25:51.184887', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (76, '包装纸', '', '2022-02-05 08:26:00.875714', '2022-02-05 08:26:00.875714', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (77, '礼品袋', '', '2022-02-05 08:26:11.682808', '2022-02-05 08:26:11.682808', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (78, '礼品盒', '', '2022-02-05 08:26:23.516336', '2022-02-05 08:26:23.516336', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (79, '明信片/贺卡', '', '2022-02-05 08:27:11.044004', '2022-02-05 08:27:11.044004', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (80, '笔芯', '', '2022-02-05 08:27:19.493316', '2022-02-05 08:27:19.493316', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (81, '钢笔', '', '2022-02-05 08:27:28.494158', '2022-02-05 08:27:28.495164', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (82, '墨水', '', '2022-02-05 08:27:35.301950', '2022-02-05 08:27:35.301950', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (83, '水彩笔', '', '2022-02-05 08:27:47.322442', '2022-02-05 08:27:47.322442', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (84, '圆珠笔', '', '2022-02-05 08:27:58.378626', '2022-02-05 08:27:58.378626', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (85, '中性笔', '', '2022-02-05 08:28:08.592514', '2022-02-05 08:28:08.592514', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (86, 'PU料笔袋', '', '2022-02-05 08:28:17.700140', '2022-02-05 08:28:17.700140', '0', 2, 2, 30);
INSERT INTO `merch_merchtypechild` VALUES (87, '布料笔袋', '', '2022-02-05 08:28:24.890387', '2022-02-05 08:28:24.890387', '0', 2, 2, 30);
INSERT INTO `merch_merchtypechild` VALUES (88, '文具盒', '', '2022-02-05 08:21:14.847128', '2022-02-05 08:21:14.848125', '0', 2, 2, 30);
INSERT INTO `merch_merchtypechild` VALUES (89, '功能贴', '', '2022-02-05 08:21:29.492152', '2022-02-05 08:21:29.492152', '0', 2, 2, 31);
INSERT INTO `merch_merchtypechild` VALUES (90, '卡通贴纸', '', '2022-02-05 08:21:39.347845', '2022-02-05 08:21:39.347845', '0', 2, 2, 31);
INSERT INTO `merch_merchtypechild` VALUES (91, '装饰贴纸', '', '2022-02-05 08:21:51.843978', '2022-02-05 08:21:51.843978', '0', 2, 2, 31);
INSERT INTO `merch_merchtypechild` VALUES (92, '车线本', '', '2022-02-05 08:22:14.831515', '2022-02-05 08:22:14.831515', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (93, '胶套本', '', '2022-02-05 08:22:26.335208', '2022-02-05 08:22:26.335208', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (94, '精装本', '', '2022-02-05 08:22:37.500514', '2022-02-05 08:22:37.500514', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (95, '线圈本', '', '2022-02-05 08:22:44.922205', '2022-02-05 08:22:44.922205', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (96, '回形针', '', '2022-02-05 08:22:53.708807', '2022-02-05 08:22:53.708807', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (97, '夹子', '', '2022-02-05 08:23:12.515904', '2022-02-05 08:23:12.515904', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (98, '胶带', '', '2022-02-05 08:23:20.749332', '2022-02-05 08:23:20.749332', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (99, '台历', '', '2022-02-05 08:23:27.531531', '2022-02-05 08:23:27.531531', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (100, '橡皮', '', '2022-02-05 08:23:36.558400', '2022-02-05 08:23:36.558400', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (101, '印章', '', '2022-02-05 08:24:13.853374', '2022-02-05 08:24:13.853374', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (102, '功能袋', '', '2022-02-05 08:24:24.916779', '2022-02-05 08:24:24.916779', '0', 2, 2, 17);
INSERT INTO `merch_merchtypechild` VALUES (103, '装饰袋', '', '2022-02-05 08:24:34.512204', '2022-02-05 08:24:34.512204', '0', 2, 2, 17);
INSERT INTO `merch_merchtypechild` VALUES (104, '厨房小物', '', '2022-02-05 08:25:51.184887', '2022-02-05 08:25:51.184887', '0', 2, 2, 18);
INSERT INTO `merch_merchtypechild` VALUES (105, '毛巾', '', '2022-02-05 08:26:00.875714', '2022-02-05 08:26:00.875714', '0', 2, 2, 18);
INSERT INTO `merch_merchtypechild` VALUES (106, '空气清新剂', '', '2022-02-05 08:26:11.682808', '2022-02-05 08:26:11.682808', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (107, '闹钟', '', '2022-02-05 08:26:23.516336', '2022-02-05 08:26:23.516336', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (108, '沙漏', '', '2022-02-05 08:27:11.044004', '2022-02-05 08:27:11.044004', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (109, '台灯', '', '2022-02-05 08:27:19.493316', '2022-02-05 08:27:19.493316', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (110, '相框', '', '2022-02-05 08:27:28.494158', '2022-02-05 08:27:28.495164', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (111, '香薰', '', '2022-02-05 08:27:35.301950', '2022-02-05 08:27:35.301950', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (112, '音乐盒', '', '2022-02-05 08:27:47.322442', '2022-02-05 08:27:47.322442', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (113, '陈设摆件', '', '2022-02-05 08:27:58.378626', '2022-02-05 08:27:58.378626', '0', 2, 2, 20);
INSERT INTO `merch_merchtypechild` VALUES (114, '干花', '', '2022-02-05 08:28:08.592514', '2022-02-05 08:28:08.592514', '0', 2, 2, 20);
INSERT INTO `merch_merchtypechild` VALUES (115, '卡通', '', '2022-02-05 08:28:17.700140', '2022-02-05 08:28:17.700140', '0', 2, 2, 21);
INSERT INTO `merch_merchtypechild` VALUES (116, '手办', '', '2022-02-05 08:28:24.890387', '2022-02-05 08:28:24.890387', '0', 2, 2, 21);
INSERT INTO `merch_merchtypechild` VALUES (117, '发泄玩具', '', '2022-02-05 08:21:14.847128', '2022-02-05 08:21:14.848125', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (118, '过家家', '', '2022-02-05 08:21:29.492152', '2022-02-05 08:21:29.492152', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (119, '机器人', '', '2022-02-05 08:21:39.347845', '2022-02-05 08:21:39.347845', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (120, '玩具车', '', '2022-02-05 08:21:51.843978', '2022-02-05 08:21:51.843978', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (121, '玩沙戏水', '', '2022-02-05 08:22:14.831515', '2022-02-05 08:22:14.831515', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (122, '无人机', '', '2022-02-05 08:22:26.335208', '2022-02-05 08:22:26.335208', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (123, '早教玩具', '', '2022-02-05 08:22:37.500514', '2022-02-05 08:22:37.500514', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (124, '智力玩具', '', '2022-02-05 08:22:44.922205', '2022-02-05 08:22:44.922205', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (125, '套装', '', '2022-02-05 08:22:53.708807', '2022-02-05 08:22:53.708807', '0', 2, 2, 23);
INSERT INTO `merch_merchtypechild` VALUES (126, '烟弹', '', '2022-02-05 08:23:12.515904', '2022-02-05 08:23:12.515904', '0', 2, 2, 23);
INSERT INTO `merch_merchtypechild` VALUES (127, '一次性小烟', '', '2022-02-05 08:23:20.749332', '2022-02-05 08:23:20.749332', '0', 2, 2, 23);
INSERT INTO `merch_merchtypechild` VALUES (128, '钢带表', '', '2022-02-05 08:23:27.531531', '2022-02-05 08:23:27.531531', '0', 2, 2, 24);
INSERT INTO `merch_merchtypechild` VALUES (129, '链条表', '', '2022-02-05 08:23:36.558400', '2022-02-05 08:23:36.558400', '0', 2, 2, 24);
INSERT INTO `merch_merchtypechild` VALUES (130, '皮带表', '', '2022-02-05 08:24:13.853374', '2022-02-05 08:24:13.853374', '0', 2, 2, 24);
INSERT INTO `merch_merchtypechild` VALUES (131, '挂耳耳机', '', '2022-02-05 08:24:24.916779', '2022-02-05 08:24:24.916779', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (132, '平耳耳机', '', '2022-02-05 08:24:34.512204', '2022-02-05 08:24:34.512204', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (133, '入耳耳机', '', '2022-02-05 08:25:51.184887', '2022-02-05 08:25:51.184887', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (134, '头戴耳机', '', '2022-02-05 08:26:00.875714', '2022-02-05 08:26:00.875714', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (135, 'BB夹', '', '2022-02-05 08:26:11.682808', '2022-02-05 08:26:11.682808', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (136, '发插', '', '2022-02-05 08:26:23.516336', '2022-02-05 08:26:23.516336', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (137, '发梳', '', '2022-02-05 08:27:11.044004', '2022-02-05 08:27:11.044004', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (138, '马尾夹', '', '2022-02-05 08:27:19.493316', '2022-02-05 08:27:19.493316', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (139, '青蛙夹', '', '2022-02-05 08:27:28.494158', '2022-02-05 08:27:28.495164', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (140, '头箍', '', '2022-02-05 08:27:35.301950', '2022-02-05 08:27:35.301950', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (141, '鸭夹', '', '2022-02-05 08:27:47.322442', '2022-02-05 08:27:47.322442', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (142, '一字夹', '', '2022-02-05 08:27:58.378626', '2022-02-05 08:27:58.378626', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (143, '爪夹', '', '2022-02-05 08:28:08.592514', '2022-02-05 08:28:08.592514', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (144, '组合发饰', '', '2022-02-05 08:28:17.700140', '2022-02-05 08:28:17.700140', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (145, '发带', '', '2022-02-05 08:28:24.890387', '2022-02-05 08:28:24.890387', '0', 2, 2, 35);
INSERT INTO `merch_merchtypechild` VALUES (146, '发束', '', '2022-02-05 08:21:14.847128', '2022-02-05 08:21:14.848125', '0', 2, 2, 35);
INSERT INTO `merch_merchtypechild` VALUES (147, '橡巾', '', '2022-02-05 08:21:29.492152', '2022-02-05 08:21:29.492152', '0', 2, 2, 35);
INSERT INTO `merch_merchtypechild` VALUES (148, '耳丁', '', '2022-02-05 08:21:39.347845', '2022-02-05 08:21:39.347845', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (149, '耳钩', '', '2022-02-05 08:21:51.843978', '2022-02-05 08:21:51.843978', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (150, '耳夹', '', '2022-02-05 08:22:14.831515', '2022-02-05 08:22:14.831515', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (151, '耳线', '', '2022-02-05 08:22:26.335208', '2022-02-05 08:22:26.335208', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (152, '圈环', '', '2022-02-05 08:22:37.500514', '2022-02-05 08:22:37.500514', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (153, '套装耳环', '', '2022-02-05 08:22:44.922205', '2022-02-05 08:22:44.922205', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (154, '单只装戒指', '', '2022-02-05 08:22:53.708807', '2022-02-05 08:22:53.708807', '0', 2, 2, 37);
INSERT INTO `merch_merchtypechild` VALUES (155, '多只装戒指', '', '2022-02-05 08:23:12.515904', '2022-02-05 08:23:12.515904', '0', 2, 2, 37);
INSERT INTO `merch_merchtypechild` VALUES (156, '短项链', '', '2022-02-05 08:23:20.749332', '2022-02-05 08:23:20.749332', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (157, '脚链', '', '2022-02-05 08:23:27.531531', '2022-02-05 08:23:27.531531', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (158, '手链', '', '2022-02-05 08:23:36.558400', '2022-02-05 08:23:36.558400', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (159, '手镯', '', '2022-02-05 08:24:13.853374', '2022-02-05 08:24:13.853374', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (160, '胸针', '', '2022-02-05 08:24:24.916779', '2022-02-05 08:24:24.916779', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (161, '长项链', '', '2022-02-05 08:24:34.512204', '2022-02-05 08:24:34.512204', '0', 2, 2, 38);

-- ----------------------------
-- Table structure for merch_typeset
-- ----------------------------
DROP TABLE IF EXISTS `merch_typeset`;
CREATE TABLE `merch_typeset`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  `merchset_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merch_typeset_created_by_id_d2398028_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `merch_typeset_last_edited_by_id_d83cb1d8_fk_users_use`(`last_edited_by_id`) USING BTREE,
  INDEX `merch_typeset_merchset_id_6bcc5eeb_fk_merch_merchset_id`(`merchset_id`) USING BTREE,
  CONSTRAINT `merch_typeset_created_by_id_d2398028_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_typeset_last_edited_by_id_d83cb1d8_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_typeset_merchset_id_6bcc5eeb_fk_merch_merchset_id` FOREIGN KEY (`merchset_id`) REFERENCES `merch_merchset` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_typeset
-- ----------------------------
INSERT INTO `merch_typeset` VALUES (1, '生活日用', '', '2022-02-05 08:02:25.828060', '2022-02-05 08:02:25.828060', '0', 2, 2, 1);
INSERT INTO `merch_typeset` VALUES (2, '服饰配件', '', '2022-02-05 08:02:36.760891', '2022-02-05 08:02:36.760891', '0', 2, 2, 1);
INSERT INTO `merch_typeset` VALUES (3, '创意家居', '', '2022-02-05 08:02:48.699999', '2022-02-05 08:02:48.699999', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (4, '动漫周边', '', '2022-02-05 08:03:01.773181', '2022-02-05 08:03:01.773181', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (5, '数码周边', '', '2022-02-05 08:03:13.087868', '2022-02-05 08:03:13.087868', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (6, '文创用品', '', '2022-02-05 08:03:24.828096', '2022-02-05 08:03:24.828096', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (7, '发饰', '', '2022-02-05 08:03:40.949430', '2022-02-05 08:03:40.949430', '0', 2, 2, 3);
INSERT INTO `merch_typeset` VALUES (8, '首饰', '', '2022-02-05 08:03:51.449611', '2022-02-05 08:03:51.449611', '0', 2, 2, 3);

SET FOREIGN_KEY_CHECKS = 1;
