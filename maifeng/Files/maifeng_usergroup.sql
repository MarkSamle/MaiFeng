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

 Date: 08/02/2022 13:58:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (3, '发饰链');
INSERT INTO `auth_group` VALUES (1, '季节社');
INSERT INTO `auth_group` VALUES (2, '杂货社');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (1, 1, 1);
INSERT INTO `auth_group_permissions` VALUES (2, 1, 2);
INSERT INTO `auth_group_permissions` VALUES (3, 1, 3);
INSERT INTO `auth_group_permissions` VALUES (4, 1, 4);
INSERT INTO `auth_group_permissions` VALUES (5, 1, 5);
INSERT INTO `auth_group_permissions` VALUES (6, 1, 6);
INSERT INTO `auth_group_permissions` VALUES (7, 1, 7);
INSERT INTO `auth_group_permissions` VALUES (8, 1, 8);
INSERT INTO `auth_group_permissions` VALUES (9, 1, 9);
INSERT INTO `auth_group_permissions` VALUES (10, 1, 10);
INSERT INTO `auth_group_permissions` VALUES (11, 1, 11);
INSERT INTO `auth_group_permissions` VALUES (12, 1, 12);
INSERT INTO `auth_group_permissions` VALUES (13, 1, 13);
INSERT INTO `auth_group_permissions` VALUES (14, 1, 14);
INSERT INTO `auth_group_permissions` VALUES (15, 1, 15);
INSERT INTO `auth_group_permissions` VALUES (16, 1, 16);
INSERT INTO `auth_group_permissions` VALUES (17, 1, 17);
INSERT INTO `auth_group_permissions` VALUES (18, 1, 18);
INSERT INTO `auth_group_permissions` VALUES (19, 1, 19);
INSERT INTO `auth_group_permissions` VALUES (20, 1, 20);
INSERT INTO `auth_group_permissions` VALUES (21, 1, 21);
INSERT INTO `auth_group_permissions` VALUES (22, 1, 22);
INSERT INTO `auth_group_permissions` VALUES (23, 1, 23);
INSERT INTO `auth_group_permissions` VALUES (24, 1, 24);
INSERT INTO `auth_group_permissions` VALUES (25, 1, 25);
INSERT INTO `auth_group_permissions` VALUES (26, 1, 26);
INSERT INTO `auth_group_permissions` VALUES (27, 1, 27);
INSERT INTO `auth_group_permissions` VALUES (28, 1, 28);
INSERT INTO `auth_group_permissions` VALUES (29, 1, 29);
INSERT INTO `auth_group_permissions` VALUES (30, 1, 30);
INSERT INTO `auth_group_permissions` VALUES (31, 1, 31);
INSERT INTO `auth_group_permissions` VALUES (32, 1, 32);
INSERT INTO `auth_group_permissions` VALUES (33, 1, 33);
INSERT INTO `auth_group_permissions` VALUES (34, 1, 34);
INSERT INTO `auth_group_permissions` VALUES (35, 1, 35);
INSERT INTO `auth_group_permissions` VALUES (36, 1, 36);
INSERT INTO `auth_group_permissions` VALUES (37, 1, 37);
INSERT INTO `auth_group_permissions` VALUES (38, 1, 38);
INSERT INTO `auth_group_permissions` VALUES (39, 1, 39);
INSERT INTO `auth_group_permissions` VALUES (40, 1, 40);
INSERT INTO `auth_group_permissions` VALUES (41, 1, 41);
INSERT INTO `auth_group_permissions` VALUES (42, 1, 42);
INSERT INTO `auth_group_permissions` VALUES (43, 1, 43);
INSERT INTO `auth_group_permissions` VALUES (44, 1, 44);
INSERT INTO `auth_group_permissions` VALUES (45, 1, 45);
INSERT INTO `auth_group_permissions` VALUES (46, 1, 46);
INSERT INTO `auth_group_permissions` VALUES (47, 1, 47);
INSERT INTO `auth_group_permissions` VALUES (48, 1, 48);
INSERT INTO `auth_group_permissions` VALUES (49, 1, 49);
INSERT INTO `auth_group_permissions` VALUES (50, 1, 50);
INSERT INTO `auth_group_permissions` VALUES (51, 1, 51);
INSERT INTO `auth_group_permissions` VALUES (52, 1, 52);
INSERT INTO `auth_group_permissions` VALUES (53, 1, 53);
INSERT INTO `auth_group_permissions` VALUES (54, 1, 54);
INSERT INTO `auth_group_permissions` VALUES (55, 1, 55);
INSERT INTO `auth_group_permissions` VALUES (56, 1, 56);
INSERT INTO `auth_group_permissions` VALUES (57, 1, 57);
INSERT INTO `auth_group_permissions` VALUES (58, 1, 58);
INSERT INTO `auth_group_permissions` VALUES (59, 1, 59);
INSERT INTO `auth_group_permissions` VALUES (60, 1, 60);
INSERT INTO `auth_group_permissions` VALUES (61, 1, 61);
INSERT INTO `auth_group_permissions` VALUES (62, 1, 62);
INSERT INTO `auth_group_permissions` VALUES (63, 1, 63);
INSERT INTO `auth_group_permissions` VALUES (64, 1, 64);
INSERT INTO `auth_group_permissions` VALUES (65, 1, 65);
INSERT INTO `auth_group_permissions` VALUES (66, 1, 66);
INSERT INTO `auth_group_permissions` VALUES (67, 1, 67);
INSERT INTO `auth_group_permissions` VALUES (68, 1, 68);
INSERT INTO `auth_group_permissions` VALUES (69, 1, 69);
INSERT INTO `auth_group_permissions` VALUES (70, 1, 70);
INSERT INTO `auth_group_permissions` VALUES (71, 1, 71);
INSERT INTO `auth_group_permissions` VALUES (72, 1, 72);
INSERT INTO `auth_group_permissions` VALUES (73, 2, 1);
INSERT INTO `auth_group_permissions` VALUES (74, 2, 2);
INSERT INTO `auth_group_permissions` VALUES (75, 2, 3);
INSERT INTO `auth_group_permissions` VALUES (76, 2, 4);
INSERT INTO `auth_group_permissions` VALUES (77, 2, 5);
INSERT INTO `auth_group_permissions` VALUES (78, 2, 6);
INSERT INTO `auth_group_permissions` VALUES (79, 2, 7);
INSERT INTO `auth_group_permissions` VALUES (80, 2, 8);
INSERT INTO `auth_group_permissions` VALUES (81, 2, 9);
INSERT INTO `auth_group_permissions` VALUES (82, 2, 10);
INSERT INTO `auth_group_permissions` VALUES (83, 2, 11);
INSERT INTO `auth_group_permissions` VALUES (84, 2, 12);
INSERT INTO `auth_group_permissions` VALUES (85, 2, 13);
INSERT INTO `auth_group_permissions` VALUES (86, 2, 14);
INSERT INTO `auth_group_permissions` VALUES (87, 2, 15);
INSERT INTO `auth_group_permissions` VALUES (88, 2, 16);
INSERT INTO `auth_group_permissions` VALUES (89, 2, 17);
INSERT INTO `auth_group_permissions` VALUES (90, 2, 18);
INSERT INTO `auth_group_permissions` VALUES (91, 2, 19);
INSERT INTO `auth_group_permissions` VALUES (92, 2, 20);
INSERT INTO `auth_group_permissions` VALUES (93, 2, 21);
INSERT INTO `auth_group_permissions` VALUES (94, 2, 22);
INSERT INTO `auth_group_permissions` VALUES (95, 2, 23);
INSERT INTO `auth_group_permissions` VALUES (96, 2, 24);
INSERT INTO `auth_group_permissions` VALUES (97, 2, 25);
INSERT INTO `auth_group_permissions` VALUES (98, 2, 26);
INSERT INTO `auth_group_permissions` VALUES (99, 2, 27);
INSERT INTO `auth_group_permissions` VALUES (100, 2, 28);
INSERT INTO `auth_group_permissions` VALUES (101, 2, 29);
INSERT INTO `auth_group_permissions` VALUES (102, 2, 30);
INSERT INTO `auth_group_permissions` VALUES (103, 2, 31);
INSERT INTO `auth_group_permissions` VALUES (104, 2, 32);
INSERT INTO `auth_group_permissions` VALUES (105, 2, 33);
INSERT INTO `auth_group_permissions` VALUES (106, 2, 34);
INSERT INTO `auth_group_permissions` VALUES (107, 2, 35);
INSERT INTO `auth_group_permissions` VALUES (108, 2, 36);
INSERT INTO `auth_group_permissions` VALUES (109, 2, 37);
INSERT INTO `auth_group_permissions` VALUES (110, 2, 38);
INSERT INTO `auth_group_permissions` VALUES (111, 2, 39);
INSERT INTO `auth_group_permissions` VALUES (112, 2, 40);
INSERT INTO `auth_group_permissions` VALUES (113, 2, 41);
INSERT INTO `auth_group_permissions` VALUES (114, 2, 42);
INSERT INTO `auth_group_permissions` VALUES (115, 2, 43);
INSERT INTO `auth_group_permissions` VALUES (116, 2, 44);
INSERT INTO `auth_group_permissions` VALUES (117, 2, 45);
INSERT INTO `auth_group_permissions` VALUES (118, 2, 46);
INSERT INTO `auth_group_permissions` VALUES (119, 2, 47);
INSERT INTO `auth_group_permissions` VALUES (120, 2, 48);
INSERT INTO `auth_group_permissions` VALUES (121, 2, 49);
INSERT INTO `auth_group_permissions` VALUES (122, 2, 50);
INSERT INTO `auth_group_permissions` VALUES (123, 2, 51);
INSERT INTO `auth_group_permissions` VALUES (124, 2, 52);
INSERT INTO `auth_group_permissions` VALUES (125, 2, 53);
INSERT INTO `auth_group_permissions` VALUES (126, 2, 54);
INSERT INTO `auth_group_permissions` VALUES (127, 2, 55);
INSERT INTO `auth_group_permissions` VALUES (128, 2, 56);
INSERT INTO `auth_group_permissions` VALUES (129, 2, 57);
INSERT INTO `auth_group_permissions` VALUES (130, 2, 58);
INSERT INTO `auth_group_permissions` VALUES (131, 2, 59);
INSERT INTO `auth_group_permissions` VALUES (132, 2, 60);
INSERT INTO `auth_group_permissions` VALUES (133, 2, 61);
INSERT INTO `auth_group_permissions` VALUES (134, 2, 62);
INSERT INTO `auth_group_permissions` VALUES (135, 2, 63);
INSERT INTO `auth_group_permissions` VALUES (136, 2, 64);
INSERT INTO `auth_group_permissions` VALUES (137, 2, 65);
INSERT INTO `auth_group_permissions` VALUES (138, 2, 66);
INSERT INTO `auth_group_permissions` VALUES (139, 2, 67);
INSERT INTO `auth_group_permissions` VALUES (140, 2, 68);
INSERT INTO `auth_group_permissions` VALUES (141, 2, 69);
INSERT INTO `auth_group_permissions` VALUES (142, 2, 70);
INSERT INTO `auth_group_permissions` VALUES (143, 2, 71);
INSERT INTO `auth_group_permissions` VALUES (144, 2, 72);
INSERT INTO `auth_group_permissions` VALUES (145, 3, 1);
INSERT INTO `auth_group_permissions` VALUES (146, 3, 2);
INSERT INTO `auth_group_permissions` VALUES (147, 3, 3);
INSERT INTO `auth_group_permissions` VALUES (148, 3, 4);
INSERT INTO `auth_group_permissions` VALUES (149, 3, 5);
INSERT INTO `auth_group_permissions` VALUES (150, 3, 6);
INSERT INTO `auth_group_permissions` VALUES (151, 3, 7);
INSERT INTO `auth_group_permissions` VALUES (152, 3, 8);
INSERT INTO `auth_group_permissions` VALUES (153, 3, 9);
INSERT INTO `auth_group_permissions` VALUES (154, 3, 10);
INSERT INTO `auth_group_permissions` VALUES (155, 3, 11);
INSERT INTO `auth_group_permissions` VALUES (156, 3, 12);
INSERT INTO `auth_group_permissions` VALUES (157, 3, 13);
INSERT INTO `auth_group_permissions` VALUES (158, 3, 14);
INSERT INTO `auth_group_permissions` VALUES (159, 3, 15);
INSERT INTO `auth_group_permissions` VALUES (160, 3, 16);
INSERT INTO `auth_group_permissions` VALUES (161, 3, 17);
INSERT INTO `auth_group_permissions` VALUES (162, 3, 18);
INSERT INTO `auth_group_permissions` VALUES (163, 3, 19);
INSERT INTO `auth_group_permissions` VALUES (164, 3, 20);
INSERT INTO `auth_group_permissions` VALUES (165, 3, 21);
INSERT INTO `auth_group_permissions` VALUES (166, 3, 22);
INSERT INTO `auth_group_permissions` VALUES (167, 3, 23);
INSERT INTO `auth_group_permissions` VALUES (168, 3, 24);
INSERT INTO `auth_group_permissions` VALUES (169, 3, 25);
INSERT INTO `auth_group_permissions` VALUES (170, 3, 26);
INSERT INTO `auth_group_permissions` VALUES (171, 3, 27);
INSERT INTO `auth_group_permissions` VALUES (172, 3, 28);
INSERT INTO `auth_group_permissions` VALUES (173, 3, 29);
INSERT INTO `auth_group_permissions` VALUES (174, 3, 30);
INSERT INTO `auth_group_permissions` VALUES (175, 3, 31);
INSERT INTO `auth_group_permissions` VALUES (176, 3, 32);
INSERT INTO `auth_group_permissions` VALUES (177, 3, 33);
INSERT INTO `auth_group_permissions` VALUES (178, 3, 34);
INSERT INTO `auth_group_permissions` VALUES (179, 3, 35);
INSERT INTO `auth_group_permissions` VALUES (180, 3, 36);
INSERT INTO `auth_group_permissions` VALUES (181, 3, 37);
INSERT INTO `auth_group_permissions` VALUES (182, 3, 38);
INSERT INTO `auth_group_permissions` VALUES (183, 3, 39);
INSERT INTO `auth_group_permissions` VALUES (184, 3, 40);
INSERT INTO `auth_group_permissions` VALUES (185, 3, 41);
INSERT INTO `auth_group_permissions` VALUES (186, 3, 42);
INSERT INTO `auth_group_permissions` VALUES (187, 3, 43);
INSERT INTO `auth_group_permissions` VALUES (188, 3, 44);
INSERT INTO `auth_group_permissions` VALUES (189, 3, 45);
INSERT INTO `auth_group_permissions` VALUES (190, 3, 46);
INSERT INTO `auth_group_permissions` VALUES (191, 3, 47);
INSERT INTO `auth_group_permissions` VALUES (192, 3, 48);
INSERT INTO `auth_group_permissions` VALUES (193, 3, 49);
INSERT INTO `auth_group_permissions` VALUES (194, 3, 50);
INSERT INTO `auth_group_permissions` VALUES (195, 3, 51);
INSERT INTO `auth_group_permissions` VALUES (196, 3, 52);
INSERT INTO `auth_group_permissions` VALUES (197, 3, 53);
INSERT INTO `auth_group_permissions` VALUES (198, 3, 54);
INSERT INTO `auth_group_permissions` VALUES (199, 3, 55);
INSERT INTO `auth_group_permissions` VALUES (200, 3, 56);
INSERT INTO `auth_group_permissions` VALUES (201, 3, 57);
INSERT INTO `auth_group_permissions` VALUES (202, 3, 58);
INSERT INTO `auth_group_permissions` VALUES (203, 3, 59);
INSERT INTO `auth_group_permissions` VALUES (204, 3, 60);
INSERT INTO `auth_group_permissions` VALUES (205, 3, 61);
INSERT INTO `auth_group_permissions` VALUES (206, 3, 62);
INSERT INTO `auth_group_permissions` VALUES (207, 3, 63);
INSERT INTO `auth_group_permissions` VALUES (208, 3, 64);
INSERT INTO `auth_group_permissions` VALUES (209, 3, 65);
INSERT INTO `auth_group_permissions` VALUES (210, 3, 66);
INSERT INTO `auth_group_permissions` VALUES (211, 3, 67);
INSERT INTO `auth_group_permissions` VALUES (212, 3, 68);
INSERT INTO `auth_group_permissions` VALUES (213, 3, 69);
INSERT INTO `auth_group_permissions` VALUES (214, 3, 70);
INSERT INTO `auth_group_permissions` VALUES (215, 3, 71);
INSERT INTO `auth_group_permissions` VALUES (216, 3, 72);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 肖像图片', 7, 'add_portrait');
INSERT INTO `auth_permission` VALUES (26, 'Can change 肖像图片', 7, 'change_portrait');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 肖像图片', 7, 'delete_portrait');
INSERT INTO `auth_permission` VALUES (28, 'Can view 肖像图片', 7, 'view_portrait');
INSERT INTO `auth_permission` VALUES (29, 'Can add 验证码对应', 8, 'add_telcode');
INSERT INTO `auth_permission` VALUES (30, 'Can change 验证码对应', 8, 'change_telcode');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 验证码对应', 8, 'delete_telcode');
INSERT INTO `auth_permission` VALUES (32, 'Can view 验证码对应', 8, 'view_telcode');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户信息', 9, 'add_userextension');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户信息', 9, 'change_userextension');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户信息', 9, 'delete_userextension');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户信息', 9, 'view_userextension');
INSERT INTO `auth_permission` VALUES (37, 'Can add 文件', 10, 'add_files');
INSERT INTO `auth_permission` VALUES (38, 'Can change 文件', 10, 'change_files');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 文件', 10, 'delete_files');
INSERT INTO `auth_permission` VALUES (40, 'Can view 文件', 10, 'view_files');
INSERT INTO `auth_permission` VALUES (41, 'Can add 图片', 11, 'add_images');
INSERT INTO `auth_permission` VALUES (42, 'Can change 图片', 11, 'change_images');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 图片', 11, 'delete_images');
INSERT INTO `auth_permission` VALUES (44, 'Can view 图片', 11, 'view_images');
INSERT INTO `auth_permission` VALUES (45, 'Can add 01-顾客群', 12, 'add_merchset');
INSERT INTO `auth_permission` VALUES (46, 'Can change 01-顾客群', 12, 'change_merchset');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 01-顾客群', 12, 'delete_merchset');
INSERT INTO `auth_permission` VALUES (48, 'Can view 01-顾客群', 12, 'view_merchset');
INSERT INTO `auth_permission` VALUES (49, 'Can add 03-品类', 13, 'add_merchtype');
INSERT INTO `auth_permission` VALUES (50, 'Can change 03-品类', 13, 'change_merchtype');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 03-品类', 13, 'delete_merchtype');
INSERT INTO `auth_permission` VALUES (52, 'Can view 03-品类', 13, 'view_merchtype');
INSERT INTO `auth_permission` VALUES (53, 'Can add 04-子品类', 14, 'add_merchtypechild');
INSERT INTO `auth_permission` VALUES (54, 'Can change 04-子品类', 14, 'change_merchtypechild');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 04-子品类', 14, 'delete_merchtypechild');
INSERT INTO `auth_permission` VALUES (56, 'Can view 04-子品类', 14, 'view_merchtypechild');
INSERT INTO `auth_permission` VALUES (57, 'Can add 02-品类组', 15, 'add_typeset');
INSERT INTO `auth_permission` VALUES (58, 'Can change 02-品类组', 15, 'change_typeset');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 02-品类组', 15, 'delete_typeset');
INSERT INTO `auth_permission` VALUES (60, 'Can view 02-品类组', 15, 'view_typeset');
INSERT INTO `auth_permission` VALUES (61, 'Can add 01-商品', 16, 'add_wares');
INSERT INTO `auth_permission` VALUES (62, 'Can change 01-商品', 16, 'change_wares');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 01-商品', 16, 'delete_wares');
INSERT INTO `auth_permission` VALUES (64, 'Can view 01-商品', 16, 'view_wares');
INSERT INTO `auth_permission` VALUES (65, 'Can add 02-色码', 17, 'add_waresku');
INSERT INTO `auth_permission` VALUES (66, 'Can change 02-色码', 17, 'change_waresku');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 02-色码', 17, 'delete_waresku');
INSERT INTO `auth_permission` VALUES (68, 'Can view 02-色码', 17, 'view_waresku');
INSERT INTO `auth_permission` VALUES (69, 'Can add 01-供应商', 18, 'add_supply');
INSERT INTO `auth_permission` VALUES (70, 'Can change 01-供应商', 18, 'change_supply');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 01-供应商', 18, 'delete_supply');
INSERT INTO `auth_permission` VALUES (72, 'Can view 01-供应商', 18, 'view_supply');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$180000$286DPexZmbCS$2PxVF9g1E/oYnPVhdvR/5xNpnOKXHYdZxLOjhPIH26w=', '2022-02-08 04:18:22.944904', 1, 'admin', '', '', '', 1, 1, '2022-02-08 04:18:03.851169');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$180000$seJXf5kFZqSv$hBlSjXD8oBA6RJt+iLVJIkJTxb6mheClkA+CF6JiKgQ=', '2022-02-08 05:57:13.767545', 0, 'samle', '', '', '', 1, 1, '2022-02-08 04:22:01.014135');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$180000$Ni3MXuC3mq2i$vM5n2+1B50cFSbFptvfgc6w5irgr2Wo2PHFsTxwkdh4=', '2022-02-08 05:57:05.904221', 0, 'MFJJ001', '', '', '', 1, 1, '2022-02-08 05:25:34.324360');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$180000$HTp5uFikPxMy$EdIAK/t0pBk2Q8Yx8FNh0Ur98G9QvgbiSW6nQZl8LN0=', '2022-02-08 05:51:32.346878', 0, 'MFZH001', '', '', '', 1, 1, '2022-02-08 05:26:12.146468');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$180000$XBAkqZKrAAUV$Tka30GurmF1PFGOjw/cDIU/fNzbVA4ts9QdYXF7uMH4=', '2022-02-08 05:57:33.077211', 0, 'MFFS001', '', '', '', 1, 1, '2022-02-08 05:26:49.825481');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (1, 2, 1);
INSERT INTO `auth_user_groups` VALUES (2, 2, 2);
INSERT INTO `auth_user_groups` VALUES (3, 2, 3);
INSERT INTO `auth_user_groups` VALUES (5, 3, 1);
INSERT INTO `auth_user_groups` VALUES (12, 4, 2);
INSERT INTO `auth_user_groups` VALUES (16, 5, 3);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES (1, 2, 1);
INSERT INTO `auth_user_user_permissions` VALUES (2, 2, 2);
INSERT INTO `auth_user_user_permissions` VALUES (3, 2, 3);
INSERT INTO `auth_user_user_permissions` VALUES (4, 2, 4);
INSERT INTO `auth_user_user_permissions` VALUES (5, 2, 5);
INSERT INTO `auth_user_user_permissions` VALUES (6, 2, 6);
INSERT INTO `auth_user_user_permissions` VALUES (7, 2, 7);
INSERT INTO `auth_user_user_permissions` VALUES (8, 2, 8);
INSERT INTO `auth_user_user_permissions` VALUES (9, 2, 9);
INSERT INTO `auth_user_user_permissions` VALUES (10, 2, 10);
INSERT INTO `auth_user_user_permissions` VALUES (11, 2, 11);
INSERT INTO `auth_user_user_permissions` VALUES (12, 2, 12);
INSERT INTO `auth_user_user_permissions` VALUES (13, 2, 13);
INSERT INTO `auth_user_user_permissions` VALUES (14, 2, 14);
INSERT INTO `auth_user_user_permissions` VALUES (15, 2, 15);
INSERT INTO `auth_user_user_permissions` VALUES (16, 2, 16);
INSERT INTO `auth_user_user_permissions` VALUES (17, 2, 17);
INSERT INTO `auth_user_user_permissions` VALUES (18, 2, 18);
INSERT INTO `auth_user_user_permissions` VALUES (19, 2, 19);
INSERT INTO `auth_user_user_permissions` VALUES (20, 2, 20);
INSERT INTO `auth_user_user_permissions` VALUES (21, 2, 21);
INSERT INTO `auth_user_user_permissions` VALUES (22, 2, 22);
INSERT INTO `auth_user_user_permissions` VALUES (23, 2, 23);
INSERT INTO `auth_user_user_permissions` VALUES (24, 2, 24);
INSERT INTO `auth_user_user_permissions` VALUES (25, 2, 25);
INSERT INTO `auth_user_user_permissions` VALUES (26, 2, 26);
INSERT INTO `auth_user_user_permissions` VALUES (27, 2, 27);
INSERT INTO `auth_user_user_permissions` VALUES (28, 2, 28);
INSERT INTO `auth_user_user_permissions` VALUES (29, 2, 29);
INSERT INTO `auth_user_user_permissions` VALUES (30, 2, 30);
INSERT INTO `auth_user_user_permissions` VALUES (31, 2, 31);
INSERT INTO `auth_user_user_permissions` VALUES (32, 2, 32);
INSERT INTO `auth_user_user_permissions` VALUES (33, 2, 33);
INSERT INTO `auth_user_user_permissions` VALUES (34, 2, 34);
INSERT INTO `auth_user_user_permissions` VALUES (35, 2, 35);
INSERT INTO `auth_user_user_permissions` VALUES (36, 2, 36);
INSERT INTO `auth_user_user_permissions` VALUES (37, 2, 37);
INSERT INTO `auth_user_user_permissions` VALUES (38, 2, 38);
INSERT INTO `auth_user_user_permissions` VALUES (39, 2, 39);
INSERT INTO `auth_user_user_permissions` VALUES (40, 2, 40);
INSERT INTO `auth_user_user_permissions` VALUES (41, 2, 41);
INSERT INTO `auth_user_user_permissions` VALUES (42, 2, 42);
INSERT INTO `auth_user_user_permissions` VALUES (43, 2, 43);
INSERT INTO `auth_user_user_permissions` VALUES (44, 2, 44);
INSERT INTO `auth_user_user_permissions` VALUES (45, 2, 45);
INSERT INTO `auth_user_user_permissions` VALUES (46, 2, 46);
INSERT INTO `auth_user_user_permissions` VALUES (47, 2, 47);
INSERT INTO `auth_user_user_permissions` VALUES (48, 2, 48);
INSERT INTO `auth_user_user_permissions` VALUES (49, 2, 49);
INSERT INTO `auth_user_user_permissions` VALUES (50, 2, 50);
INSERT INTO `auth_user_user_permissions` VALUES (51, 2, 51);
INSERT INTO `auth_user_user_permissions` VALUES (52, 2, 52);
INSERT INTO `auth_user_user_permissions` VALUES (53, 2, 53);
INSERT INTO `auth_user_user_permissions` VALUES (54, 2, 54);
INSERT INTO `auth_user_user_permissions` VALUES (55, 2, 55);
INSERT INTO `auth_user_user_permissions` VALUES (56, 2, 56);
INSERT INTO `auth_user_user_permissions` VALUES (57, 2, 57);
INSERT INTO `auth_user_user_permissions` VALUES (58, 2, 58);
INSERT INTO `auth_user_user_permissions` VALUES (59, 2, 59);
INSERT INTO `auth_user_user_permissions` VALUES (60, 2, 60);
INSERT INTO `auth_user_user_permissions` VALUES (61, 2, 61);
INSERT INTO `auth_user_user_permissions` VALUES (62, 2, 62);
INSERT INTO `auth_user_user_permissions` VALUES (63, 2, 63);
INSERT INTO `auth_user_user_permissions` VALUES (64, 2, 64);
INSERT INTO `auth_user_user_permissions` VALUES (65, 2, 65);
INSERT INTO `auth_user_user_permissions` VALUES (66, 2, 66);
INSERT INTO `auth_user_user_permissions` VALUES (67, 2, 67);
INSERT INTO `auth_user_user_permissions` VALUES (68, 2, 68);
INSERT INTO `auth_user_user_permissions` VALUES (69, 2, 69);
INSERT INTO `auth_user_user_permissions` VALUES (70, 2, 70);
INSERT INTO `auth_user_user_permissions` VALUES (71, 2, 71);
INSERT INTO `auth_user_user_permissions` VALUES (72, 2, 72);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(0) DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2022-02-08 04:19:02.792890', '1', '管理员', 2, '[{\"changed\": {\"fields\": [\"\\u771f\\u5b9e\\u59d3\\u540d\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (2, '2022-02-08 04:22:01.166984', '2', 'samle', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (3, '2022-02-08 04:22:10.023195', '2', 'samle', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (4, '2022-02-08 04:22:30.162364', '2', 'Samle', 2, '[{\"changed\": {\"fields\": [\"\\u771f\\u5b9e\\u59d3\\u540d\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2022-02-08 04:29:21.809710', '1', '季节社', 1, '[{\"added\": {}}]', 3, 2);
INSERT INTO `django_admin_log` VALUES (6, '2022-02-08 04:29:30.161086', '2', '杂货社', 1, '[{\"added\": {}}]', 3, 2);
INSERT INTO `django_admin_log` VALUES (7, '2022-02-08 04:29:37.528843', '3', '发饰链', 1, '[{\"added\": {}}]', 3, 2);
INSERT INTO `django_admin_log` VALUES (8, '2022-02-08 05:25:34.484379', '3', 'MFJJ001', 1, '[{\"added\": {}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (9, '2022-02-08 05:25:48.286028', '3', 'MFJJ001', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (10, '2022-02-08 05:26:12.312970', '4', 'MFZH001', 1, '[{\"added\": {}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (11, '2022-02-08 05:26:25.520841', '4', 'MFZH001', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (12, '2022-02-08 05:26:49.990044', '5', 'MFFS001', 1, '[{\"added\": {}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (13, '2022-02-08 05:26:59.239151', '5', 'MFFS001', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (14, '2022-02-08 05:42:37.375131', '3', '季节社成员1', 2, '[{\"changed\": {\"fields\": [\"\\u771f\\u5b9e\\u59d3\\u540d\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (15, '2022-02-08 05:42:46.072032', '4', '杂货社成员1', 2, '[{\"changed\": {\"fields\": [\"\\u771f\\u5b9e\\u59d3\\u540d\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (16, '2022-02-08 05:42:52.079806', '5', '发饰链成员1', 2, '[{\"changed\": {\"fields\": [\"\\u771f\\u5b9e\\u59d3\\u540d\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (17, '2022-02-08 05:46:45.474106', '5', '发饰链成员1', 2, '[{\"changed\": {\"fields\": [\"\\u53ef\\u89c1\\u5206\\u7ec4\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (18, '2022-02-08 05:46:52.818951', '4', '杂货社成员1', 2, '[{\"changed\": {\"fields\": [\"\\u53ef\\u89c1\\u5206\\u7ec4\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (19, '2022-02-08 05:47:01.115995', '3', '季节社成员1', 2, '[{\"changed\": {\"fields\": [\"\\u53ef\\u89c1\\u5206\\u7ec4\"]}}]', 9, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (10, 'files', 'files');
INSERT INTO `django_content_type` VALUES (11, 'files', 'images');
INSERT INTO `django_content_type` VALUES (12, 'merch', 'merchset');
INSERT INTO `django_content_type` VALUES (13, 'merch', 'merchtype');
INSERT INTO `django_content_type` VALUES (14, 'merch', 'merchtypechild');
INSERT INTO `django_content_type` VALUES (15, 'merch', 'typeset');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (18, 'supply', 'supply');
INSERT INTO `django_content_type` VALUES (7, 'users', 'portrait');
INSERT INTO `django_content_type` VALUES (8, 'users', 'telcode');
INSERT INTO `django_content_type` VALUES (9, 'users', 'userextension');
INSERT INTO `django_content_type` VALUES (16, 'wares', 'wares');
INSERT INTO `django_content_type` VALUES (17, 'wares', 'waresku');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-02-08 04:17:34.453509');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-02-08 04:17:34.625344');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-02-08 04:17:34.969013');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-02-08 04:17:35.078361');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-08 04:17:35.093983');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-02-08 04:17:35.187711');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-02-08 04:17:35.250196');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-02-08 04:17:35.265844');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-02-08 04:17:35.281439');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-02-08 04:17:35.328303');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-02-08 04:17:35.343925');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-08 04:17:35.343925');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-02-08 04:17:35.406416');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-08 04:17:35.468895');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-02-08 04:17:35.484543');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-02-08 04:17:35.500138');
INSERT INTO `django_migrations` VALUES (17, 'users', '0001_initial', '2022-02-08 04:17:35.703215');
INSERT INTO `django_migrations` VALUES (18, 'files', '0001_initial', '2022-02-08 04:17:36.084206');
INSERT INTO `django_migrations` VALUES (19, 'files', '0002_auto_20220208_0205', '2022-02-08 04:17:36.380135');
INSERT INTO `django_migrations` VALUES (20, 'merch', '0001_initial', '2022-02-08 04:17:36.643766');
INSERT INTO `django_migrations` VALUES (21, 'merch', '0002_auto_20220208_0205', '2022-02-08 04:17:37.441703');
INSERT INTO `django_migrations` VALUES (22, 'sessions', '0001_initial', '2022-02-08 04:17:37.837705');
INSERT INTO `django_migrations` VALUES (23, 'supply', '0001_initial', '2022-02-08 04:17:37.870990');
INSERT INTO `django_migrations` VALUES (24, 'supply', '0002_auto_20220208_0205', '2022-02-08 04:17:38.024226');
INSERT INTO `django_migrations` VALUES (25, 'wares', '0001_initial', '2022-02-08 04:17:38.250872');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('kslkfdi2sm5z1l2xorpdzdhwo4qvct9j', 'MWIwZTRhZjcyMGY5NTVjYWQ5YjFjYTVmZDI1NTJiMmU4MWViYjI5NTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODg0YTRiZDFkMzNmN2E5MjdhOTVhNzE2MjYxNjZiZDFlYTlmNGJmIn0=', '2022-02-22 05:57:33.083229');

-- ----------------------------
-- Table structure for files_files
-- ----------------------------
DROP TABLE IF EXISTS `files_files`;
CREATE TABLE `files_files`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fix` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `size` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `with_models` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `models_id` int unsigned,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `files_files_created_by_id_77a0760c_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `files_files_last_edited_by_id_f87c6569_fk_users_userextension_id`(`last_edited_by_id`) USING BTREE,
  CONSTRAINT `files_files_created_by_id_77a0760c_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `files_files_last_edited_by_id_f87c6569_fk_users_userextension_id` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for files_files_group
-- ----------------------------
DROP TABLE IF EXISTS `files_files_group`;
CREATE TABLE `files_files_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `files_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `files_files_group_files_id_group_id_67be59b9_uniq`(`files_id`, `group_id`) USING BTREE,
  INDEX `files_files_group_group_id_edcf47f6_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `files_files_group_files_id_1e651d9a_fk_files_files_id` FOREIGN KEY (`files_id`) REFERENCES `files_files` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `files_files_group_group_id_edcf47f6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for files_images
-- ----------------------------
DROP TABLE IF EXISTS `files_images`;
CREATE TABLE `files_images`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `height` int unsigned,
  `with_models` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `models_id` int unsigned,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `files_images_created_by_id_520092da_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `files_images_last_edited_by_id_4f41dbe0_fk_users_use`(`last_edited_by_id`) USING BTREE,
  CONSTRAINT `files_images_created_by_id_520092da_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `files_images_last_edited_by_id_4f41dbe0_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for files_images_group
-- ----------------------------
DROP TABLE IF EXISTS `files_images_group`;
CREATE TABLE `files_images_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `images_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `files_images_group_images_id_group_id_9e3c2443_uniq`(`images_id`, `group_id`) USING BTREE,
  INDEX `files_images_group_group_id_e000a2bc_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `files_images_group_group_id_e000a2bc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `files_images_group_images_id_c19b828c_fk_files_images_id` FOREIGN KEY (`images_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchset
-- ----------------------------
INSERT INTO `merch_merchset` VALUES (1, '季节社', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2);
INSERT INTO `merch_merchset` VALUES (2, '杂货社', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2);
INSERT INTO `merch_merchset` VALUES (3, '发饰链', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2);

-- ----------------------------
-- Table structure for merch_merchset_group
-- ----------------------------
DROP TABLE IF EXISTS `merch_merchset_group`;
CREATE TABLE `merch_merchset_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `merchset_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `merch_merchset_group_merchset_id_group_id_df0d70d0_uniq`(`merchset_id`, `group_id`) USING BTREE,
  INDEX `merch_merchset_group_group_id_b67f8093_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `merch_merchset_group_group_id_b67f8093_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchset_group_merchset_id_5f522795_fk_merch_merchset_id` FOREIGN KEY (`merchset_id`) REFERENCES `merch_merchset` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchset_group
-- ----------------------------
INSERT INTO `merch_merchset_group` VALUES (1, 1, 1);
INSERT INTO `merch_merchset_group` VALUES (2, 2, 2);
INSERT INTO `merch_merchset_group` VALUES (3, 3, 3);

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
  INDEX `merch_merchtype_created_by_id_390b83ae_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `merch_merchtype_last_edited_by_id_52d4b4c8_fk_users_use`(`last_edited_by_id`) USING BTREE,
  INDEX `merch_merchtype_typeset_id_0b178166_fk_merch_typeset_id`(`typeset_id`) USING BTREE,
  CONSTRAINT `merch_merchtype_created_by_id_390b83ae_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtype_last_edited_by_id_52d4b4c8_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtype_typeset_id_0b178166_fk_merch_typeset_id` FOREIGN KEY (`typeset_id`) REFERENCES `merch_typeset` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchtype
-- ----------------------------
INSERT INTO `merch_merchtype` VALUES (1, '冬暖', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (2, '夏凉', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (3, '日用', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (4, '雨具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtype` VALUES (5, '帽子', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (6, '手套', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (7, '围巾', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (8, '眼镜', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtype` VALUES (9, '时尚杯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (10, '家居拖鞋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (11, '迷你包', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (12, '小家电', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (13, '毛绒玩具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (14, '枕垫', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (15, '防护', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (16, '小帮手', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (17, '环保袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (18, '浴厨用品', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (19, '功能性摆件', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (20, '装饰性摆件', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtype` VALUES (21, '动漫IP', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 4);
INSERT INTO `merch_merchtype` VALUES (22, '玩具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 4);
INSERT INTO `merch_merchtype` VALUES (23, '电子烟', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (24, '手表', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (25, '耳机', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (26, '手机周边', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (27, '数据线', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtype` VALUES (28, '包装工具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (29, '笔', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (30, '笔袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (31, '贴纸', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (32, '文本', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (33, '文具周边', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtype` VALUES (34, '发夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 7);
INSERT INTO `merch_merchtype` VALUES (35, '头饰', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 7);
INSERT INTO `merch_merchtype` VALUES (36, '耳环', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 8);
INSERT INTO `merch_merchtype` VALUES (37, '戒指', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 8);
INSERT INTO `merch_merchtype` VALUES (38, '链', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 8);

-- ----------------------------
-- Table structure for merch_merchtype_group
-- ----------------------------
DROP TABLE IF EXISTS `merch_merchtype_group`;
CREATE TABLE `merch_merchtype_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `merchtype_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `merch_merchtype_group_merchtype_id_group_id_55180050_uniq`(`merchtype_id`, `group_id`) USING BTREE,
  INDEX `merch_merchtype_group_group_id_135b2273_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `merch_merchtype_grou_merchtype_id_ab5de38e_fk_merch_mer` FOREIGN KEY (`merchtype_id`) REFERENCES `merch_merchtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtype_group_group_id_135b2273_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchtype_group
-- ----------------------------
INSERT INTO `merch_merchtype_group` VALUES (1, 1, 1);
INSERT INTO `merch_merchtype_group` VALUES (2, 2, 1);
INSERT INTO `merch_merchtype_group` VALUES (3, 3, 1);
INSERT INTO `merch_merchtype_group` VALUES (4, 4, 1);
INSERT INTO `merch_merchtype_group` VALUES (5, 5, 1);
INSERT INTO `merch_merchtype_group` VALUES (6, 6, 1);
INSERT INTO `merch_merchtype_group` VALUES (7, 7, 1);
INSERT INTO `merch_merchtype_group` VALUES (8, 8, 1);
INSERT INTO `merch_merchtype_group` VALUES (9, 9, 2);
INSERT INTO `merch_merchtype_group` VALUES (10, 10, 2);
INSERT INTO `merch_merchtype_group` VALUES (11, 11, 2);
INSERT INTO `merch_merchtype_group` VALUES (12, 12, 2);
INSERT INTO `merch_merchtype_group` VALUES (13, 13, 2);
INSERT INTO `merch_merchtype_group` VALUES (14, 14, 2);
INSERT INTO `merch_merchtype_group` VALUES (15, 15, 2);
INSERT INTO `merch_merchtype_group` VALUES (16, 16, 2);
INSERT INTO `merch_merchtype_group` VALUES (17, 17, 2);
INSERT INTO `merch_merchtype_group` VALUES (18, 18, 2);
INSERT INTO `merch_merchtype_group` VALUES (19, 19, 2);
INSERT INTO `merch_merchtype_group` VALUES (20, 20, 2);
INSERT INTO `merch_merchtype_group` VALUES (21, 21, 2);
INSERT INTO `merch_merchtype_group` VALUES (22, 22, 2);
INSERT INTO `merch_merchtype_group` VALUES (23, 23, 2);
INSERT INTO `merch_merchtype_group` VALUES (24, 24, 2);
INSERT INTO `merch_merchtype_group` VALUES (25, 25, 2);
INSERT INTO `merch_merchtype_group` VALUES (26, 26, 2);
INSERT INTO `merch_merchtype_group` VALUES (27, 27, 2);
INSERT INTO `merch_merchtype_group` VALUES (28, 28, 2);
INSERT INTO `merch_merchtype_group` VALUES (29, 29, 2);
INSERT INTO `merch_merchtype_group` VALUES (30, 30, 2);
INSERT INTO `merch_merchtype_group` VALUES (31, 31, 2);
INSERT INTO `merch_merchtype_group` VALUES (32, 32, 2);
INSERT INTO `merch_merchtype_group` VALUES (33, 33, 2);
INSERT INTO `merch_merchtype_group` VALUES (34, 34, 3);
INSERT INTO `merch_merchtype_group` VALUES (35, 35, 3);
INSERT INTO `merch_merchtype_group` VALUES (36, 36, 3);
INSERT INTO `merch_merchtype_group` VALUES (37, 37, 3);
INSERT INTO `merch_merchtype_group` VALUES (38, 38, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchtypechild
-- ----------------------------
INSERT INTO `merch_merchtypechild` VALUES (1, '八角帽', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (2, '渔夫帽', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (3, '棒球帽', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (4, '草帽', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (5, '礼帽', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (6, '西瓜帽', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_merchtypechild` VALUES (7, '半指手套', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtypechild` VALUES (8, '包指手套', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtypechild` VALUES (9, '五指手套', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_merchtypechild` VALUES (10, '方巾', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (11, '围巾', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (12, '披肩', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (13, '长巾', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_merchtypechild` VALUES (14, '儿童镜', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 4);
INSERT INTO `merch_merchtypechild` VALUES (15, '平光镜', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 4);
INSERT INTO `merch_merchtypechild` VALUES (16, '太阳镜', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 4);
INSERT INTO `merch_merchtypechild` VALUES (17, '电暖袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (18, '耳罩', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (19, '暖身贴', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (20, '热水袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 5);
INSERT INTO `merch_merchtypechild` VALUES (21, '扇子', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (22, '冰垫', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (23, '风衣', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (24, '小风扇', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 6);
INSERT INTO `merch_merchtypechild` VALUES (25, '口罩', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 7);
INSERT INTO `merch_merchtypechild` VALUES (26, '袖套', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 7);
INSERT INTO `merch_merchtypechild` VALUES (27, '防雨伞', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 8);
INSERT INTO `merch_merchtypechild` VALUES (28, '防紫外伞', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 8);
INSERT INTO `merch_merchtypechild` VALUES (29, '雨具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 8);
INSERT INTO `merch_merchtypechild` VALUES (30, '杯子周边', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (31, '玻璃杯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (32, '不锈钢杯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (33, '塑料杯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (34, '陶瓷杯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 9);
INSERT INTO `merch_merchtypechild` VALUES (35, '半包拖', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (36, '开口拖', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (37, '全包拖', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (38, '人字拖', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (39, '一字拖', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 10);
INSERT INTO `merch_merchtypechild` VALUES (40, '卡包', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (41, '卡套', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (42, '零钱包', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (43, '手机包', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (44, '锁包扣', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 11);
INSERT INTO `merch_merchtypechild` VALUES (45, '电吹风', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (46, '加湿器', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (47, '卷发棒', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (48, '毛衣美容器', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (49, '排插', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (50, '直发器', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 12);
INSERT INTO `merch_merchtypechild` VALUES (51, '按摩棒', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 13);
INSERT INTO `merch_merchtypechild` VALUES (52, '公仔', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 13);
INSERT INTO `merch_merchtypechild` VALUES (53, '抱枕', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 14);
INSERT INTO `merch_merchtypechild` VALUES (54, '颈枕', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 14);
INSERT INTO `merch_merchtypechild` VALUES (55, '其他枕垫', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 14);
INSERT INTO `merch_merchtypechild` VALUES (56, '眼镜盒', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 15);
INSERT INTO `merch_merchtypechild` VALUES (57, '眼罩', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 15);
INSERT INTO `merch_merchtypechild` VALUES (58, '服饰用品', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (59, '驱蚊虫', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (60, '收纳', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (61, '鞋用品', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 16);
INSERT INTO `merch_merchtypechild` VALUES (62, '车载', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (63, '充电宝', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (64, '充电头', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (65, '电池', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (66, '手机壳', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (67, '手机绳', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (68, '手机支架', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (69, '手游工具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (70, '音箱', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (71, '组合套装', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 26);
INSERT INTO `merch_merchtypechild` VALUES (72, 'Type-c数据线', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (73, '安卓数据线', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (74, '苹果数据线', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (75, '组合数据线', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 27);
INSERT INTO `merch_merchtypechild` VALUES (76, '包装纸', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (77, '礼品袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (78, '礼品盒', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (79, '明信片/贺卡', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 28);
INSERT INTO `merch_merchtypechild` VALUES (80, '笔芯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (81, '钢笔', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (82, '墨水', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (83, '水彩笔', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (84, '圆珠笔', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (85, '中性笔', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 29);
INSERT INTO `merch_merchtypechild` VALUES (86, 'PU料笔袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 30);
INSERT INTO `merch_merchtypechild` VALUES (87, '布料笔袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 30);
INSERT INTO `merch_merchtypechild` VALUES (88, '文具盒', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 30);
INSERT INTO `merch_merchtypechild` VALUES (89, '功能贴', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 31);
INSERT INTO `merch_merchtypechild` VALUES (90, '卡通贴纸', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 31);
INSERT INTO `merch_merchtypechild` VALUES (91, '装饰贴纸', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 31);
INSERT INTO `merch_merchtypechild` VALUES (92, '车线本', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (93, '胶套本', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (94, '精装本', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (95, '线圈本', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 32);
INSERT INTO `merch_merchtypechild` VALUES (96, '回形针', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (97, '夹子', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (98, '胶带', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (99, '台历', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (100, '橡皮', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (101, '印章', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 33);
INSERT INTO `merch_merchtypechild` VALUES (102, '功能袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 17);
INSERT INTO `merch_merchtypechild` VALUES (103, '装饰袋', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 17);
INSERT INTO `merch_merchtypechild` VALUES (104, '厨房小物', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 18);
INSERT INTO `merch_merchtypechild` VALUES (105, '毛巾', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 18);
INSERT INTO `merch_merchtypechild` VALUES (106, '空气清新剂', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (107, '闹钟', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (108, '沙漏', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (109, '台灯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (110, '相框', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (111, '香薰', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (112, '音乐盒', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 19);
INSERT INTO `merch_merchtypechild` VALUES (113, '陈设摆件', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 20);
INSERT INTO `merch_merchtypechild` VALUES (114, '干花', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 20);
INSERT INTO `merch_merchtypechild` VALUES (115, '卡通', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 21);
INSERT INTO `merch_merchtypechild` VALUES (116, '手办', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 21);
INSERT INTO `merch_merchtypechild` VALUES (117, '发泄玩具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (118, '过家家', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (119, '机器人', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (120, '玩具车', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (121, '玩沙戏水', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (122, '无人机', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (123, '早教玩具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (124, '智力玩具', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 22);
INSERT INTO `merch_merchtypechild` VALUES (125, '套装', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 23);
INSERT INTO `merch_merchtypechild` VALUES (126, '烟弹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 23);
INSERT INTO `merch_merchtypechild` VALUES (127, '一次性小烟', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 23);
INSERT INTO `merch_merchtypechild` VALUES (128, '钢带表', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 24);
INSERT INTO `merch_merchtypechild` VALUES (129, '链条表', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 24);
INSERT INTO `merch_merchtypechild` VALUES (130, '皮带表', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 24);
INSERT INTO `merch_merchtypechild` VALUES (131, '挂耳耳机', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (132, '平耳耳机', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (133, '入耳耳机', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (134, '头戴耳机', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 25);
INSERT INTO `merch_merchtypechild` VALUES (135, 'BB夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (136, '发插', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (137, '发梳', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (138, '马尾夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (139, '青蛙夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (140, '头箍', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (141, '鸭夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (142, '一字夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (143, '爪夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (144, '组合发饰', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 34);
INSERT INTO `merch_merchtypechild` VALUES (145, '发带', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 35);
INSERT INTO `merch_merchtypechild` VALUES (146, '发束', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 35);
INSERT INTO `merch_merchtypechild` VALUES (147, '橡巾', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 35);
INSERT INTO `merch_merchtypechild` VALUES (148, '耳丁', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (149, '耳钩', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (150, '耳夹', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (151, '耳线', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (152, '圈环', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (153, '套装耳环', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 36);
INSERT INTO `merch_merchtypechild` VALUES (154, '单只装戒指', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 37);
INSERT INTO `merch_merchtypechild` VALUES (155, '多只装戒指', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 37);
INSERT INTO `merch_merchtypechild` VALUES (156, '短项链', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (157, '脚链', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (158, '手链', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (159, '手镯', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (160, '胸针', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 38);
INSERT INTO `merch_merchtypechild` VALUES (161, '长项链', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 38);

-- ----------------------------
-- Table structure for merch_merchtypechild_group
-- ----------------------------
DROP TABLE IF EXISTS `merch_merchtypechild_group`;
CREATE TABLE `merch_merchtypechild_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `merchtypechild_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `merch_merchtypechild_gro_merchtypechild_id_group__e8aa34dd_uniq`(`merchtypechild_id`, `group_id`) USING BTREE,
  INDEX `merch_merchtypechild_group_group_id_2881792f_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `merch_merchtypechild_group_group_id_2881792f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_merchtypechild_merchtypechild_id_ca0c0860_fk_merch_mer` FOREIGN KEY (`merchtypechild_id`) REFERENCES `merch_merchtypechild` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_merchtypechild_group
-- ----------------------------
INSERT INTO `merch_merchtypechild_group` VALUES (1, 1, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (2, 2, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (3, 3, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (4, 4, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (5, 5, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (6, 6, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (7, 7, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (8, 8, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (9, 9, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (10, 10, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (11, 11, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (12, 12, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (13, 13, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (14, 14, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (15, 15, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (16, 16, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (17, 17, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (18, 18, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (19, 19, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (20, 20, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (21, 21, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (22, 22, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (23, 23, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (24, 24, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (25, 25, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (26, 26, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (27, 27, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (28, 28, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (29, 29, 1);
INSERT INTO `merch_merchtypechild_group` VALUES (30, 30, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (31, 31, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (32, 32, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (33, 33, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (34, 34, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (35, 35, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (36, 36, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (37, 37, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (38, 38, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (39, 39, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (40, 40, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (41, 41, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (42, 42, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (43, 43, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (44, 44, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (45, 45, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (46, 46, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (47, 47, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (48, 48, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (49, 49, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (50, 50, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (51, 51, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (52, 52, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (53, 53, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (54, 54, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (55, 55, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (56, 56, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (57, 57, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (58, 58, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (59, 59, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (60, 60, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (61, 61, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (62, 62, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (63, 63, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (64, 64, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (65, 65, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (66, 66, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (67, 67, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (68, 68, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (69, 69, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (70, 70, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (71, 71, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (72, 72, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (73, 73, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (74, 74, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (75, 75, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (76, 76, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (77, 77, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (78, 78, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (79, 79, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (80, 80, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (81, 81, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (82, 82, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (83, 83, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (84, 84, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (85, 85, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (86, 86, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (87, 87, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (88, 88, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (89, 89, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (90, 90, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (91, 91, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (92, 92, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (93, 93, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (94, 94, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (95, 95, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (96, 96, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (97, 97, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (98, 98, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (99, 99, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (100, 100, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (101, 101, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (102, 102, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (103, 103, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (104, 104, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (105, 105, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (106, 106, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (107, 107, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (108, 108, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (109, 109, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (110, 110, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (111, 111, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (112, 112, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (113, 113, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (114, 114, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (115, 115, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (116, 116, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (117, 117, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (118, 118, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (119, 119, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (120, 120, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (121, 121, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (122, 122, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (123, 123, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (124, 124, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (125, 125, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (126, 126, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (127, 127, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (128, 128, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (129, 129, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (130, 130, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (131, 131, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (132, 132, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (133, 133, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (134, 134, 2);
INSERT INTO `merch_merchtypechild_group` VALUES (135, 135, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (136, 136, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (137, 137, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (138, 138, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (139, 139, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (140, 140, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (141, 141, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (142, 142, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (143, 143, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (144, 144, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (145, 145, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (146, 146, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (147, 147, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (148, 148, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (149, 149, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (150, 150, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (151, 151, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (152, 152, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (153, 153, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (154, 154, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (155, 155, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (156, 156, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (157, 157, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (158, 158, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (159, 159, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (160, 160, 3);
INSERT INTO `merch_merchtypechild_group` VALUES (161, 161, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_typeset
-- ----------------------------
INSERT INTO `merch_typeset` VALUES (1, '生活日用', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_typeset` VALUES (2, '服饰配件', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 1);
INSERT INTO `merch_typeset` VALUES (3, '创意家居', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (4, '动漫周边', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (5, '数码周边', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (6, '文创用品', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 2);
INSERT INTO `merch_typeset` VALUES (7, '发饰', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);
INSERT INTO `merch_typeset` VALUES (8, '首饰', '', '2022-02-05 08:00:00.000000', '2022-02-05 08:00:00.000000', '0', 2, 2, 3);

-- ----------------------------
-- Table structure for merch_typeset_group
-- ----------------------------
DROP TABLE IF EXISTS `merch_typeset_group`;
CREATE TABLE `merch_typeset_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `typeset_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `merch_typeset_group_typeset_id_group_id_938db79e_uniq`(`typeset_id`, `group_id`) USING BTREE,
  INDEX `merch_typeset_group_group_id_bb0e2d5a_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `merch_typeset_group_group_id_bb0e2d5a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `merch_typeset_group_typeset_id_63f7d30c_fk_merch_typeset_id` FOREIGN KEY (`typeset_id`) REFERENCES `merch_typeset` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merch_typeset_group
-- ----------------------------
INSERT INTO `merch_typeset_group` VALUES (1, 1, 1);
INSERT INTO `merch_typeset_group` VALUES (2, 2, 1);
INSERT INTO `merch_typeset_group` VALUES (3, 3, 2);
INSERT INTO `merch_typeset_group` VALUES (4, 4, 2);
INSERT INTO `merch_typeset_group` VALUES (5, 5, 2);
INSERT INTO `merch_typeset_group` VALUES (6, 6, 2);
INSERT INTO `merch_typeset_group` VALUES (7, 7, 3);
INSERT INTO `merch_typeset_group` VALUES (8, 8, 3);

-- ----------------------------
-- Table structure for supply_supply
-- ----------------------------
DROP TABLE IF EXISTS `supply_supply`;
CREATE TABLE `supply_supply`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `place` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `scale` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grade` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `typ` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supply_supply_created_by_id_e53303bb_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `supply_supply_last_edited_by_id_0e60cef4_fk_users_use`(`last_edited_by_id`) USING BTREE,
  CONSTRAINT `supply_supply_created_by_id_e53303bb_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `supply_supply_last_edited_by_id_0e60cef4_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supply_supply_group
-- ----------------------------
DROP TABLE IF EXISTS `supply_supply_group`;
CREATE TABLE `supply_supply_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `supply_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `supply_supply_group_supply_id_group_id_86ca3cee_uniq`(`supply_id`, `group_id`) USING BTREE,
  INDEX `supply_supply_group_group_id_ad3f8f66_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `supply_supply_group_group_id_ad3f8f66_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `supply_supply_group_supply_id_aa25d1d8_fk_supply_supply_id` FOREIGN KEY (`supply_id`) REFERENCES `supply_supply` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_portrait
-- ----------------------------
DROP TABLE IF EXISTS `users_portrait`;
CREATE TABLE `users_portrait`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `portrait` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_portrait_created_by_id_0b84f29c_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `users_portrait_last_edited_by_id_15d28638_fk_users_use`(`last_edited_by_id`) USING BTREE,
  CONSTRAINT `users_portrait_created_by_id_0b84f29c_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_portrait_last_edited_by_id_15d28638_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_portrait_group
-- ----------------------------
DROP TABLE IF EXISTS `users_portrait_group`;
CREATE TABLE `users_portrait_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `portrait_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_portrait_group_portrait_id_group_id_c48da69d_uniq`(`portrait_id`, `group_id`) USING BTREE,
  INDEX `users_portrait_group_group_id_f7a42882_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_portrait_group_group_id_f7a42882_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_portrait_group_portrait_id_5d5212c9_fk_users_portrait_id` FOREIGN KEY (`portrait_id`) REFERENCES `users_portrait` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_telcode
-- ----------------------------
DROP TABLE IF EXISTS `users_telcode`;
CREATE TABLE `users_telcode`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userextension
-- ----------------------------
DROP TABLE IF EXISTS `users_userextension`;
CREATE TABLE `users_userextension`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `realname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `visits` int unsigned,
  `portrait_id` int(0) DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `users_userextension_portrait_id_8d5f03f1_fk_users_portrait_id`(`portrait_id`) USING BTREE,
  CONSTRAINT `users_userextension_portrait_id_8d5f03f1_fk_users_portrait_id` FOREIGN KEY (`portrait_id`) REFERENCES `users_portrait` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userextension_user_id_d53fc3a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userextension
-- ----------------------------
INSERT INTO `users_userextension` VALUES (1, '管理员', '', '0', '', NULL, 0, NULL, 1);
INSERT INTO `users_userextension` VALUES (2, 'Samle', '', '0', '', NULL, 0, NULL, 2);
INSERT INTO `users_userextension` VALUES (3, '季节社成员1', '', '0', '', NULL, 0, NULL, 3);
INSERT INTO `users_userextension` VALUES (4, '杂货社成员1', '', '0', '', NULL, 0, NULL, 4);
INSERT INTO `users_userextension` VALUES (5, '发饰链成员1', '', '0', '', NULL, 0, NULL, 5);

-- ----------------------------
-- Table structure for users_userextension_group
-- ----------------------------
DROP TABLE IF EXISTS `users_userextension_group`;
CREATE TABLE `users_userextension_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userextension_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userextension_grou_userextension_id_group_i_66b9a7cd_uniq`(`userextension_id`, `group_id`) USING BTREE,
  INDEX `users_userextension_group_group_id_e113cc72_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userextension__userextension_id_45e65fb2_fk_users_use` FOREIGN KEY (`userextension_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userextension_group_group_id_e113cc72_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userextension_group
-- ----------------------------
INSERT INTO `users_userextension_group` VALUES (3, 3, 1);
INSERT INTO `users_userextension_group` VALUES (2, 4, 2);
INSERT INTO `users_userextension_group` VALUES (1, 5, 3);

-- ----------------------------
-- Table structure for wares_wares
-- ----------------------------
DROP TABLE IF EXISTS `wares_wares`;
CREATE TABLE `wares_wares`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weight` decimal(10, 2) DEFAULT NULL,
  `land` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bid` decimal(10, 2) DEFAULT NULL,
  `fix` decimal(10, 2) DEFAULT NULL,
  `delivery` decimal(10, 2) DEFAULT NULL,
  `base` int unsigned,
  `startorder` int unsigned,
  `way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logistics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `img1_id` int(0) DEFAULT NULL,
  `img2_id` int(0) DEFAULT NULL,
  `img3_id` int(0) DEFAULT NULL,
  `img4_id` int(0) DEFAULT NULL,
  `img5_id` int(0) DEFAULT NULL,
  `img6_id` int(0) DEFAULT NULL,
  `img7_id` int(0) DEFAULT NULL,
  `img8_id` int(0) DEFAULT NULL,
  `img9_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  `merchtypechild_id` int(0) DEFAULT NULL,
  `supply_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wares_wares_created_by_id_64ce2660_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `wares_wares_img1_id_40acb429_fk_files_images_id`(`img1_id`) USING BTREE,
  INDEX `wares_wares_img2_id_ebf57b36_fk_files_images_id`(`img2_id`) USING BTREE,
  INDEX `wares_wares_img3_id_949e0139_fk_files_images_id`(`img3_id`) USING BTREE,
  INDEX `wares_wares_img4_id_04ec7dd6_fk_files_images_id`(`img4_id`) USING BTREE,
  INDEX `wares_wares_img5_id_d3294019_fk_files_images_id`(`img5_id`) USING BTREE,
  INDEX `wares_wares_img6_id_27b8f022_fk_files_images_id`(`img6_id`) USING BTREE,
  INDEX `wares_wares_img7_id_55f2ffe1_fk_files_images_id`(`img7_id`) USING BTREE,
  INDEX `wares_wares_img8_id_389854c9_fk_files_images_id`(`img8_id`) USING BTREE,
  INDEX `wares_wares_img9_id_0c5ac875_fk_files_images_id`(`img9_id`) USING BTREE,
  INDEX `wares_wares_last_edited_by_id_7b2fac35_fk_users_userextension_id`(`last_edited_by_id`) USING BTREE,
  INDEX `wares_wares_merchtypechild_id_e575212f_fk_merch_mer`(`merchtypechild_id`) USING BTREE,
  INDEX `wares_wares_supply_id_fc0cd2b4_fk_supply_supply_id`(`supply_id`) USING BTREE,
  CONSTRAINT `wares_wares_created_by_id_64ce2660_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img1_id_40acb429_fk_files_images_id` FOREIGN KEY (`img1_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img2_id_ebf57b36_fk_files_images_id` FOREIGN KEY (`img2_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img3_id_949e0139_fk_files_images_id` FOREIGN KEY (`img3_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img4_id_04ec7dd6_fk_files_images_id` FOREIGN KEY (`img4_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img5_id_d3294019_fk_files_images_id` FOREIGN KEY (`img5_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img6_id_27b8f022_fk_files_images_id` FOREIGN KEY (`img6_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img7_id_55f2ffe1_fk_files_images_id` FOREIGN KEY (`img7_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img8_id_389854c9_fk_files_images_id` FOREIGN KEY (`img8_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_img9_id_0c5ac875_fk_files_images_id` FOREIGN KEY (`img9_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_last_edited_by_id_7b2fac35_fk_users_userextension_id` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_merchtypechild_id_e575212f_fk_merch_mer` FOREIGN KEY (`merchtypechild_id`) REFERENCES `merch_merchtypechild` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_supply_id_fc0cd2b4_fk_supply_supply_id` FOREIGN KEY (`supply_id`) REFERENCES `supply_supply` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wares_wares_group
-- ----------------------------
DROP TABLE IF EXISTS `wares_wares_group`;
CREATE TABLE `wares_wares_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `wares_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wares_wares_group_wares_id_group_id_17892325_uniq`(`wares_id`, `group_id`) USING BTREE,
  INDEX `wares_wares_group_group_id_0b8e7bcd_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `wares_wares_group_group_id_0b8e7bcd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_wares_group_wares_id_a83ac3ca_fk_wares_wares_id` FOREIGN KEY (`wares_id`) REFERENCES `wares_wares` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wares_waresku
-- ----------------------------
DROP TABLE IF EXISTS `wares_waresku`;
CREATE TABLE `wares_waresku`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `last_edited_date` datetime(6) DEFAULT NULL,
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by_id` int(0) DEFAULT NULL,
  `img1_id` int(0) DEFAULT NULL,
  `img2_id` int(0) DEFAULT NULL,
  `img3_id` int(0) DEFAULT NULL,
  `img4_id` int(0) DEFAULT NULL,
  `img5_id` int(0) DEFAULT NULL,
  `img6_id` int(0) DEFAULT NULL,
  `img7_id` int(0) DEFAULT NULL,
  `img8_id` int(0) DEFAULT NULL,
  `img9_id` int(0) DEFAULT NULL,
  `last_edited_by_id` int(0) DEFAULT NULL,
  `wares_id` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wares_waresku_created_by_id_af88bf7f_fk_users_userextension_id`(`created_by_id`) USING BTREE,
  INDEX `wares_waresku_img1_id_93f803a4_fk_files_images_id`(`img1_id`) USING BTREE,
  INDEX `wares_waresku_img2_id_c45b6672_fk_files_images_id`(`img2_id`) USING BTREE,
  INDEX `wares_waresku_img3_id_221f04f5_fk_files_images_id`(`img3_id`) USING BTREE,
  INDEX `wares_waresku_img4_id_04fd2b1c_fk_files_images_id`(`img4_id`) USING BTREE,
  INDEX `wares_waresku_img5_id_767ed22b_fk_files_images_id`(`img5_id`) USING BTREE,
  INDEX `wares_waresku_img6_id_d3c0cbcd_fk_files_images_id`(`img6_id`) USING BTREE,
  INDEX `wares_waresku_img7_id_71164e35_fk_files_images_id`(`img7_id`) USING BTREE,
  INDEX `wares_waresku_img8_id_03e4203a_fk_files_images_id`(`img8_id`) USING BTREE,
  INDEX `wares_waresku_img9_id_536475d0_fk_files_images_id`(`img9_id`) USING BTREE,
  INDEX `wares_waresku_last_edited_by_id_88a6c723_fk_users_use`(`last_edited_by_id`) USING BTREE,
  INDEX `wares_waresku_wares_id_3733702a_fk_wares_wares_id`(`wares_id`) USING BTREE,
  CONSTRAINT `wares_waresku_created_by_id_af88bf7f_fk_users_userextension_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img1_id_93f803a4_fk_files_images_id` FOREIGN KEY (`img1_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img2_id_c45b6672_fk_files_images_id` FOREIGN KEY (`img2_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img3_id_221f04f5_fk_files_images_id` FOREIGN KEY (`img3_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img4_id_04fd2b1c_fk_files_images_id` FOREIGN KEY (`img4_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img5_id_767ed22b_fk_files_images_id` FOREIGN KEY (`img5_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img6_id_d3c0cbcd_fk_files_images_id` FOREIGN KEY (`img6_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img7_id_71164e35_fk_files_images_id` FOREIGN KEY (`img7_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img8_id_03e4203a_fk_files_images_id` FOREIGN KEY (`img8_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_img9_id_536475d0_fk_files_images_id` FOREIGN KEY (`img9_id`) REFERENCES `files_images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_last_edited_by_id_88a6c723_fk_users_use` FOREIGN KEY (`last_edited_by_id`) REFERENCES `users_userextension` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_wares_id_3733702a_fk_wares_wares_id` FOREIGN KEY (`wares_id`) REFERENCES `wares_wares` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wares_waresku_group
-- ----------------------------
DROP TABLE IF EXISTS `wares_waresku_group`;
CREATE TABLE `wares_waresku_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `waresku_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wares_waresku_group_waresku_id_group_id_78c3649d_uniq`(`waresku_id`, `group_id`) USING BTREE,
  INDEX `wares_waresku_group_group_id_362d562a_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `wares_waresku_group_group_id_362d562a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wares_waresku_group_waresku_id_4fe92cf9_fk_wares_waresku_id` FOREIGN KEY (`waresku_id`) REFERENCES `wares_waresku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
