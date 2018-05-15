/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : erp

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 15/05/2018 17:55:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bom_data
-- ----------------------------
DROP TABLE IF EXISTS `bom_data`;
CREATE TABLE `bom_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRD_ID` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `MTR_CUT_ID` bigint(20) NULL DEFAULT NULL COMMENT '切割形状ID',
  `MTR_TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料类别',
  `TAKE_STN` bigint(20) NULL DEFAULT NULL COMMENT '领料站点',
  `SEMI_FINISHED` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否半成品',
  `GROSS_WGT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '材料毛重',
  `NET_WGT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净重',
  `NET_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净得率',
  `MODI_WGT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '熟重',
  `MODI_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '熟得率',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配方信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bom_detail
-- ----------------------------
DROP TABLE IF EXISTS `bom_detail`;
CREATE TABLE `bom_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bom_id` bigint(20) NULL DEFAULT NULL COMMENT '配方ID',
  `mtr_id` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `mtr_extend_id` bigint(20) NULL DEFAULT NULL COMMENT '扩展规格ID',
  `mtr_extend_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展规格说明[单位编码-单位名称-转换率]',
  `mtr_cut_id` bigint(20) NULL DEFAULT NULL COMMENT '切割形状ID',
  `gross_wgt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毛重',
  `net_wgt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净重',
  `net_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净得率',
  `modi_wgt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '熟重',
  `modi_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '熟得率',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '配方里原料的单价=原料采购价／采购转换率',
  `semi_finished` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否半成品',
  `cost` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '配方里原料的成本=（配方里原料单价／原料配方单位转换率',
  `cost_rate` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本率=(成本／产品售价)*100%',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bom_detail
-- ----------------------------
INSERT INTO `bom_detail` VALUES (8, 2, 1, NULL, NULL, 14, '3.00', '3', '1', '6.00', '2', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (10, 1, 1, NULL, NULL, 10, '7.00', '7', '1', '14.00', '2', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (11, 1, 3, NULL, NULL, 0, NULL, '9', NULL, '27.00', '3', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (13, 3, 2, NULL, NULL, 16, '18.00', '9', '2', '27.00', '3', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (14, 3, 4, NULL, NULL, NULL, NULL, '2', NULL, '6.00', '3', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (15, 3, 3, NULL, NULL, 17, '6.00', '3', '2', '9.00', '3', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (16, 1, 2, NULL, NULL, 16, '30.00', '15', '2', '45.00', '3', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (18, 2, 4, NULL, NULL, 0, NULL, '5', NULL, '20.00', '4', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (28, 6, 318, NULL, NULL, NULL, '6', '6', '1', '6', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (29, 6, 1180, NULL, NULL, NULL, '1.00', '1', '1.000', '1.00', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (30, 6, 679, NULL, NULL, NULL, '1.00', '1', '1.000', '1.00', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (32, 6, 6, NULL, NULL, NULL, NULL, '45', NULL, '45.00', '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (33, 8, 2056, NULL, NULL, 0, NULL, '50.2', NULL, '45.03', '0.897', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (34, 9, 4, NULL, NULL, NULL, '', '2.56', '1', '2.56', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (35, 9, 247, NULL, NULL, NULL, '0.04', '0.04', '1.000', '0.00', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (36, 9, 251, NULL, NULL, NULL, '2.56', '2.56', '1.000', '2.56', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (37, 9, 264, NULL, NULL, NULL, '0.04', '0.04', '1.000', '0.04', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (38, 9, 137, NULL, NULL, NULL, '40.50', '45', '0.900', '45.00', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (39, 7, 4, NULL, NULL, NULL, '7980', '7980', '1', '893.8', '0.112', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (40, 7, 247, NULL, NULL, NULL, '120.00', '120', '1.000', '76.4', '0.637', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (41, 7, 257, NULL, NULL, NULL, '7.00', '7', '1.000', '0.007', '0.0010', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (42, 7, 264, NULL, NULL, NULL, '30.00', '30', '1.000', '0.03', '0.001', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (43, 7, 266, NULL, NULL, NULL, '45.00', '45', '1.000', '0.045', '0.0010', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (44, 7, 267, NULL, NULL, NULL, '200.00', '200', '1.000', '200', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (45, 7, 325, NULL, NULL, NULL, '90.00', '90', '1.000', '90.00', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (46, 7, 324, NULL, NULL, NULL, '4761.9', '5000', '1.05', '10240', '2.048', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (47, 7, 287, NULL, NULL, NULL, '90.00', '90', '1.000', '0.09', '0.001', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (48, 11, 4, NULL, NULL, NULL, '45.00', '45', '1.0', '45.00', '1.00', NULL, '0', 0.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (50, 11, 267, NULL, NULL, NULL, '2.27', '2.27', '1.00', '0.00', '0.001', NULL, '0', 0.01, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (51, 11, 128, NULL, NULL, NULL, '229.00', '229', '1.00', '226.94', '0.991', NULL, '0', 0.92, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (53, 13, 4, NULL, NULL, NULL, '300', '300', '1', '300.00', '0.001', 0.00, '0', 0.00, 0.00, NULL, NULL, 'admin', '2017-12-19 21:12:20');
INSERT INTO `bom_detail` VALUES (54, 13, 8, NULL, NULL, NULL, '50.00', '50', '1.000', '0.05', '0.001', 2.40, '0', 0.24, 0.00, NULL, NULL, 'admin', '2017-12-19 21:12:08');
INSERT INTO `bom_detail` VALUES (55, 13, 247, NULL, NULL, NULL, '5.00', '5', '1.000', '0.55', '0.11', 6.60, '0', 0.03, 0.00, NULL, NULL, 'admin', '2017-12-19 21:11:20');
INSERT INTO `bom_detail` VALUES (56, 13, 264, NULL, NULL, NULL, '10.00', '10', '1.000', '0.01', '0.001', 4.99, '0', 0.05, 0.00, NULL, NULL, 'admin', '2017-12-19 21:10:24');
INSERT INTO `bom_detail` VALUES (57, 13, 292, NULL, NULL, NULL, '100.00', '100', '1.000', '0.10', '0.001', 0.19, '0', 0.02, 0.00, NULL, NULL, 'admin', '2017-12-19 21:09:32');
INSERT INTO `bom_detail` VALUES (58, 13, 188, NULL, NULL, NULL, '277.78', '250', '0.900', '212.50', '0.85', 26.80, '0', 6.70, 0.00, NULL, NULL, 'admin', '2017-12-19 21:07:57');
INSERT INTO `bom_detail` VALUES (59, 12, 371, NULL, NULL, NULL, NULL, '80', NULL, '72.00', '0.9', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (60, 12, 122, NULL, NULL, NULL, '72.00', '80', '0.8', '56.00', '0.721', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (61, 12, 258, NULL, NULL, NULL, '1.00', '1', '1.000', '0.01', '0.06', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (62, 12, 266, NULL, NULL, NULL, '6.25', '6.25', '1.000', '0.06', '0.15', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (63, 12, 287, NULL, NULL, NULL, '37.00', '37', '1.000', '37', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (64, 10, 56, NULL, NULL, NULL, NULL, '140', NULL, '140.00', '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (65, 10, 55, NULL, NULL, NULL, NULL, '280', NULL, '280.00', '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (66, 10, 356, NULL, NULL, NULL, '1.00', '1', '1.000', '1', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (67, 10, 357, NULL, NULL, NULL, '1.00', '1', '1.000', '1', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (68, 10, 536, NULL, NULL, NULL, '1.00', '1', '1.000', '1.00', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (69, 10, 1406, NULL, NULL, NULL, '0.20', '0.2', '1.000', '0.20', '1.000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (70, 6, NULL, NULL, NULL, NULL, NULL, '140', NULL, '140.00', '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_detail` VALUES (71, 13, 1455, NULL, NULL, NULL, '52.63', '50', '0.95', '40.00', '0.8', 4.50, '0', 0.23, 0.00, NULL, NULL, 'admin', '2017-12-19 21:07:32');
INSERT INTO `bom_detail` VALUES (72, 14, 287, NULL, NULL, NULL, '30.00', '30', '1.0', '30.00', '1', 6.90, '0', 0.21, 0.00, NULL, NULL, 'admin', '2017-12-18 15:40:24');
INSERT INTO `bom_detail` VALUES (73, 14, 997, NULL, NULL, 69, '250.00', '250', '1.000', '250.00', '1.000', 2.67, '0', 0.67, 0.00, NULL, NULL, 'admin', '2017-12-19 00:03:51');
INSERT INTO `bom_detail` VALUES (74, 14, 276, NULL, NULL, NULL, '50.00', '50', '1.00', '5.00', '0.1', 24.00, '0', 1.20, 0.00, NULL, NULL, 'admin', '2017-12-18 23:42:34');
INSERT INTO `bom_detail` VALUES (75, 14, 2, NULL, NULL, 0, '80.00', '80', '1', '64.00', '0.8', 1.50, '0', 0.12, 0.00, 'admin', '2017-12-16 08:26:36', 'admin', '2017-12-18 15:45:39');
INSERT INTO `bom_detail` VALUES (76, 14, 674, NULL, NULL, NULL, '1.00', '1', '1.00', '1.00', '1.000', 0.07, '0', 0.07, 0.00, 'admin', '2017-12-18 13:16:03', 'admin', '2017-12-18 15:46:29');
INSERT INTO `bom_detail` VALUES (77, 14, 1460, NULL, NULL, NULL, '1.00', '1.0', '1', '1.00', '1', 0.42, '0', 0.42, 0.00, 'admin', '2017-12-19 10:37:54', 'admin', '2017-12-19 10:40:00');
INSERT INTO `bom_detail` VALUES (83, 15, 158, NULL, NULL, NULL, '250.00', '250', '1.000', '250.00', '1.000', 2.30, '0', 0.58, 0.01, 'admin', '2017-12-20 16:23:45', 'admin', '2017-12-20 16:26:13');
INSERT INTO `bom_detail` VALUES (84, 5, 294, NULL, NULL, NULL, '176.47', '150', '0.850', '150.00', '1.000', 9.00, '0', 1.35, 0.01, 'admin', '2017-12-21 03:43:32', NULL, NULL);
INSERT INTO `bom_detail` VALUES (85, 5, 700, NULL, NULL, NULL, '150.00', '150', '1.000', '150.00', '1.000', 10.00, '0', 1.50, 0.01, 'admin', '2017-12-21 03:44:53', 'admin', '2017-12-21 03:45:28');
INSERT INTO `bom_detail` VALUES (86, 5, 264, NULL, NULL, NULL, '50.00', '50', '1.000', '0.05', '0.001', 4.99, '0', 0.25, 0.00, 'admin', '2017-12-21 03:46:08', NULL, NULL);
INSERT INTO `bom_detail` VALUES (87, 5, 287, NULL, NULL, NULL, '150.00', '150', '1.000', '0.15', '0.001', 6.90, '0', 1.04, 0.01, 'admin', '2017-12-21 03:46:26', NULL, NULL);
INSERT INTO `bom_detail` VALUES (88, 16, 100, NULL, NULL, NULL, '333.33', '300', '0.900', '210.00', '0.700', 1.80, '0', 0.54, 0.00, 'admin', '2017-12-21 06:35:28', NULL, NULL);
INSERT INTO `bom_detail` VALUES (89, 16, 243, NULL, NULL, NULL, '100.00', '100', '1.000', '0.10', '0.001', 2.05, '0', 0.20, 0.00, 'admin', '2017-12-21 06:36:08', NULL, NULL);
INSERT INTO `bom_detail` VALUES (90, 16, 83, NULL, NULL, NULL, '21.05', '20', '0.950', '16.00', '0.800', 3.50, '0', 0.07, 0.00, 'admin', '2017-12-21 06:36:37', NULL, NULL);
INSERT INTO `bom_detail` VALUES (91, 16, 287, NULL, NULL, NULL, '100.00', '100', '1.000', '0.10', '0.001', 6.90, '0', 0.69, 0.00, 'admin', '2017-12-21 06:37:35', NULL, NULL);
INSERT INTO `bom_detail` VALUES (92, 16, 276, NULL, NULL, NULL, '15.00', '15', '1.000', '1.50', '0.100', 24.00, '0', 0.36, 0.00, 'admin', '2017-12-22 11:10:52', NULL, NULL);
INSERT INTO `bom_detail` VALUES (93, 17, 86, NULL, NULL, NULL, '176.47', '150', '0.850', '127.50', '0.850', 2.50, '0', 0.38, 0.00, 'admin', '2017-12-27 01:02:00', NULL, NULL);
INSERT INTO `bom_detail` VALUES (95, 18, 2, NULL, NULL, NULL, '60.00', '120', '2', '360.00', '3', 1.50, '0', 0.18, 0.00, 'admin', '2017-12-27 01:03:38', NULL, NULL);
INSERT INTO `bom_detail` VALUES (96, 18, 997, NULL, NULL, NULL, '100.00', '100', '1.000', '100.00', '1.000', 2.67, '0', 0.27, 0.00, 'admin', '2017-12-27 01:04:03', NULL, NULL);
INSERT INTO `bom_detail` VALUES (97, 18, 264, NULL, NULL, NULL, '20.00', '20', '1.000', '0.02', '0.001', 4.99, '0', 0.10, 0.00, 'admin', '2017-12-27 01:04:13', NULL, NULL);
INSERT INTO `bom_detail` VALUES (98, 17, 2060, NULL, NULL, 0, NULL, '170', NULL, '136.00', '0.8', NULL, '1', 0.91, 0.00, 'admin', '2017-12-27 01:04:47', 'admin', '2018-01-31 22:16:15');
INSERT INTO `bom_detail` VALUES (103, 18, 1460, 0, '件-900-¥:378.00', NULL, '1.00', '1', '1', '1.00', '1', 0.42, '0', 0.42, 0.00, 'admin', '2018-01-17 03:38:48', NULL, NULL);
INSERT INTO `bom_detail` VALUES (104, 17, 1460, 5, '盒-50.00-¥:8.00', NULL, '1.00', '1', '1', '1.00', '1', 0.16, '0', 0.16, 0.00, 'admin', '2018-01-31 22:20:31', 'admin', '2018-01-31 23:23:39');
INSERT INTO `bom_detail` VALUES (105, 20, 324, 0, '袋-1.000-¥:5.40', NULL, '300.00', '300', '1.000', '300.00', '1.000', 5.40, '0', 1.62, 0.00, 'admin', '2018-02-01 16:41:03', NULL, NULL);
INSERT INTO `bom_detail` VALUES (106, 20, 27, 0, '袋-1.000-¥:3.60', NULL, '100.00', '100', '1.000', '100.00', '1.000', 3.60, '0', 0.36, 0.00, 'admin', '2018-02-01 16:42:41', NULL, NULL);
INSERT INTO `bom_detail` VALUES (107, 21, 148, 0, '盒-1.000-¥:13.50', NULL, '900.00', '1000', '0.900', '1000.00', '1.000', 13.50, '0', 10.00, 0.03, 'admin', '2018-02-01 16:48:34', 'admin', '2018-04-17 22:37:45');
INSERT INTO `bom_detail` VALUES (108, 21, 264, 0, '袋-17.500-¥:87.27', NULL, '50.00', '50', '1.000', '0.05', '0.001', 4.99, '0', 0.00, 0.00, 'admin', '2018-02-01 16:49:12', 'admin', '2018-04-17 22:37:10');
INSERT INTO `bom_detail` VALUES (110, 21, 8, 0, '壶-1-¥:1.20', NULL, '2.00', '200', '0.01', '2.00', '0.010', 1.20, '0', 0.00, 0.00, 'admin', '2018-02-01 18:05:33', 'admin', '2018-04-17 22:36:28');
INSERT INTO `bom_detail` VALUES (111, 19, 8, NULL, NULL, 0, '40.00', '40', NULL, '34.00', '0.85', 5.00, '1', 0.20, 0.00, 'admin', '2018-02-01 18:09:49', 'admin', '2018-05-03 02:17:32');
INSERT INTO `bom_detail` VALUES (113, 11, 287, 0, '桶-20-¥:138', NULL, '80.00', '80', '1.000', '0.08', '0.001', 6.90, '0', 0.55, 0.00, 'admin', '2018-03-30 14:49:59', NULL, NULL);
INSERT INTO `bom_detail` VALUES (114, 20, 699, NULL, NULL, 0, '100.00', '100', NULL, '95.00', '0.95', 1.50, '1', 0.50, 0.00, 'admin', '2018-04-23 15:08:39', 'admin', '2018-05-03 02:18:02');

-- ----------------------------
-- Table structure for bom_info
-- ----------------------------
DROP TABLE IF EXISTS `bom_info`;
CREATE TABLE `bom_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bom_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配方名称',
  `bom_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配方编号',
  `bom_py` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `prd_id` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `cost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '成本',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bom_info
-- ----------------------------
INSERT INTO `bom_info` VALUES (1, '红豆粥12', NULL, 'HDZ12', 2, 0.00, '1', 'dawdawdaw222', NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (3, '火锅底料', NULL, 'HGDL', 3, 0.00, '1', '半成品火锅底料的配方', NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (4, '*盐饭', NULL, '*YF', 73, 0.00, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (5, '*三彩蛋卷', NULL, '*SCDJ(2P）', 5, 4.14, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (6, '至尊饭团(奥尔良鸡腿)180g', NULL, 'ZZFT(AELJT)180G', 2052, 0.00, '1', '2222', NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (7, '*九州鸡块饭', NULL, '*JZJKF', 39, 0.00, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (8, '*奥尔良鸡腿45g（至尊饭团）', NULL, '*AELJT1K（ZZFT）', 6, 0.00, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (9, '*腌制奥尔良鸡腿45g（至尊饭团）', NULL, '*YZAELJT（ZZFT）', 174, 0.00, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (10, '葱油拌面420g', NULL, 'CYBM420G', 2058, 0.00, '1', '11111111111', NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (11, '*热干面', NULL, '*RGM', 55, 1.48, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (12, '*肉丝葱油', NULL, '*RSCY', 56, 0.00, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bom_info` VALUES (13, '*葱油肉丝的肉丝', NULL, 'CYRSDRS', 371, 7.27, '1', '111', NULL, NULL, 'admin', '2017-12-19 21:04:40');
INSERT INTO `bom_info` VALUES (14, '泡椒滑鸡', NULL, 'PJHJ', 166, 2.69, '1', '1212121', NULL, NULL, 'admin', '2017-12-16 08:04:33');
INSERT INTO `bom_info` VALUES (15, '孜香牛肉', NULL, 'ZXNR', 84, 0.58, '1', NULL, 'admin', '2017-12-20 16:05:44', NULL, NULL);
INSERT INTO `bom_info` VALUES (16, '现打中餐-酸辣大白菜(Z)', NULL, 'XDZC-SLDBC(Z)', 621, 1.86, '1', NULL, 'admin', '2017-12-21 06:34:48', NULL, NULL);
INSERT INTO `bom_info` VALUES (17, '测试类产品', NULL, 'CSLCP', 2062, 1.45, '1', NULL, 'admin', '2017-12-27 01:01:33', NULL, NULL);
INSERT INTO `bom_info` VALUES (18, '测试类半成品1', NULL, 'CSLBCP1', 2060, 0.97, '1', NULL, 'admin', '2017-12-27 01:03:09', 'admin', '2018-01-17 01:31:14');
INSERT INTO `bom_info` VALUES (19, '雪菜鸡丁炒饭', NULL, 'XCJDCF', 699, 0.20, '1', NULL, 'admin', '2018-02-01 16:36:37', NULL, NULL);
INSERT INTO `bom_info` VALUES (20, '白米饭', NULL, '*BMF', 8, 2.48, '1', NULL, 'admin', '2018-02-01 16:38:28', NULL, NULL);
INSERT INTO `bom_info` VALUES (21, '*腌制鸡丁5*5', NULL, 'AZJD5*5', 117, 10.00, '1', NULL, 'admin', '2018-02-01 16:45:12', NULL, NULL);

-- ----------------------------
-- Table structure for mtr_cut
-- ----------------------------
DROP TABLE IF EXISTS `mtr_cut`;
CREATE TABLE `mtr_cut`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `CUT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加工形状',
  `WORK_HOURS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工时',
  `NET_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净得率',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mtr_cut
-- ----------------------------
INSERT INTO `mtr_cut` VALUES (10, 2, 'a', '1', '1', '1');
INSERT INTO `mtr_cut` VALUES (13, 1, '一', '1', '1', '1');
INSERT INTO `mtr_cut` VALUES (14, 1, '二', '2', '2', '1');
INSERT INTO `mtr_cut` VALUES (15, 1, '三', '3', '3', '1');
INSERT INTO `mtr_cut` VALUES (16, 2, 'd', '4', '4', '1');
INSERT INTO `mtr_cut` VALUES (17, 3, '测试', '3', '3', '1');
INSERT INTO `mtr_cut` VALUES (18, NULL, 'AAA', '1', '1.5', '1');

-- ----------------------------
-- Table structure for mtr_data
-- ----------------------------
DROP TABLE IF EXISTS `mtr_data`;
CREATE TABLE `mtr_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MTR_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料编号',
  `MTR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料名称',
  `MTR_PY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `TYPE_ID` int(11) NULL DEFAULT NULL COMMENT '类别',
  `CUT_ID` bigint(20) NULL DEFAULT NULL COMMENT '切割形状',
  `PURCHASE_UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购单位',
  `PURCHASE_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购单位转换率',
  `MINI_UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最小单位',
  `MINI_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最小单位转换率',
  `FORMULA_UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配方单位',
  `MODI_RATE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净菜得率',
  `MODI_RATE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '熟菜得率',
  `WAREHOUSE_ID` int(11) NULL DEFAULT NULL COMMENT '所属仓库',
  `TAKE_STN_ID` int(11) NULL DEFAULT NULL COMMENT '领料站点',
  `WGT_UNIT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单件重量',
  `WGT_UNIT2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单筐重量',
  `PRICE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购单价',
  `FIXUP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定采购',
  `PURCYCLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购周期',
  `COST_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本分类',
  `TAX_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税率',
  `EXTEND_ID` bigint(20) NULL DEFAULT NULL,
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  `EXTEND_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对外编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1461 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '原料基础数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mtr_data
-- ----------------------------
INSERT INTO `mtr_data` VALUES (1, '1010300001', '测试股油', 'CSGY', 6, 14, '11', '1', '12', '2', '13', '1', '2', 24, 20, NULL, NULL, '3', '0', NULL, '15', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (2, '00000236', '酱油', 'JY', 8, 16, '53', '20', '46', '1000', '47', '2', '3', 29, 20, NULL, NULL, '30.00', '0', NULL, '15', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-18 15:45:23', NULL);
INSERT INTO `mtr_data` VALUES (3, '1010300003', '测试原料1', 'CSYL1', 8, NULL, '12', '10', '11', '10', '13', '2', '3', 24, 24, NULL, NULL, '5', '0', NULL, '15', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (4, '00000000', '水', 'S', 4, NULL, '46', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '0', '否', '10', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (5, '00000001', '青豆', 'QD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.850', NULL, NULL, '10.0', '0.0', '8.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (6, '00000003', '面条', 'MT', NULL, NULL, '278', '0.900', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (7, '00000004', '精品大曲', 'JPDQ', NULL, NULL, '270', '2.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '9.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (8, '00000005', '料酒', 'LJ', 8, NULL, '108', '1', '46', '1000', '47', '1.000', '0.010', 29, 58, '10.0', '7.0', '1.20', '1', '7', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-04-17 22:35:55', NULL);
INSERT INTO `mtr_data` VALUES (9, '00000006', '白木耳', 'BME', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '60.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (10, '00000007', '干香菇', 'GXG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '2.000', '0.900', NULL, NULL, '0.0', '5.0', '80.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (11, '00000008', '海带丝', 'HDS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '6.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (12, '00000009', '(停用)----------------盐渍海带丝', '(TY)----------------YZHDS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '6.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (13, '00000010', '干黑木耳', 'GHME', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '80.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (14, '00000011', '白芷', 'BZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '22.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (15, '00000012', '草果', 'CG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '65.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (16, '00000013', '红扣', 'HK', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '24.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (17, '00000014', '姜黄', 'JH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '38.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (18, '00000015', '肉蔻', 'RK', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '99.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (19, '00000016', '山奈', 'SN', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '28.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (20, '00000017', '香砂仁', 'XSR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '96.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (21, '00000018', '玉果', 'YG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '75.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (22, '00000019', '火腿肠', 'HTC', NULL, NULL, '279', '0.050', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '0.76', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (23, '00000020', '小红枣', 'XHZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '7.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (24, '00000021', '干豆角', 'GDJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.500', NULL, NULL, '10.0', '0.0', '34.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (25, '00000022', '海白菜', 'HBC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '14.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (26, '00000023', '梅干菜', 'MGC', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '14.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (27, '00000024', '爽口雪菜', 'SKXC（YL）', 9, NULL, '64', '1.000', '46', '1000.000', '47', '1.000', '1.000', 28, 107, '10.0', '5.0', '3.60', '1', '5', '59', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-02-01 16:42:22', NULL);
INSERT INTO `mtr_data` VALUES (28, '00000025', '酸菜', 'SC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '4.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (29, '00000026', '外婆菜', 'WPC', NULL, NULL, '268', '8.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '5.05', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (30, '00000027', '榨菜丝', 'ZCS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '3.60', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (31, '00000028', '榨菜坨', 'ZCT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '3.60', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (32, '00000029', '紫菜', 'ZC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.200', NULL, NULL, '10.0', '5.0', '140.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (33, '00000030', '酸豆角', 'SDJ（YL）', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '11.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (34, '00000031', '剁椒', 'DJ', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '5.0', '8.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (35, '00000032', '冻毛豆米', 'DMDM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '0.0', '8.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (36, '00000033', '冻玉米粒', 'DYML', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '1.000', NULL, NULL, '10.0', '0.0', '6.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (37, '00000034', '(停用)----------------酱瓜条', '(TY)----------------JGT', NULL, NULL, '270', '0.670', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '17.50', '否', '7', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (38, '00000035', '白萝卜', 'BLB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.930', '0.800', NULL, NULL, '10.0', '0.0', '2.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (39, '00000036', '大蒜', 'DS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '9.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (40, '00000037', '红萝卜', 'HLB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.953', '0.850', NULL, NULL, '10.0', '0.0', '2.70', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (41, '00000038', '红薯', 'HS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.840', '0.850', NULL, NULL, '10.0', '0.0', '1.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (42, '00000039', '黄豆芽', 'HDY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.950', '0.800', NULL, NULL, '10.0', '0.0', '2.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (43, '00000040', '绿豆芽', 'LDY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '2.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (44, '00000041', '净莴苣', 'JWJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.980', '1.000', NULL, NULL, '10.0', '0.0', '9.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (45, '00000042', '香芋', 'XY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '0.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (46, '00000043', '小紫薯', 'XZS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '1.000', NULL, NULL, '10.0', '0.0', '5.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (47, '00000044', '净芋头', 'JYT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.800', '0.900', NULL, NULL, '10.0', '0.0', '4.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (48, '00000045', '扁豆', 'BD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '8.40', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (49, '00000046', '蚕豆米', 'CDM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '24.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (50, '00000047', '带壳花生', 'DKHS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '7.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (51, '00000048', '青皮冬瓜', 'QPDG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.780', '0.750', NULL, NULL, '10.0', '0.0', '0.90', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (52, '00000049', '番茄', 'FQ', 100, NULL, '46', '1.000', '46', '1000.000', '47', '0.950', '1.000', 28, 20, '', '', '4.60', '是', '0', '101', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (53, '00000050', '广椒', 'GJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '7.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (54, '00000051', '杭椒', 'HJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '1.000', NULL, NULL, '10.0', '0.0', '7.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (55, '00000052', '红椒', 'HJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '0.0', '6.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (56, '00000053', '红樱桃番茄', 'HYTFQ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.50', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (57, '00000054', '黄瓜', 'HG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.800', '1.000', NULL, NULL, '10.0', '0.0', '3.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (58, '00000055', '秋葵', 'QK', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (59, '00000056', '金南瓜', 'JNG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '5.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (60, '00000057', '苦瓜', 'KG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '0.600', NULL, NULL, '10.0', '0.0', '5.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (61, '00000058', '毛豆', 'MD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.900', NULL, NULL, '10.0', '0.0', '6.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (62, '00000059', '南瓜', 'NG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.680', '1.000', NULL, NULL, '10.0', '0.0', '1.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (63, '00000060', '嫩南瓜', 'NNG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '1.800', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (64, '00000061', '紫茄子', 'ZQZ', 100, NULL, '46', '1.000', '46', '1000.000', '47', '0.900', '0.600', 28, 20, '', '', '5.80', '0', '0', '101', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (65, '00000062', '青豆角', 'QDJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (66, '00000063', '青椒', 'QJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '0.0', '3.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (67, '00000064', '青丝瓜', 'QSG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '6.90', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (68, '00000065', '四季豆', 'SJD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '0.0', '12.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (69, '00000066', '笋瓜', 'SG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.950', '1.000', NULL, NULL, '10.0', '0.0', '7.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (70, '00000067', '西兰花', 'XLH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.700', '0.700', NULL, NULL, '10.0', '0.0', '9.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (71, '00000068', '鲜小米椒', 'XXMJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '9.50', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (72, '00000069', '黑玉米', 'HYM', NULL, NULL, '279', '1.000', '279', '1.000', '279', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '2.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (73, '00000070', '糯玉米', 'NYM', NULL, NULL, '279', '1.000', '279', '1.000', '279', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '1.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (74, '00000071', '百合', 'BH', NULL, NULL, '271', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (75, '00000072', '花菜', 'HC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.700', '1.000', NULL, NULL, '10.0', '0.0', '6.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (76, '00000073', '花生米', 'HSM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.900', NULL, NULL, '10.0', '7.0', '15.00', '是', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (77, '00000074', '冬笋', 'DS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '11.0', '0.0', '8.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (78, '00000075', '毛莴苣', 'MWJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '7.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (79, '00000076', '莲藕', 'LO', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.820', '0.700', NULL, NULL, '10.0', '0.0', '9.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (80, '00000077', '毛芋头', 'MYT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '4.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (81, '00000078', '泥蒿', 'NH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '0.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (82, '00000079', '山药', 'SY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '5.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (83, '00000080', '生姜', 'SJ', 6, NULL, '46', '1.000', '46', '1000.000', '47', '0.950', '0.800', 28, 58, '10.0', '0.0', '3.50', '0', '0', '15', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-21 06:38:14', NULL);
INSERT INTO `mtr_data` VALUES (84, '00000081', '蒜苗', 'SM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.750', '0.600', NULL, NULL, '10.0', '0.0', '5.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (85, '00000082', '铁棍山药', 'TGSY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '8.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (86, '00000083', '土豆', 'TD', 100, NULL, '46', '1.000', '46', '1000.000', '47', '0.850', '0.850', 28, 20, '', '', '2.50', '0', '0', '101', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (87, '00000084', '香芹', 'XQ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '0.800', NULL, NULL, '10.0', '0.0', '10.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (88, '00000086', '茶树菇', 'CSG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '14.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (89, '00000087', '姬菇', 'JG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '14.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (90, '00000088', '金针菇', 'JZG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '11.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (91, '00000089', '平菇', 'PG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '8.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (92, '00000090', '杏鲍菇', 'XBG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '11.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (93, '00000091', '板栗米', 'BLM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '29.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (94, '00000092', '甜玉米', 'TYM', NULL, NULL, '279', '1.000', '279', '1.000', '279', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '1.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (95, '00000093', '西生菜', 'XSC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (96, '00000094', '鲜榨菜', 'XZC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '10.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (97, '00000095', '白菜苔', 'BCT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '0.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (98, '00000096', '菠菜', 'BC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '7.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (99, '00000097', '菜芯', 'CX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '2.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (100, '00000098', '大白菜', 'DBC', 100, NULL, '46', '1.000', '46', '1000.000', '47', '0.900', '0.700', 28, 20, '', '', '1.80', '0', '0', '101', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (101, '00000099', '大白菜秧', 'DBCY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (102, '00000100', '大葱', 'DC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '0.900', NULL, NULL, '10.0', '0.0', '5.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (103, '00000101', '红菜苔', 'HCT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.750', NULL, NULL, '10.0', '0.0', '0.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (104, '00000102', '韭菜', 'JC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.850', '0.650', NULL, NULL, '10.0', '0.0', '6.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (105, '00000103', '韭菜花', 'JCH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '10.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (106, '00000104', '韭黄', 'JH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '16.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (107, '00000105', '空心菜', 'KXC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '6.70', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (108, '00000106', '马齿苋', 'MCX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', NULL, '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (109, '00000107', '牛心包', 'NXB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '0.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (110, '00000109', '平包菜', 'PBC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '2.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (111, '00000110', '青梗芹菜', 'QGQC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '5.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (112, '00000111', '球包菜', 'QBC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '1.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (113, '00000112', '(停)上海青', '(T)SHQ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '7.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (114, '00000113', '生菜', 'SC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '7.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (115, '00000114', '蒜米', 'SM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '16.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (116, '00000115', '苕尖', 'SJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '6.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (117, '00000116', '停用-----娃娃菜', 'TY-----WWC', NULL, NULL, '271', '0.300', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '9.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (118, '00000117', '西芹', 'XQ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '5.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (119, '00000118', '苋菜', 'XC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '7.50', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (120, '00000119', '香菜', 'XC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.500', NULL, NULL, '10.0', '0.0', '17.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (121, '00000120', '小白菜', 'XBC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '6.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (122, '00000121', '小葱', 'XC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '13.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (123, '00000122', '洋葱', 'YC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '2.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (124, '00000123', '油麦菜', 'YMC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.700', NULL, NULL, '10.0', '0.0', '7.80', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (125, '00000124', '紫甘兰', 'ZGL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '8.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (126, '00000126', '意大利面', 'YDLM', NULL, NULL, '283', '3.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '24.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (127, '00000127', '鹌鹑蛋', 'ACD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '12.67', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (128, '00000128', '热干面（熟）', 'RGM（S）', 54, NULL, '46', '1.000', '46', '1000.000', '47', '1.000', '1.000', 28, 58, '10.0', '0.0', '4.00', '0', '0', '55', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-21 04:17:49', NULL);
INSERT INTO `mtr_data` VALUES (129, '00000129', '猪大皮', 'ZDP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '12.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (130, '00000130', '田螺', 'TL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '9.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (131, '00000131', '小河虾', 'XHX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '36.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (132, '00000132', '草鱼', 'CY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '20.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (133, '00000133', '草鱼块', 'CYK', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '21.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (134, '00000134', '鲢子鱼', 'LZY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '11.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (135, '00000135', '鱼白', 'YB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '24.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (136, '00000136', '鱼红', 'YH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '23.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (137, '00000137', '去骨鸡上腿排', 'QGJSTP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '15.0', '16.00', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (138, '00000138', '鱿鱼头', 'YYT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '17.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (139, '00000139', '鱿鱼尾', 'YYW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '16.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (140, '00000140', '调理奥尔良烤鸡450g', 'DLAELKJ450G', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '6.40', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (141, '00000141', '调理烤鸭', 'DLKY', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '10.40', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (142, '00000142', '凤爪', 'FZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '20.00', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (143, '00000143', '鸡翅根', 'JCG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '17.20', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (144, '00000144', '鸡翅尖', 'JCJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.600', NULL, NULL, '10.0', '15.0', '16.00', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (145, '00000145', '鸡翅中', 'JCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '39.47', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (146, '00000146', '鸡架', 'JJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '4.40', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (147, '00000147', '鸡排腿', 'JPT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '15.50', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (148, '00000148', '鸡胸肉', 'JXR', 109, NULL, '11', '1.000', '46', '1000.000', '47', '0.900', '1.000', 27, 22, '10.0', '15.0', '13.50', '1', '15', '105', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-02-01 16:46:18', NULL);
INSERT INTO `mtr_data` VALUES (149, '00000149', '西装鸡（18只）', 'XZJ（18Z）', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '7.70', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (150, '00000150', '西装鸡（20只）', 'XZJ（20Z）', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '7.80', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (151, '00000151', '西装鸡（23只）', 'XZJ（23Z）', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '5.70', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (152, '00000152', '西装鸡（28只）', 'XZJ（28Z）', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '5.30', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (153, '00000153', '(停用)----------------鸡脯肉', '(TY)----------------JFR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '13.50', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (154, '00000154', '牛肚', 'ND', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '53.00', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (155, '00000155', '牛后胸肉', 'NHXR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', NULL, '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (156, '00000156', '牛肩肉', 'NJR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '46.50', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (157, '00000157', '牛腱', 'NJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '51.50', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (158, '00000158', '牛霖', 'NL', 109, NULL, '61', '20', '46', '1000.000', '47', '1.000', '1.000', 27, 22, '10.0', '15.0', '46.00', '1', '15', '105', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-20 16:03:56', NULL);
INSERT INTO `mtr_data` VALUES (159, '00000159', '牛碎', 'NS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '30.00', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (160, '00000160', '虾仁', 'XR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '56.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (161, '00000161', '老鸭', 'LY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '24.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (162, '00000162', '鸭爪', 'YZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '23.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (163, '00000163', '乌鸡', 'WJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '20.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (164, '00000164', '鸭边腿', 'YBT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '10.0', '8.70', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (165, '00000165', '鸭脖', 'YB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '14.83', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (166, '00000166', '鸭翅', 'YC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '10.40', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (167, '00000167', '鸭锁骨', 'YSG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '9.50', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (168, '00000168', '鸭头', 'YT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '18.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (169, '00000169', '鸭胸肉', 'YXR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '9.50', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (170, '00000170', '鸭肫', 'YZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '30.50', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (171, '00000172', '三黄鸡 13只*1', 'SHJ 13Z*1', NULL, NULL, '268', '13.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '8.65', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (172, '00000173', '白条鸭', 'BTY', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '7.90', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (173, '00000174', '半边鸭', 'BBY', NULL, NULL, '274', '1.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '5.60', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (174, '00000175', '带鱼', 'DY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '27.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (175, '00000176', '刁子鱼', 'DZY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '19.00', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (176, '00000177', '金线鱼', 'JXY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '17.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (177, '00000178', '鱿鱼', 'YY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '22.70', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (178, '00000179', '鱿鱼须', 'YYX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.813', '1.000', NULL, NULL, '10.0', '7.0', '20.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (179, '00000180', '带根猪耳', 'DGZE', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '45.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (180, '00000181', '冻带皮五花', 'DDPWH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '10.0', '31.80', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (181, '00000182', '冻肋排', 'DLP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '10.0', '50.50', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (182, '00000183', '冻猪蹄', 'DZT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '31.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (183, '00000184', '耳片', 'EP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '58.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (184, '00000185', '(停用)----------------冻后腿精瘦', '(TY)----------------DHTJS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '29.80', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (185, '00000186', '脊骨', 'JG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '10.0', '19.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (186, '00000187', '琵琶腿', 'PPT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '15.33', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (187, '00000188', '冻肥膘', 'DFB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '7.0', '15.60', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (188, '00000189', '冻前腿精瘦', 'DQTJS', 109, NULL, '46', '1.000', '46', '1000.000', '47', '0.900', '1.000', 27, 22, '', '', '26.80', '否', '10', '105', '11.00', NULL, '', NULL, NULL, '1', NULL, '昇阳', NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (189, '00000190', '冻去皮五花', 'DQPWH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '1.000', NULL, NULL, '10.0', '10.0', '33.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (190, '00000191', '(停用)----------------烧毛猪皮', '(TY)----------------SMZP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '11.50', '否', '10', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (191, '00000192', '猪肚', 'ZD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '52.00', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (192, '00000193', '猪耳尖', 'ZEJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '55.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (193, '00000194', '红豆', 'HD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.300', NULL, NULL, '10.0', '7.0', '13.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (194, '00000195', '绿豆', 'LD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '2.000', NULL, NULL, '10.0', '7.0', '12.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (195, '00000196', '八角', 'BJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '22.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (196, '00000197', '草蔻', 'CK', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '34.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (197, '00000198', '陈皮', 'CP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '17.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (198, '00000199', '粗孜然', 'CZR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '22.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (199, '00000200', '丁香', 'DX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '75.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (200, '00000201', '甘草', 'GC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '30.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (201, '00000202', '桂皮', 'GP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '17.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (202, '00000203', '红茶(茶叶)', 'HC(CY)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '17.30', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (203, '00000204', '花红茶叶', 'HHCY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '30.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (204, '00000205', '罗汉果', 'LHG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '110.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (205, '00000206', '千里香', 'QLX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '20.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (206, '00000207', '香叶', 'XY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '22.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (207, '00000208', '小茴香', 'XHX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '15.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (208, '00000209', '紫草', 'ZC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '35.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (209, '00000210', '动物明胶', 'DWMJ', NULL, NULL, '272', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '192.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (210, '00000211', '（停用）--------------黃面包糠', '（TY）--------------HMBK', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '14.50', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (211, '00000212', '(停用)----------------整颗干辣椒', '(TY)----------------ZKGLJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '19.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (212, '00000213', '番茄膏', 'FQG', NULL, NULL, '284', '3.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '18.0', '7.0', '50.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (213, '00000214', '吉士粉', 'JSF', NULL, NULL, '284', '3.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '36.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (214, '00000215', '番茄酱', 'FQJ', 5, NULL, '270', '0.850', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.2', '7.0', '9.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (215, '00000216', '甜辣酱', 'TLJ', NULL, NULL, '270', '2.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '14.60', '否', '10', NULL, '17.00', NULL, '2kg*6/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (216, '00000217', '(停用)----------------甜面酱', '(TY)----------------TMJ', NULL, NULL, '270', '0.800', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '7.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (217, '00000218', '香芹片', 'XQP', NULL, NULL, '270', '0.056', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '31.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (218, '00000219', '味噌', 'WZ', NULL, NULL, '283', '0.800', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '12.80', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (219, '00000220', '五香粉', 'WXF', NULL, NULL, '283', '0.350', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '3.60', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (220, '00000221', '去皮番茄酱', 'QPFQJ', NULL, NULL, '284', '2.550', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '15.3', '7.0', '32.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (221, '00000222', '话梅', 'HM', NULL, NULL, '283', '0.085', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '5.1', '7.0', '10.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (222, '00000223', '面包糠', 'MBK', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '6.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (223, '00000224', '蚝油', 'HY', NULL, NULL, '269', '6.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '12.0', '7.0', '33.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (224, '00000225', '火锅底料', 'HGDL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '7.20', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (225, '00000226', '金沙腌酱', 'JSYJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '25.37', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (226, '00000227', '凉拌香油汁风味调味汁', 'LBXYZFWDWZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '43.67', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (227, '00000228', '蜜汁叉烧膏状香精', 'MZCSGZXJBC14-4-23', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '8.0', '28.00', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (228, '00000229', '十三香', 'SSX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '8.0', '7.0', '43.13', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (229, '00000230', '鲜香凉拌菜调味汁', 'XXLBCDWZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '15.0', '7.0', '32.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (230, '00000231', '花生酱', 'HSJ', NULL, NULL, '270', '0.450', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '4.8', '7.0', '8.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (231, '00000232', '辣妹子辣椒酱', 'LMZLJJ', NULL, NULL, '270', '0.920', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '11.0', '7.0', '13.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (232, '00000233', '郫县豆瓣', 'PXDB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '5.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (233, '00000234', '香油', 'XY', NULL, NULL, '270', '0.360', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '10.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (234, '00000235', '咖喱块', 'KLK', NULL, NULL, '272', '0.970', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '19.4', '10.0', '56.02', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (235, '00000236', '酱油', 'JY', NULL, NULL, '270', '11.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '30.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (236, '00000237', '呈味核苷酸二纳', 'CWHGSEN', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '90.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (237, '00000238', '纯碱', 'CJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '40.0', '7.0', '2.70', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (238, '00000239', '大豆分离蛋白', 'DDFLDB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '20.0', '7.0', '25.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (239, '00000240', '复合磷酸盐', 'FHLSY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '15.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (240, '00000241', '卡拉胶', 'KLJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '36.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (241, '00000242', '小苏打', 'XSD', NULL, NULL, '283', '25.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '115.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (242, '00000243', '红曲红', 'HQH', NULL, NULL, '283', '0.200', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '28.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (243, '00000244', '老陈醋', 'LCC', 8, NULL, '53', '2.200', '46', '1000.000', '47', '1.000', '0.001', 29, 58, '13.2', '7.0', '4.50', '1', '7', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-21 06:38:52', NULL);
INSERT INTO `mtr_data` VALUES (244, '00000245', '林和记沙司', 'LHJSS', NULL, NULL, '270', '3.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '25.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (245, '00000246', '白醋', 'BC', NULL, NULL, '270', '0.480', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '9.6', '7.0', '2.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (246, '00000247', '醋精', 'CJ', NULL, NULL, '270', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '6.0', '7.0', '3.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (247, '00000248', '白糖', 'BT', 6, NULL, '61', '1.000', '46', '1000.000', '47', '1.000', '0.001', 28, 58, '10.0', '15.0', '6.60', '1', '15', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-19 21:11:12', NULL);
INSERT INTO `mtr_data` VALUES (248, '00000249', '冰糖', 'BT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '8.20', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (249, '00000250', '糖粉', 'TF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '7.84', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (250, '00000251', '蜂蜜', 'FM', NULL, NULL, '270', '0.900', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '30.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (251, '00000252', '奥尔良烤翅腌料', 'AELKCZL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '8.0', '20.00', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (252, '00000253', '黑椒腌料', 'HJYL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '34.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (253, '00000254', '樟茶鸭腌料', 'ZCYZL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '8.0', '32.00', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (254, '00000255', '孜然腌酱', 'ZRYJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '25.37', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (255, '00000256', '大桥鲜味王', 'DQXWW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '22.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (256, '00000257', '鸡骨汤粉', 'JGTF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '20.0', '7.0', '29.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (257, '00000258', '鸡精', 'JJ', 7, NULL, '64', '1.000', '46', '1000.000', '46', '1.000', '0.010', 29, 58, '10.0', '5.0', '18.00', '1', '5', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-02-01 16:47:02', NULL);
INSERT INTO `mtr_data` VALUES (258, '00000259', '味精', 'WJ', 7, NULL, '46', '1.000', '46', '1000.000', '47', '1.000', '1', 24, 58, '', '7.0', '13.60', '否', '7', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (259, '00000260', '猪骨汤粉', 'ZGTF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.001', NULL, NULL, '10.0', '8.0', '45.00', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (260, '00000261', '拌拌鲜', 'BBX', NULL, NULL, '270', '0.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '7.17', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (261, '00000262', '叉烧酱', 'CSJ', NULL, NULL, '270', '0.270', '277', '1.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '5.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (262, '00000263', '老干妈', 'LGM', NULL, NULL, '270', '0.280', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '6.7', '7.0', '6.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (263, '00000264', '腊八豆', 'LBD', NULL, NULL, '268', '6.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '40.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (264, '00000265', '腌制盐', 'YZY', 6, NULL, '64', '17.500', '46', '1000.000', '47', '1.000', '0.001', 29, 58, '10.0', '7.0', '87.27', '1', '7', '15', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-19 21:10:15', NULL);
INSERT INTO `mtr_data` VALUES (265, '00000266', '海鲜酱', 'HXJ', NULL, NULL, '269', '7.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '57.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (266, '00000267', '土老憨老抽', 'TLHLC', 8, NULL, '53', '4.900', '46', '1000.000', '47', '1.000', '0.010', 29, 58, '9.8', '10.0', '32.00', '1', '10', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (267, '00000268', '土老憨生抽', 'TLHSC', 8, NULL, '53', '4.900', '46', '1000.000', '47', '1.000', '0.010', 29, 58, '9.8', '10.0', '28.00', '1', '10', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (268, '00000269', '柱候酱', 'ZHJ', NULL, NULL, '269', '6.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '13.0', '7.0', '57.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (269, '00000270', '(停用)----------------风味腊八豆', '(TY)----------------FWLBD', NULL, NULL, '270', '2.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '30.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (270, '00000271', '荆沙辣酱', 'JSLJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '4.40', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (271, '00000272', '南乳酱', 'NRJ', NULL, NULL, '270', '0.190', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '2.60', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (272, '00000273', '望红甜面酱', 'WHTMJ', NULL, NULL, '270', '0.300', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '2.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (273, '00000274', '豆豉', 'DC', NULL, NULL, '283', '0.140', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '2.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (274, '00000275', '腐乳汁', 'FRZ', NULL, NULL, '283', '0.260', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '3.9', '7.0', '3.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (275, '00000277', '白胡椒粒', 'BHJL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '70.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (276, '00000278', '干辣椒', 'GLJ', 9, NULL, '46', '1.000', '46', '1000.000', '47', '1.000', '0.100', 29, 58, '10.0', '7.0', '24.00', '1', '7', '16', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-01-30 01:14:53', NULL);
INSERT INTO `mtr_data` VALUES (277, '00000279', '黑胡椒粒', 'HHJL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '70.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (278, '00000280', '红花椒', 'HHJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.001', NULL, NULL, '10.0', '7.0', '95.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (279, '00000281', '黄栀子', 'HZZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '44.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (280, '00000282', '辣椒粉', 'LJF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '20.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (281, '00000283', '辣椒皮', 'LJP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '20.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (282, '00000284', '辣椒王段', 'LJWD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '27.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (283, '00000285', '辣椒王粉', 'LJWF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '26.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (284, '00000286', '青花椒', 'QHJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.001', NULL, NULL, '10.0', '7.0', '90.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (285, '00000287', '胡椒粉(白)', 'HJF(B)', NULL, NULL, '283', '0.227', '277', '1000.000', '276', '1.000', '0.001', NULL, NULL, '10.0', '7.0', '73.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (286, '00000289', '(停用)胡椒粉', '(TY)HJF', NULL, NULL, '283', '0.227', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '28.60', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (287, '00000290', '大豆油', 'DDY', 57, NULL, '53', '20', '46', '1000.000', '47', '1.000', '0.001', 29, 58, '17.0', '7.0', '138', '1', '7', '59', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-18 14:11:47', NULL);
INSERT INTO `mtr_data` VALUES (288, '00000291', '玉米油', 'YMY', NULL, NULL, '270', '4.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '48.50', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (289, '00000292', '白米粉', 'BMF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '5.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (290, '00000293', '超级生粉', 'CJSF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '30.0', '7.0', '12.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (291, '00000294', '糯米', 'NM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.700', NULL, NULL, '10.0', '10.0', '5.80', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (292, '00000295', '生粉', 'SF', 7, NULL, '64', '20', '46', '1000.000', '47', '1.000', '1.500', 29, 58, '25.0', '7.0', '3.84', '1', '7', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-19 21:08:57', NULL);
INSERT INTO `mtr_data` VALUES (293, '00000296', '蒸肉粉', 'ZRF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '7.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (294, '00000297', '鸡蛋', 'JD', 104, NULL, '46', '1.000', '46', '1000.000', '47', '0.850', '1.000', 28, 107, '22.0', '5.0', '9.00', '1', '5', '16', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-21 03:43:17', NULL);
INSERT INTO `mtr_data` VALUES (295, '00000298', '味淋调味液', 'WLDWY', NULL, NULL, '269', '18.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '145.00', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (296, '00000299', '千岛酱', 'QDJ', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '22.80', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (297, '00000300', '青芥辣', 'QJL', NULL, NULL, '272', '0.043', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '5.30', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (298, '00000301', '三文鱼松', 'SWYS', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '35.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (299, '00000302', '福神渍', 'FSZ', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '10.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (300, '00000304', '干瓢', 'GP', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '20.00', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (301, '00000305', '金枪鱼罐头', 'JQYGT', NULL, NULL, '284', '1.880', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '60.00', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (302, '00000307', '绿河童寿司芯（绿）', 'LHTSSX（L）', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '14.80', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (303, '00000308', '细青海苔粉', 'XQHTF', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '13.50', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (304, '00000309', '泽庵寿司芯（黄）', 'ZZSSX（H）', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '14.80', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (305, '00000310', '(停用)----------------黑芝麻仁', '(TY)----------------HZMR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '24.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (306, '00000311', '芝士碎', 'ZSS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '580.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (307, '00000312', '肉松', 'RS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '65.00', '否', '10', NULL, '17.00', NULL, '15kg*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (308, '00000313', '白芝麻', 'BZM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '20.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (309, '00000314', '黑芝麻', 'HZM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '22.50', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (310, '00000315', '粗蟹肉棒', 'CXRB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '19.87', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (311, '00000316', '(停用)烤鳗', '(TY)KM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '75.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (312, '00000317', '鲑肉松', 'GRS', 9, NULL, '64', '0.500', '46', '1000.000', '47', '1.000', '1.000', 24, 67, '', '', '35.00', '0', '15', '16', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (313, '00000318', '方腿(三文治火腿)', 'FT(SWZHT)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '16.80', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (314, '00000319', '细蟹肉棒', 'XXRB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '16.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (315, '00000320', '冻熟制裙带菜', 'DSZQDC', NULL, NULL, '283', '2.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '45.00', '是', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (316, '00000321', '芝士片', 'ZSP', NULL, NULL, '268', '11.880', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '780.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (317, '00000322', '芝麻酱', 'ZMJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '7.0', '19.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (318, '00000323', '丘比沙拉酱', 'QBSLJ', 8, NULL, '46', '1.000', '46', '1000.000', '47', '1.000', '1.000', 28, 58, '', '', '27.30', '0', '10', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (319, '00000324', 'flim海苔', 'flimHT', NULL, NULL, '272', '100.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '46.80', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (320, '00000325', '(停用)半切海苔1*80*100', '(TY)BQHT1*80*100', NULL, NULL, '283', '100.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '31.20', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (321, '00000326', '军舰海苔', 'JJHT', NULL, NULL, '283', '350.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '31.80', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (322, '00000327', '(停用)全型海苔1*80*50', '(TY)QXHT1*80*50', NULL, NULL, '283', '50.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '30.60', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (323, '00000328', '大米', 'DM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.30', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (324, '00000329', '东北大米', 'DBDM', 54, NULL, '64', '1.000', '46', '1000.000', '47', '1.000', '1.000', 29, 56, '0.0', '0.0', '5.40', '0', '0', '55', '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-02-01 16:40:15', NULL);
INSERT INTO `mtr_data` VALUES (325, '00000330', '米饭调味液', 'MFDWY', NULL, NULL, '269', '18.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '420.00', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (326, '00000331', '寿司调味液', 'SSDWY', NULL, NULL, '269', '18.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '240.00', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (327, '00000332', '筷子', 'KZ', NULL, NULL, '268', '225.000', '280', '1.000', '280', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '450.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (328, '00000333', '酸奶', 'SN', NULL, NULL, '281', '1.000', '281', '1.000', '281', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '1.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (329, '00000334', '云丝', 'YS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '2.100', '1.000', NULL, NULL, '10.0', '5.0', '24.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (330, '00000335', '芸豆', 'YD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '18.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (331, '00000336', '虾皮', 'XP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '5.0', '50.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (332, '00000337', '小米', 'XM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.500', NULL, NULL, '10.0', '5.0', '10.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (333, '00000338', '玉米片', 'YMP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '5.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (334, '00000339', '(停用)----------------一次性纸碗', '(TY)----------------YCXZW', NULL, NULL, '268', '450.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (335, '00000340', 'UH-2117（2格内衬）', 'UH2117', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (336, '00000341', 'UH2117体', 'UH2117T', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (337, '00000342', 'UH2117盖', 'UH2117G', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (338, '00000343', 'UH9/2盖', 'UH9/2G', NULL, NULL, '268', '500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '250.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (339, '00000344', 'UH9/2体', 'UH9/2T', NULL, NULL, '268', '500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '315.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (340, '00000345', '1410胶托', '1410JT', NULL, NULL, '268', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (341, '00000346', 'A-5豆腐盒', 'A5DFH', NULL, NULL, '268', '360.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (342, '00000347', 'HS-7身（黑）', 'HS-7S（H）', NULL, NULL, '268', '1200.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '332.40', '否', '7', NULL, '17.00', NULL, '250元/件/1000个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (343, '00000348', 'SB-L1身', 'SBL1S', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '380.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (344, '00000349', 'SB-L2身', 'SBL2S', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '380.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (345, '00000350', '(停用)----------------华纹寿司盒1913身', '(TY)----------------HWSSH1913S', NULL, NULL, '268', '1200.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (346, '00000351', 'ND-1盖（透明）', 'ND-1G（TM）', 62, NULL, '61', '1000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '7.0', '260', '0', '7', '67', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (347, '00000352', 'ND-1身（黑色）', 'ND-1S（HS）', 62, NULL, '61', '1000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '7.0', '340', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (348, '00000353', 'HS-7盖', 'HS-7G', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '141.60', '否', '7', NULL, '17.00', NULL, '125元/件/1000个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (349, '00000354', 'SBL嵌合盖1盖', 'SBLQHG1G', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '232.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (350, '00000355', '寿司盒1913盖', 'SSH1913G', NULL, NULL, '268', '1200.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '348.00', '否', '7', NULL, '17.00', NULL, '106元/件/400个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (351, '00000356', '果绿3号盒', 'GL3HH', NULL, NULL, '268', '800.000', '268', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (352, '00000357', '升阳三格盒', 'SYSGH', NULL, NULL, '268', '560.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (353, '00000358', '绿叶片(青山1号)', 'LYP(QS1H)', NULL, NULL, '268', '3000.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '105.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (354, '00000359', '多春鱼籽酱', 'DCYZJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '15.0', '40.00', '否', '15', NULL, '17.00', NULL, '1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (355, '00000360', '照烧汁', 'ZSZ', NULL, NULL, '270', '1.800', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '68.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (356, '00000361', 'FB-2121身/新加深木理纹', 'FB-2121S/XJSMLW', 62, NULL, '61', '400.000', '65', '1.000', '65', '1.000', '0.010', 26, 67, '', '', '224.00', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (357, '00000362', 'FB-2121盖/OPS透明', 'FB-2121G/OPSTM', 62, NULL, '61', '400.000', '65', '1.000', '65', '1.000', '0.010', 26, 67, '', '', '156.80', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (358, '00000363', '寿司醋', 'SSC', NULL, NULL, '268', '20.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '7.0', '230.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (359, '00000364', '福嘉厚干（散）', 'FJHG（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '20.0', '6.50', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (360, '00000365', '大根', 'DG', NULL, NULL, '279', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', '12.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (361, '00000366', '面粉', 'MF', NULL, NULL, '271', '25.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '25.0', '15.0', '86.50', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (362, '00000367', 'JR-1', 'JR1', NULL, NULL, '268', '3600.000', '273', '1.000', '273', '1.000', '0.010', NULL, NULL, '0.0', '10.0', '720.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (363, '00000368', '咖喱饭2215身', 'KLF2215S', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '0.010', NULL, NULL, '0.0', '7.0', '152.80', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (364, '00000369', '咖喱饭2215盖', 'KLF2215G', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '0.010', NULL, NULL, '0.0', '7.0', '149.60', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (365, '00000371', '福嘉厚千张（散）', 'FJHQZ（S）', 112, NULL, '64', '1.000', '46', '1000.000', '47', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-16 02:26:04', NULL);
INSERT INTO `mtr_data` VALUES (366, '00000372', '(停)皮蛋', '(T)PD', NULL, NULL, '273', '1.000', '277', '60.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.20', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (367, '00000373', 'TL340杯(95*55*105）', 'TL340B(95*55*105）', NULL, NULL, '268', '2200.000', '273', '1.000', '273', '1.000', '0.010', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (368, '00000374', '福嘉卤水豆腐（散）', 'FJLSDF（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '4.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (369, '00000375', '黄油', 'HY', NULL, NULL, '268', '20.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '20.0', '7.0', '350.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (370, '00000376', '寿司盒1913身', 'SSH1913S', NULL, NULL, '268', '1200.000', '273', '1.000', '273', '1.000', '0.010', NULL, NULL, '0.0', '7.0', '590.40', '否', '7', NULL, '17.00', NULL, '150元/件/400个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (371, '00000377', '(停用)----------------照烧酱', '(TY)----------------ZSJ', NULL, NULL, '270', '1.000', '277', '1000.000', '270', '1.000', '1.000', NULL, NULL, '2.0', '2.0', '18.00', '否', '2', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (372, '00000378', '寿司盒1611 身', 'SSH1611 S', NULL, NULL, '268', '1800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '653.40', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (373, '00000379', '寿司盒1611 盖', 'SSH1611 G', NULL, NULL, '268', '900.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '317.70', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (374, '00000380', '香辣腌制料', 'XLYZL', NULL, NULL, '268', '20.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '10.0', '10.0', '600.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (375, '00000381', '中卷寿司膜（蓝色）', 'ZJSSM（LS）', NULL, NULL, '268', '6000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '1080.00', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (376, '00000382', '大口饭团袋(席纹)', 'DKFTD(XW)', NULL, NULL, '268', '6000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '1200.00', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (377, '00000383', '105mm盖膜', '105mmGM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (378, '00000384', '120汤盖', '120TG', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (379, '00000385', '150g真空袋16*24cm', '150GZKD16*24CM', NULL, NULL, '268', '4000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.140', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (380, '00000386', '1616D层饭盒ND-43', '1616DCFHND43', NULL, NULL, '268', '900.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (381, '00000387', '500ML汤碗', '500MLTW', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (382, '00000388', '80g真空袋12*23cm', '80GZKD12*23CM', NULL, NULL, '268', '7600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (383, '00000389', '900平盖', '900PG', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (384, '00000390', '900圆盖', '900YG', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (385, '00000391', 'IPC-058', 'IPC-058', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '215.60', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (386, '00000392', 'RR06盖(IPC-02L)', 'RR06G(IPC-02L)', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '290.40', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (387, '00000393', 'RR06内衬(IPC-02N1)', 'RR06NC(IPC-02N1)', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '202.40', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (388, '00000394', 'pvc不干胶165*50(直长条形)', 'pvcBGJ165*50ZCTX', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '0.110', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (389, '00000395', 'PVC手工膜400*500', 'PVCSGM400*500', NULL, NULL, '268', '6.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '27.833', '否', '7', NULL, '17.00', NULL, '6*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (390, '00000396', '（停用）--------------PVC手工膜400', '（TY）--------------PVCSGM400', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '450mm*500m', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (391, '00000397', 'pvc异形不干胶180g', 'pvcYXBGJ180g', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', NULL, '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (392, '00000398', 'pvc异形不干胶250g', 'pvcYXBGJ250g', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '0.118', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (393, '00000399', 'pvc异形不干胶80g', 'pvcYXBGJ80g', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', NULL, '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (394, '00000400', 'UH-F3/1 (碗+盖)(2件套)', 'UHF3/1 W+G2JT', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (395, '00000401', 'UH-F9/2盖(绿白5格餐盒　盖BI)', 'UH-F9/2G(LB5GCH　GBI)', NULL, NULL, '268', '500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '250.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (396, '00000402', 'UH-F9/2体(绿白5格餐盒 盒体DO)', 'UH-F9/2T(LB5GCH HTDO)', NULL, NULL, '268', '500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '315.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (397, '00000403', '伍仁酱丁', 'WRJD', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '30.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (398, '00000404', '奥尔良连心脆', 'AELLXC', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '10.10', '否', '10', NULL, '11.00', NULL, '10kg*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (399, '00000405', '八角盒底', 'BJHD', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '410.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (400, '00000406', '拌面意面系列45*135mm', 'BMYMXL45*135mm', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (401, '00000407', '菠萝（原料）', 'BLYL', NULL, NULL, '270', '0.822', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.38', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (402, '00000408', '餐具包（四件套）', 'CJB（SJT）', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (403, '00000409', '餐盒UH-F9/1', 'CHUHF9/1', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '700.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (404, '00000410', '美膳餐具包', 'MSCJB', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '170.55', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (405, '00000411', '叉烧包', 'CSB', NULL, NULL, '268', '12.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (406, '00000412', '抽纸', 'CZ', NULL, NULL, '286', '1.000', '286', '1.000', '286', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.808', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (407, '00000413', '纯牛奶', 'CNN', NULL, NULL, '268', '1.000', '268', '1.000', '268', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (408, '00000414', '罗森打印标签50*40mm单列', 'LSDYBQ50*40MMDL', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '51.40', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (409, '00000415', '罗森打印标签50*50mm单列', 'LSDYBQ50*50MMDL', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '51.40', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (410, '00000416', '罗森打印标签50*60mm单列', 'LSDYBQ50*60MMDL', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '51.40', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (411, '00000417', '大白碗', 'DBW', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '102.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (412, '00000418', '大成脆香鸡', 'DCCXJ', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '10.25', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (413, '00000419', '大成汉堡（微辣）', 'DCHBWL', NULL, NULL, '283', '2.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '3.0', NULL, '否', '3', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (414, '00000420', '大红色素', 'DHSS', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (415, '00000421', '大红浙醋', 'DHZC', NULL, NULL, '270', '0.500', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '0.0', '7.0', '3.20', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (416, '00000422', '牛肉(黄瓜条)', 'NR(HGT)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (417, '00000423', '防油黄纸托', 'FYHZT', NULL, NULL, '268', '9300.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.019', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (418, '00000424', '封口膜', 'FKM', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '58.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (419, '00000425', '凤尾鱼', 'FWY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (420, '00000426', '夫妻肺片', 'FQFP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (421, '00000427', '夫妻肺片碗+盖', 'FQFPW+G', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (422, '00000428', '谷朊粉', 'GRF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '25.0', '7.0', '12.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (423, '00000429', '桂花糕', 'GHG', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (424, '00000430', '桂花糖(瓶)', 'GHT(P)', NULL, NULL, '270', '0.080', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (425, '00000431', '韩式泡菜60*200mm', 'HSPC60*200mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (426, '00000433', '黑胡椒碎', 'HHJS', NULL, NULL, '284', '1.000', '277', '250.000', '284', '1.000', '0.100', NULL, NULL, '0.0', '7.0', '30.000', '否', '7', NULL, '17.00', NULL, '250g', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (427, '00000434', '黑椒鸭胸', 'HJYX', NULL, NULL, '283', '2.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (428, '00000435', '烘培奶油', 'HPNY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '23.74', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (429, '00000436', '樟茶鸭腿', 'ZCYT', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (431, '00000438', '黄金脆', 'HJC', NULL, NULL, '268', '8.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (432, '00000439', '黄酒', 'HJ', NULL, NULL, '270', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (433, '00000440', '鸡米花', 'JMH', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.20', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (434, '00000441', '肩胛肉', 'JJR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', '26.800', '否', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (435, '00000442', '咖喱粉350g', 'KLF350G', NULL, NULL, '270', '0.350', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (436, '00000443', '辣椒段', 'LJD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.100', NULL, NULL, '0.0', '7.0', '19.00', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (437, '00000444', '(停用)--------------老坛豆角（酸豆角）', '(TY)--------------LTDJ（SDJ）', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (438, '00000445', '老鸭汤', 'LYT', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (439, '00000446', '藕丸子', 'OWZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '14.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (440, '00000447', '龙头鱼', 'LTY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '24.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (441, '00000448', '卤味小食84*84mm', 'LWXS84*84mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (442, '00000449', '罗勒叶', 'LLY', NULL, NULL, '270', '0.141', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (443, '00000450', '（停用）罗森条码纸50*40mm', '（TY）LSTMZ50*40MM', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (444, '00000451', '（停用）罗森条码纸50*50mm（带地址）', '（TY）LSTMZ50*50MM（DDZ）', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (445, '00000452', '（停用）罗森条码纸50*60mm（带地址）', '（TY）LSTMZ50*60MM（DDZ）', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (446, '00000453', '麻糬棒', 'MSB', NULL, NULL, '268', '7.680', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (447, '00000454', '麦芽糖', 'MYT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '8.200', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (448, '00000455', '梅花杯250', 'MHB250', NULL, NULL, '268', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (449, '00000456', '(停用)----------------美膳打印标签', '(TY)----------------MSDYBQ', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (450, '00000457', '美膳彩色标签', 'MSCSBQ', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (451, '00000458', '美味香肠', 'MWXC', NULL, NULL, '283', '2.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (452, '00000459', '咪咪乳瓜', 'MMRG', NULL, NULL, '268', '10.800', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.820', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (453, '00000460', '迷你肉串', 'MNRC', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '19.100', '否', '7', NULL, '11.00', NULL, '10kg*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (454, '00000461', '奶茶专用植脂末', 'NCZYZZM', NULL, NULL, '276', '3.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (455, '00000462', '汉味油皮香干', 'HWYPXG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (456, '00000463', '糯米烧麦', 'NMSM', NULL, NULL, '283', '0.500', '276', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '500g/袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (457, '00000464', '(停)雀巢柠檬味', '(T)QCNMW', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (458, '00000465', '三格餐盒', 'SGCH', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (459, '00000466', '一次性三号纸碗', 'YCXSHZW', NULL, NULL, '268', '450.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '31.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (460, '00000467', '三角饭团55*55mm', 'SJFT55*55mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (461, '00000468', '沙姜粉', 'SJF', NULL, NULL, '283', '8.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '6.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (462, '00000469', '山楂', 'SZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '20.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (463, '00000470', 'PE手工膜400', 'PESGM400', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (464, '00000471', '寿司A   70*40mm', 'SSA   70*40mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (465, '00000472', '寿司B   50*30mm', 'SSB   50*30mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (466, '00000473', '薯条', 'ST', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (467, '00000474', '水果45*70mm', 'SG45*70mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (468, '00000475', '思念葱油花卷', 'SNCYHJ', NULL, NULL, '283', '0.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (469, '00000476', '思念奶香馒头400g', 'SNNXMT400G', NULL, NULL, '283', '0.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (470, '00000477', '思念香菇素菜包', 'SNXGSCB', NULL, NULL, '283', '0.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (471, '00000478', '思念猪肉包', 'SNZRB', NULL, NULL, '283', '0.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (472, '00000479', '美膳版塑料杯90mm*700ml高透', 'MSBSLB90MM*700MLGT', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.210', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (473, '00000480', '美膳版塑料杯90mm*500ml高透', 'MSBSLB90MM*500MLGT', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.190', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (474, '00000481', '塑料袋大号', 'SLDDH', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (475, '00000482', '塑料袋小号', 'SLDXH', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (476, '00000483', '塑料袋中号', 'SLDZH', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (477, '00000484', '酸梅膏', 'SMG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (478, '00000485', '酸梅酱', 'SMJ', NULL, NULL, '269', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (479, '00000486', '碎皮', 'SP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (480, '00000487', '汤类不干胶', 'TLBGJ', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (481, '00000488', '汤圆', 'TY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '10.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (482, '00000489', '糖纳豆 小红豆', 'TND XHD', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '23.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (483, '00000490', '(停用)----------------红茶', '(TY)----------------HC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '40.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (484, '00000491', '透明180杯', 'TM180B', NULL, NULL, '268', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (485, '00000492', '透明防雾盖膜(1605)', 'TMFWGM1605', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (486, '00000493', '(停用)----------------外婆菜', '(TY)----------------WPC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (487, '00000494', '大五格餐盒盖', 'DWGCHG', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '140.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (488, '00000495', '五香卤牛腱', 'WXLNZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (489, '00000496', '五香卤牛筋', 'WXLNJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '40.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (490, '00000497', '五香牛肚QS不干胶(有二维码)', 'WXNDQSBGJYEWM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (491, '00000498', '五香牛肉QS不干胶(有二维码)', 'WXNRQSBGJYEWM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (492, '00000230', '鲜香凉拌菜调味汁', 'XXLBCDWZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '32.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (493, '00000500', '香肠', 'XC', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (494, '00000501', '香肠（江夏大咀）', 'XCJXDJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (495, '00000502', '香肠（辣）', 'XCL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (496, '00000503', '香肠（甜）', 'XCT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (497, '00000504', '香菇鸡肉丸', 'XGJRW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (498, '00000505', '香辣牛肚QS不干胶(有二维码)', 'XLNDQSBGJ(YEWM)', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (499, '00000506', '香辣牛肉QS不干胶(有二维码)', 'XLNRQSBGJYEWM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (500, '00000507', '香辣鸭掌', 'XLYZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (501, '00000508', '停用----------香卤牛肚', 'TY----------XLND', NULL, NULL, '283', '2.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (502, '00000510', '小食不干胶', 'XSBGJ', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (503, '00000511', '新的橙汁', 'XDCZ', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '68.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (504, '00000512', '(停)新的黑加仑', '(T)XDHJL', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '68.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (505, '00000513', '(停)新的柠檬汁', '(T)XDNMZ', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '68.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (506, '00000514', '(停)新的苹果汁', '(T)XDPGZ', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '68.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (507, '00000515', '烟鸭胸', 'YYX', NULL, NULL, '283', '2.500', '277', '1000.000', '276', '0.980', '1.000', NULL, NULL, '0.0', '10.0', '0.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (508, '00000516', '(停)椰浆', '(T)YJ', NULL, NULL, '284', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.50', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (509, '00000517', '一次性筷子', 'YCXKZ', NULL, NULL, '268', '1500.000', '280', '1.000', '280', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '0.063', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (510, '00000518', '(停用)----------------一次性纸碗(兰3号)', '(TY)----------------YCXZW(L3H)', NULL, NULL, '268', '450.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (511, '00000519', '原味奶昔', 'YWNX', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (512, '00000520', '圆形饭团60*60mm', 'YXFT60*60mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (513, '00000521', '早餐奶', 'ZCN', NULL, NULL, '268', '1.000', '268', '1.000', '268', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (514, '00000522', '增味香粉', 'ZWXF', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (515, '00000523', '芝麻球', 'ZMQ', NULL, NULL, '268', '5.200', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (516, '00000524', '大厨房条码纸(大卷QS)60*60*2000', 'DCFTMZ(DJQS)60*60*2000', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '29.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (517, '00000525', '大厨房条码纸(小卷QS)60*60*500', 'DCFTMZ(XJQS)60*60*500', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (518, '00000526', '粥/烫系列(80*80mm）', 'Z/TXL80*80mm', NULL, NULL, '285', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (519, '00000527', '粥/烫系列（无胶108g双铜115*115mm）', 'Z/TXLWJ108gST115*115mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (520, '00000528', '粥/烫系列115*115mm', 'Z/TXL115*115mm', NULL, NULL, '285', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (521, '00000529', '五香卤牛肚', 'WXLND', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '76.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (522, '00000530', '干海带', 'GHD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '21.200', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (523, '00000531', '子草', 'ZC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (524, '00000532', '奥尔良烤翅中', 'AELKCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (525, '00000533', '甘草粉', 'GCF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (526, '00000534', '奥尔良鸡扒', 'AELJB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (527, '00000535', '奥尔良烤对翅', 'AELKDC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (528, '00000536', '大成花枝月亮滑', 'DCHZYLH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (529, '00000537', '大成金米鸡条', 'DCJMJT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '500g*20', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (530, '00000538', '盖膜130', 'GM130', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '53.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (531, '00000539', '机膜400', 'JM400', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '138.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (532, '00000540', '机膜450', 'JM450', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '148.00', '否', '0', NULL, '17.00', NULL, '450mm*1000m', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (533, '00000541', '龙口粉丝', 'LKFS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '9.400', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (534, '00000542', '(停)罗森-茄汁肉酱意面45*135mm', '(T)LS-QZRJYM45*135MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '325.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (535, '00000543', '(停)罗森-120*36mm', '(T)LS-120*36MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '200.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (536, '00000544', '罗森-肉丝葱油拌面45*135mm', 'LS-RSCYBM45*135MM', 63, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 30, 67, '', '', '325.00', '否', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (537, '00000545', '卤猪肚', 'LZD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '66.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (538, '00000546', '麻辣烤翅中', 'MLKCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (539, '00000547', '蜜汁黑椒鸡扒', 'MZHJJB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (540, '00000548', '蜜汁烤翅中', 'MZKCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (541, '00000549', 'PE方片96*41cm*0.02s', 'PEFP96*41CM*0.02S', NULL, NULL, '268', '1000.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '120.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (542, '00000550', '披萨饼', 'PSB', NULL, NULL, '268', '180.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.833', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (543, '00000551', '思念奶香馒头960g', 'SNNXMT960G', NULL, NULL, '268', '8.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (544, '00000553', '烟熏鸭腿', 'YXYT', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (545, '00000554', '孜然烤翅中', 'ZRKCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (546, '00000555', '(停用)----------------餐盒-富财C31', '(TY)----------------CH-FCC31', NULL, NULL, '268', '300.000', '288', '1.000', '288', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '355.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (547, '00000556', '（停用）--------------三文治火腿', '（TY）--------------SWZHT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (548, '00000557', '(停)罗森-香辣鱿鱼饭45*95mm', '(T)LS-XLYYF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (549, 'BC000036', '(停)罗森-熏鸭双冬盖浇饭45*95mm', '(T)LS-XYSDGJF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (550, 'BC000037', '(停)罗森-糍粑鱼青椒炒肉双拼饭', '(T)LS-CBYQJCRSPF', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (551, 'BC000038', '(停)罗森-红豆粥φ115mm', '(T)LS-HDZΦ115MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '450.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (552, 'BC000039', '(停)罗森-绿豆汤φ80mm', '(T)LS-LDTΦ80MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '375.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (553, 'BC000040', '美膳-茄汁炸鸡块饭团φ60mm', 'MS-QZZJKFTΦ60MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '197.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (554, 'BC000041', '美膳-照烧鸡肉手卷120*36mm ', 'MS-ZSJRSJ120*36MM ', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '200.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (555, 'BC000042', '美膳-香炸排条手卷120*36mm ', 'MS-XZPTSJ120*36MM ', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '200.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (556, 'BC000043', '(停)美膳-银耳汤φ80mm', '(T)MS-YETΦ80MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '375.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (557, 'BC000044', '美膳-皮蛋瘦肉粥(无胶)φ115mm ', 'MS-PDSRZ(WJ)Φ115MM ', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '450.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (558, 'BC000045', '(停)美膳-红豆粥φ80mm', '(T)MS-HDZΦ80MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '450.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (559, 'BC000046', '(停)美膳-绿豆汤φ80mm', '(T)MS-LDTΦ80MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '375.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (560, 'BC000047', '美膳-香辣翅尖', 'MSXLCJ', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '400.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (561, 'BC000048', '美膳-香辣鸭脖', 'MSXLYB', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '400.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (562, 'BC000049', '(停)美膳-宫保鸡丁盖浇饭45*95mm', '(T)MS-GBJDGJF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (563, 'BC000050', '(停)美膳-番茄汁蛋包饭45*95mm', '(T)MS-FQZDBF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (564, 'BC000051', '美膳-酥炸鸡排咖喱饭45*95mm', 'MS-SZJPKLF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '350.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (565, 'BC000052', '(停)美膳-椒盐排条炒饭45*95mm', '(T)MS-JYPTCF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (566, 'BC000053', '(停)美膳-鱼香肉丝饭45*95mm', '(T)MS-YXRSF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (567, 'BC000054', '(停)美膳-糍粑鱼青椒炒肉双拼饭', '(T)MS-CBYQJCRSPF', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (568, 'BC000055', '(停)美膳-辣子鸡丁饭45*95mm', '(T)MS-LZJDF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (569, 'BC000056', '(停)美膳-川香回锅肉盖饭45*95mm', '(T)MS-CXHGRGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (570, 'BC000057', '(停)美膳-麻婆豆腐盖饭45*95mm', '(T)MS-MPDFGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (571, 'BC000058', '美膳-奥尔良鸡排盖饭45*95mm', 'MS-AELJPGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '350.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (572, 'BC000059', '(停)美膳-番茄滑蛋盖饭45*95mm', '(T)MS-FQHDGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (573, 'BC000060', '(停)美膳-番茄汁肉酱意面136*37mm', '(T)MS-FQZRJYM136*37MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '340.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (574, 'BC000061', '美膳-猪肉丝葱香拌面136*37mm', 'MS-ZRSCXBM136*37MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '340.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (575, 'BC000062', '美膳-打印标签50*60mm', 'MS-DYBQ50*60MM', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '51.40', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (576, 'BC000063', '罗森-黑椒牛肉盖浇饭45*95mm', 'LS-HJNRGJF45*95MM', 62, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '7.0', '350.00', '1', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-01-23 00:19:52', NULL);
INSERT INTO `mtr_data` VALUES (577, 'BC000064', '罗森-宫保鸡丁盖浇饭45*95mm', 'LS-GBJDGJF45*95MM', 63, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 30, 67, '', '', '350.00', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (578, 'BC000065', '圆碗FL-700身(黄)', 'YWFL-700S(H)', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '207.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (579, 'BC000066', '圆碗FL-700盖', 'YWFL-700G', 62, NULL, '61', '1200.000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '7.0', '210.00', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (580, 'BC000067', '(停)美膳-培根蟹柳寿司组合70*40mm', '(T)MS-PGXLSSZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '125.00', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (581, 'BC000068', '美膳-芝士培根手卷120*36mm ', 'MS-ZSPGSJ120*36MM ', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '200.00', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (582, 'BC000069', '美膳-蛋黄酱虾仁饭团φ55mm', 'MS-DHJXRFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '160.00', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (583, 'BC000070', '美膳-蛋黄酱蟹柳饭团φ55mm', 'MS-DHJXLFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '160.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (584, 'BC000071', '(停)美膳-香辣鱿鱼拼饭45*95mm', '(T)MS-XLYYPF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (585, 'BC000072', '(停)美膳-香辣鸭腿拼饭45*95mm', '(T)MS-XLYTPF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (586, 'BC000073', '(停)美膳-金牌泡椒滑鸡饭45*95mm', '(T)MS-JPPJHJF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (587, 'BC000074', '美膳-黑椒牛肉盖饭45*95mm', 'MS-HJNRGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '350.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (588, 'BC000075', '(停)美膳-韩式烤肉盖饭45*95mm', '(T)MS-HSKRGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (589, 'BC000076', '(停)美膳-熏鸭双冬盖饭45*95mm', '(T)MS-XYSDGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (590, 'BC000077', '(停)罗森-铁板烤鸡花式盒饭45*95mm', '(T)LS-TBKJHSHF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (591, 'BC000078', '罗森-香炸排条饭卷120*36mm', 'LS-XZPTFJ120*36MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '200.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (592, 'BC000079', '三格双层餐盒C31身(白)', 'SGSCCHC31S(B)', NULL, NULL, '268', '300.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '175.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (593, 'BC000080', '三格双层餐盒C31内托', 'SGSCCHC31NT', NULL, NULL, '268', '300.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '100.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (594, 'BC000081', '三格双层餐盒C31盖(蓝)', 'SGSCCHC31G(L)', NULL, NULL, '268', '300.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '80.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (595, 'BC000082', '罗森-肉松金枪鱼粢饭卷120*36mm', 'LS-RSJQYZFJ120*36MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '200.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (596, 'BC000083', '(停)罗森-芝士火炬组合70*40mm', '(T)LS-ZSHJZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '125.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (597, 'BC000084', '(停)罗森-泡椒滑鸡盒饭45*95mm', '(T)LS-PJHJHF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (598, 'BC000085', '(停)罗森-茄汁蛋包饭40*90mm', '(T)LS-QZDBF40*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.065', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (599, 'BC000086', '罗森-照烧鸡肉饭卷120*36mm', 'LS-ZSJRFJ120*36MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.040', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (600, 'BC000087', '罗森-金枪鱼蛋黄酱饭团φ55mm', 'LS-JQYDHJFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.032', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (601, 'BC000088', '罗森-三文鱼蛋黄酱饭团φ55mm', 'LS-SWYDHJFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.032', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (602, 'BC000089', '罗森-虾仁蛋黄酱饭团φ55mm', 'LS-XRDHJFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.032', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (603, 'BC000090', 'PVC手工膜250', 'PVCSGM250', NULL, NULL, '268', '6.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '17.833', '否', '7', NULL, '17.00', NULL, '6*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (604, 'BC000091', '罗森手卷饭团膜卷绿(2017)180mm*1km', 'LSSJFTMJL(2017)180MM*1KM', NULL, NULL, '285', '1000.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '0.386', '否', '20', NULL, '17.00', NULL, '3卷/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (605, 'BC000092', '罗森大口饭团膜卷绿(2017)270mm*1km', 'LSDKFTMJL(2017)270MM*1KM', NULL, NULL, '285', '1000.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '0.541', '否', '20', NULL, '17.00', NULL, '2卷/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (606, 'BC000093', '圆三格餐盒SZ-838黑', 'YSGCHSZ838H', NULL, NULL, '268', '150.000', '273', '1.000', '288', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.913', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (607, 'BC000094', '罗森-水煮肉片盒饭45*95mm', 'LS-SZRPHF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (608, 'BC000095', '罗森-皮蛋瘦肉粥(无胶)φ115mm', 'LS-PDSRZ(WJ)Φ115MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 'LS-AELJPGF45*95MM', 63, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 30, 107, '0.0', '7.0', '35.00', '1', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2018-05-15 16:30:20', NULL);
INSERT INTO `mtr_data` VALUES (610, 'BC000097', '罗森-香炸鸡排咖喱饭45*95mm', 'LS-XZJPKLF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (611, 'BC000098', '罗森-缤纷什锦组合70*40mm', 'LS-BFSJZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.025', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (612, 'BC000099', '大厨房条码纸(大卷QS)60*80*1500', 'DCFTMZ(DJQS)60*80*1500', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '35.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (613, 'BC000100', '罗森-蟹柳蛋黄酱饭团φ55mm', 'LS-XLDHJFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '160.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (614, 'BC000101', '(停)罗森-至尊饭团(甜辣烤肉)80*90mm', '(T)LS-ZZFT(TLKR)80*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.050', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (615, 'BC000102', '(停)罗森-香辣鸭腿饭45*95mm', '(T)LS-XLYTF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (616, 'BC000103', '罗森-金枪鱼中卷寿司50*30mm', 'LS-JQYZJSS50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '100.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (617, 'BC000104', '(停)罗森-新什锦总汇70*40mm', '(T)LS-XSJZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.025', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (618, 'BC000105', '(停)罗森-鱼籽蟹柳军舰卷70*40mm', '(T)LS-YZXLJJJ70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.020', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (619, 'BC000106', '罗森-双馅细卷组合70*40mm', 'LS-SXXJZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.025', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (620, 'BC000107', '(停)罗森-银耳汤φ80mm', '(T)LS-YETΦ80MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.075', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (621, 'BC000108', '罗森-樱花什锦寿司组合70*40mm', 'LS-YHSJSSZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.025', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (622, 'BC000109', '罗森-缤纷军舰组合50*30mm', 'LS-BFJJZH50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.020', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (623, 'BC000110', '罗森-香辣牛肉饭团φ55mm', 'LS-XLNRFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.032', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (624, 'BC000111', 'POF热缩单片膜380mm*9um*3000m', 'POFRSDPM380MM*9UM*3000M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '226.000', '否', '7', NULL, '17.00', NULL, '3000M', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (625, 'BC000112', 'POF热缩单片膜420mm*9um*3000m', 'POFRSDPM420MM*9UM*3000M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '250.000', '否', '7', NULL, '17.00', NULL, '3000M', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (626, 'BC000113', 'POF热缩单片膜490mm*9um*3000m', 'POFRSDPM490MM*9UM*3000M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '292.000', '否', '7', NULL, '17.00', NULL, '3000M/11.91kg', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (627, 'BC000114', 'POF热缩单片膜540mm*9um*3000m', 'POFRSDPM540MM*9UM*3000M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '321.000', '否', '7', NULL, '17.00', NULL, '3000M', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (628, 'BC000115', 'POF热缩单片膜600mm*9um*3000m', 'POFRSDPM600MM*9UM*3000M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '357.000', '否', '7', NULL, '17.00', NULL, '3000M/14.58kg', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (629, 'BC000116', '罗森-麻辣香锅饭45*95mm', 'LS-MLXGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (630, 'BC000117', '(停)罗森-黑椒猪排饭45*95mm', '(T)LS-HJZPF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (631, 'BC000118', '(停)罗森-韩式什锦拌饭45*95mm', '(T)LS-HSSJBF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (632, 'BC000119', '圆碗380ml', 'YW380ML', NULL, NULL, '268', '450.000', '288', '1.000', '288', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.344', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (633, 'BC000121', '罗森-军舰组合50*30mm', 'LS-JJZH50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.020', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (634, 'BC000122', '寿司盒 1480 身', 'SSH 1480 S', NULL, NULL, '268', '1800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.180', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (635, 'BC000123', '寿司盒 1480 盖', 'SSH 1480 G', NULL, NULL, '268', '1800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.150', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (636, 'BC000124', '圆碗-铭星500乳白', 'YW-MX500RB', NULL, NULL, '268', '300.000', '288', '1.000', '288', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.333', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (637, 'BC000125', '圆碗-伟力WL-SY700黑', 'YW-WLWL-SY700H', NULL, NULL, '268', '150.000', '288', '1.000', '288', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.653', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (638, 'BC000126', '罗森-新登场', 'LS-XDC', NULL, NULL, '268', '10000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.016', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (639, 'BC000127', '罗森-八宝粥(无胶)φ108mm', 'LS-BBZ(WJ)Φ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (640, 'BC000128', '罗森-黑米粥(无胶)φ108mm', 'LS-HMZ(WJ)Φ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (641, 'BC000129', '(停)罗森-酸汤三鲜盒饭115*230mm', '(T)LS-STSXHF115*230MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (642, 'BC000130', '美膳-水煮肉片饭45*95mm', 'MS-SZRPF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (643, 'BC000131', '年味大礼包(包装盒)', 'NWDLB(BZH)', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.400', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (644, 'BC000132', '罗森-金鸡贺喜φ35mm', 'LS-JJHXΦ35MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.029', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (645, 'BC000133', '罗森-好食烩48*69mm', 'LS-HSH48*69MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (646, 'BC000134', '罗森-双菇卤肉饭45*95mm', 'LS-SGLRF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (647, 'BC000135', '(停)罗森-茄汁鱼柳双色饭45*95mm', '(T)LS-QZYLSSF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (648, 'BC000136', '(停)罗森-虾扯蛋雪菜炒饭45*95mm', '(T)LS-XCDXCCF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (649, 'BC000137', '美膳-梅菜扣肉φ108mm', 'MS-MCKRΦ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.140', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (650, 'BC000138', '美膳-粉蒸肉φ108mm', 'MS-FZRΦ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.140', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (651, 'BC000139', '罗森-孜然梅条饭卷120*36mm', 'LS-ZRMTFJ120*36MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.040', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (652, 'BC000140', '一次性勺子', 'YCXSZ', NULL, NULL, '268', '3000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.028', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (653, 'BC000141', '罗森-黑椒牛柳炒面45*135mm', 'LS-HJNLCM45*135MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.065', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (654, 'BC000142', '盒饭单片11*11cm', 'HFDP11*11CM', NULL, NULL, '268', '1000.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.016', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (655, 'BC000143', '绿纸托', 'LZT', NULL, NULL, '278', '1.000', '278', '1.000', '278', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '8.190', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (656, 'BC000144', '(停)罗森-干豆角烧肉盖浇饭45*95mm', '(T)LS-GDJSRGJF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (657, 'BCL00001', '大五格餐盒底', 'DWGCHD', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '340.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (658, 'BCL00002', '八角盒盖', 'BJHG', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '120.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (659, 'BCL0001', '(停)罗森-蟹柳花式组合70*40mm', '(T)LS-XLHSZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '125.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (660, 'BCL0002', '(停用)----------------方圆粥碗-身', '(TY)----------------FYZW-S', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '216.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (661, 'BCL0003', '(停用)----------------方圆粥碗-盖', '(TY)----------------FYZW-G', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '90.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (662, 'BCL00036', '小匙子', 'XCZ', NULL, NULL, '268', '3000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (663, 'BCL0004', '(停用)----------------ND-9身 (金边)', '(TY)----------------ND-9S (JB)', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (664, 'BCL0005', 'JR-3身', 'JR3S', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '196.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (665, 'BCL0006', 'JR-3内衬', 'JR3NC', NULL, NULL, '268', '1600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '416.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (666, 'BCL0007', 'JR-3盖', 'JR3G', NULL, NULL, '268', '1600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '320.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (667, 'BCL0008', '半圆饭团袋', 'BYFTD', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '1050.00', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (668, 'BCL0009', '寿司单片6*20cm', 'SSDP6*20CM', NULL, NULL, '268', '1000.000', '273', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '15.00', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (669, 'BCL0010', '(停用)----------------FB-2121 盖', '(TY)----------------FB-2121 G', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (670, 'BCL0011', '(停用)----------------FB-2121 身', '(TY)----------------FB-2121 S', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (671, 'BCL0012', '(停)罗森-辣子鸡丁花式盒饭45*95mm', '(T)LS-LZJDHSHF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (672, 'BCL0013', '(停)罗森-椒盐排条蛋炒饭45*95mm', '(T)LS-JYPTDCF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (673, 'BCL0014', '(停)罗森-鱼香肉丝饭45*95mm', '(T)LS-YXRSF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (674, 'BCL0015', '罗森-孜香牛肉盖浇饭45*95mm', 'LS-ZXNRGJF45*95MM', 63, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 30, 67, '', '', '350.00', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (675, 'BCL0016', '(停)罗森-韩式烤肉盖浇饭45*95mm', '(T)LS-HSKRGJF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '350.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (676, 'BCL0017', '罗森-培根芝士饭卷120*36mm', 'LS-PGZSFJ120*36MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '200.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (677, 'BCL0018', '罗森-目玉烧饭团φ60mm', 'LS-MYSFTΦ60MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '197.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (678, 'BCL0019', '罗森-炸鸡块茄汁饭团φ60mm', 'LS-ZJKQZFTΦ60MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '197.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (679, 'BCL0020', '罗森-至尊饭团(奥尔良鸡腿)80*90mm', 'LS-ZZFT(AELJT)80*90MM', 63, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 30, 67, '0.0', '', '250.00', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (680, 'BCL0021', '罗森-至尊饭团(美式辣鸡腿)80*90mm', 'LS-ZZFT(MSLJT)80*90MM', 63, NULL, '61', '5000.000', '65', '1.000', '65', '1.000', '1.000', 30, 21, '0.0', '7.0', '250.00', '否', '7', '15', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (681, 'BCL0022', '(停)美膳-至尊饭团(甜辣烤肉)80*90mm', '(T)MS-ZZFT(TLKR)80*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '250.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (682, 'BCL0023', '美膳-至尊饭团(新奥尔良鸡腿)80*90mm', 'MS-ZZFT(XAELJT)80*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '250.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (683, 'BCL0024', '美膳-至尊饭团(美式辣鸡腿)80*90mm', 'MS-ZZFT(MSLJT)80*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '250.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (684, 'BCL0025', '美膳-日式目玉烧饭团φ60mm', 'MS-RSMYSFTΦ60MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '197.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (685, 'BCL0026', '美膳-蛋黄酱三文鱼饭团φ55mm', 'MS-DHJSWYFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '160.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (686, 'BCL0027', '美膳-蛋黄酱金枪鱼饭团φ55mm', 'MS-DHJJQYFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '160.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (687, 'BCL0028', '美膳-双馅细卷套餐组合70*40mm', 'MS-SXXJTCZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '125.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (688, 'BCL0029', '美膳-什锦寿司套餐组合70*40mm', 'MS-SJSSTCZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '125.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (689, 'BCL0030', '(停)美膳-芝士火炬套餐组合70*40mm', '(T)MS-ZSHJTCZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '125.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (690, 'BCL0031', '美膳-缤纷什锦套餐组合70*40mm', 'MS-BFSJTCZH70*40MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '125.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (691, 'BCL0032', '美膳-军舰寿司套餐组合50*30mm', 'MS-JJSSTCZH50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '100.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (692, 'BCL0033', '美膳-金枪鱼寿司50*30mm', 'MS-JQYSS50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '100.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (693, 'BCL0034', '(停)美膳-鱼籽蟹柳军舰寿司50*30mm', '(T)MS-YZXLJJSS50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '100.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (694, 'BCL0035', '美膳-孜香牛肉盖饭45*95mm', 'MS-ZXNRGF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '350.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (695, 'DPL00001', '蛋卷', 'DJ', NULL, NULL, '268', '143.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '163.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (696, 'DPL00002', '保洁蛋', 'BJD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '9.800', '否', '5', NULL, '11.00', NULL, '0税率可抵13的税', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (697, 'DPL00003', '全蛋液', 'QDY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '13.00', '是', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (698, 'DPL00004', '蛋黄液', 'DHY', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '22.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (699, 'DPL00005', '蛋白液', 'DBY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '11.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (700, 'DPL00006', '咸蛋黄', 'XDH', 104, NULL, '46', '1.000', '46', '1000', '47', '1.000', '1.000', 28, 107, '0.0', '7.0', '10.000', '1', '7', '16', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-21 03:45:19', NULL);
INSERT INTO `mtr_data` VALUES (701, 'DZP00001', '素三杯鸡', 'SSBJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (702, 'DZP00002', '吉祥福袋', 'JXFD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (703, 'DZP0001', '豆干边角', 'DGBJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (704, 'DZP0002', '豆浆', 'DJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (705, 'DZP0003', '福嘉块豆腐（散）', 'FJKDF（S）', NULL, NULL, '276', '1.000', '276', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.60', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (706, 'DZP0004', '福嘉五香厚干（散）', 'FJWXHG（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.50', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (707, 'DZP0005', '福嘉五香薄干（散）', 'FJWXBG（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (708, 'DZP0006', '福嘉老豆腐（散）', 'FJLDF（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (709, 'DZP0007', '豆油皮', 'DYP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (710, 'DZPL0001', '素熏鱼', 'SXY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (711, 'DZPL0002', '福嘉五香素鸡(散)', 'FJWXSJ(S)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (712, 'DZPL0004', '福嘉绢豆腐418g', 'FJJDF418G', NULL, NULL, '272', '0.418', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '2.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (713, 'DZPL0005', '味付油扬', 'WFYY', NULL, NULL, '283', '0.950', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '24.211', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (714, 'DZPL0006', '福嘉家常豆腐380g', 'FJJCDF380G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (715, 'DZPL0007', '福嘉五香素鸡250g', 'FJWXSJ250G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (716, 'DZPL0008', '福嘉柴火豆腐420g', 'FJCHDF420G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (717, 'DZPL0009', '福嘉超嫩豆腐350g', 'FJCNDF350G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (718, 'DZPL0010', '福嘉油皮香干200g', 'FJYPXG200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.62', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (719, 'DZPL0011', '福嘉薄千张200g', 'FJBQZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (720, 'DZPL0012', '福嘉千张结200g', 'FJQZJ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.750', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (721, 'DZPL0013', '福嘉壹张干130g', 'FJYZG130G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.350', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (722, 'DZPL0014', '福嘉霉千张280g', 'FJMQZ280G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.750', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (723, 'DZPL0015', '福嘉千叶豆腐400g', 'FJQYDF400G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (724, 'DZPL0016', '福嘉豆油皮80g', 'FJDYP80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.870', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (725, 'DZPL0017', '福嘉嫩豆腐450g', 'FJNDF450G', NULL, NULL, '272', '0.450', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.5', '0.0', '5.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (726, 'DZPL0018', '福嘉千张结(散)', 'FJQZJ(S)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (727, 'DZPL0019', '福嘉豆泡（散）', 'FJDP（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (728, 'DZPL0020', '日本豆腐', 'RBDF', NULL, NULL, '272', '1.000', '277', '65.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.000', '否', '0', NULL, '17.00', NULL, '65g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (729, 'DZYH0001', '大垃圾袋', 'DLJD', NULL, NULL, '268', '500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '168.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (730, 'DZYH0002', '洗洁精20kg/桶', 'XJJ20KG/T', NULL, NULL, '269', '20.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '92.00', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (731, 'DZYH0003', '次氯酸钠溶液', 'CLSNRY', NULL, NULL, '269', '25.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '150.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (732, 'DZYH0004', '漂白水', 'PBS', NULL, NULL, '269', '25.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '100.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (733, 'DZYH0005', '丁腈手套', 'DJST', NULL, NULL, '268', '500.000', '280', '1.000', '280', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.800', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (734, 'DZYH0006', '一次性PE手套', 'YCXPEST', NULL, NULL, '268', '10000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.030', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (735, 'DZYH0007', '95%食用酒精500ML', '95%SYJJ500ML', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.300', '是', '0', NULL, '17.00', NULL, '30*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (736, 'DZYH0008', '一次性口罩', 'YCXKZ', NULL, NULL, '268', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (737, 'DZYH0009', '一次性PE围裙', 'YCXPEWQ', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.150', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (738, 'DZYH0010', '片碱', 'PJ', NULL, NULL, '283', '25.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (739, 'DZYH0011', '洗洁精(小壶)', 'XJJ(XH)', NULL, NULL, '295', '1.000', '295', '1.000', '295', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (740, 'DZYH0012', '75%食用酒精2.5L', '75%SYJJ2.5L', NULL, NULL, '295', '1.000', '295', '1.000', '295', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '20.000', '否', '0', NULL, '17.00', NULL, '10*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (741, 'DZYH0013', '75%食用酒精5L', '75%SYJJ5L', NULL, NULL, '295', '1.000', '295', '1.000', '295', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '40.000', '否', '0', NULL, '17.00', NULL, '6*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (742, 'GHL00001', '黄花菜', 'HHC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '45.00', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (743, 'GHL00004', '王仁和粗米线', 'WRHCMX', NULL, NULL, '268', '25.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (744, 'GHL0001', '木鱼花', 'MYH', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '86.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (745, 'GHL0002', '苕粉', 'SF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '5.200', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (746, 'GHL0003', '腰果', 'YG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '44.60', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (747, 'MML00001', '藕粉', 'OF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '1.20', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (748, 'MML00002', '黑米', 'HM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '7.83', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (749, 'MML00006', '思念水饺', 'SNSJ', NULL, NULL, '268', '8.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (750, 'MML0001', '放心宽米粉250g', 'FXKMF250G', NULL, NULL, '283', '0.250', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.800', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (751, 'MML0002', '原味面发糕', 'YWMFG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.830', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (752, 'MML0003', '紫薯面发糕', 'ZSMFG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.830', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (753, 'MML0004', '散装葱香花卷', 'SZCXHJ', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.670', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (754, 'MML0005', '散装麦香馒头70g', 'SZMXMT70G', NULL, NULL, '273', '0.070', '273', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.857', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (755, 'MYL00001', '清水面筋200g', 'QSMJ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.630', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (756, 'MYL00002', '香辣凤尖散(H)', 'XLFJS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '32.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (757, 'MYL00003', '卤鸭肫散(H)', 'LYZS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '70.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (758, 'MYL00004', '卤鸭翅散(H)', 'LYCS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '28.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (759, 'MYL00005', '卤鸭脖散(H)', 'LYBS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '30.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (760, 'MYL00006', '甜片牛奶吐司95g(Z)', 'TPNNTS95G(Z)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.840', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (761, 'MYL00007', '丹麦草莓奶油面包70g', 'DMCMNYMB70G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (762, 'MYL00008', '丹麦芝士面包90g', 'DMZSMB90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (763, 'MYL00009', '海绵巧克力卷85g', 'HMQKLJ85G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (764, 'MYL00010', '卤猪舌', 'LZS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '65.000', '否', '10', NULL, '17.00', NULL, '2.5kg*4/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (765, 'MYL00011', '卤猪头肉', 'LZTR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '36.500', '否', '10', NULL, '17.00', NULL, '10kg/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (766, 'MYL00012', '丹麦肉松纽纹面包100g', 'DMRSNWMB100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.84', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (767, 'MYL00013', '缤纷QQ麻薯(四种口味)120g', 'BFQQMS(SZKW)120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (768, 'MYL00014', '香蕉奶昔蛋糕100g', 'XJNXDG100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.83', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (769, 'MYL00015', '牛油排包180g', 'NYPB180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (770, 'MYL00016', '肉松吐司385g', 'RSTS385G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (771, 'MYL00017', '香醇蛋糕200g', 'XCDG200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.830', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (772, 'MYL00018', '巧克力慕斯75g', 'QKLMS75G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (773, 'MYL00019', '分享蛋糕', 'FXDG', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.160', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (774, 'MYL00020', '冰心巧克力蛋糕80g', 'BXQKLDG80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (775, 'MYL00021', '冰心芒果蛋糕90g', 'BXMGDG90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (776, 'MYL00022', '香蕉水果蛋糕100g', 'XJSGDG100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.830', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (777, 'MYL00023', '香浓提子吐司180g', 'XNTZTS180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.420', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (778, 'MYL00024', '五香卤牛耳', 'WXLNE', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '57.000', '否', '10', NULL, '17.00', NULL, '1.5kg/袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (779, 'MYL00025', '五香卤牛蹄', 'WXLNT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '53.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (780, 'MYL00026', '五香卤牛舌', 'WXLNS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '90.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (781, 'MYL00027', '冻牛脸肉', 'DNLR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '44.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (782, 'MYL00029', '红豆小餐包140g', 'HDXCB140G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.150', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (783, 'MYL00030', '虎皮瑞士卷130g', 'HPRSJ130G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.550', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (784, 'MYL00031', '抹茶瑞士卷110g', 'MCRSJ110G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (785, 'MYL00032', '香草瑞士卷110g', 'XCRSJ110G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (786, 'MYL00033', '鲜奶吐司180g', 'XNTS180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.420', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (787, 'MYL00034', '毛毛虫120g', 'MMC120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.770', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (788, 'MYL00035', '枣泥蛋糕4个装130g', 'ZNDG4GZ130G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.850', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (789, 'MYL00036', '法棒230g', 'FB230G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.360', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (790, 'MYL00037', '盐面包180g', 'YMB180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.760', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (791, 'MYL00038', '咖啡瑞士卷110g', 'KFRSJ110G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (792, 'MYL00039', '卡拉棒(黑椒)75g', 'KLB(HJ)75G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (793, 'MYL00040', '荞麦馒头（散）', 'QMMT（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.400', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (794, 'MYL00041', '放心宽米粉600g/袋', 'FXKMF600G/D', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.570', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (795, 'MYL00042', '黑米馒头20g（散）', 'HMMT20G（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.410', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (796, 'MYL00043', '咖喱土豆3个装/240g', 'KLTD3GZ/240G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.700', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (797, 'SCL00005', '鲜香菇', 'XXG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.845', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (798, 'SCL0001', '刀豆', 'DD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.800', NULL, NULL, '0.0', '0.0', '15.20', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (799, 'SCL0002', '(停用)----------------培根', '(TY)----------------PG', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (800, 'SCL0003', '净篙芭', 'JGB', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '22.60', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (801, 'SCL0004', '瓠子', 'HZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (803, 'SGL0002', '苹果', 'PG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '0.0', '14.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (804, 'SGL0003', '西瓜', 'XG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (805, 'SGNN0001', '哈密瓜', 'HMG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (806, 'SGNN0002', '嘎啦果', 'GLG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (807, 'SGNN0003', '桃子', 'TZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (808, 'SGNN0004', '水蜜桃', 'SMT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (809, 'SGNN0005', '香瓜', 'XG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (810, 'SGNN0006', '火龙果', 'HLG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.800', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (811, 'SGNN0007', '冬枣', 'DZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.556', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (812, 'SGNN0008', '桔子', 'JZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (813, 'SGNN0009', '地瓜', 'DG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.000', '是', '0', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (814, 'SGNN0010', '橙子', 'CZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '30.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (815, 'SGNN0011', '梨子', 'LZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (816, 'TWLL0001', '辣椒油', 'LJY', NULL, NULL, '270', '1.000', '277', '1000.000', '270', '1.000', '0.010', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (817, 'TWLL0002', '泡打粉', 'PDF', NULL, NULL, '284', '2.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '15.200', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (818, 'TWLL0003', '小米椒', 'XMJ', NULL, NULL, '268', '12.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.000', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (819, 'TWLL0004', '美极烧焖鲜', 'MJSMX', NULL, NULL, '268', '6.000', '277', '1000.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (820, 'TWLL0005', '美极厨师调味汁', 'MJCSDWZ', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '29.500', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (821, 'TWLL0006', '食用碱', 'SYJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (822, 'TWLL0007', '黑胡椒粉', 'HHJF', NULL, NULL, '283', '0.250', '277', '1000.000', '276', '1.000', '0.001', NULL, NULL, '0.0', '7.0', '17.50', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (823, 'TWLL0008', '咖喱粉', 'GLF', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '38.000', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (824, 'TWLL0009', '外公菜', 'WGC', NULL, NULL, '268', '1.000', '268', '1.000', '268', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '5.910', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (825, 'TWLL0010', '爽脆红丁', 'SCHD', NULL, NULL, '268', '8.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '4.118', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (826, 'TWLL0011', '(停)新的芒果汁', '(T)XDMGZ', NULL, NULL, '270', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '68.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (827, 'TWLL0012', '红腐乳', 'HFR', NULL, NULL, '284', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (828, 'TWLL0013', '酒曲', 'JQ', NULL, NULL, '268', '6.000', '277', '50.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.400', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (829, 'TWLL0014', '黄姜粉', 'HJF', NULL, NULL, '272', '0.400', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (830, 'TWLL0015', '沸煮江湖麻辣底料', 'FZJHMLDL', NULL, NULL, '283', '0.300', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '0.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (831, 'TWLL0016', '米酒', 'MJ', NULL, NULL, '270', '0.900', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (832, 'TWLL0017', '美式炸鸡粉', 'MSZJF', NULL, NULL, '283', '2.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (833, 'TWLL0018', '玉米淀粉', 'YMDF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (834, 'TWLL0019', '风味膏', 'FWG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (835, 'TWLL0020', '什锦水果', 'SJSG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (836, 'TWLL0021', '豆豉鱼罐头', 'DCYGT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (837, 'TWLL0022', '浓缩鸡汁', 'NSJZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (838, 'TWLL0023', '二荆条', 'EJT', NULL, NULL, '283', '2.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '5.250', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (839, 'TWLL0024', '孜然粉', 'ZRF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '0.0', '7.0', '24.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (840, 'TWLL0025', '金玉满堂', 'JYMT', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '7.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (841, 'TWLL0026', '户户酱', 'HHJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '8.40', '否', '10', NULL, '17.00', NULL, '14kg*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (842, 'TWLL0027', '户户辣椒粉', 'HHLJF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '20.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (843, 'TWLL0028', '生姜汁500ml', 'SJZ500ML', NULL, NULL, '268', '12.000', '277', '500.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '10.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (844, 'TWLL0029', '大蒜汁500ml', 'DSZ500ML', NULL, NULL, '268', '12.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '10.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (845, 'TWLL0030', '雀巢甜奶粉', 'QCTNF', NULL, NULL, '283', '0.800', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '66.250', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (846, 'TWLL0031', '(停)奶精', '(T)NJ', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '18.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (847, 'TWLL0032', '(停)柳橙', '(T)LC', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '68.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (848, 'TWLL0033', '(停)茉莉绿茶', '(T)MLLC', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (849, 'TWLL0034', '(停)沙冰粉', '(T)SBF', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '17.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (850, 'TWLL0035', '(停)白椰果', '(T)BYG', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (851, 'TWLL0036', '(停)咖啡红茶', '(T)KFHC', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (852, 'TWLL0037', '(停)麦香红茶', '(T)MXHC', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (853, 'W0000001', 'MX-7A身', 'MX-7AS', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.560', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (854, 'W0000002', 'SB LX1 盖', 'SB LX1 G', NULL, NULL, '268', '1200.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.392', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (855, 'W0000003', '水果黄瓜', 'SGHG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '5.0', '0.0', '9.80', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (856, 'W0000004', '美极鲜鸡粉', 'MJXJF', NULL, NULL, '283', '2.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '26.500', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (857, 'W0000005', '美极牛肉粉', 'MJNRF', NULL, NULL, '284', '1.000', '277', '1000.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '29.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (858, 'W0000007', '干虾仁', 'GXR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '是', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (859, 'W0000008', '面筋', 'MJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.500', NULL, NULL, '0.0', '0.0', '6.800', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (860, 'W0000009', '香蕉', 'XJ', NULL, NULL, '276', '1.000', '279', '3.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (861, 'W0000010', '放心宽米粉', 'FXKMF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.910', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (862, 'W0000011', '腐竹', 'FZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '24.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (863, 'W0000012', '麻辣风味膏', 'MLFWG', NULL, NULL, '269', '20.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (864, 'W0000013', '五香猪耳', 'WXZE', 104, NULL, '46', '1.000', '46', '1000.000', '47', '1.000', '1.000', 27, 107, '', '', '58.00', '0', '10', '106', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (865, 'W0000014', '淡水鱼', 'DSY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '16.200', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (866, 'W0000015', '莲子米', 'LZM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '46.000', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (867, 'W0000016', '牛腩', 'NN', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '36.00', '是', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (868, 'W0000017', '培根碎片', 'PGSP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.950', '1.000', NULL, NULL, '0.0', '7.0', '11.83', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (869, 'W0000018', '连卷袋（小）', 'LJD（X）', NULL, NULL, '268', '10.000', '273', '500.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '230.00', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (870, 'W0000019', '连卷袋（大）', 'LJD（D）', NULL, NULL, '268', '10.000', '273', '500.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '220.00', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (871, 'W0000020', '180g真空袋15*27cm', '180GZKD15*27CM', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (872, 'W0000021', '250g真空袋18*25cm', '250GZKD18*25CM', NULL, NULL, '268', '2500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (873, 'W0000022', '1kg真空袋20*35，25*32cm', '1KGZKD20*35，25*32CM', NULL, NULL, '268', '3000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.300', '是', '10', NULL, '17.00', NULL, '20*35,32*25', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (874, 'W0000023', '2kg真空袋30*40cm', '2KGZKD30*40CM', NULL, NULL, '268', '1300.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.435', '是', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (875, 'W0000024', '升阳小号托', 'SYXHT', NULL, NULL, '268', '560.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.240', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (876, 'W0000025', '升阳中号托', 'SYZHT', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (877, 'W0000026', '散点大白袋', 'SDDBD', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.220', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (878, 'W0000027', '机膜350', 'JM350', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '128.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (879, 'W0000028', '江夏大白袋', 'JXDBD', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.450', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (880, 'W0000029', '6号盒', '6HH', NULL, NULL, '268', '720.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.220', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (881, 'W0000030', '福嘉薄千张（散）', 'FJBQZ（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.500', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (882, 'W0000031', '大厨房条码纸(大卷)', 'DCFTMZ(DJ)', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (883, 'W0000032', '黄豆', 'HD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '5.100', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (884, 'W0000033', '枸杞', 'GQ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '6.00', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (885, 'W0000035', '脆皮肠（烤肠）碎', 'CPC（KC）S', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (886, 'W0000036', '塑料杯400F', 'SLB400F', NULL, NULL, '268', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (887, 'W0000037', '王仁和细米线', 'WRHXMX', NULL, NULL, '268', '25.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (888, 'W0000038', '筒子骨', 'TZG', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '18.00', '是', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (889, 'W0000039', '餐盒UHF9/1盖', 'CHUHF9/1G', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (890, 'W0000040', '铁锅馒头', 'TGMT', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.470', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (891, 'W0000041', '扎带3.6*150mm', 'ZD3.6*150MM', NULL, NULL, '271', '500.000', '279', '1.000', '279', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.046', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (892, 'W0000042', 'A1912一次性托盘', 'A1912YCXTP', NULL, NULL, '268', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.100', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (893, 'W0000043', '活草鱼', 'HCY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (894, 'W0000044', '卤猪蹄', 'LZT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '35.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (895, 'W0000045', '牛肉丸', 'NRW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '16.50', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (896, 'W0000046', '干蚕豆', 'GCD', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '10.000', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (897, 'W0000047', '思恋小丸子500g', 'SLXWZ500G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (898, 'W0000048', '福嘉臭干子300g', 'FJCGZ300G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.620', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (899, 'W0000049', '海带头', 'HDT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '11.00', NULL, '9.3kg/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (900, 'W0000050', '玉米窝窝头', 'YMWWT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.660', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (901, 'W0000051', '凉面（熟）', 'LM（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.400', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (902, 'WBC0001', '五香卤牛肉', 'WXLNR', 104, NULL, '46', '1.000', '46', '1000.000', '47', '1.000', '1.000', 27, 107, '0.0', '0.0', '79.000', '0', '10', '106', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (903, 'WBCP0001', '鲜肉大包', 'XRDB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '100g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (904, 'WBCP0002', '香菇菜包', 'XGCB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.220', '否', '5', NULL, '17.00', NULL, '85g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (905, 'WBCP0003', '酱肉包', 'JRB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '100g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (906, 'WBCP0004', '照烧鸡肉包（10/袋）', 'ZSJRB（10/D）', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '100g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (907, 'WBCP0005', '鱼香肉丝包', 'YXRSB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '100g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (908, 'WBCP0006', '五谷粗粮包', 'WGCLB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '100g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (909, 'WBCP0007', '南瓜包', 'NGB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '100g/个', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (910, 'WBCP0008', '紫薯包', 'ZSB', NULL, NULL, '268', '100.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (911, 'WBCP0009', '卤鸭脖180g(H)', 'LYB180G(H)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.70', '否', '0', NULL, '17.00', NULL, '35元/kg', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (912, 'WBCP0010', '即食鸭翅', 'JSYC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '33.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (913, 'WBCP0011', '卤鸭掌散(H)', 'LYZS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '44.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (914, 'WBCP0012', '吸管6*250', 'XG6*250', NULL, NULL, '268', '50.000', '279', '100.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (915, 'WBCP0013', '香辣脱骨鸭掌(锁鲜装)70g', 'XLTGYZ(SXZ)70G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '4.900', '否', '5', NULL, '17.00', NULL, '80g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (916, 'WBCP0014', '夫妻肺片(锁鲜装)80g', 'FQFP(SXZ)80G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '4.900', '否', '5', NULL, '17.00', NULL, '80g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (917, 'WBCP0015', '卤藕(锁鲜装)80g', 'LO(SXZ)80G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.000', '否', '0', NULL, '17.00', NULL, '80g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (918, 'WBCP0016', '卤味牛皮干(锁鲜装)70g', 'LWNPG(SXZ)70G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.000', '否', '0', NULL, '17.00', NULL, '70g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (919, 'WBCP0017', '卤味豆油皮(锁鲜装)80g', 'LWDYP(SXZ)80G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.200', '否', '0', NULL, '17.00', NULL, '80g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (920, 'WBCP0018', '农夫山泉380ml', 'NFSQ380ML', NULL, NULL, '268', '24.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.100', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (921, 'WBCP0019', '香辣锁骨(锁鲜装)70g', 'XLSG(SXZ)70G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '3.000', '否', '5', NULL, '17.00', NULL, '70g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (922, 'WBCP0020', '香辣鸭翅(锁鲜装)70g', 'XLYC(SXZ)70G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '3.500', '否', '5', NULL, '17.00', NULL, '70g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (923, 'WBCP0021', '卤味干豆角(锁鲜装)70g', 'LWGDJ(SXZ)70G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.200', '否', '0', NULL, '17.00', NULL, '70g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (924, 'WBCP0022', '馄饨250g', 'HT250G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (925, 'WBCP0023', '安井猪肉包720g', 'AJZRB720G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (926, 'WBCP0024', '卤花生(锁鲜装)75g', 'LHS(SXZ)75G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.300', '否', '0', NULL, '17.00', NULL, '75g/盒', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (927, 'WBCP0025', '梅菜扣肉350g', 'MCKR350G', NULL, NULL, '296', '1.000', '296', '1.000', '296', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.000', '否', '0', NULL, '17.00', NULL, '22*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (928, 'WBCP0026', '粉蒸肉350g', 'FZR350G', NULL, NULL, '296', '1.000', '296', '1.000', '296', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.000', '否', '0', NULL, '17.00', NULL, '22*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (929, 'WBCP0027', '豆沙包3个装240g', 'DSB3GZ240G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.490', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (930, 'WBCP0028', '布利欧吐司75g(Z)', 'BLOTS75G(Z)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.380', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (931, 'WBCP0029', '海绵小蛋糕140g', 'HMXDG140G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (932, 'WBCP0030', '酥皮夹心蛋糕100g', 'SPJXDG100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.380', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (933, 'WBCP0031', '红豆沙吐司110g(Z)', 'HDSTS110G(Z)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.380', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (934, 'WBCP0032', '色拉肉松面包90g', 'SLRSMB90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.840', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (935, 'WBCP0033', '照烧鸡肉三明治120g', 'ZSJRSMZ120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (936, 'WGB0001', '韩式泡菜', 'HSPC', NULL, NULL, '283', '1.000', '277', '1000.000', '276', '1.000', '0.900', NULL, NULL, '0.0', '10.0', '18.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (937, 'WGB0002', '微辣鸡排', 'WLJP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (938, 'WGB0003', '停用-----奥尔良连心脆', 'TY-----AELLXC', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (939, 'WGB0006', '大成辣味龙田扬', 'DCLWLTY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (940, 'WGBC0001', '关东煮-黄金玉米棒', 'GDZ-HJYMB', NULL, NULL, '283', '10.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.500', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (941, 'WGBC0002', '关东煮-鱼仔仙贝', 'GDZ-YZXB', NULL, NULL, '283', '10.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.500', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (942, 'WGBC0003', '关东煮-脆骨麻花', 'GDZ-CGMH', NULL, NULL, '283', '10.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.500', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (943, 'WGBC0004', '关东煮-脆骨豆腐', 'GDZ-CGDF', NULL, NULL, '283', '10.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.500', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (944, 'WGBC0005', '关东煮-莲藕烧', 'GDZ-LOS', NULL, NULL, '283', '10.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.500', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (945, 'WGBC0006', '关东煮-竹轮鸡肉', 'GDZ-ZLJR', NULL, NULL, '283', '10.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.500', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (946, 'WGBC0007', '关东煮-牛筋串', 'GDZ-NJC', NULL, NULL, '268', '500.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '50*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (947, 'WGBC0008', '关东煮-肉筋串', 'GDZ-RJC', NULL, NULL, '268', '500.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '50*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (948, 'WGBC0009', '关东煮-牛肠串', 'GDZ-NCC', NULL, NULL, '268', '500.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '50*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (949, 'WGBC0010', '精品肥牛', 'JPFN', NULL, NULL, '268', '25.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '34.000', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (950, 'WGBC0011', '生牛肉片', 'SNRP', NULL, NULL, '283', '0.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '41.000', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (951, 'WGBC0012', '玉米布丁', 'YMBD', NULL, NULL, '268', '888.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '240.00', '否', '0', NULL, '17.00', NULL, '15kg/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (952, 'WGBC0013', '(停)蜂蜜柚子茶（冲剂）', '(T)FMYZC（CJ）', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '21.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (953, 'WGBC0014', '(停)桂圆红枣茶', '(T)GYHZC', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '24.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (954, 'WGBC0015', '牙签', 'YQ', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (955, 'WGBC0016', '吸管6*210', 'XG6*210', NULL, NULL, '268', '50.000', '279', '100.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (956, 'WGBC0017', '吸管10*210', 'XG10*210', NULL, NULL, '268', '50.000', '279', '100.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '3.380', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (957, 'WGBC0018', '吸管10*250', 'XG10*250', NULL, NULL, '268', '50.000', '279', '100.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (958, 'WGBC0019', '脱骨烧鸭', 'TGSY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (959, 'WGBC0020', '雀巢橙味C', 'QCCWC', NULL, NULL, '268', '12.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '23.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (960, 'WGBC0021', '雀巢茶品港式奶茶', 'QCCPGSNC', NULL, NULL, '268', '12.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '56.000', '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (961, 'WGBC0022', '雀巢丝滑拿铁咖啡', 'QCSHNTKF', NULL, NULL, '268', '12.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '43.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (962, 'WGBC0023', '豆浆粉', 'DJF', NULL, NULL, '268', '12.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '12.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (963, 'WGBC0024', '雀巢纸杯+盖', 'QCZB+G', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.420', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (964, 'WGBC0025', '三全煎饺', 'SQJJ', NULL, NULL, '268', '6.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (965, 'WGBC0026', '外婆蛋饼', 'WPDB', NULL, NULL, '268', '100.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '1.250', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (966, 'WGBC0027', '三色拼盘', 'SSPP', NULL, NULL, '271', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '8.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (967, 'WGBC0028', '香草蛋糕5个装60g', 'XCDG5GZ60G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.150', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (968, 'WGBC0029', '肉松蛋夹3个装120g', 'RSDJ3GZ120G', NULL, NULL, '271', '1.000', '271', '1.000', '271', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.430', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (969, 'WGBC0030', '冰皮月亮蛋糕(芒果)90g', 'BPYLDG(MG)90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.23', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (970, 'WGBC0031', '冰皮月亮蛋糕(巧克力)80g', 'BPYLDG(QKL)80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.670', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (971, 'WGBC0032', '调理奥尔良烤鸡350g', 'DLAELKJ350G', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (972, 'WGBC0033', '加州提子排包200g', 'JZTZPB200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.550', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (973, 'WGBC0034', '肉松餐包110g', 'RSCB110G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.940', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (974, 'WGBC0035', '牛奶棒130g', 'NNB130G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.770', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (975, 'WGBC0036', '红豆餐包2个装75g', 'HDCB2GZ75G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.35', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (976, 'WGBC0037', '南方馒头3个装210g', 'NFMT3GZ210G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (977, 'WGBC0038', '香辣凤爪散(H)', 'XLFZS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '45.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (978, 'WGBC0039', '玉米甜心', 'YMTX', NULL, NULL, '268', '388.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.387', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (979, 'WGBC0040', '玉米酥', 'YMS', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '18.500', '否', '0', NULL, '17.00', NULL, '13g*77块/袋/kg', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (980, 'WGBC0041', '料理丸子', 'LLWZ', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '130个/袋/2kg', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (981, 'XSYL0001', '脆香油条', 'CXYT', NULL, NULL, '268', '120.000', '279', '1.000', '279', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.792', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (982, 'XSYL0002', '关东煮-牛肚串', 'GDZ-NDC', NULL, NULL, '268', '500.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '50*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (983, 'XSYL0003', '关东煮-牛肉串', 'GDZ-NRC', NULL, NULL, '268', '500.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '50*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (984, 'XSYL0004', '樱花粉', 'YHF', NULL, NULL, '268', '10.000', '276', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '72.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (985, 'YR000001', '火腿丁', 'HTD', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '14.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (986, 'YR000002', '猪肉散', 'ZRS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '22.000', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (987, 'YR000003', '红茶鸭腿', 'HCYT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (988, 'YR000004', '红烧狮子头', 'HSSZT', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '130.00', '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (989, 'YR000005', '油炸鱼丸', 'YZYW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '17.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (990, 'YR000006', '八爪鱼', 'BZY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', '50.000', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (991, 'YR000007', '味付螺肉', 'WFLR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (992, 'YR000008', '鳕鱼丝', 'XYS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', '38.000', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (993, 'YR000009', '蒲烧海鳗切片8g', 'PSHMQP8G', NULL, NULL, '268', '50.000', '276', '0.160', '271', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '17.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (994, 'YR000010', '扣肉方', 'KRF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '46.00', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (995, 'YR000011', '哈利路鸭', 'HLLY', NULL, NULL, '282', '1.000', '282', '1.000', '282', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '16.800', '是', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (996, 'YR000012', '鱼糜', 'YM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '15.000', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (997, 'YR000013', '原味鸡块', 'YWJK', 109, NULL, '64', '30', '46', '1000', '47', '1.000', '1.000', 27, 22, '0.0', '0.0', '80', '否', '0', '105', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-18 15:50:56', NULL);
INSERT INTO `mtr_data` VALUES (998, 'YR000014', '香酥鸡柳', 'XSJL', NULL, NULL, '276', '1.000', '277', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (999, 'YR000015', '龙利鱼', 'LLY', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '21.250', '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1000, 'YR000016', '广式腊肉', 'GSLR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '60.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1001, 'YR000017', '广式腊肠', 'GSLC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '30.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1002, 'YR000018', '学生餐卤牛肉', 'XSCLNR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1003, 'YR000019', '五香猪腱子', 'WXZJZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '51.000', '否', '10', NULL, '17.00', NULL, '2.5kg*4/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1004, 'YR000020', '饭匙骨（板骨）', 'FCG（BG）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '8.000', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1005, 'YRL00001', '鱼丸', 'YW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '16.80', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1006, 'YRL00016', '冻猪边排', 'DZBP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1007, 'YRL00017', '剥皮鱼', 'BPY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1008, 'YRL00018', '小黄鱼', 'XHY', NULL, NULL, '276', '1.000', '277', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1009, 'YRL0002', '牛骨头', 'NGT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1010, 'YRL0003', '(停用)----------------冻后腿精瘦肉', '(TY)----------------DHTJSR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.940', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1011, 'YRL0004', '全羊', 'QY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.920', '1.000', NULL, NULL, '0.0', '5.0', '40.000', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1012, 'YRL0005', '肘花碎', 'ZHS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1013, 'YRL0007', '切片火腿头', 'QPHTT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '12.00', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1014, 'YRL0008', '土鸡', 'TJ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '24.000', '否', '5', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1015, 'YRL0012', '烤鳗碎肉', 'KMSR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '62.500', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1016, 'YRL0013', '松叶蟹柳', 'SYXL', NULL, NULL, '283', '0.270', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '70.370', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1017, 'YRL0014', '原料鸭', 'YLY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1018, 'YRL0015', '蜜汁叉烧肉', 'MZCSR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1019, 'YZL00002', '月饼', 'YB', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '5.0', NULL, '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1020, 'ZB000001', '菜籽油', 'CZY', NULL, NULL, '269', '20.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '20.0', '7.0', '8.800', '是', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1021, 'ZB000002', '红豆酥菠萝250g', 'HDSBL250G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.850', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1022, 'ZB000003', '芝士条80g', 'ZST80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.150', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1023, 'ZB000004', '椰香奶棒190g', 'YXNB190G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1024, 'ZB000005', '鸡蛋火腿三明治', 'JDHTSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.440', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1025, 'ZB000007', '金枪鱼色拉三明治', 'JQYSLSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.190', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1026, 'ZB000008', '卤藕180g(H)', 'LO180G(H)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.50', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1027, 'ZB000009', '卤干子180g(H)', 'LGZ180G(H)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.500', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1028, 'ZB000010', '卤豆油皮180g(H)', 'LDYP180G(H)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.90', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1029, 'ZB000011', '干笔笋', 'GBS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '21.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1030, 'ZB000012', '虎皮蛋糕4个装', 'HPDG4GZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.700', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1031, 'ZB000013', '火腿乳酪三明治120g', 'HTRLSMZ120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.210', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1032, 'ZB000014', '卤鸭肫180g（H）', 'LYZ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1033, 'ZB000015', '卤鸭掌180g（H）', 'LYZ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1034, 'ZB000016', '卤鸭翅180g（H）', 'LYC180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1035, 'ZB000017', '香辣凤爪180g（H）', 'XLFZ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1036, 'ZB000018', '卤豆干180g（H）', 'LDG180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.90', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1037, 'ZB000019', '卤花生米180g（H）', 'LHSM180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.90', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1038, 'ZB000020', '卤干豆角180g（H）', 'LGDJ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.90', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1039, 'ZB000021', '香辣凤尖180g(H)', 'XLFJ180G(H)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1040, 'ZB000022', '香辣鸭锁骨180g（H）', 'XLYSG180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.10', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1041, 'ZB000023', '鸡蛋时蔬三明治', 'JDSSSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1042, 'ZB000024', '香辣鸡腿堡', 'XLJTB', NULL, NULL, '268', '120.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.250', '否', '0', NULL, '17.00', NULL, '80g/片/120/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1043, 'ZB000025', '亲亲肠', 'QQC', NULL, NULL, '283', '2.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '12.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1044, 'ZB000026', '杂鱿鱼', 'ZYY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '18.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1045, 'ZB000027', '芙蓉虾', 'FRX', NULL, NULL, '283', '0.200', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '100.000', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1046, 'ZB000028', '400汤杯（乳白）', '400TB（RB）', NULL, NULL, '298', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.225', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1047, 'ZB000029', '400汤杯盖（透明）', '400TBG（TM）', NULL, NULL, '298', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.095', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1048, 'ZB000030', '卤鸭头3个装(H)', 'LYT3GZ(H)', NULL, NULL, '283', '3.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.00', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1049, 'ZB000032', '卤牛皮干散（H）', 'LNPGS（H）', NULL, NULL, '276', '1.000', '276', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1050, 'ZB000033', '卤藕散(H)', 'LOS(H)', NULL, NULL, '276', '1.000', '277', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1051, 'ZB000034', '卤豆油皮散(H)', 'LDYPS(H)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '17.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1052, 'ZB000035', '卤海白菜散（H）', 'LHBCS（H）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '19.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1053, 'ZB000036', '卤香菇散（H）', 'LXGS（H）', NULL, NULL, '276', '1000.000', '277', '1.000', '277', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '26.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1054, 'ZB000037', '卤海带结散（H）', 'LHDJS（H）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1055, 'ZB000038', '卤腐竹散（H）', 'LFZS（H）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1056, 'ZB000039', '金丝肉饼80g*100片', 'JSRB80G*100P', NULL, NULL, '268', '100.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '1.280', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1057, 'ZB000040', '洋葱圈', 'YCQ', NULL, NULL, '268', '6.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1058, 'ZB000041', '黑椒牛味柳', 'HJNWL', NULL, NULL, '268', '15.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1059, 'ZB000042', '烟熏鸡肉火腿三明治', 'YXJRHTSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.440', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1060, 'ZB000043', '椰子吐司385g', 'YZTS385G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.250', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1061, 'ZB000044', '黑芝麻吐司290g', 'HZMTS290G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.720', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1062, 'ZB000045', '菠萝餐包2个装75g', 'BLCB2GZ75G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1063, 'ZB000046', '蜂蜜蛋糕85g', 'FMDG85G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.240', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1064, 'ZB000047', '盒装肉松卷200g', 'HZRSJ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.250', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1065, 'ZB000048', '香辣虾球180g（H）', 'XLXQ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '21.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1066, 'ZB000049', '正大经典猪肉丸', 'ZDJDZRW', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '14.000', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1067, 'ZB000050', '清水粽（W）', 'QSZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1068, 'ZB000051', '豆沙粽（W）', 'DSZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1069, 'ZB000052', '金丝蜜枣粽（W）', 'JSMZZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1070, 'ZB000053', '相思红豆粽（W）', 'XSHDZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1071, 'ZB000054', '绿豆粽（W）', 'LDZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1072, 'ZB000055', '养生杂粮粽（W）', 'YSZLZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1073, 'ZB000056', '原味红枣粽（W）', 'YWHZZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1074, 'ZB000057', '极味花生粽（W）', 'JWHSZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1075, 'ZB000058', '香辣虾球散（H）', 'XLXQS（H）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '65.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1076, 'ZB000059', '葡萄干粽（W）', 'PTGZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1077, 'ZB000060', '特制鲜肉粽（W）', 'TZXRZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1078, 'ZB000061', '香菇鸡肉粽（W）', 'XGJRZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1079, 'ZB000062', '腊肉火腿粽（W）', 'LRHTZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1080, 'ZB000063', '鲜香牛肉粽（W）', 'XXNRZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1081, 'ZB000064', '蛋黄粽（W）', 'DHZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1082, 'ZB000065', '通用盒饭标签45*95mm', 'TYHFBQ45*95MM', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1083, 'ZB000066', '通用至尊饭团标签80*90mm', 'TYZZFTBQ80*90MM', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1084, 'ZB000067', '通用圆形饭团标签φ60', 'TYYXFTBQΦ60', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1085, 'ZB000068', '通用三角饭团标签φ55mm', 'TYSJFTBQΦ55MM', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '1.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1086, 'ZB000069', '通用饭卷标签120*36mm', 'TYFJBQ120*36MM', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1087, 'ZB000070', '通用粥系列标签φ100+', 'TYZXLBQΦ100+', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1088, 'ZB000071', '通用汤系列标签φ80mm', 'TYTXLBQΦ80MM', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1089, 'ZB000072', '通用面系列标签45*135', 'TYMXLBQ45*135', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1090, 'ZB000073', '通用寿司标签70*40', 'TYSSBQ70*40', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1091, 'ZB000074', '通用寿司标签50*30', 'TYSSBQ50*30', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1092, 'ZB000075', '通用打印标签', 'TYDYBQ', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1093, 'ZB000076', '通用热收缩膜600mm', 'TYRSSM600MM', NULL, NULL, '294', '1.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1094, 'ZB000077', '通用热收缩膜490mm', 'TYRSSM490MM', NULL, NULL, '294', '1.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1095, 'ZB000078', '通用保鲜膜400mm', 'TYBXM400MM', NULL, NULL, '294', '1.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1096, 'ZB000079', '素粽子（W）', 'SZZ（W）', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1097, 'ZB000080', '通用大口饭团膜卷270mm', 'TYDKFTMJ270MM', NULL, NULL, '294', '1.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1098, 'ZB000081', '通用饭卷膜卷180mm', 'TYFJMJ180MM', NULL, NULL, '294', '1.000', '294', '1.000', '294', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1099, 'ZB000082', '卤鸭锁骨散（H）', 'LYSGS（H）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '28.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1100, 'ZB000083', '卤鸭腿散（H）', 'LYTS（H）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '28.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1101, 'ZB000084', '卤鸭肠散（H）', 'LYCS（H）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '43.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1102, 'ZB000085', '鱿鱼圈', 'YYQ', NULL, NULL, '268', '6.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '15.000', '否', '7', NULL, '17.00', NULL, '1kg*6袋/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1103, 'ZB000086', '包心鱼丸', 'BXYW', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '13.500', '否', '5', NULL, '17.00', NULL, '2.5kg*4袋/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1104, 'ZB000087', '(停)罗森-腊皇煲仔饭40*90mm', '(T)LS-LHBZF40*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.065', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1105, 'ZB000088', '蒜头', 'ST', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1106, 'ZB000089', '有机花菜', 'YJHC', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1107, 'ZB000090', '茼蒿', 'TH', NULL, NULL, '276', '1.000', '277', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.00', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1108, 'ZB000091', '经典豆干(散)', 'JDDG(S)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.400', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1109, 'ZB000092', '八宝粽（W）', 'BBZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1110, 'ZB000093', '香菇粽（W）', 'XGZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1111, 'ZB000094', '咸蛋黄粽（W）', 'XDHZ（W）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '13.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1112, 'ZB000095', '牛肉盖浇饭汁(1.9L)', 'NRGJFZ(1.9L)', NULL, NULL, '270', '2.300', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', '31.304', '否', '15', NULL, '17.00', NULL, '6瓶/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1113, 'ZB000096', '烤鳗酱（1.9L）', 'KMJ（1.9L）', NULL, NULL, '270', '2.300', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '6瓶/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1114, 'ZB000097', '泡菜味炒菜酱(1.9L)', 'PCWCCJ(1.9L)', NULL, NULL, '270', '2.200', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '15.0', NULL, '否', '15', NULL, '17.00', NULL, '6瓶/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1115, 'ZB000098', '卤鸭肠180g（H）', 'LYC180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1116, 'ZB000099', '烹调淡奶油', 'PDDNY', NULL, NULL, '272', '1.000', '299', '1.000', '299', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '30.400', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1117, 'ZB000100', '卤干豆角散（H）', 'LGDJS（H）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '17.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1118, 'ZB000101', '卤花生米散（H）', 'LHSMS（H）', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '17.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1119, 'ZB000102', '卤腐竹180g（H）', 'LFZ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1120, 'ZB000103', '卤海带结180g（H）', 'LHDJ180G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1121, 'ZB000104', '罗森-京酱鸡丝盖浇饭45*95mm', 'LS-JJJSGJF45*95MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1122, 'ZB000105', '包心贡丸', 'BXGW', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '14.500', '否', '5', NULL, '17.00', NULL, '2.5kg*4/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1123, 'ZB000106', '蜂蜜柚子茶（饮料）', 'FMYZC（YL）', NULL, NULL, '281', '1.000', '281', '1.000', '281', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.400', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1124, 'ZB000107', '红茶(饮料)', 'HC(YL)', NULL, NULL, '281', '1.000', '281', '1.000', '281', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1125, 'ZB000108', '墨西哥提子餐包100g', 'MXGTZCB100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.940', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1126, 'ZB000109', '摩奇QQ120g', 'MQQQ120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1127, 'ZB000110', '地菜花', 'DCH', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.800', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1128, 'ZB000111', '香薰鸡肉三明治145g', 'XXJRSMZ145G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.030', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1129, 'ZB000112', '培根时蔬三明治', 'PGSSSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.800', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1130, 'ZB000113', '经典全麦三明治', 'JDQMSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.420', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1131, 'ZB000114', '照烧鸡块三明治', 'ZSJKSMZ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.060', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1132, 'ZB000115', '牛奶焦糖大理石100g', 'NNJTDLS100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1133, 'ZB000116', '蓝莓果酱面包110g', 'LMGJMB110G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.030', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1134, 'ZB000117', '芝麻手指饼90g', 'ZMSZB90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.450', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1135, 'ZB000118', '欧式核桃面包140g', 'OSHTMB140G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1136, 'ZB000119', '法式健康葡萄70g', 'FSJKPT70G', NULL, NULL, '283', '1.000', '283', NULL, '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.930', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1137, 'ZB000120', '(停)罗森-台湾嘉义鸡肉饭35*75mm', '(T)LS-TWJYJRF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1138, 'ZB000121', '罗森-咖喱鸡块蛋包饭35*75mm', 'LS-KLJKDBF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1139, 'ZB000122', '(停)罗森-大话西鱿饭35*75mm', '(T)LS-DHXYF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1140, 'ZB000123', '(停)罗森-西式浓汁鱼排饭35*75mm', '(T)LS-XSNZYPF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1141, 'ZB000124', '鸡茸玉米汤调味料', 'JRYMTDWL', NULL, NULL, '269', '20.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '8.0', '35.000', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1142, 'ZB000125', '奶油蘑菇汤调味料', 'NYMGTDWL', NULL, NULL, '269', '20.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '8.0', '33.000', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1143, 'ZB000126', '麻婆豆腐调味料', 'MPDFDWL', NULL, NULL, '269', '20.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '8.0', '35.000', '否', '8', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1144, 'ZB000127', '研发产品', 'YFCP', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1145, 'ZB000128', '(停)罗森-蚝油双菇炒面45*135mm', '(T)LS-HYSGCM45*135MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.065', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1146, 'ZB000129', '乐享肉排', 'LXRP', NULL, NULL, '268', '150.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.167', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1147, 'ZB000130', '芝麻土司', 'ZMTS', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.860', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1148, 'ZB000131', '甜甜圈（黑巧克力）80g', 'TTQ（HQKL）80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1149, 'ZB000132', '椰香面包', 'YXMB', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1150, 'ZB000133', '罗森-鸡茸玉米浓汤φ108mm', 'LS-JRYMNTΦ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1151, 'ZB000134', '罗森-奶油蘑菇浓汤φ108mm', 'LS-NYMGNTΦ108MM', NULL, NULL, '268', '5000.000', '268', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1152, 'ZB000135', '港式菠萝包80g', 'GSBLB80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1153, 'ZB000136', '酱料杯 P4', 'JLB P4', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.170', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1154, 'ZB000137', '酱牛肉', 'JNR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '51.000', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1155, 'ZB000138', '卤火鸡腿', 'LHJT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '32.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1156, 'ZB000139', '盐水鸭', 'YSY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '32.000', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1157, 'ZB000140', '菊圆碗1770身', 'JYW1770S', NULL, NULL, '268', '450.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.666', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1158, 'ZB000141', '菊圆碗1770盖', 'JYW1770G', NULL, NULL, '268', '900.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.467', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1159, 'ZB000142', '雪花脆辣堡', 'XHCLB', NULL, NULL, '268', '120.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.250', '否', '0', NULL, '17.00', NULL, '80g*120片/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1160, 'ZB000143', '霸王鸡条（孜然味）', 'BWJT（ZRW）', NULL, NULL, '268', '9.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '18.900', '否', '7', NULL, '17.00', NULL, '900g*10包/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1161, 'ZB000144', '脆香绿豆酥', 'CXLDS', NULL, NULL, '268', '9.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '18.667', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1162, 'ZB000145', '精灵薯饼', 'JLSB', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '14.490', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1163, 'ZB000146', '玉米如意棒', 'YMRYB', NULL, NULL, '268', '8.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '16.275', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1164, 'ZB000147', '鸡肉洋葱圈', 'JRYCQ', NULL, NULL, '268', '8.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '14.838', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1165, 'ZB000148', '玉米布丁酥', 'YMBDS', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '16.280', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1166, 'ZB000149', '速冻面条250g', 'SDMT250G', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '13.356', '否', '7', NULL, '17.00', NULL, '250g*20块/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1167, 'ZB000150', '速冻面条200g', 'SDMT200G', NULL, NULL, '268', '4.800', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '13.388', '否', '7', NULL, '17.00', NULL, '200g*24块/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1168, 'ZB000151', '中百口味卤鸭脖100g（H）', 'ZBKWLYB100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1169, 'ZB000152', '中百口味卤鸭翅100g（H）', 'ZBKWLYC100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.700', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1170, 'ZB000153', '中百口味卤鸭锁骨100g（H）', 'ZBKWLYSG100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1171, 'ZB000154', '中百口味卤鸭掌100g（H）', 'ZBKWLYZ100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1172, 'ZB000155', '中百口味卤鸭肠100g（H）', 'ZBKWLYC100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.900', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1173, 'ZB000156', '中百口味卤凤尖100g（H）', 'ZBKWLFJ100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1174, 'ZB000157', '中百口味卤藕100g（H）', 'ZBKWLO100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.100', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1175, 'ZB000158', '中百口味牛皮干100g（H）', 'ZBKWNPG100G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.300', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1176, 'ZB000159', '(停)罗森-亲子盖浇饭35*75mm', '(T)LS-QZGJF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1177, 'ZB000160', '罗森-玉子豆腐海鲜饭35*75mm', 'LS-YZDFHXF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1178, 'ZB000161', '卤鸭腿个（H)', 'LYTG（H)', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1179, 'ZB000162', '全型海苔1*44*100', 'QXHT1*44*100', NULL, NULL, '268', '44.000', '274', '100.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '15.0', '94.500', '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1180, 'ZB000163', '半切海苔1*44*200', 'BQHT1*44*200', 62, NULL, '61', '44.000', '64', '200.000', '60', '1.000', '1.000', 26, 21, '0.0', '', '4268', '0', '15', '16', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1181, 'ZB000164', '福嘉白素鸡200g', 'FJBSJ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1182, 'ZB000165', '福嘉素火腿200g', 'FJSHT200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1183, 'ZB000166', '福嘉厚千张220g', 'FJHQZ220G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.380', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1184, 'ZB000167', '福嘉龙井茶干200g', 'FJLJCG200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1185, 'ZB000168', '福嘉五香干子200g', 'FJWXGZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1186, 'ZB000169', '福嘉五香豆糕200g', 'FJWXDG200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1187, 'ZB000170', '福嘉薄干子200g', 'FJBGZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.620', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1188, 'ZB000171', '福嘉酱干子200g', 'FJJGZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1189, 'ZB000172', '福嘉油干子200g', 'FJYGZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1190, 'ZB000173', '福嘉海绵干200g', 'FJHMG200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.620', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1191, 'ZB000174', '福嘉冻豆腐380g', 'FJDDF380G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.360', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1192, 'ZB000175', '福嘉卤水豆腐450g', 'FJLSDF450G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.620', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1193, 'ZB000176', '福嘉老豆腐350g', 'FJLDF350G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1194, 'ZB000177', '福嘉红烧豆腐380g', 'FJHSDF380G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.930', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1195, 'ZB000178', '福嘉烤麸280g', 'FJKF280G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.950', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1196, 'ZB000179', '福嘉鲜汁干200g', 'FJXZG200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.350', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1197, 'ZB000180', '福嘉五香素鸡片200g', 'FJWXSJP200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.750', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1198, 'ZB000181', '福嘉御豆卷220g', 'FJYDJ220G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.750', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1199, 'ZB000182', '卤面筋200g', 'LMJ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.930', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1200, 'ZB000183', '福嘉白干子200g', 'FJBGZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1201, 'ZB000184', '酱猪皮', 'JZP', NULL, NULL, '268', '10.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '21.800', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1202, 'ZB000185', '香辣牛腩', 'XLNN', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '74.000', '是', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1203, 'ZB000186', '单格餐盒身(橙色)KLCX-32', 'DGCHS(CS)KLCX-32', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.350', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1204, 'ZB000187', '单格餐盒 盖KLCX-32', 'DGCH GKLCX-32', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.180', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1205, 'ZB000188', 'POF热缩对折膜330mm*12um*1500m', 'POFRSDZM330MM*12UM*1500M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', NULL, '否', '7', NULL, '17.00', NULL, '10.69kg/卷', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1206, 'ZB000189', 'POF热缩对折膜380mm*12um*1500m', 'POFRSDZM380MM*12UM*1500M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '314.000', '否', '7', NULL, '17.00', NULL, '12.31kg/卷', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1207, 'ZB000190', '绿豆糕（莲蓉味）260g', 'LDG（LRW）260G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.060', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1208, 'ZB000191', '芝麻糕（黑芝麻糕+白芝麻糕）220g', 'ZMG（HZMG+BZMG）220G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.760', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1209, 'ZB000192', '迷你瑞士卷85g', 'MNRSJ85G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1210, 'ZB000193', '绿豆糕（豆沙味）100g', 'LDG（DSW）100G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.550', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1211, 'ZB000194', '绿豆糕（莲蓉味）100g', 'LDG（LRW）100G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.550', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1212, 'ZB000195', '绿豆糕（豆沙味）+白芝麻糕240g', 'LDG（DSW）+BZMG240G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.760', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1213, 'ZB000196', '薄皮餐包（白豆沙味）', 'BPCB（BDSW）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1214, 'ZB000197', '绿豆糕（豆沙味）260g', 'LDG（DSW）260G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.060', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1215, 'ZB000198', '紫薯条面包200g', 'ZSTMB200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.130', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1216, 'ZB000199', '薄皮餐包（豆沙味）', 'BPCB（DSW）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1217, 'ZB000200', '薄皮餐包（卡仕达味）', 'BPCB（KSDW）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1218, 'ZB000201', '冬笋丝', 'DSS', NULL, NULL, '283', '1.250', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.320', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1219, 'ZB000202', '(停)罗森-桂花绿豆汤(无胶)φ108mm', '(T)LS-GHLDT(WJ)Φ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.090', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1220, 'ZB000203', '罗森-香菇滑鸡粥(无胶)φ108mm', 'LS-XGHJZ(WJ)Φ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1221, 'ZB000204', '罗森-柴鱼花海苔粥(无胶)φ108mm', 'LS-CYHHTZ(WJ)Φ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1222, 'ZB000205', 'G桂花糖', 'GGHT', NULL, NULL, '268', '7.500', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '11.067', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1223, 'ZB000206', 'G橄榄菜', 'GGLC', NULL, NULL, '270', '0.170', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '21.176', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1224, 'ZB000207', '天然酵母面包', 'TRJMMB', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.800', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1225, 'ZB000208', '真空袋8*12cm', 'ZKD8*12CM', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.040', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1226, 'ZB000209', '园碗450ml乳白', 'YW450MLRB', NULL, NULL, '268', '450.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.344', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1227, 'ZB000210', 'W菠萝面包60g', 'WBLMB60G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1228, 'ZB000211', '豆乳蛋糕120g', 'DRDG120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1229, 'ZB000212', '烟熏培根鸡蛋三明治120g', 'YXPGJDSMZ120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.190', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1230, 'ZB000213', '日式豆乳蛋糕80g', 'RSDRDG80G', NULL, NULL, '283', '1.000', '283', NULL, '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.810', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1231, 'ZB000214', '冰皮月亮蛋糕（蛋黄肉松）95g', 'BPYLDG（DHRS）95G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.080', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1232, 'ZB000215', '荞麦馒头3个装210g', 'QMMT3GZ210G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.330', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1233, 'ZB000216', '米发糕4个装240g', 'MFG4GZ240G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.380', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1234, 'ZB000217', '奶黄包3个装240g', 'NHB3GZ240G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1235, 'ZB000218', '鲜肉包2个装180g', 'XRB2GZ180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.600', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1236, 'ZB000219', '葱香花卷2个装180g', 'CXHJ2GZ180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.330', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1237, 'ZB000220', '红虾', 'HX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '52.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1238, 'ZB000221', 'POF热缩对折膜350mm*12um*1500m', 'POFRSDZM350MM*12UM*1500M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '20.0', '289.000', '否', NULL, NULL, '17.00', NULL, '11.34kg*1', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1239, 'ZB000222', '肉松面包70g', 'RSMB70G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.840', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1240, 'ZB000223', '虎皮蛋糕卷60g', 'HPDGJ60G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1241, 'ZB000224', '椰蓉面包50g', 'YRMB50G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1242, 'ZB000225', '玛芬蛋糕80g', 'MFDG80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.360', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1243, 'ZB000226', '丹麦飞碟面包120g', 'DMFDMB120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.840', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1244, 'ZB000227', '北海道牛奶吐司2片', 'BHDNNTS2P', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.550', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1245, 'ZB000228', '肉松小贝蛋糕120g', 'RSXBDG120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.270', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1246, 'ZB000229', '牛乳蛋糕70g', 'NRDG70G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1247, 'ZB000230', '全麦火腿鸡蛋三明治115g', 'QMHTJDSMZ115G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.410', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1248, 'ZB000231', '白虾', 'BX', NULL, NULL, '268', '17.000', '276', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '60.882', '否', '0', NULL, '11.00', NULL, '1.7kg*1*10/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1249, 'ZB000232', '牛奶手撕包95g', 'NNSSB95G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1250, 'ZB000233', '福嘉白干子（散）', 'FJBGZ（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1251, 'ZB000234', '提子', 'TZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '17.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1252, 'ZB000235', '牛奶餐包65g', 'NNCB65G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.750', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1253, 'ZB000236', '罗森-日式肥牛饭35*75mm', 'LS-RSFNF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1254, 'ZB000237', '酸辣萝卜条', 'SLLBT', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1255, 'ZB000238', '八宝雪菜', 'BBXC', NULL, NULL, '268', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1256, 'ZB000239', '(停)罗森-紫薯寿司42*49mm', '(T)LS-ZSSS42*49MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.030', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1257, 'ZB000240', '草莓羊角面包90g', 'CMYJMB90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1258, 'ZB000241', '虎皮蛋糕卷4个装100g', 'HPDGJ4GZ100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.700', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1259, 'ZB000242', '超醇汤种吐司180g', 'CCTZTS180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.570', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1260, 'ZB000243', '椰香牛奶面包', 'YXNNMB', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1261, 'ZB000244', '芝麻吐司', 'ZMTS', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.860', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1262, 'ZB000245', '蛋心圆120g', 'DXY120G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.550', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1263, 'ZB000246', '牛乳卷65g', 'NRJ65G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1264, 'ZB000247', '热狗餐包130g', 'RGCB130G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.840', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1265, 'ZB000248', '巧克力奶油夹心面包95g', 'QKLNYJXMB95G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1266, 'ZB000249', '丹麦肉松100g', 'DMRS100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1267, 'ZB000250', '香肠面包100g', 'XCMB100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.840', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1268, 'ZB000251', '奶油豆沙夹心面包95g', 'NYDSJXMB95G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1269, 'ZB000252', '丹麦巧克力90g', 'DMQKL90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1270, 'ZB000253', '鸡蛋牛奶排包105g', 'JDNNPB105G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.580', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1271, 'ZB000254', '巧克力软欧面包165g', 'QKLROMB165G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1272, 'ZB000255', '芸豆吐司', 'YDTS', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.490', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1273, 'ZB000256', '黄金椰子面包', 'HJYZMB', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1274, 'ZB000257', '丹麦手风琴（咸）', 'DMSFQ（X）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '36.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1275, 'ZB000258', '丹麦手风琴（甜）', 'DMSFQ（T）', NULL, NULL, '283', '1.000', '283', '1.000', '282', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '36.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1276, 'ZB000259', '咸蛋(熟)', 'XD(S)', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1277, 'ZB000260', '农夫山泉550ml', 'NFSQ550ML', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.300', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1278, 'ZB000261', '惠氏乳酸菌100ml', 'HSRSJ100ML', NULL, NULL, '270', '1.000', '270', '1.000', '270', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1279, 'ZB000262', '畅优酸奶200g', 'CYSN200G', NULL, NULL, '281', '1.000', '281', '1.000', '281', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1280, 'ZB000263', '牛奶手撕包140g', 'NNSSB140G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1281, 'ZB000264', '肉松排包180g', 'RSPB180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1282, 'ZB000265', '咸麻花', 'XMH', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '3.360', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1283, 'ZB000266', '卤鸭腿235g（H）', 'LYT235G（H）', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1284, 'ZB000267', '洪湖鸳鸯蛋(8咸蛋8皮蛋)手提袋', 'HHYYD(8XD8PD)STD', NULL, NULL, '286', '1.000', '286', '1.000', '286', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '20.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1285, 'ZB000268', '洪湖鸳鸯蛋(10咸蛋10皮蛋)礼盒', 'HHYYD(10XD10PD)LH', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '31.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1286, 'ZB000269', '端午礼盒(12粽子2绿豆糕)', 'DWLH(12ZZ2LDG)', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '68.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1287, 'ZB000270', '咸蛋(生)', 'XD(S)', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.780', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1288, 'ZB000271', '绿豆糕(红豆沙味)230g', 'LDG(HDSW)230G', NULL, NULL, '272', '1.000', '272', '1.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1289, 'ZB000272', '特浓牛奶餐包230g', 'TNNNCB230G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.550', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1290, 'ZB000273', '雪条面包100g', 'XTMB100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1291, 'ZB000274', '油炸脆花(天妇罗炸花)', 'YZCH(TFLZH)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1292, 'ZB000275', '吉士排包180g', 'JSPB180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.060', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1293, 'ZB000276', '格格蛋糕110g', 'GGDG110G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.230', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1294, 'ZB000277', '紫米双皮奶 ', 'ZMSPN ', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1295, 'ZB000278', '蓝莓芝士蛋糕', 'LMZSDG', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1296, 'ZB000279', '双皮奶（血糯米）150g', 'SPN（XNM）150G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1297, 'ZB000280', '乳牛瑞士卷65g', 'RNRSJ65G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1298, 'ZB000281', '拿破仑酥皮蛋糕100g', 'NPLSPDG100G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1299, 'ZB000282', '经典冰芝士蛋糕65g', 'JDBZSDG65G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1300, 'ZB000283', '提拉米苏75g', 'TLMS75G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1301, 'ZB000284', '闪电泡芙90g', 'SDPF90G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1302, 'ZB000286', '纯生奶油芝士双馅蛋糕60g', 'CSNYZSSXDG60G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1303, 'ZB000287', '红丝绒奶油卷85g', 'HSRNYJ85G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1304, 'ZB000288', '草莓慕斯80g', 'CMMS80G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1305, 'ZB000289', '猪板油', 'ZBY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1306, 'ZB000290', '罗森-台湾大口饭团60*60mm', 'LS-TWDKFT60*60MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1307, 'ZB000291', '桂圆肉', 'GYR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '70.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1308, 'ZB000292', '热干面（生）', 'RGM（S）', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.400', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1309, 'ZB000293', '生凉面', 'SLM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.400', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1310, 'ZB000294', '鸡肉丝(冻)', 'JRS(D)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '25.500', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1311, 'ZB000295', '正大-新奥尔良鸡腿包 ', 'ZD-XAELJTB ', NULL, NULL, '268', '72.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85g*6个*12袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1312, 'ZB000296', '正大-猪肉圆白菜包', 'ZD-ZRYBCB', NULL, NULL, '268', '72.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85g*6个*12袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1313, 'ZB000297', '正大-香菇肉包', 'ZD-XGRB', NULL, NULL, '268', '48.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85g*6个*8袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1314, 'ZB000298', '正大-红糖芝麻包 ', 'ZD-HTZMB ', NULL, NULL, '268', '48.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85g*6个*8袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1315, 'ZB000299', '正大-猪肉大葱包（简装）', 'ZD-ZRDCB（JZ）', NULL, NULL, '268', '72.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85克*6个*12袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1316, 'ZB000300', '正大-香菇青菜包 ', 'ZD-XGQCB ', NULL, NULL, '268', '72.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85g*6个*12袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1317, 'ZB000301', '正大-豆沙包', 'ZD-DSB', NULL, NULL, '268', '72.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '85g*6个*12袋', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1318, 'ZB000302', '透明 KF-1818身', 'TM KF-1818S', NULL, NULL, '268', '1200.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.336', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1319, 'ZB000303', '透明 KF-1818盖', 'TM KF-1818G', NULL, NULL, '268', '600.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.141', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1320, 'ZB000304', '罗森-台式鸡丝凉面75*150mm', 'LS-TSJSLM75*150MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.120', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1321, 'ZB000305', '罗森-台式麻酱凉面75*150mm', 'LS-TSMJLM75*150MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.120', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1322, 'ZB000306', '醇熟白吐司290g', 'CSBTS290G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1323, 'ZB000309', '透明 KF-1818内衬', 'TM KF-1818NC', NULL, NULL, '268', '2400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.128', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1324, 'ZB000310', '高纤维低糖吐司180g', 'GXWDTTS180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.420', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1325, 'ZB000311', '多谷物吐司180g', 'DGWTS180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.420', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1326, 'ZB000312', '红豆吐司385g', 'HDTS385G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.250', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1327, 'ZB000313', '超大鲜奶吐司720g', 'CDXNTS720G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1328, 'ZB000314', '起酥条150g', 'QST150G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.400', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1329, 'ZB000315', '玉米馒头3个装210g', 'YMMT3GZ210G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.330', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1330, 'ZB000316', 'W散装麦香馒头50g', 'WSZMXMT50G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.350', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1331, 'ZB000317', 'w散装荞麦馒头60g', 'WSZQMMT60G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.400', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1332, 'ZB000318', 'w散装玉米馒头60g', 'WSZYMMT60G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.400', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1333, 'ZB000319', '散装玉米馒头', 'SZYMMT', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.400', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1334, 'ZB000320', '散装鲜肉包90g', 'SZXRB90G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.280', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1335, 'ZB000321', '散装豆沙包', 'SZDSB', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.710', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1336, 'ZB000322', '散装奶黄包', 'SZNHB', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.710', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1337, 'ZB000323', '四格餐盒 身(橙)225*195*35', 'SGCH S(C)225*195*35', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.300', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1338, 'ZB000324', '(停用)四格餐盒 盖(透明)225*195', '(TY)SGCH G(TM)225*195', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.130', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1339, 'ZB000325', '2照烧汁', '2ZSZ', NULL, NULL, '270', '1.800', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '10.0', '10.0', NULL, '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1340, 'ZB000326', '荔枝', 'LZ', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '16.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1341, 'ZB000327', '鱼头', 'YT', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '18.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1342, 'ZB000328', '罗森-双花寿司50*30mm', 'LS-SHSS50*30MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.020', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1343, 'ZB000329', '四格餐盒 加厚盖(透明)225*195', 'SGCH JHG(TM)225*195', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.200', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1344, 'ZB000330', '卤香菇180g(H)', 'LXG180G(H)', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1345, 'ZB000331', '冬笋片', 'DSP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.600', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1346, 'ZB000332', '大绿叶片14.5cm', 'DLYP14.5CM', NULL, NULL, '268', '25.000', '274', '1000.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '34.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1347, 'ZB000333', '罗森-泡椒鸭脯盖浇饭35*75mm', 'LS-PJYFGJF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1348, 'ZB000334', '海苔碎', 'HTS', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', '0', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1349, 'ZB000335', '罗森-藤椒鸡排大口饭团80*90mm', 'LS-TJJPDKFT80*90MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.050', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1350, 'ZB000336', '李子', 'LZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1351, 'ZB000337', '黑鱼', 'HY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1352, 'ZB000338', '藤椒腌料', 'TJYL', NULL, NULL, '268', '20.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '41.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1353, 'ZB000339', '香米', 'XM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.900', '是', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1354, 'ZB000340', '外购蓑衣干子', 'WGSYGZ', NULL, NULL, '274', '1.000', '274', '1.000', '274', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.400', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1355, 'ZB000341', '燕麦片', 'YMP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1356, 'ZB000342', '薏仁米', 'YRM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.600', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1357, 'ZB000343', '宽汤面', 'KTM', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.000', '是', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1358, 'ZB000344', '冷面盒UW-Y800体', 'LMHUW-Y800T', NULL, NULL, '268', '750.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.370', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1359, 'ZB000345', '冷面盒UW-Y800内托', 'LMHUW-Y800NT', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', NULL, '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1360, 'ZB000346', '冷面盒UW-Y800盖', 'LMHUW-Y800G', NULL, NULL, '268', '1500.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '10.0', '0.230', '否', '10', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1361, 'ZB000347', '散装老面馒头', 'SZLMMT', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.590', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1362, 'ZB000348', '散装北方馒头', 'SZBFMT', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.670', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1363, 'ZB000349', '散装南方馒头', 'SZNFMT', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.670', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1364, 'ZB000350', '鳕鱼排', 'XYP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '18.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1365, 'ZB000351', '叉烧碎肉', 'CSSR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '27.000', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1366, 'ZB000352', '孜然肉串40g', 'ZRRC40G', NULL, NULL, '268', '200.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1367, 'ZB000353', '罗森-鱼香鸡丝双拼饭35*75mm', 'LS-YXJSSPF35*75MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.060', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1368, 'ZB000354', '一次性二号纸碗', 'YCXEHZW', NULL, NULL, '268', '450.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.125', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1369, 'ZB000355', '香菇蔬菜包180g', 'XGSCB180G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '2.280', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1370, 'ZB000356', '调整领料', 'DZLL', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '1.000', '是', '0', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1371, 'ZB000357', '罗森-香酥肉松饭团φ55mm', 'LS-XSRSFTΦ55MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.032', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1372, 'ZB000358', '餐盒UH-F24G3身', 'CHUH-F24G3S', NULL, NULL, '268', '800.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.530', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1373, 'ZB000359', '餐盒UH-F24G3盖', 'CHUH-F24G3G', NULL, NULL, '268', '400.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.420', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1374, 'ZB000360', '奶香馒头20g称重', 'NXMT20GCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.410', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1375, 'ZB000361', '藤椒鸡腿排', 'TJJTP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '24.600', '否', '0', NULL, '11.00', NULL, '100g*10片*10袋/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1376, 'ZB000362', '脆皮猪排(黑椒)', 'CPZP(HJ)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '33.500', '是', '0', NULL, '11.00', NULL, '17片1kg*10袋/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1377, 'ZB000363', '玉米馒头20g称重', 'YMMT20GCZ', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.410', '否', '0', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1378, 'ZB000364', '流通版塑料杯90mm*500ml高透', 'LTBSLB90MM*500MLGT', NULL, NULL, '268', '1000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '5.0', '0.185', '否', '5', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1379, 'ZB000365', '公交餐盒 盖(蓝)', 'GJCH G(L)', 62, NULL, '61', '600.000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '0.0', '144', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1380, 'ZB000366', '公交餐盒 内托', 'GJCH NT', 62, NULL, '61', '600.000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '0.0', '126', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1381, 'ZB000367', '公交餐盒 身(乳白)', 'GJCH S(RB)', 62, NULL, '61', '600.000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '0.0', '270', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1382, 'ZB000368', '罗森-培根芝士焗饭40*140mm', 'LS-PGZSJF40*140MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '7.0', '0.095', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1383, 'ZB000369', '油桃', 'YT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '10.000', '否', '0', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1384, 'ZB000370', '鸭蛋P', 'YDP', NULL, NULL, '273', '1.000', '277', '60.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.700', '否', '7', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1385, 'ZB000371', '藕带', 'OD', NULL, NULL, '276', '1.000', '277', '1000.000', '275', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '14.000', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1386, 'ZB000372', '黄豆酱', 'HDJ', NULL, NULL, '269', '6.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.583', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1387, 'ZB000373', '福嘉家常豆腐(散)', 'FJJCDF(S)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.000', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1388, 'ZB000374', '细卷寿司膜(蓝白)30*330*180', 'XJSSM(LB)30*330*180', NULL, NULL, '268', '8000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.175', '否', '20', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1389, 'ZB000375', '罗森-黑椒猪排意面50*120mm', 'LS-HJZPYM50*120MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1390, 'ZB000376', '罗森-鱼香肉丝拌面50*120mm', 'LS-YXRSBM50*120MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1391, 'ZB000377', '罗森-藤椒鸡排饭40*135mm', 'LS-TJJPF40*135MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1392, 'ZB000378', '红油', 'HY', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '0.010', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1393, 'ZB000379', '空白膜卷(酱料包)162mm*8s', 'KBMJ(JLB)162MM*8S', NULL, NULL, '276', '1.000', '276', '1.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '28.000', '否', '12', NULL, '17.00', NULL, '200kg起订', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1394, 'ZB000380', 'T-孜香牛肉三拼饭', 'T-ZXNRSPF', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.150', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1395, 'ZB000381', '沙茶酱', 'SCJ', NULL, NULL, '270', '228.000', '277', '1.000', '277', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.018', '是', NULL, NULL, '17.00', NULL, '12瓶/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1396, 'ZB000382', '琵琶腿125g', 'PPT125G', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.650', NULL, NULL, '10.0', '10.0', NULL, '是', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1397, 'ZB000383', '琵琶腿100g', 'PPT100G', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.900', '0.650', NULL, NULL, '10.0', '10.0', '13.500', '是', '15', NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1398, 'ZB000384', '娃娃菜0.7kg/包', 'WWC0.7KG/B', NULL, NULL, '271', '0.700', '277', '1000.000', '276', '0.900', '0.800', NULL, NULL, '0.0', '0.0', '6.857', '是', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1399, 'ZB000385', '(自制)火锅底料(干料)', '(ZZ)HGDL(GL)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1400, 'ZB000386', '(自制)火锅底料(红油)', '(ZZ)HGDL(HY)', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1401, 'ZB000387', '散装紫薯馒头', 'SZZSMT', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.800', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1402, 'ZB000388', '罗森-红豆燕麦粥(无胶)φ108mm', 'LS-HDYMZ(WJ)Φ108MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.090', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1403, 'ZB000389', '罗森-沙茶鸡丁手卷34*85mm', 'LS-SCJDSJ34*85MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.040', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1404, 'ZB000390', '空白打印标签50*60mm', 'KBDYBQ50*60MM', NULL, NULL, '285', '2000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.026', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1405, 'ZB000391', '自制鲜肉丸子', 'ZZXRWZ', NULL, NULL, '276', '1.000', NULL, NULL, '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1406, 'ZB000392', 'POF热缩对折膜360mm*12um*1500m', 'POFRSDZM360MM*12UM*1500M', NULL, NULL, '285', '1.000', '285', '1.000', '285', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '297.000', '否', '7', NULL, '17.00', NULL, '11.66kg/卷', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1407, 'ZB000393', '熟红豆', 'SHD', NULL, NULL, '283', '5.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '16.000', '否', NULL, NULL, '17.00', NULL, '5kg/袋*2/件', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1408, 'ZB000394', 'T-腐竹烧肉三拼饭', 'T-FZSRSPF', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.150', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1409, 'ZB000395', '罗森-泰式咖喱什锦炒饭50*120mm', 'LS-TSKLSJCF50*120MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.070', '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1410, 'ZB000396', '红咖喱', 'HKL', NULL, NULL, '270', '1.000', NULL, '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '35.000', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1411, 'ZB000397', '鸭血', 'YX', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '0.920', '1.000', NULL, NULL, '0.0', '0.0', '6.000', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1412, 'ZB000398', '佳享精烧白肉', 'JXJSBR', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '19.000', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1413, 'ZB000399', '罗森奥利奥盒子', 'LSALAHZ', NULL, NULL, '273', '1.000', NULL, '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.060', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1414, 'ZB000400', '(停用)奥尔良鸡扒三明治', '(TY)AELJBSMZ', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1415, 'ZB000401', '奥尔良鸡扒三明治150g', 'AELJBSMZ150G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.190', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1416, 'ZB000013', '火腿乳酪三明治120g', 'HTRLSMZ120G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.210', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1417, 'ZB000403', '丹麦双酱三明治110g', 'DMSJSMZ110G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.370', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1418, 'ZB000404', '草莓三明治140g', 'CMSMZ140G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.270', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1419, 'ZB000405', '巨无霸三明治120g', 'JWBSMZ120G', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.700', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1420, 'ZB000406', '(停用)三花淡奶', '(TY)SHDN', NULL, NULL, '284', '1.000', '277', '410.000', '284', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1421, 'ZB000407', '椰浆', 'YJ', NULL, NULL, '272', '1.000', '277', '1000.000', '272', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1422, 'ZB000408', '李锦记生抽', 'LJJSC', NULL, NULL, '270', '1.900', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '6.579', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1423, 'ZB000409', '李锦记老抽', 'LJJLC', NULL, NULL, '270', '1.900', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '8.332', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1424, 'ZB000410', '双色蛋糕卷（4个）85g', 'SSDGJ（4G）85G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.410', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1425, 'ZB000411', '罗森—鸡丝泡饭（无胶）φ115', 'LS—JSPF（WJ）Φ115', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '0.090', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1426, 'ZB000412', '鱼豆腐', 'YDF', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1427, 'ZB000413', '三花植脂淡奶(雀巢)', 'SHZZDN(QC)', NULL, NULL, '284', '0.410', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '15.854', '是', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1428, 'ZB000414', '土豆 J', 'TD J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.800', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1429, 'ZB000415', '花菜 J', 'HC J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1430, 'ZB000416', '洋葱 J', 'YC J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.400', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1431, 'ZB000417', '红萝卜 J', 'HLB J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.600', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1432, 'ZB000418', '莲藕 J', 'LO J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.300', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1433, 'ZB000419', '四季豆 J', 'SJD J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '12.000', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1434, 'ZB000420', '紫茄子 J', 'ZQZ J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '9.700', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1435, 'ZB000421', '瓠子 J', 'HZ J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1436, 'ZB000422', '豆泡', 'DP', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '2.400', NULL, NULL, '0.0', '0.0', '15.000', '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1437, 'ZB000423', '炭烧鸡肉串', 'TSJRC', NULL, NULL, '291', '1.000', '291', '1.000', '291', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1438, 'ZB000424', '黑椒鸭肉柳', 'HJYRL', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '15', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1439, 'ZB000425', '南瓜 J', 'NG J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '4.200', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1440, 'ZB000426', '青豆角 J', 'QDJ J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '7.000', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1441, 'ZB000427', '包菜 J', 'BC J', NULL, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', '5.100', '否', NULL, NULL, '11.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1442, 'ZB000428', '自制卤水', 'ZZLS', NULL, NULL, '276', '1.000', NULL, NULL, '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1443, 'ZB000429', '魔芋', 'MY', NULL, NULL, '276', '1.000', NULL, NULL, '276', '0.900', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1444, 'ZB000430', '带皮玉米棒', 'DPYMB', NULL, NULL, '276', '1.000', NULL, NULL, '276', '0.780', '1.000', NULL, NULL, '0.0', '0.0', NULL, '是', NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1445, 'ZB000431', '葱香花卷35g散装', 'CXHJ35GSZ', NULL, NULL, '273', '1.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1446, 'ZB000432', '北方馒头2个装200g', 'BFMT2GZ200G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1447, 'ZB000433', '老面馒头3个装210g', 'LMMT3GZ210G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1448, 'ZB000434', '原味铁锅馒头150g', 'YWTGMT150G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1449, 'ZB000435', '荞麦铁锅馒头150g', 'QMTGMT150G', NULL, NULL, '283', '1.000', '283', '1.000', '283', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1450, 'ZB000436', '罗森-泰式咖喱拌面45*110mm', 'LS-TSKLBM45*110MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1451, 'ZB000437', '罗森-日式叉烧双拼饭40*135mm', 'LS-RSCSSPF40*135MM', NULL, NULL, '268', '5000.000', '273', '1.000', '273', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', '7', NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1452, 'ZB000438', '圆碗FL-700身(黑)', 'YWFL-700S(H)', 62, NULL, '61', '600.000', '65', '1.000', '65', '1.000', '1.000', 26, 67, '0.0', '0.0', '207', '0', '7', '66', '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1453, 'ZB000439', '福嘉手工千张（散）', 'FJSGQZ（S）', 54, NULL, '276', '1.000', '277', '1000.000', '276', '1.000', '1.000', NULL, NULL, '0.0', '0.0', NULL, '否', NULL, NULL, '17.00', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1454, 'A0701454', '白萝卜测试', 'BLBCS', 100, 17, '46', '1', '46', '1000', '47', '0.9', '0.95', 28, 20, NULL, NULL, '6.9', '0', NULL, '101', '11', NULL, NULL, NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-18 14:03:44', NULL);
INSERT INTO `mtr_data` VALUES (1455, 'A010301455', '老抽测试', 'LCCS', 8, NULL, '108', '1.9', '46', '1000', '47', '1', '1', 24, 58, '10', '5', '8.55', '0', '7', '15', '17', NULL, '常温保存', NULL, NULL, '1', '1.9kg/壶', '海天', NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1456, 'A010301456', '香油', 'XY', 8, NULL, '53', '1.5', '46', '1000', '47', '1', '1', 29, 58, NULL, NULL, '85', '0', NULL, '59', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1457, 'A01457', '水测试', 'SCS', 4, NULL, '53', '1', '46', '1000', '47', '1', '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1458, 'A0701458', '红萝卜', 'HLB', 100, NULL, '46', '1', '46', '1000', '47', '1', '1', 28, 20, NULL, NULL, '4.00', '0', NULL, '101', '17', NULL, NULL, NULL, NULL, '1', NULL, NULL, 'admin', '2017-12-21 11:27:39', NULL);
INSERT INTO `mtr_data` VALUES (1459, 'A010301459', '测试', 'CS', 8, NULL, '46', '1', '46', '1000', '47', '1', '1', 28, 58, NULL, NULL, NULL, '0', NULL, '15', NULL, NULL, NULL, 'admin', '2017-12-17 10:38:19', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mtr_data` VALUES (1460, 'A0501460', '测试咖喱饭2215身', 'CSKLF2215S', 62, NULL, '61', '1', '61', '900', '65', '1', '1', 26, 67, '0.5', NULL, '378.00', '0', NULL, '66', '17', NULL, NULL, 'admin', '2017-12-19 10:36:59', '1', NULL, NULL, 'admin', '2018-01-22 23:35:31', '100010');

-- ----------------------------
-- Table structure for prd_data
-- ----------------------------
DROP TABLE IF EXISTS `prd_data`;
CREATE TABLE `prd_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRD_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  `PRD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `PRD_PY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `TYPE_ID` int(11) NULL DEFAULT NULL COMMENT '产品类别',
  `POT_WEIGHT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锅重',
  `BOX_WEIGHT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盒重',
  `REFERENCE_PRICE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考售价',
  `PROCESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产工艺',
  `SEMI_FINISHED` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否半成品:0-成品，1-半成品',
  `PDC_STN` int(11) NULL DEFAULT NULL COMMENT '生产站点',
  `ORDER_TYPE` int(11) NULL DEFAULT NULL COMMENT '订单类别',
  `EXTRA_COST` int(11) NULL DEFAULT NULL COMMENT '额外成本',
  `COOK_TYPE` int(11) NULL DEFAULT NULL COMMENT '烹调方式',
  `PRODUCTION_TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单锅生产时间',
  `QUICK_COOLING` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否速冷',
  `QUICK_COOLING_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '速冷率',
  `ROUNDING` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否取整',
  `ROUND_WEIGHT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取整重',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `REPORT_NO` bigint(20) NULL DEFAULT NULL COMMENT '报表序',
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXTEND_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对外编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2064 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品基础信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prd_data
-- ----------------------------
INSERT INTO `prd_data` VALUES (2, 'V010300002', '红豆粥12', 'HDZ12', 35, '3', '0.2', '2', NULL, '1', 21, 43, NULL, NULL, NULL, '1', NULL, '0', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (3, 'V020300003', '火锅底料', 'HGDL', 39, '2', '2.3', '38', NULL, '1', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (4, 'V010100004', '凉拌莴苣', 'LBWJ', 33, '15', '0.5', '3', NULL, '0', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (5, '00000001', '*三彩蛋卷', 'SCDJ', 111, '1.0000', '5.0000', '1.20', '', '1', 50, 41, NULL, 89, '0.4', '1', '0.950', '0', NULL, '', NULL, NULL, '1', 486, '2018-02-21 15:58:55', 'admin', NULL);
INSERT INTO `prd_data` VALUES (6, '00000003', '奥尔良鸡腿45g（至尊饭团）', '*AELJT1K（ZZFT）', NULL, '20.0000', '5.0000', '0.00', '烤箱150度烤40分钟', '1', 128, NULL, NULL, 398, '5.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 420, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (7, '00000004', '奥尔良烤鸡腿65g', '*AELKJT1K', NULL, '6.0450', '5.0000', '0.00', '烤箱150度烤40分钟', '1', 128, NULL, NULL, 398, '5.0', '1', '0.900', '0', NULL, '02-AELJPF01', NULL, NULL, '1', 463, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (8, '00000005', '*测试白米饭', 'BMF', 45, '13.7000', '13.7000', '5.00', '', '1', 49, 41, NULL, 89, '1.0', '1', '0.900', '0', NULL, '01-BMF', NULL, NULL, '1', 0, '2018-02-01 19:01:44', 'admin', '1');
INSERT INTO `prd_data` VALUES (9, '00000006', '白芝麻反卷', '*BZMFJ', NULL, '2.8488', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, '1.0', '0', NULL, '1', '284.88', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (10, '00000007', '白粥', '*BZ', NULL, '100.0000', '5.0000', '8.00', '', '1', 130, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (11, '00000008', '薄蛋皮', '*BDP', NULL, '10.0000', '10.0000', '0.00', '电饼档油温100度，260ml蛋液（每张蛋皮），刷匀，煎2.5分钟。中间留20厘米宽作45g蛋皮，左右切开作蛋皮丝和小蛋皮', '1', 136, NULL, NULL, 403, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 488, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (12, '00000009', '菠菜胡萝卜丝', '*BCHLBS', NULL, '20.0000', '5.0000', '0.00', '水烧开下菠菜红萝卜丝，加调味料搅拌，水开后捞起', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '06-JYPT03', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (13, '00000010', '糍粑鱼', '*ZZY', NULL, '20.0000', '5.0000', '0.00', '鱼块腌制后放入180度油温炸5分起锅备用，鱼块中心温度95度。锅内放少许油，加入调味包炒香，放入炸好的鱼块，炒匀起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '03-CBY01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (14, '00000011', '大根芥末色拉细卷', '*DGJMSLXJ', NULL, '1.2450', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '124.50', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (15, '00000012', '蛋糕条', '*DGT', NULL, '10.0000', '10.0000', '0.00', '小汽蒸20分钟,切成18g重，1*1*18', '1', 136, NULL, NULL, 396, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 487, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (16, '00000014', '蛋皮反卷', '*DPFJ', NULL, '3.0200', '1.0000', '0.00', '', '1', 138, NULL, NULL, 395, '1.0', '0', NULL, '1', '302.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (17, '00000015', '法式鸡排(4刀5块)', '*FSJP(4D5K)', NULL, '20.0000', '5.0000', '0.00', '油炸机160摄氏度油炸5分钟，每锅放入150块', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 460, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (18, '00000016', '番茄鸡蛋', '*FQJD', NULL, '20.0000', '5.0000', '0.00', '油温150度，下鸡蛋液（40秒）炒凝固，捞起待用，锅内放油150度下西红柿，加调味料炒制1分钟加炸好的鸡蛋30秒勾芡起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '05-FQHDF02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (19, '00000017', '蛋包饭番茄酱', '*FQJ', NULL, '20.0000', '5.0000', '0.00', '', '1', 136, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (20, '00000018', '番茄牛肉酱', '*FQNRJ', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '09-YDLYM02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (21, '00000019', '干辣椒段', '*GLJD', NULL, '20.0000', '5.0000', '0.00', '辣椒段用140度热油淋5到6次即可', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '07-LZJHSHF03', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (22, '00000020', '干瓢白芝麻细卷', '*GPBZMXJ', NULL, '1.2200', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '122.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (23, '00000021', '宫爆鸡丁', '*GBJD', NULL, '20.0000', '5.0000', '0.00', '香干丁过油150度1分50秒（干子表面有空洞，易于入味），鸡丁油温140度1分10秒，土豆丁过油130度50秒，锅内放油，加调料炒香，放入鸡丁香干土豆丁炒匀勾芡', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '06-GBJD01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (24, '00000022', '荷兰豆片', '*HLDP', NULL, '20.0000', '5.0000', '0.00', '刀豆开水煮透', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '08-MPDFF02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (25, '00000023', '黑木耳四季豆', '*HMESJD', NULL, '20.0000', '5.0000', '0.00', '黑木耳沸水20秒，刀豆150摄氏度过油50秒，混匀调味勾芡', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '05-FQHDF01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (26, '00000024', '红椒丝', '*HJS', NULL, '0.3000', '5.0000', '0.00', '过150摄氏度油30秒', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 482, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (27, '00000025', '缤纷组合红鱼子反卷', '*HYZFJ', NULL, '2.7588', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '275.88', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (28, '00000026', '红鱼子军舰卷', '*HYZJJJ', NULL, '0.3250', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, '1.0', '0', NULL, '1', '32.50', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (29, '00000027', '红鱼子芝士握寿司', '*HYZZSWSS', NULL, '0.2800', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, '2.0', '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (30, '00000028', '花生米', '*HSM', NULL, '20.0000', '5.0000', '0.00', '', '1', 130, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '07-LZJHSHF01', NULL, NULL, '1', 447, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (31, '00000029', '黄瓜细卷', '*HGSWYXJ', NULL, '1.1900', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '119.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (32, '00000030', '黄瓜丝', '*HGS', NULL, '20.0000', '5.0000', '0.00', '沸水3秒', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 498, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (33, '00000032', '椒盐排条', '*JYPT', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '06-JYPT01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (34, '00000033', '军舰组合芥末鱿鱼', '*JMZY', NULL, '20.0000', '5.0000', '0.00', '', '1', 137, NULL, NULL, 395, '10.0', '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (35, '00000034', '军舰组合芥末鱿鱼军舰卷', '*JMZYJJJ', NULL, '0.3710', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '37.10', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (36, '00000036', '金枪鱼蛋黄酱', '*JQYDHJ', NULL, '10.5000', '5.0000', '0.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (37, '00000037', '金枪鱼沙拉军舰卷', '*JQYSLJJJ', NULL, '0.3100', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '62.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (38, '00000038', '金枪鱼蟹柳粗卷', '*JQYXLCJ', NULL, '3.6200', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '362.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (39, '00000039', '九州鸡块饭', '*JZJKF', NULL, '13.8000', '13.8000', '0.00', '', '1', 134, NULL, NULL, 396, '1.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (40, '00000040', '咖喱酱', '*KZJ', NULL, '10.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 469, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (41, '00000041', '辣鸡腿（1块美式辣鸡腿）', '*LJT（1KMSLJT）', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 419, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (42, '00000042', '辣子鸡(6块)', '*LZJ(6K)', NULL, '20.0000', '5.0000', '0.00', '鸡块上浆腌制，油温150度3分钟，表面炸至金黄', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '07-LZJHSHF02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (43, '00000043', '麻婆豆腐', '*MPDF', NULL, '20.0000', '5.0000', '0.00', '加水煮开后捞起待用，加油烧热蒜末、姜末炝锅，加调料150度放入焯水后的豆腐勾芡起锅', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '08-MPDFF01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (44, '00000044', '鳗鱼拌酱', '*ZYBJ', NULL, '20.0000', '5.0000', '0.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (45, '00000045', '鳗鱼军舰卷', '*ZYJJJ', NULL, '0.3520', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '35.20', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (46, '00000046', '目玉烧饭', '*MYSF', NULL, '15.2200', '15.2200', '0.00', '', '1', 134, NULL, NULL, 396, '1.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (47, '00000047', '南瓜炒蛋', '*NGCD', 45, '20.0000', '5.0000', '0.00', '南瓜片蒸40分钟，油温150度加鸡蛋液1分30秒起锅，锅内加水烧开放蒸好的南瓜搅拌成泥，加调料，加炸好的鸡蛋，加生粉勾芡起锅', '1', 50, 41, NULL, 89, NULL, '1', '0.900', '0', NULL, '02-AELJPF03', NULL, NULL, '1', 461, '2017-12-21 06:21:25', 'admin', NULL);
INSERT INTO `prd_data` VALUES (48, '00000048', '茄汁饭(新)', '*QZF(X)', NULL, '15.0000', '5.0000', '0.00', '', '1', 134, NULL, NULL, 396, '1.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (49, '00000049', '茄子土豆', '*QZTD', NULL, '20.0000', '5.0000', '0.00', '茄子过油170度10秒，土豆片150度过油10秒起锅，锅烧热加油加姜蒜炝锅，放土豆片加水2分钟，加茄子烧11分钟加淀粉勾芡起锅', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '11-ZXNRF02', NULL, NULL, '1', 436, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (50, '00000050', '青菜', '*QC', NULL, '20.0000', '5.0000', '0.00', '飞水10秒', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '10-YXRSF02', NULL, NULL, '1', 471, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (51, '00000051', '青海苔反卷', '*QHTFJ', NULL, '2.8488', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, '5.0', '0', NULL, '1', '284.88', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (52, '00000052', '青椒肉丝', '*QJRS', NULL, '10.0000', '5.0000', '0.00', '青椒150度过油30秒，腌制后肉丝过油150度30秒，锅内加油加调味料加肉丝，加青椒后勾芡起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '03-CBY02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (53, '00000053', '青椒丝', '*QJS', NULL, '20.0000', '5.0000', '0.00', '过150摄氏度油30秒', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 489, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (54, '00000054', '裙带菜军舰卷', '*QDCJJJ', NULL, '0.3800', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, '5.0', '0', NULL, '1', '38.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (55, '00000055', '*热干面', '*RGM', 79, '20.0000', '5.0000', '3.5', '热干面摊匀蒸三分钟，加配料加油拌均匀', '1', 128, 42, NULL, 0, NULL, '1', '0.900', '0', NULL, '04-RSCY02', NULL, NULL, '1', 426, '2018-03-30 14:42:23', 'admin', NULL);
INSERT INTO `prd_data` VALUES (56, '00000057', '肉丝葱油', '*RSCY', NULL, '20.0000', '5.0000', '0.00', '腌制后的肉丝过150度油1分30秒起锅，小葱段过150度油3分半钟起锅，小葱和肉丝加调料炒匀，30秒起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '04-RSCY01', NULL, NULL, '1', 427, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (57, '00000058', '肉松蛋糕细卷', '*RSDGXJ', NULL, '1.2300', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '123.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (58, '00000059', '三文鱼蛋黄酱', '*SWYDHJ', NULL, '20.0000', '5.0000', '0.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (59, '00000060', '什锦中卷', '*SJZJ', NULL, '2.5688', '5.0000', '3.00', '', '1', 138, NULL, NULL, 395, '5.0', '0', NULL, '1', '256.88', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (60, '00000061', '寿司饭', '*SSF', NULL, '16.0000', '16.0000', '0.00', '', '1', 134, NULL, NULL, 396, '1.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (61, '00000062', '粟米军舰卷', '*SMJJJ', NULL, '0.3900', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, '5.0', '0', NULL, '1', '39.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (62, '00000063', '甜辣鱿鱼军舰卷', '*TLZYJJJ', NULL, '0.3720', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '37.20', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (63, '00000065', '土豆滚刀块', '*TDGDK', NULL, '20.0000', '5.0000', '0.00', '土豆腌制后过油140度油温30秒', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '07-LZJHSHF04', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (64, '00000066', '土豆沙拉', '*TDSL', NULL, '20.0000', '5.0000', '0.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (65, '00000067', '土豆沙拉鱼子军舰卷', '*TDSLYZJJJ', NULL, '0.3650', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '73.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (66, '00000068', '土豆烧刀豆', '*TDSDD', NULL, '20.0000', '20.0000', '0.00', '土豆片，刀豆过油待用，锅内加油加水，放入调味料烧开，加土豆和刀豆烧制3分钟以上，加水淀粉勾芡起锅', '1', 128, NULL, NULL, 399, '5.0', '1', '0.900', '0', NULL, '02-AELJPF02', NULL, NULL, '1', 462, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (67, '00000069', '土豆条', '*TDT', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '06-JYPT02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (68, '00000070', '西葫芦香菇胡萝卜', '*XHLXGHLB', NULL, '20.0000', '5.0000', '0.00', '香菇飞水煮熟，放入萝卜片翻炒10秒钟煮开起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '06-GBJD02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (69, '00000071', '咸菜鸡丝毛豆', '*XCJSMD', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '07-LZJHSHF05', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (70, '00000072', '香炸排条', '*XZPT', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 422, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (71, '00000073', '蟹肉棒黄瓜炒蛋', '*XRBHGCD', NULL, '20.0000', '5.0000', '0.00', '油温180度，加鸡蛋液1分30秒起锅，锅内放油放蟹柳棒丁炒散，加黄瓜丁加水烧开，加调味料，加鸡蛋，三分钟勾芡起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '07-LZJHSHF06', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (72, '00000074', '新照烧鸡块', '*XZSJK(3D4K)', NULL, '20.0000', '20.0000', '0.00', '', '1', 133, NULL, NULL, 407, NULL, '1', '0.900', '0', NULL, '12-QZDBF01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (73, '00000075', '盐饭', '*YF', NULL, '15.0000', '15.0000', '50.00', '', '1', 134, NULL, NULL, 396, '1.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (74, '00000076', '扬州炒饭', '*YZCF', NULL, '20.0000', '5.0000', '0.00', '加油烧热，火腿过油150度45秒，鸡蛋液过油170度45秒后加过油的火腿丁，加盐饭炒散起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '06-JYPT04', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (75, '00000077', '意大利油面', '*YDLYM', NULL, '20.0000', '5.0000', '0.00', '水烧开放意面，不停翻炒，15-17分钟后把开水捞出加冰块冷却，不停搅拌，起锅后加油凉拌', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '09-YDLYM01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (76, '00000078', '银耳汤', '*YET', NULL, '60.0000', '10.0000', '0.00', '', '1', 130, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (77, '00000079', '鱼香肉丝', '*YXRS', NULL, '20.0000', '5.0000', '0.00', '黑木耳，笋丝过水煮熟捞起待用，肉丝腌制过油后待用，锅内加油放入调料包炒香，放入黑木耳，笋丝肉丝炒匀，勾芡起锅', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '10-YXRSF01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (78, '00000081', '照烧鸡肉块', '*ZSJRK', NULL, '20.0000', '5.0000', '0.00', '', '1', 133, NULL, NULL, 407, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 407, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (79, '00000082', '照烧鸡肉握寿司', '*ZSJRWSS', NULL, '0.3700', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (80, '00000083', '照烧猪肉反卷', '*ZSZRFJ', NULL, '2.5488', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '254.88', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (81, '00000084', '芝士方腿细卷', '*ZSFTXJ', NULL, '1.2600', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '126.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (82, '00000085', '芝士中卷', '*ZSZJ', NULL, '2.5700', '5.0000', '0.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '257.00', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (83, '00000086', '猪肉米', '*ZRM', NULL, '20.0000', '5.0000', '0.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (84, '00000087', '孜香牛肉', 'ZXNR', 45, '20.0000', '5.0000', '1', '140度45秒起锅', '1', 110, 41, NULL, 102, NULL, '1', '0.900', '0', NULL, '11-ZXNRF01', NULL, NULL, '1', 435, '2017-12-20 16:17:44', 'admin', NULL);
INSERT INTO `prd_data` VALUES (85, '00000088', '奥尔良鸡排盖浇饭490g', 'AELJPGJF490g', NULL, '100.0000', '100.0000', '8.39', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (86, '00000089', '缤纷什锦组合365g', 'BFSJZH365G', 93, '3.9540', '5.0000', '8.39', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (87, '00000090', '(停购)糍粑鱼青椒肉丝双拼饭500g', 'ZZYQJRSSPF500g', NULL, '100.0000', '100.0000', '9.69', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (89, '00000092', '(停购)番茄滑蛋盖浇饭480g', 'FQHDGJF480g', NULL, '100.0000', '100.0000', '5.85', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (90, '00000093', '(停购)宫保鸡丁盖浇饭550g', 'GBJDGJF550g', NULL, '100.0000', '100.0000', '8.26', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (91, '00000094', '红豆粥400g', 'HDZ400g', NULL, '20.0000', '5.0000', '2.28', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (92, '00000095', '(停购)椒盐排条蛋炒饭435g', 'JYPTHF435g', NULL, '100.0000', '100.0000', '9.04', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (93, '00000096', '金枪鱼蛋黄酱饭团100g', 'JQYDHJFT', NULL, '1.1100', '5.0000', '2.15', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (94, '00000097', '金枪鱼中卷寿司210g', 'JQYZJZH213g', NULL, '2.2825', '5.0000', '5.14', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (95, '00000098', '军舰组合200g', 'JJZH200g', NULL, '2.2112', '5.0000', '5.14', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (96, '00000100', '(停购)辣子鸡丁花式盒饭560g', 'LZJHSHF560g', NULL, '100.0000', '100.0000', '9.69', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (97, '00000101', '(停购)绿豆汤250g', 'LDT250g', NULL, '20.0000', '5.0000', '1.95', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (98, '00000102', '(停购)麻婆豆腐盖浇饭485g', 'MPDFGJF485g', NULL, '100.0000', '100.0000', '5.85', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (99, '00000103', '皮蛋瘦肉粥450g', 'PDSRZ450g', NULL, '20.0000', '5.0000', '2.93', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (100, '00000105', '茄汁肉酱意面420g', 'QZRJYM', NULL, '100.0000', '100.0000', '8.39', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (101, '00000107', '三文鱼蛋黄酱饭团100g', 'SWYDHJSFT100g', NULL, '1.1100', '5.0000', '2.15', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (102, '00000108', '双馅细卷组合215g', 'SXXJZH215g', NULL, '2.3046', '5.0000', '5.14', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (103, '00000109', '香炸排条饭卷180g', 'XZPTFJ180g', NULL, '1.9500', '5.0000', '3.58', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (104, '00000110', '新什锦总汇234g', 'XSJZH234g', NULL, '2.6065', '5.0000', '7.48', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (105, '00000111', '银耳汤250g', 'YET250g', NULL, '20.0000', '5.0000', '2.28', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (106, '00000112', '(停购)鱼香肉丝饭500g', 'YXRSF', NULL, '100.0000', '100.0000', '9.04', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (107, '00000113', '(停购)鱼子蟹柳军舰卷180g', 'YZXLJJZH', NULL, '10.0000', '5.0000', '5.14', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (108, '00000114', '照烧鸡肉饭卷', 'ZSJRFJ', NULL, '10.0000', '5.0000', '3.84', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (109, '00000115', '芝士火炬组合290g', 'ZSHJZH290g', NULL, '2.8663', '5.0000', '8.39', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (111, '00000117', '至尊饭团(美式辣鸡腿)', 'ZZFT(MSLJT)', NULL, '1.9800', '5.0000', '3.84', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (112, '00000118', '孜香牛肉盖浇饭515g', 'ZXNRGJF515g', NULL, '100.0000', '100.0000', '9.04', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (113, '00000119', '烧烤酱', '*SKJ', NULL, '5.0000', '5.0000', '4.00', '', '1', 136, NULL, NULL, 395, NULL, '1', '0.930', '0', NULL, '不速冷', NULL, NULL, '1', 424, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (114, '00000120', '照烧猪肉', 'ZSZR', NULL, '20.0000', '20.0000', '4.00', '', '1', 133, NULL, NULL, 407, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (115, '00000121', '腌制糍粑鱼20g', '*YZCBY', NULL, '20.0000', '20.0000', '6.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (116, '00000122', '鱼香肉丝的肉丝', '*YZRS', NULL, '20.0000', '20.0000', '50.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (117, '00000123', '*腌制鸡丁5*5', 'AZJD5*5', 92, '20.0000', '20.0000', '4.00', '', '1', 50, 41, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, '2018-02-01 16:44:53', 'admin', NULL);
INSERT INTO `prd_data` VALUES (118, '00000124', '腌制椒盐排条7g', '*YZJYPT', NULL, '20.0000', '20.0000', '4.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (119, '00000125', '沸水鱿鱼', '*FSYY', NULL, '10.0000', '10.0000', '4.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 493, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (120, '00000127', '腌制辣子鸡15g', '*YZLZJ', NULL, '20.0000', '20.0000', '4.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (121, '00000128', '腌制鸡丝', '*YZJS', NULL, '20.0000', '20.0000', '4.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (122, '00000129', '腌制猪肉米', '*YZZRM', NULL, '20.0000', '20.0000', '4.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (123, '00000130', '腌制孜香牛肉', 'YZZXNR', NULL, '20.0000', '20.0000', '4.00', '牛霖静水解冻12小时，去筋膜，机器切片', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (124, '00000131', '腌制奥尔良鸡腿85.5g', '*YZAELJT85G', NULL, '20.0000', '20.0000', '5.00', '净水解冻12小时，去鸡油，切成规定的形状', '1', 133, NULL, NULL, 407, '60.0', '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (125, '00000133', '(停购)茄汁蛋包饭460g', 'QZDBF460G', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (126, '00000134', '腌制新照烧鸡块75g', '*YZXZSJK(3D4K)', NULL, '20.0000', '20.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (127, '00000136', '三文鱼松沙拉酱', '*SWYSSLJ', NULL, '5.0000', '5.0000', '0.90', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (128, '00000137', '虾仁蛋黄酱饭团110g', 'XRDHJFT110G', NULL, '40.0000', '40.0000', '2.45', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (129, '00000138', '虾仁蛋黄酱', 'XRDHJ', NULL, '40.0000', '40.0000', '2.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (130, '00000139', '至尊饭团（甜辣烤肉）180克', 'ZZFT（TLKR）180K', NULL, '1.8600', '40.0000', '3.77', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (131, '00000140', '韩式烤肉', '*HSKR', NULL, '20.0000', '20.0000', '1.10', '', '1', 133, NULL, NULL, 407, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (132, '00000141', '盖浇饭甜辣烤肉', '*TLKR', NULL, '10.0000', '40.0000', '5.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (133, '00000142', '韩式泡菜', 'HSPC', NULL, '20.0000', '2.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (134, '00000143', '照烧鸡肉（饭卷用）', '*ZSJR（FJY）', NULL, '20.0000', '20.0000', '1.00', '鸡肉解冻，切成规定形状', '1', 133, NULL, NULL, 407, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 421, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (135, '00000144', '沸水包菜丝', 'FSBCS', NULL, '20.0000', '10.0000', '0.20', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 423, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (136, '00000145', '青椒千张丝', 'QJQZS', NULL, '20.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '07-LZJHSHF07', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (137, '00000146', '皮蛋粥的肉末', '*RM', NULL, '10.0000', '10.0000', '1.00', '肉末沸水，速冷', '1', 130, NULL, NULL, 406, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 403, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (138, '00000147', '(停购)梅干菜烧肉盖浇饭510g', 'MGCSRGJF510G', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (139, '00000148', '梅干菜', '*MGC', NULL, '20.0000', '5.0000', '3.00', '', '1', 128, NULL, NULL, 401, '6.0', '1', '0.900', '0', NULL, '12-MGCSRF03', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (140, '00000149', '红烧肉', '*HSR', NULL, '20.0000', '5.0000', '10.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '12-MGCSRF04', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (141, '00000150', '芹菜段', '*QCD', NULL, '10.0000', '5.0000', '0.00', '150度油温炸20秒', '1', 128, NULL, NULL, 397, '0.4', '1', '0.900', '0', NULL, '12-MGCSRF02', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (142, '00000151', '胡萝卜丝', '*HLBS', NULL, '20.0000', '5.0000', '0.00', '150度油温炸20秒', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '12-MGCSRF01', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (143, '00000152', '香炸鸡排咖喱饭570g', 'XZJPKLF570G', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, 395, '10.0', '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (144, '00000153', '(停购)韩式烤肉盖浇饭480g', 'HSKRGJF480G', NULL, '100.0000', '100.0000', '8.70', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (145, '00000154', '烤海带', '*KHD', NULL, '10.0000', '5.0000', '3.00', '海带洗净，切丝，腌制。上下火170度 烤30分钟', '1', 128, NULL, NULL, 398, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (146, '00000155', '刀豆丝', 'DDS', NULL, '10.0000', '5.0000', '0.30', '刀豆洗净切丝，170度油温中炸15秒', '1', 128, NULL, NULL, 397, '0.1', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 491, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (147, '00000156', '目玉烧饭团155g', 'MYSFT155G', NULL, '1.6512', '10.0000', '2.28', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (148, '00000157', '煎鸡蛋', '*JJD', NULL, '0.0400', '1.0000', '1.00', '', '1', 134, NULL, NULL, 403, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 490, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (149, '00000158', '炸鸡块茄汁饭团140g', 'ZJKQZFT140G', NULL, '1.5400', '10.0000', '2.60', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (150, '00000159', '茄汁饭', '*QZF', NULL, '15.0000', '5.0000', '3.80', '', '1', 134, NULL, NULL, 396, '1.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 473, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (151, '00000160', '唐扬鸡块', '*TYJK', NULL, '10.0000', '10.0000', '0.50', '腌制12小时，用150度油温炸3分钟', '1', 128, NULL, NULL, 397, '3.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (152, '00000161', '茄汁酱', '*QZJ', NULL, '5.0000', '5.0000', '3.00', '', '1', 136, NULL, NULL, 399, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (153, '00000162', '腌制唐扬鸡块15g', '*YZTYJK', NULL, '20.0000', '20.0000', '0.50', '', '1', 133, NULL, NULL, 407, '2.0', '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (154, '00000163', '芥末色拉酱', 'JMSLJ', NULL, '1.0000', '1.0000', '1.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (155, '00000164', '军舰组合金枪鱼沙拉酱', 'JQYSLJ', NULL, '1.0000', '1.0000', '3.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (156, '00000165', '玉米沙拉千岛酱', 'YMSLQDJ', NULL, '1.0000', '1.0000', '1.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (157, '00000166', '甜辣鱿鱼', 'TLYY', NULL, '1.0000', '1.0000', '1.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (158, '00000167', '奥尔良鱿鱼', '*AELYY', NULL, '20.0000', '20.0000', '1.00', '', '1', 133, NULL, NULL, 407, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 492, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (159, '00000168', '蟹肉沙拉酱', '*XRSLJ', NULL, '1.0000', '1.0000', '1.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (160, '00000169', '新什锦红鱼子反卷', '*XSJHYZFJ', NULL, '2.8488', '1.0000', '5.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '1', '284.88', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (161, '00000171', '(停购)川香回锅肉盖浇饭', 'CXHGR', NULL, '100.0000', '100.0000', '9.04', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (162, '00000172', '卤肉方', 'LRF', NULL, '100.0000', '10.0000', '4.00', '', '1', 130, NULL, NULL, 400, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (163, '00000173', '卤鸡蛋', 'LJD', NULL, '100.0000', '10.0000', '2.00', '', '1', 130, NULL, NULL, 400, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (164, '00000174', '回锅肉', 'HGR', NULL, '10.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, 400, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (165, '00000175', '(停购)泡椒滑鸡饭530g', 'PJHJF530G', NULL, '100.0000', '100.0000', '8.70', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (166, '00000176', '泡椒滑鸡', 'PJHJ', 45, '20.0000', '20.0000', '3.00', '', '1', 50, 42, NULL, 88, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (167, '00000177', '红椒粒', '*HJL', NULL, '10.0000', '5.0000', '0.50', '红椒切粒，在150度油温中炸15秒', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 481, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (168, '00000178', '培根芝士饭卷160g', 'PGZSFJ160G', NULL, '1.7150', '10.0000', '3.84', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (169, '00000179', '洋葱炒培根', '*YCCPG', NULL, '10.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 416, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (170, '00000180', '培根沙拉', 'PGSL', NULL, '10.0000', '10.0000', '1.50', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (171, '00000183', '腌制美式辣鸡腿45g', '*YZMSLJT', NULL, '20.0000', '20.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (172, '00000184', '腌制香炸排条24g', '*YZXZPT', NULL, '20.0000', '20.0000', '1.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (173, '00000185', '法式鸡排', '*FSJP', NULL, '5.0000', '5.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (174, '00000186', '腌制奥尔良鸡腿45g（至尊饭团）', '*YZAELJT（ZZFT）', NULL, '20.0000', '20.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (175, '00000187', '茄汁酱（新）', 'QZJ（X）', NULL, '5.0000', '5.0000', '2.00', '', '1', 136, NULL, NULL, 396, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (176, '00000188', '蟹柳蛋黄酱饭团110g', 'XLDHJFT110G', NULL, '1.1300', '10.0000', '2.45', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (177, '00000189', '蟹柳沙拉酱', 'XLSLJ', NULL, '10.0000', '10.0000', '1.00', '蟹柳棒机器打成小丁，加沙拉酱拌匀', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (178, '00000190', '土豆芹菜胡萝卜沙拉', 'TDQCHLBSL', NULL, '20.0000', '10.0000', '2.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (179, '00000191', '水果黄瓜（2根）', 'SGHG（2G）', NULL, '10.0000', '10.0000', '1.82', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (180, '00000192', '红樱番茄80--100g', 'HYFQ80--100G', NULL, '10.0000', '10.0000', '1.82', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (181, '00000193', '苹果（单个）', 'PG（DG）', NULL, '10.0000', '10.0000', '2.28', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (182, '00000194', '香辣翅尖120g', 'XLCJ120G', NULL, '10.0000', '10.0000', '6.50', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (183, '00000195', '香辣鸭脖180g', 'XLYB180G', NULL, '10.0000', '10.0000', '7.15', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (184, '00000196', '五香卤藕140g', 'WXLO140G', NULL, '10.0000', '10.0000', '4.50', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (185, '00000197', '卤水', 'LS', NULL, '10.0000', '10.0000', '0.01', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (186, '00000198', '茶叶蛋', 'CYD', NULL, '10.0000', '10.0000', '0.98', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (187, '00000199', '香辣鸡翅尖', '*XLJCJ', NULL, '10.0000', '10.0000', '10.00', '', '1', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (188, '00000200', '香辣鸭脖', '*XLYB', NULL, '10.0000', '10.0000', '7.00', '', '1', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (189, '00000201', '五香卤藕', '*WXLO', NULL, '10.0000', '10.0000', '3.00', '', '1', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (190, '00000202', '原味烤鸭', 'YWKY', NULL, '100.0000', '100.0000', '13.20', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (191, '00000203', '奥尔良烤鸡450g生胚', 'AELKJ450gSP', NULL, '100.0000', '100.0000', '8.64', '', '0', 133, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (192, '00000204', '奥尔良烤鸡翅中', 'AELKJCZ', NULL, '100.0000', '100.0000', '45.40', '', '0', 133, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (193, '00000205', '奥尔良烤鸡翅根', 'AELKJCG', NULL, '100.0000', '100.0000', '21.80', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (194, '00000206', '(停购)卤制品精品五香牛肉散', 'LZPJPWXNRS', NULL, '100.0000', '100.0000', '110.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (195, '00000207', '(停购)卤制品精品香辣牛肉散', 'LZPJPXLNRS', NULL, '100.0000', '100.0000', '110.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (196, '00000208', '卤制品五香牛肚散', 'LZPWXNDS', NULL, '100.0000', '100.0000', '85.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (197, '00000209', '(停购)卤制品香辣牛肚散', 'LZPXLNDS', NULL, '100.0000', '100.0000', '95.68', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (198, '00000210', '卤制品糯猪蹄个（称重）', 'LZPNZTG（CZ）', NULL, '100.0000', '100.0000', '51.48', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (199, '00000211', '卤制品酱香猪耳真空称重', 'LZPJXZEZKCZ', NULL, '100.0000', '100.0000', '72.33', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (200, '00000212', '卤制品酱香猪耳切片散', 'LZPJXZEQPS', NULL, '100.0000', '100.0000', '70.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (201, '00000213', '卤制香辣牛肚切片散', 'LZXLNDQPS', NULL, '100.0000', '100.0000', '95.68', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (202, '00000214', '(停购)卤制品五香牛腱散', 'LZPWXNZS', NULL, '100.0000', '100.0000', '109.80', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (203, '00000215', '卤制品五香牛肚切片散', 'LZPWXNDQPS', NULL, '100.0000', '100.0000', '95.68', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (204, '00000216', '卤肉方真空称重', 'LRFZKCZ', NULL, '1.0000', '1.0000', '65.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (205, '00000217', '卤制品酱香猪耳散', 'LZPJXZES', NULL, '100.0000', '100.0000', '87.68', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (206, '00000218', '卤肉方散', 'LRFS', NULL, '1.0000', '1.0000', '50.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (207, '00000219', '卤制品糯猪蹄散', 'LZPNZTS', NULL, '100.0000', '100.0000', '50.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (208, '00000220', '卤制品酱香猪皮散', 'LZPJXZPS', NULL, '100.0000', '100.0000', '28.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (209, '00000221', '卤制品酱香猪皮真空称重', 'LZPJXZPZKCZ', NULL, '100.0000', '100.0000', '28.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (210, '00000222', '卤制品鸭脖X', 'LZPYBX', NULL, '100.0000', '100.0000', '46.08', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (211, '00000223', '卤制品香辣凤尖散', 'LZPXLFJS', NULL, '100.0000', '100.0000', '41.68', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (212, '00000224', '卤制品香辣凤爪散', 'LZPXLFZS', NULL, '100.0000', '100.0000', '56.20', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (213, '00000225', '(停购)卤制品麻香鸭真空称重', 'LZPMXYZKCZ', NULL, '100.0000', '100.0000', '31.84', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (214, '00000226', '(停购)卤制品麻香鸭散', 'LZPMXYS', NULL, '100.0000', '100.0000', '31.84', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (215, '00000227', '卤制品鸭肫真空称重', 'LZPYZZKCZ', NULL, '100.0000', '100.0000', '88.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (216, '00000228', '卤制品鸭肫散', 'LZPYZS', NULL, '100.0000', '100.0000', '88.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (217, '00000229', '(停购)卤制品鸭腿真空装称重', 'LZPYTZKZCZ', NULL, '100.0000', '100.0000', '26.90', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (218, '00000230', '(停购)卤制品鸭腿散', 'LZPYTS', NULL, '100.0000', '100.0000', '26.90', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (219, '00000231', '卤制品鸭掌真空称重', 'LZPYZZKCZ', NULL, '100.0000', '100.0000', '55.60', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (220, '00000232', '卤制品鸭掌散', 'LZPYZS', NULL, '100.0000', '100.0000', '55.60', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (221, '00000233', '卤制品鸭翅真空称重', 'LZPYCZKCZ', NULL, '100.0000', '100.0000', '50.08', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (222, '00000234', '卤制品鸭翅散', 'LZPYCS', NULL, '100.0000', '100.0000', '44.48', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (223, '00000235', '熟食油炸肉丸子散', 'SSYZRWZS', NULL, '1.0000', '1.0000', '34.88', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (224, '00000236', '熟食珍珠丸子', 'SSZZWZ', NULL, '1.0000', '1.0000', '32.08', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (225, '00000237', '(停购)肉丸馅', 'RWX', NULL, '1.0000', '1.0000', '32.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (226, '00000238', '炸鱼块', 'ZYK', NULL, '1.0000', '1.0000', '22.80', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (227, '00000239', '卤鸡蛋', 'LJD', NULL, '1.0000', '1.0000', '0.95', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (228, '00000240', '香煎金线鱼', 'XJJXY', NULL, '1.0000', '1.0000', '47.84', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (229, '00000241', '金牌辣子鸡块', 'JPLZJK', NULL, '1.0000', '1.0000', '43.20', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (230, '00000242', '熟食油炸糯米鸡（仓储）', 'SSYZNMJ（CC）', NULL, '1.0000', '1.0000', '1.20', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (231, '00000243', '精选芝香肉串', 'JXZXRC', NULL, '1.0000', '1.0000', '1.32', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (232, '00000244', '精选骨肉相连', 'JXGRXL', NULL, '1.0000', '1.0000', '1.76', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (233, '00000245', '精选川香鸡柳', 'JXCXJL', NULL, '1.0000', '1.0000', '1.76', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (234, '00000246', '(停购)孜然鱿鱼须', 'ZRZYX', NULL, '1.0000', '1.0000', '57.30', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (235, '00000247', '(停购)调理草鱼块', 'DLCYK', NULL, '1.0000', '1.0000', '40.13', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (236, '00000248', '精选香芋地瓜丸', 'JXXYDGW', NULL, '1.0000', '1.0000', '29.56', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (237, '00000249', '卤制品联营条码', 'LZPLYTM', NULL, '100.0000', '100.0000', '1.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (238, '00000250', '即食1联营条码', 'JS1LYTM', NULL, '1.0000', '1.0000', '1.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (239, '00000251', '即食2联营条码', 'JS2LYTM', NULL, '1.0000', '1.0000', '1.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (240, '00000252', '即食3联营条码', 'JS3LYTM', NULL, '1.0000', '1.0000', '1.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (241, '00000253', '油炸制品联营条码', 'YZZPLYTM', NULL, '1.0000', '1.0000', '1.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (242, '00000255', '(停购)自制茄夹', 'ZZQJ', NULL, '1.0000', '1.0000', '18.75', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (243, '00000256', '(停购)麻辣酱鸭', 'MLJY', NULL, '1.0000', '1.0000', '18.50', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (244, '00000257', '(停购)卤全鸡', 'LQJ', NULL, '1.0000', '1.0000', '15.20', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (245, '00000246', '(停购)孜然鱿鱼须', 'ZRZYX', NULL, '1.0000', '1.0000', '57.30', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (246, '00000259', '香卤半只鸭', 'XLBZY', NULL, '1.0000', '1.0000', '10.00', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (247, '00000260', '美膳-蛋黄酱三文鱼饭团', 'DHJSWYFT100g(Z)', NULL, '1.1100', '1.0000', '2.15', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (248, '00000261', '美膳-蛋黄酱金枪鱼饭团', 'DHJJQYFT100g(Z)', NULL, '1.1100', '1.0000', '2.15', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (249, '00000262', '美膳-日式目玉烧饭团', 'RSMYSFT155g(Z)', NULL, '1.6512', '1.0000', '2.28', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (250, '00000263', '美膳-茄汁炸鸡块饭团', 'QZZJKFT140g(Z)', NULL, '1.5400', '1.0000', '2.60', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (251, '00000264', '(停购)美膳-鱼子蟹柳军舰寿司', 'YZXLJJSS180g(Z)', NULL, '10.0000', '5.0000', '5.14', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (252, '00000265', '美膳-双馅细卷套餐组合', 'SXXJTCZH215g(Z)', NULL, '10.0000', '5.0000', '5.14', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (253, '00000266', '美膳-金枪鱼寿司', 'JQYSS210g(Z)', NULL, '10.0000', '5.0000', '5.14', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (254, '00000267', '美膳-什锦寿司套餐组合', 'SJSSTCZH235g(Z)', NULL, '10.0000', '5.0000', '7.48', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (255, '00000268', '(停购)芝士火炬套餐组合290g(Z)', 'ZSHJTCZH290g(Z)', NULL, '2.8663', '1.0000', '8.39', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (256, '00000269', '美膳-军舰寿司套餐组合', 'JJSSTCZH200g(Z)', NULL, '2.1120', '1.0000', '5.14', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (257, '00000270', '美膳-缤纷什锦套餐组合', 'ZFSJTCZH365g(Z)', NULL, '10.0000', '5.0000', '8.39', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (258, '00000271', '烧鹅', 'SE', NULL, '1.0000', '1.0000', '102.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (259, '00000272', '烧鸭', 'SY', NULL, '1.0000', '1.0000', '78.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (260, '00000273', '叉烧排骨', 'CSPG', NULL, '1.0000', '1.0000', '70.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (261, '00000274', '白切鸡', 'BQJ', NULL, '1.0000', '1.0000', '22.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (262, '00000275', '香肠', 'XC', NULL, '1.0000', '1.0000', '46.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (263, '00000276', '牛肉粉', 'NRF', NULL, '1.0000', '1.0000', '6.40', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (264, '00000277', '牛肚粉', 'NDF', NULL, '1.0000', '1.0000', '6.40', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (265, '00000278', '三鲜粉', 'SXF', NULL, '1.0000', '1.0000', '4.48', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (266, '00000279', '炸酱粉', 'ZJF', NULL, '1.0000', '1.0000', '4.80', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (267, '00000280', '热干粉', 'RGF', NULL, '1.0000', '1.0000', '3.20', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (268, '00000281', '5元粥类', '5YZL', NULL, '1.0000', '1.0000', '4.00', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (269, '00000282', '6元粥类', '6YZL', NULL, '1.0000', '1.0000', '4.80', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (270, '00000283', '3元粥、汤类', '3YZ、TL', NULL, '1.0000', '1.0000', '2.40', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (271, '00000284', '3元饮品类', '3YYPL', NULL, '1.0000', '1.0000', '2.40', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (272, '00000285', '2元饮品类', '2YYPL', NULL, '1.0000', '1.0000', '1.60', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (273, '00000286', '5元奶茶、饮品', '5YNC、YP', NULL, '1.0000', '1.0000', '4.00', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (274, '00000287', '6元奶茶、饮品', '6YNC、YP', NULL, '1.0000', '1.0000', '4.80', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (275, '00000288', '8元奶茶、饮品', '8YNC、YP', NULL, '1.0000', '1.0000', '6.40', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (276, '00000289', '粉蒸芋头', 'FZYT', NULL, '1.0000', '1.0000', '7.20', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (277, '00000290', '蒸玉米', 'ZYM', NULL, '1.0000', '1.0000', '2.40', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (278, '00000291', '蒸紫薯', 'ZZS', NULL, '1.0000', '1.0000', '4.00', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (279, '00000292', '蒸山药', 'ZSY', NULL, '1.0000', '1.0000', '4.00', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (280, '00000293', '烤肠', 'KC', NULL, '100.0000', '100.0000', '44.80', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (281, '00000294', '脱骨鸡爪', 'TGJZ', NULL, '1.0000', '1.0000', '58.90', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (282, '00000295', '三杯福袋', 'SBFD', NULL, '1.0000', '1.0000', '15.80', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (283, '00000296', '南洋烧鸭', 'NYSY', NULL, '1.0000', '1.0000', '15.80', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (284, '00000297', '蜜汁叉烧', 'MZCS', NULL, '1.0000', '1.0000', '15.80', NULL, '0', NULL, NULL, NULL, 395, NULL, '0', '0.000', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (285, '00000298', '武汉熏鱼', 'WHXY', NULL, '1.0000', '1.0000', '15.84', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (286, '00000299', '家常土豆片', 'JCTDP', NULL, '80.0000', '20.0000', '7.00', '', '1', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (287, '00000300', '奥尔良鸡排', 'AELJP', NULL, '5.0000', '5.0000', '2.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (288, '00000301', '番茄炒蛋', 'FQCDT', NULL, '80.0000', '80.0000', '1.50', '', '1', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (289, '00000302', '低年级家常土豆片', 'DNJJCTDP', NULL, '80.0000', '10.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (290, '00000303', '中年级家常土豆片', 'ZNJJCTDP', NULL, '80.0000', '10.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (291, '00000304', '高年级家常土豆片', 'GNJJCTDP', NULL, '80.0000', '10.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (292, '00000305', '中年级番茄炒蛋', 'ZNJFQCD', NULL, '80.0000', '10.0000', '1.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (293, '00000306', '低年级番茄鸡蛋', 'DNJFQJD', NULL, '80.0000', '10.0000', '1.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (294, '00000307', '高年级番茄鸡蛋', 'GNJFQJD', NULL, '80.0000', '10.0000', '1.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (295, '00000308', '停用---低年级白米饭', 'DNJBMF', NULL, '15.0000', '10.0000', '1.00', '', '0', 134, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (296, '00000309', '停用----中年级白米饭', 'ZNJBMF', NULL, '15.0000', '10.0000', '1.00', '', '0', 134, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (297, '00000310', '停用-----高年级白米饭', 'GNJBMF', NULL, '15.0000', '10.0000', '1.00', '', '0', 134, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (298, '00000314', '(停购)香辣鸭腿饭640g', 'XLYTF', NULL, '100.0000', '100.0000', '9.50', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (299, '00000315', '土豆烧鸭腿', '*TDSYT', NULL, '20.0000', '5.0000', '4.00', '鸭腿剁块烧好，土豆焯水5分钟，在170度油温中炸1分钟，再在烧鸭腿的汤中泡5分钟捞起，剩下的汤和鸭腿一起烧，勾芡，起锅。', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (300, '00000316', '西葫芦', '*XHL', NULL, '20.0000', '5.0000', '1.00', '西葫芦清炒', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (301, '00000317', '青红椒片', '*QHJP', NULL, '20.0000', '5.0000', '1.00', '在170度油温中炸1分钟', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 480, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (302, '00000318', '黑椒牛肉盖浇饭550g', 'HJNRGJF550G', NULL, '100.0000', '100.0000', '9.50', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (303, '00000319', '腌制黑椒牛肉', '*YZHJNR', NULL, '20.0000', '20.0000', '4.00', '牛肉切片，加调料腌制', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (304, '00000320', '黑椒牛肉', '*HJNR', NULL, '20.0000', '5.0000', '4.50', '在150度油温中炸1分钟，中心温度到85度 起锅', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 467, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (305, '00000321', '红萝卜炒洋葱', 'HLBCYC', NULL, '50.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 434, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (306, '00000322', '红椒片', 'HJP', NULL, '20.0000', '5.0000', '1.00', '放入150度油温中炸1分钟，中心温度达到85度起锅', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 483, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (307, '00000323', '黑椒汁', 'HJZ', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 468, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (308, '00000324', '黑椒酱', 'HJJ', NULL, '20.0000', '5.0000', '50.00', '', '1', 128, NULL, NULL, 399, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (309, '00000325', '微辣鸡排', 'WLJP', NULL, '10.0000', '10.0000', '2.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (310, '00000326', '开洋冬瓜', 'KYDG', NULL, '80.0000', '80.0000', '0.80', '', '1', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (311, '00000327', '开洋冬瓜', 'DNJKYDG', NULL, '80.0000', '80.0000', '1.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (312, '00000330', '手撕面筋', 'SSMJ', NULL, '80.0000', '20.0000', '1.00', '', '1', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (313, '00000331', '手撕面筋', 'DNJSSMJ', NULL, '80.0000', '20.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (314, '00000332', '学生餐白米饭', '*XSCBMF', NULL, '13.7000', '13.7000', '0.00', '', '1', 134, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (315, '00000333', '散宽米粉250g(原料)', 'SKMF250G(YL)', NULL, '20.0000', '5.0000', '1.00', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (316, '00000334', '三鲜原料80g', 'SXYL80G', NULL, '20.0000', '5.0000', '2.50', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (317, '00000335', '米粉原汤汤料', 'MFYTTL', NULL, '20.0000', '10.0000', '0.01', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (318, '00000336', '米粉卤水汤料', 'MFLSTL', NULL, '20.0000', '10.0000', '0.01', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (319, '00000337', '卤牛肉片30g', 'LNRP30G', NULL, '20.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (320, '00000338', '醉鸡', 'ZJ', NULL, '10.0000', '10.0000', '30.00', '', '1', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (321, '00000339', '南瓜烧培根', 'NGSPG', NULL, '80.0000', '20.0000', '1.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (322, '00000340', '三色包菜丝', 'SSBCS', NULL, '80.0000', '10.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (323, '00000341', '红耳坠蒸鸡', 'HEZZJ', NULL, '20.0000', '10.0000', '2.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (324, '00000344', '员工早餐', 'YGSTZC', NULL, '1.0000', '1.0000', '4.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (325, '00000345', '外卖早餐', 'WMZC', NULL, '1.0000', '1.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (326, '00000346', '员工中餐', 'YGZC', NULL, '1.0000', '1.0000', '7.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (327, '00000347', '外卖中餐', 'WMZC', NULL, '1.0000', '1.0000', '10.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (328, '00000348', '员工晚餐', 'YGWC', NULL, '1.0000', '1.0000', '7.00', '', '0', 139, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (329, '00000349', '外卖晚餐', 'WMWC', NULL, '1.0000', '1.0000', '10.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (330, '00000350', '(停购)卤制品酱香猪肚散', 'LZPJXZDS', NULL, '100.0000', '100.0000', '99.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (331, '00000351', '(停购)熟食原味粉蒸肉300g', 'SSYWFZR300G', NULL, '1.0000', '0.3000', '8.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (332, '00000352', '(停购)熟食酱香粉蒸肉300g', 'SSJXFZR300G', NULL, '1.0000', '0.3000', '8.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (333, '00000353', '(停购)熟食土豆蒸排骨300g', 'SSTDZPG300G', NULL, '1.0000', '0.3000', '10.24', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (334, '00000354', '(停购)熟食梅干菜扣肉300g', 'SSMGCKR300G', NULL, '1.0000', '0.3000', '10.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (335, '00000355', '(停购)熟食油炸花生米散', 'SSYZHSMS', NULL, '1.0000', '1.0000', '15.68', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (336, '00000356', '卤制品五香牛肉真空称重', 'LZPWXNRZKCZ', NULL, '100.0000', '100.0000', '110.40', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (337, '00000357', '(停购)卤制品香辣牛肉块真空称重', 'LZPXLNRKZKCZ', NULL, '100.0000', '100.0000', '110.40', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (338, '00000358', '卤制品五香牛肚真空称重', 'LZPWXNDZKCZ', NULL, '100.0000', '100.0000', '95.68', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (339, '00000359', '(停购)熟食腊八豆蒸猪皮300g', 'SSLBDZZP300G', NULL, '1.0000', '0.3000', '7.84', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (340, '00000360', '(停购)熟食粉蒸牛肉300g', 'SSFZNR300G', NULL, '100.0000', '0.3000', '13.44', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (341, '00000361', '(停购)熟食豉汁蒸排骨300g', 'SSCZZPG300G', NULL, '1.0000', '0.3000', '13.44', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (342, '00000362', '奥尔良烤鸡翅中（称重）', 'AELKJCZ（CZ）', NULL, '100.0000', '100.0000', '45.40', '', '0', 133, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (343, '00000363', '(停购)精品黄陂肉糕盒', 'JPHBRGH', NULL, '1.0000', '1.0000', '15.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (344, '00000364', '(停购)回锅老卤', 'HGLL', NULL, '1.0000', '1.0000', '0.01', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (345, '00000223', '卤制品香辣凤尖散', 'LZPXLFJS', NULL, '100.0000', '100.0000', '41.68', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (346, '00000214', '(停购)卤制品五香牛腱散', 'LZPWXNJS', NULL, '100.0000', '100.0000', '109.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (347, '00000368', '熟食草鱼丸散', 'SSCYWS', NULL, '1.0000', '1.0000', '26.88', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (348, '00000369', '(停购)精品荆沙鱼糕盒', 'JPJSYGH', NULL, '1.0000', '1.0000', '15.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (349, '00000370', '(停购)熟食雪菜肉末散', 'SSXCRMS', NULL, '1.0000', '1.0000', '15.68', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (350, '00000241', '金牌辣子鸡块', 'JPLZJK', NULL, '1.0000', '1.0000', '43.20', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (351, '00000372', '熟食套餐5', 'SSTC5', NULL, '1.0000', '1.0000', '198.08', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (352, '00000373', '熟食套餐2', 'SSTC2', NULL, '1.0000', '1.0000', '124.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (353, '00000374', '樟茶鸭', 'ZCY', NULL, '1.0000', '1.0000', '13.20', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (354, '00000375', '烤琵琶腿', 'AELKPPT', NULL, '100.0000', '100.0000', '2.88', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (355, '00000246', '(停购)孜然鱿鱼须', 'ZRYYX', NULL, '1.0000', '1.0000', '57.30', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (356, '00000377', '(停购)麻辣拌菜红油', 'MLBCHY', NULL, '1.0000', '1.0000', '0.01', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (357, '00000378', '(停购)卤制品香辣牛肚真空称重', 'XLNDZKCZ', NULL, '100.0000', '100.0000', '95.68', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (358, '00000380', '学生餐主荤', 'XSCZH', NULL, '80.0000', '10.0000', '2.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (359, '00000381', '学生餐次荤', 'XSCCH', NULL, '80.0000', '10.0000', '1.50', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (360, '00000382', '学生餐素菜', 'XSCSC', NULL, '80.0000', '10.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (361, '00000383', '学生餐米饭', 'XSCMF', NULL, '1.0000', '1.0000', '0.00', '', '0', 134, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (362, '00000384', '一元', 'YY', NULL, '1.0000', '1.0000', '1.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (363, '00000385', '奥尔良烤鸡腿', 'AELKJT', NULL, '200.0000', '10.0000', '22.10', '', '0', 133, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (364, '00000386', '烤鸡酱', 'KJJ', NULL, '100.0000', '10.0000', '0.01', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (365, '00000387', '(停购)卤制品精品香辣牛肉150g', 'LZPJPXLNR150G', NULL, '100.0000', '100.0000', '19.80', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (366, '00000388', '(停购)卤制品精品五香牛肉150g', 'LZPJPWXNR150G', NULL, '100.0000', '100.0000', '19.80', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (367, '00000389', '(停购)卤制品香辣牛肚150g', 'LZPXLND150G', NULL, '100.0000', '100.0000', '16.00', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (368, '00000390', '卤制品五香牛肚150g', 'LZPWXND150G', NULL, '100.0000', '100.0000', '16.00', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (369, '00000391', '熟食套餐3', 'SSTC3', NULL, '10.0000', '10.0000', '120.32', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (370, '00000392', '青椒肉丝的肉丝', 'QJRSDRS', NULL, '20.0000', '10.0000', '40.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (371, '00000393', '葱油肉丝的肉丝', 'CYRSDRS', NULL, '20.0000', '10.0000', '40.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (372, '00000394', '烤海带的蔬菜', '*KHDDSC', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, 398, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (373, '00000395', '烤海带的调料', '*KHDDDL', NULL, '20.0000', '10.0000', '10.00', '', '1', 136, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (374, '00000396', '红萝卜条18g', '*HLBT18G', NULL, '20.0000', '10.0000', '20.00', '', '1', 128, NULL, NULL, 395, NULL, '1', '0.980', '0', NULL, '', NULL, NULL, '1', 485, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (375, '00000397', '黄瓜条18g', '*HGT18G', NULL, '20.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 395, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 499, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (376, '00000398', '武网-孜香牛肉', 'WW-ZXNR', NULL, '80.0000', '10.0000', '8.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (377, '00000400', '武网-宫保鸡丁', 'WW-GBJD', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (378, '00000401', '武网-番茄炒蛋', 'WW-FQCD', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (379, '00000402', '粉丝', '*FS', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 402, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (380, '00000403', '武网-哈密瓜', 'WW-HMG', NULL, '100.0000', '1.0000', '3.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (381, '00000404', '武网-冰镇绿豆汤', 'WW-BZLDT', NULL, '100.0000', '10.0000', '2.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (382, '00000405', '武网-醉鸡', 'WW-ZJ', NULL, '100.0000', '10.0000', '8.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (383, '00000406', '武网-糍粑鱼块', 'WW-CBYK', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (384, '00000407', '武网-鱼香肉丝', 'WW-YXRS', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (385, '00000408', '武网-酱板鸭腿', 'WW-JBYT', NULL, '80.0000', '10.0000', '8.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (386, '00000409', '武网-萝卜烧龙骨', 'WW-LBSLG', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (387, '00000410', '武网-青瓜炒肘花', 'WW-QGCZH', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (388, '00000411', '武网-香瓜', 'WW-XG', NULL, '100.0000', '1.0000', '3.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (389, '00000412', '武网-叉烧肉', 'WW-CSR', NULL, '80.0000', '10.0000', '8.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (390, '00000413', '武网-黄瓜烩火腿', 'WW-HGHHT', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (391, '00000414', '鲜肉丸子', 'XRWZ', NULL, '80.0000', '10.0000', '34.88', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (392, '00000415', '武网-孜香鸭块', 'WW-ZXYK', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (393, '00000416', '武网-咕噜肉', 'WW-GLR', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (394, '00000417', '武网-粉蒸肉', 'WW-FZR', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (395, '00000418', '武网-泡椒金针丝', 'WW-PJJZS', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (396, '00000419', '武网-西瓜', 'WW-XG', NULL, '100.0000', '1.0000', '3.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (397, '00000420', '武网-红萝卜烧牛腩', 'WW-HLBSNN', NULL, '80.0000', '10.0000', '8.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (398, '00000421', '武网-香煎剥皮鱼', 'WW-XJBPY', NULL, '80.0000', '10.0000', '5.00', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (399, '00000422', '武网-笋瓜炒肉', 'WW-SGCR', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (400, '00000423', '武网-素熏鱼', 'WW-SXY', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (401, '00000424', '武网-土豆蒸排骨', 'WW-TDZPG', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (402, '00000425', '武网-玉米鸡丁', 'WW-YMJD', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (403, '00000426', '武网-椒盐排条', 'WW-JYPT', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (404, '00000427', '武网-泡椒炒鸭脯', 'WW-PJCYF', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (405, '00000428', '武网-杏鲍菇炒肉', 'WW-XBGCR', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (406, '00000429', '武网-香酥鸡排', 'WW-XSJP', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (407, '00000430', '武网-牛肉沫烧豆腐', 'WW-NRMSDF', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (408, '00000431', '武网-香菇炒肉', 'WW-XGCR', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (409, '00000432', '武网-三杯鸡', 'WW-SBJ', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (410, '00000433', '武网-西芹炒牛肚', 'WW-XQCND', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (411, '00000434', '武网-木须肉', 'WW-MXR', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (412, '00000435', '武网-山药炖排骨', 'WW-SYDPG', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (413, '00000436', '武网-西芹百合', 'WW-XQBH', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (414, '00000437', '武网-毛豆鸡米', 'WW-MDJM', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (415, '00000438', '武网-素吉祥福袋', 'WW-SJXFD', NULL, '80.0000', '10.0000', '8.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (416, '00000439', '武网-火腿烩草鱼丸', 'WW-HTHCYW', NULL, '80.0000', '10.0000', '5.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (417, '00000440', '香辣鱿鱼饭550g', 'XLYYF550G', NULL, '20.0000', '8.0000', '9.50', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (418, '00000441', '香辣鱿鱼', 'XLYY', NULL, '20.0000', '5.0000', '3.00', '爆炒', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (419, '00000442', '腌制香辣鱿鱼', 'YZXLYY', NULL, '20.0000', '8.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (420, '00000443', '酱瓜鸡蛋', '*JGJD', NULL, '20.0000', '8.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (421, '00000444', '手撕包菜', '*SSBC', NULL, '20.0000', '8.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (422, '00000445', '家常豆腐', '*JCDF', NULL, '20.0000', '8.0000', '1.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (423, '00000446', '雪菜肉末', '*XCRM', NULL, '80.0000', '10.0000', '3.00', '', '1', 130, NULL, NULL, 401, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (424, '00000447', '武网-大根碎', 'WW-DGS', NULL, '80.0000', '10.0000', '0.60', '', '0', 132, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (425, '00000448', '武网-蔬菜', 'WW-SC', NULL, '80.0000', '10.0000', '0.60', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (426, '00000449', '武网-半边鸡蛋', 'WW-BBJD', NULL, '80.0000', '10.0000', '0.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (427, '00000450', '武网-福神渍', 'WW-FSZ', NULL, '80.0000', '10.0000', '0.60', '', '0', 132, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (428, '00000451', '(停购)蟹柳花式组合300g', 'XLHSZH300G', NULL, '10.0000', '8.0000', '8.90', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (429, '00000452', '培根中卷', '*PGZJ', NULL, '20.0000', '8.0000', '4.00', '', '1', 131, NULL, NULL, 395, NULL, '0', NULL, '1', '280.08', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (430, '00000453', '蟹柳中卷', '*XLZJ', NULL, '20.0000', '8.0000', '4.00', '', '1', 131, NULL, NULL, 395, NULL, '0', NULL, '1', '280.50', '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (431, '00000454', '蟹柳手握寿司', '*XLSWSS', NULL, '20.0000', '8.0000', '1.00', '', '1', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (432, '00000455', '蛋条手握寿司', '*DTSWSS', NULL, '20.0000', '8.0000', '1.00', '', '1', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (433, '00000456', '土豆西芹沙拉', 'TDXQSL', NULL, '20.0000', '8.0000', '1.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (434, '00000457', '熟食套餐7', 'SSTC7', NULL, '100.0000', '100.0000', '127.36', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (435, '00000458', '叉烧肉', 'CSR', NULL, '100.0000', '100.0000', '33.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (436, '00000459', '泡椒鸭翅', 'PJYC', NULL, '100.0000', '100.0000', '25.20', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (437, '00000460', '武网-雪菜肉末', 'WW-XCRM', NULL, '80.0000', '10.0000', '0.60', '', '0', 129, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (438, '00000461', '玉米粒', '*DYML', NULL, '20.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 496, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (439, '00000462', '卤牛肉(五香味）', 'LNR(WXW）', NULL, '10.0000', '10.0000', '88.00', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (440, '00000463', '熟食套餐10', 'SSTC10', NULL, '10.0000', '10.0000', '198.08', '', '0', 135, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (441, '00000464', '(停购)熏鸭双冬盖浇饭550g', 'XYSDGJF', NULL, '20.0000', '9.0000', '8.90', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (442, '00000465', '烧双冬', '*SSD', NULL, '20.0000', '5.0000', '3.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (443, '00000466', '烤熏鸭脯', '*KXYF', NULL, '20.0000', '5.0000', '2.00', '上下火150度，烤20分钟', '1', 128, NULL, NULL, 398, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (444, '00000467', '青红椒丝', 'QHJS', NULL, '20.0000', '5.0000', '0.50', '150度油温中炸20秒', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 479, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (445, '00000468', '中卷金枪鱼沙拉酱', '*ZJJQYSLJ', NULL, '1.0000', '1.0000', '3.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (446, '00000469', '饭卷甜辣烤肉', 'FJTLKR', NULL, '10.0000', '40.0000', '1.20', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (447, '00000470', '新什锦芥末鱿鱼军舰', '*XSJJMYYJJ', NULL, '0.3610', '10.0000', '1.00', '', '1', 138, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (448, '00000471', '新什锦芥末鱿鱼', '*XSJJMYY', NULL, '100.0000', '10.0000', '1.00', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (449, '00000472', '便民店三荤三素', 'SHSS', NULL, '10.0000', '6.0000', '117.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (450, '00000473', '炸酱40g', 'ZJ40G', NULL, '10.0000', '10.0000', '2.40', '', '0', 128, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (451, '00000474', '便民店白粥', 'BZ', NULL, '20.0000', '2.0000', '6.00', '', '0', 128, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (452, '00000475', '便民店黑米粥', 'HMZ', NULL, '20.0000', '2.0000', '12.00', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (453, '00000476', '便民店三鲜原料80g', 'BMDSXYL80G', NULL, '20.0000', '0.0800', '1.50', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (454, '00000477', '便民店桂花糊', 'GHH', NULL, '20.0000', '2.0000', '12.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (455, '00000478', '便民店银耳汤', 'BMDYET', NULL, '20.0000', '2.0000', '9.60', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (456, '00000479', '便民店绿豆汤', 'BMDLDT', NULL, '20.0000', '2.0000', '9.60', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (457, '00000480', '扬州炒饭的盐饭', 'YZCFDYF', NULL, '15.0000', '15.0000', '50.00', '', '1', 134, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (458, '00000481', '茄汁饭(新)的盐饭', '*QZF(X)DYF', NULL, '15.0000', '15.0000', '50.00', '', '1', 136, NULL, NULL, 395, '1.0', '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (459, '00000482', '茄汁饭的白米饭', '*QZFDBMF', NULL, '15.0600', '15.0600', '50.00', '', '1', 136, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (460, '00000483', '(停购)卤制品酱香猪肚真空称重', 'LZPJXZDZKCZ', NULL, '100.0000', '100.0000', '99.80', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (461, '00000484', '便民店卤牛肉片30g', 'BMDLNRP30G', NULL, '20.0000', '0.0300', '3.50', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (462, '00000485', '便民店炸酱40g', 'BMDZJ40G', NULL, '10.0000', '0.0400', '2.40', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (463, '00000486', '便民店米粉汤底', 'BMDMFTD', NULL, '20.0000', '2.0000', '4.00', '', '0', 130, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (464, '00000487', '便民店宽米粉250g', 'BMDKMF250G', NULL, '20.0000', '0.2500', '1.50', '', '0', NULL, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (465, '00000488', '便民店皮蛋瘦肉粥', 'BMDPDSRZ', NULL, '20.0000', '2.0000', '15.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (466, '00000489', '凤尾鱼', 'FWY', NULL, '1.0000', '1.0000', '35.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (467, '00000490', '龙头鱼', 'LTY', NULL, '1.0000', '1.0000', '35.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (468, '00000491', '汉味油皮香干', 'HWYPXG', NULL, '10.0000', '1.0000', '22.40', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (469, '00000492', '农夫山泉380ml', 'WW-NFSQ380ML', NULL, '1.0000', '1.0000', '2.00', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (470, '00000493', '武网-早餐', 'WW-ZC', NULL, '1.0000', '1.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (471, '00000494', '武网-中餐', 'WW-ZC', NULL, '1.0000', '1.0000', '20.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (472, '00000495', '蛋皮反卷红萝卜条', '*DPFJHLBT', NULL, '100.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (473, '00000496', '蛋皮反卷黄瓜条', '*DPFJHGT', NULL, '100.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (474, '00000497', '(停购)铁板烤鸡花式盒饭560g', 'TBKJHSHF560G', NULL, '20.0000', '8.0000', '9.23', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (475, '00000498', '麻婆鸡排', '*MPJP', NULL, '20.0000', '8.0000', '3.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (476, '00000499', '腌制麻婆鸡排', '*YZMPJP', NULL, '20.0000', '8.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (477, '00000500', '红烧牛肉(散)', 'HSNR(S)', NULL, '10.0000', '1.0000', '79.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (478, '00000501', '肉松金枪鱼粢饭卷170g', 'RSJQYZFJ', NULL, '20.0000', '40.0000', '3.55', '', '0', 131, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (479, '00000502', '油条', '*YT', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.980', '0', NULL, '', NULL, NULL, '1', 472, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (480, '00000503', '(停购)鳕鱼排花式盒饭516g', 'XYPHSHF516G', NULL, '20.0000', '8.0000', '9.34', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (481, '00000504', '鳕鱼排', '*XYP', NULL, '20.0000', '5.0000', '2.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (482, '00000505', '包菜炒粉丝', '*BCCFS', NULL, '20.0000', '8.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (483, '00000506', '火腿玉米粒', '*HTYML', NULL, '20.0000', '8.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (484, '00000507', '红萝卜片', '*HLBP', NULL, '20.0000', '8.0000', '0.30', '焯水', '1', 128, NULL, NULL, 406, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (485, '00000508', '肉米粉丝', '*RMFS', NULL, '20.0000', '8.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (486, '00000509', '卤鸭脖180g(H)', 'LYB180G', NULL, '1.0000', '1.0000', '9.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (487, '00000510', '香辣锁骨(锁鲜装)70g', 'XLSG(SXZ)70G', NULL, '1.0000', '1.0000', '5.69', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (488, '00000511', '香辣鸭翅(锁鲜装)70g', 'XLYC(SXZ)70G', NULL, '1.0000', '1.0000', '5.69', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (489, '00000512', '香辣脱骨鸭掌(锁鲜装)70g', 'XLTGYZ(SXZ)70G', NULL, '1.0000', '1.0000', '5.69', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (490, '00000513', '卤味牛皮干(锁鲜装)70g', 'LWNPG(SXZ)70G', NULL, '1.0000', '1.0000', '3.12', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (491, '00000514', '卤味干豆角(锁鲜装)70g', 'LWGDJ(SXZ)70G', NULL, '1.0000', '1.0000', '3.12', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (492, '00000515', '卤味豆油皮(锁鲜装)80g', 'LWDYP(SXZ)80G', NULL, '1.0000', '1.0000', '3.12', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (493, '00000516', '缤纷什锦组合黄瓜条', '*BFSJZHHGT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (494, '00000517', '缤纷什锦组合红萝卜条', 'BFSJZHHLBT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (495, '00000518', '新什锦总汇方腿条', '*XSJZHFTT', NULL, '10.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (496, '00000519', '新什锦总汇黄瓜条', '*XSJZHHGT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (497, '00000520', '新什锦总汇蛋糕条', 'XSJZHDGT', NULL, '20.0000', '5.0000', '1.00', '', '1', 136, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (498, '00000521', '新什锦总汇蟹肉棒', 'XSJZHXRB', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (499, '00000522', '缤纷什锦组合蟹肉棒', '*BFSJZHXRB', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (500, '00000523', '缤纷什锦组合绿河童寿司芯', '*BFSJZHLHTSSX', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (501, '00000524', '缤纷什锦组合方腿', '*BFSJZHFT', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (502, '00000525', '新什锦总汇干瓢条', 'XSJZHGPT', NULL, '20.0000', '5.0000', '0.50', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (503, '00000526', '新什锦总汇三彩蛋卷', '*XSJZHSCDJ', NULL, '20.0000', '5.0000', '0.50', '', '1', 137, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (504, '00000527', '芝士火炬组合蟹肉棒', 'ZSHJZHXRB', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (505, '00000528', '芝士火炬组合方腿', 'ZSHJZHFT', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (506, '00000529', '芝士火炬组合红萝卜条', 'ZSHJZHHLBT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (507, '00000530', '芝士火炬组合黄瓜条', '*ZSHJZHHGT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (508, '00000531', '芝士火炬组合干瓢', '*ZSHJZHGP', NULL, '20.0000', '5.0000', '0.50', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (509, '00000532', '双馅细卷组合方腿', 'SXXJZHXRB', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (510, '00000533', '双馅细卷组合蛋糕条', 'SXXJZHDGT', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (511, '00000534', '双馅细卷组合泽庵寿司芯', 'SXXJZHZASSX', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (512, '00000535', '双馅细卷组合黄瓜条', '*SXXJZHHGT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (513, '00000536', '双馅细卷组合干瓢', 'SXXJZHGP', NULL, '20.0000', '5.0000', '0.50', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (514, '00000537', '蟹柳花式组合蟹肉棒', '*XLHSZHXRB', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (515, '00000538', '蟹柳花式组合干瓢', 'XLHSZHGP', NULL, '20.0000', '5.0000', '0.50', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (516, '00000539', '蟹柳花式组合黄瓜条', '*XLHSZHHGT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (517, '00000540', '蟹柳花式组合蛋糕条', '*XLHSZHDGT', NULL, '20.0000', '5.0000', '1.00', '', '1', 136, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (518, '00000541', '蟹柳花式组合培根', '*XLHSZHPG', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (519, '00000542', '蟹柳花式组合红萝卜条', '*XLHSZHHLBT', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (520, '00000543', '蟹柳花式组合蟹柳片', '*XLHSZHXLP', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (521, '00000544', '蟹柳花式组合蛋糕片', '*XLHSZHDGP', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (522, '00000545', '金枪鱼中卷寿司蟹肉棒', '*JQYZJSSXRB', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (523, '00000546', '照烧鸡肉饭卷鸡块25g', '*ZSJRFJJK25G', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 398, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (524, '00000547', '香炸排条饭卷炸排条30g', '*XZPTFJZPT30G', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, 397, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (525, '00000548', '至尊饭团（奥尔良鸡腿）鸡腿', '*ZZFT（AELJT）JT', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, 397, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (526, '00000549', '卤制品五香牛肉散', 'LZPWXNRS', NULL, '20.0000', '20.0000', '95.00', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (527, '00000550', '(停购)卤制品香辣牛肉散', 'LZPXLNRS', NULL, '20.0000', '20.0000', '110.40', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (528, '00000551', '卤制品五香牛肉150g', 'LZPWXNR150G', NULL, '20.0000', '20.0000', '19.00', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (529, '00000552', '肉丸子', '*RWX', NULL, '20.0000', '20.0000', '28.80', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (530, '00000553', '珍珠丸子', '*ZZWZ', NULL, '20.0000', '20.0000', '32.08', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (531, '00000554', '五香牛肉散', '*WXNRS', NULL, '20.0000', '20.0000', '110.40', '', '1', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (532, '00000555', '香辣牛肚散', '*XLNDS', NULL, '20.0000', '20.0000', '87.68', '', '1', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (533, '00000556', '芝士火炬组合蛋糕条', 'ZSHJZHDGT', NULL, '20.0000', '5.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (534, '00000557', '(停购)牛三鲜火锅', 'NSXHG', NULL, '100.0000', '2.0000', '77.20', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (535, '00000558', '红油牛肚', 'HYND', NULL, '10.0000', '2.0000', '84.66', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (536, '00000559', '(停购)红烧猪蹄', 'HSZT', NULL, '10.0000', '2.0000', '54.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (537, '00000560', '红烧鸭块', 'HSYK', NULL, '10.0000', '2.0000', '29.80', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (538, '00000561', '沸水虾仁', '*FSXR', NULL, '10.0000', '5.0000', '2.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 418, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (539, '00000562', '沸水青豆', '*FSQD', NULL, '10.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (540, '00000563', '红烧羊肉（散）', 'HSYR（S）', NULL, '20.0000', '10.0000', '100.00', '', '0', 130, NULL, NULL, 399, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (541, '00000564', '酥炸鱼块', 'SZYK', NULL, '10.0000', '2.0000', '31.80', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (542, '00000565', '水煮肉片双层盒饭550克', 'SZRPSCHF550K', NULL, '20.0000', '5.0000', '7.72', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (543, '00000566', '腌制肉片', '*YZRP', NULL, '20.0000', '5.0000', '1.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (544, '00000567', '千张黄豆芽', '*QZHDY', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 452, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (545, '00000568', '辣椒油', '*LJY', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.980', '0', NULL, '', NULL, NULL, '1', 449, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (546, '00000569', '水煮肉片', '*SZRP', NULL, '20.0000', '5.0000', '1.50', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 451, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (547, '00000570', '水煮肉片汤汁', '*SZRPTZ', NULL, '20.0000', '5.0000', '0.10', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 450, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (548, '00000571', '樱花军舰组合', 'YHJJZH', NULL, '20.0000', '10.0000', '8.46', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (549, '00000572', '樱花反卷', '*YHFJ', NULL, '20.0000', '20.0000', '1.00', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (550, '00000573', '樱花军舰组合红鱼子反卷', '*YHJJZHHYZFJ', NULL, '20.0000', '20.0000', '1.00', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (551, '00000574', '樱花军舰组合青海苔反卷', '*YHJJZHQHTFJ', NULL, '20.0000', '10.0000', '1.00', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (552, '00000575', '玉米军舰卷', '*YMJJJ', NULL, '20.0000', '5.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (553, '00000576', '八爪鱼军舰', '*BZYJJ', NULL, '20.0000', '5.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (554, '00000577', '味付军舰', '*WFJJ', NULL, '20.0000', '5.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (555, '00000578', '樱花军舰组合黄瓜条', '*YHJJZHHGT', NULL, '20.0000', '10.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (556, '00000579', '樱花军舰组合蛋糕条', '*YHJJZHDGT', NULL, '20.0000', '10.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (557, '00000580', '樱花军舰组合方腿条', '*YHJJZHFTT', NULL, '20.0000', '10.0000', '1.00', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (558, '00000581', '樱花军舰组合蟹肉棒', '*YHJJZHXRB', NULL, '20.0000', '10.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (559, '00000582', '樱花军舰组合干瓢', '*YHJJZHGP', NULL, '20.0000', '10.0000', '0.50', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (560, '00000583', '香辣牛肉三角饭团', 'XLNRSJFT', NULL, '20.0000', '20.0000', '2.27', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (561, '00000584', '香辣牛肉酱', '*XLNRJ', NULL, '20.0000', '50.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 415, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (562, '00000585', '(停购)韩式什锦拌饭', 'HSSGBF', NULL, '20.0000', '5.0000', '8.73', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (563, '00000586', '石锅拌饭肉末', '*SGBFRM', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (564, '00000587', '黄豆芽三丝', '*HDYSS', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (565, '00000588', '缤纷军舰组合', 'BFJJZH', NULL, '20.0000', '5.0000', '6.35', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (566, '00000589', '油炸鱼丸', 'YZYW', NULL, '20.0000', '5.0000', '21.30', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (567, '00000590', '良品孜香牛肉套餐', 'ZXNRTC', NULL, '100.0000', '100.0000', '11.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (568, '00000591', '良品泡椒滑鸡套餐', 'PJHJTC', NULL, '100.0000', '100.0000', '11.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (569, '00000592', '良品鱼香肉丝套餐', 'YXRSTC', NULL, '100.0000', '100.0000', '9.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (570, '00000593', '西芹芹炒香干', 'XQQCXG', NULL, '20.0000', '5.0000', '2.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (571, '00000594', '包菜', 'BC', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (572, '00000595', '炸土豆块', '*ZTDK', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (573, '00000596', '孜然土豆片', '*ZRTDP', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (574, '00000597', '6元学生餐', '6YXSC', NULL, '1.0000', '1.0000', '6.00', '', '0', 132, NULL, NULL, 395, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (575, '00000598', '麻辣香锅饭530g', 'MLXGF530G', NULL, '10.0000', '8.0000', '8.56', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (576, '00000599', '麻辣香锅', '*MLXG', NULL, '10.0000', '5.0000', '4.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 466, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (577, '00000600', '西芹炒胡萝卜', '*XQCHLB', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.500', '0', NULL, '', NULL, NULL, '1', 465, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (578, '00000601', '火锅底料', '*HGDL', NULL, '20.0000', '5.0000', '7.32', '', '1', 128, NULL, NULL, 399, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (579, '00000602', '麻辣香锅鸡腿', '*MLXGJT', NULL, '20.0000', '5.0000', '0.50', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (580, '00000603', '(停购)自制藕夹', 'ZZOJ', NULL, '100.0000', '8.0000', '21.60', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (581, '00000604', '黑椒鸭胸散', 'HJYXS', NULL, '100.0000', '2.5000', '26.88', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (582, '00000606', '熟食套餐8', 'SSTC8', NULL, '10.0000', '10.0000', '179.36', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (583, '00000607', '(停购)酸汤三鲜盒饭', 'STSXHF', NULL, '20.0000', '20.0000', '9.85', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (584, '00000608', '酸汤三鲜', '*STSX', NULL, '20.0000', '20.0000', '5.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (585, '00000609', '三色毛豆米', '*SSMDM', NULL, '20.0000', '20.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (586, '00000610', '鱼糕', '*YG', NULL, '20.0000', '20.0000', '1.00', '', '1', 128, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (587, '00000611', '熟食草鱼丸(盒)', 'SSCYW(H)', NULL, '0.3000', '0.3000', '10.00', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (588, '00000612', '熟食套餐12', 'SSTC12', NULL, '4.0000', '4.0000', '151.04', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (589, '00000613', '(停购)哈利路鸭(酱卤肉制品)', 'HLLY(JLRZP)', NULL, '1.0000', '1.0000', '20.00', '', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (590, '00000614', '(停购)五香牛肉切片150g', 'WXNRQP150G', NULL, '10.0000', '0.1500', '15.84', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (591, '00000615', '(停购)五香牛肚切片150g', 'WXNDQP150G', NULL, '10.0000', '0.1500', '15.84', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (592, '00000616', '真空装卤肉方', 'ZKZLRF', NULL, '10.0000', '1.0000', '53.46', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (593, '00000617', '真空装卤耳片', 'ZKZLEP', NULL, '10.0000', '1.0000', '86.40', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (594, '00000618', '真空装汉味猪皮', 'ZKZHWZP', NULL, '10.0000', '1.0000', '28.80', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (595, '00000619', '福嘉家常豆腐380g', 'FJJCDF380G', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (596, '00000620', '福嘉臭干子300g', 'FJCGZ300G', NULL, '1.0000', '1.0000', '2.72', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (597, '00000621', '福嘉五香素鸡250g', 'FJWXSJ250G', NULL, '1.0000', '1.0000', '3.10', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (598, '00000622', '福嘉柴火豆腐420g', 'FJCHDF420G', NULL, '1.0000', '1.0000', '3.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (599, '00000623', '福嘉超嫩豆腐350g', 'FJCNDF350G', NULL, '1.0000', '1.0000', '1.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (600, '00000624', '福嘉油皮香干200g', 'FJYPXG200G', NULL, '1.0000', '1.0000', '2.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (601, '00000625', '福嘉薄千张200g', 'FJBQZ200G', NULL, '1.0000', '1.0000', '3.10', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (602, '00000626', '福嘉千张结200g', 'FJQZJ200G', NULL, '1.0000', '1.0000', '3.95', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (603, '00000627', '福嘉壹张干130g', 'FJYZG130G', NULL, '1.0000', '1.0000', '3.55', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (604, '00000628', '福嘉霉千张280g', 'FJMQZ280G', NULL, '1.0000', '1.0000', '3.90', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (605, '00000629', '福嘉千叶豆腐400g', 'FJQYDF400G', NULL, '1.0000', '1.0000', '5.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (606, '00000630', '福嘉豆油皮80g', 'FJDYP80G', NULL, '1.0000', '1.0000', '5.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (607, '00000631', '清水面筋200g', 'QSMJ200G', NULL, '1.0000', '0.2000', '3.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (608, '00000632', '中百美膳梅菜扣肉', 'ZBMSMCKR', NULL, '1.0000', '0.3500', '15.84', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (609, '00000633', '中百美膳粉蒸肉', 'ZBMSFZR', NULL, '1.0000', '0.3500', '13.44', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (610, '00000634', '现打中餐-酱香粉蒸肉(Z)', 'XDZC-JXFZR(Z)', NULL, '10.0000', '1.0000', '35.65', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (611, '00000635', '现打中餐-糍粑鱼(Z)', 'XDZC-CBY(Z)', NULL, '10.0000', '1.0000', '63.16', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (612, '00000636', '现打中餐-番茄炖牛肉(Z)', 'XDZC-FQDNR(Z)', NULL, '10.0000', '1.0000', '41.58', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (613, '00000637', '现打中餐-香菇烧鸡腿块(Z)', 'XDZC-XGSJTK(Z)', NULL, '10.0000', '1.0000', '33.95', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (614, '00000638', '现打中餐-啤酒鸭(Z)', 'XDZC-PJY(Z)', NULL, '10.0000', '1.0000', '12.83', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (615, '00000639', '现打中餐-鱼香肉丝(Z)', 'XDZC-YXRS(Z)', NULL, '10.0000', '1.0000', '17.60', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (616, '00000640', '现打中餐-西芹炒鸭胸片(Z)', 'XDZC-XQCYXP(Z)', NULL, '10.0000', '1.0000', '19.16', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (617, '00000641', '现打中餐-胡萝卜烧龙骨(Z)', 'XDZC-HLBSLG(Z)', NULL, '10.0000', '1.0000', '20.46', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (618, '00000642', '现打中餐-尖椒炒笋瓜(Z)', 'XDZC-JJCSG(Z)', NULL, '10.0000', '1.0000', '7.09', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (619, '00000643', '现打中餐-麻婆豆腐(Z)', 'XDZC-MPDF(Z)', NULL, '10.0000', '1.0000', '5.61', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (620, '00000644', '现打中餐-番茄鸡蛋(Z)', 'XDZC-FQJD(Z)', NULL, '10.0000', '1.0000', '12.18', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (621, '00000645', '现打中餐-酸辣大包菜', 'XDZC-SLDBC', 45, '10.0000', '1.0000', '6.39', '', '0', 50, 43, NULL, 102, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, '2018-02-23 23:44:39', 'admin', NULL);
INSERT INTO `prd_data` VALUES (622, '00000646', '公交盒饭-9元', '9YGJHF', NULL, '10.0000', '1.0000', '9.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (623, '00000647', '罗森黑米粥', 'LSHMZ', NULL, '10.0000', '0.2800', '1.93', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (624, '00000648', '罗森八宝粥', 'LSBBZ', NULL, '10.0000', '0.2800', '2.17', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (625, '00000649', '(停购)豆花鱼盒饭', 'DHYHF', NULL, '10.0000', '1.0000', '9.18', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (626, '00000650', '龙利鱼丁', '*LLYD', NULL, '10.0000', '10.0000', '4.00', '', '1', 133, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (627, '00000651', '豆花', '*DH', NULL, '10.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (628, '00000652', '日式炸鸡饭', 'RSZJF', NULL, '10.0000', '1.0000', '7.99', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (629, '00000654', '日式鸡块', '*RSJK', NULL, '10.0000', '10.0000', '2.00', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (630, '00000655', '年味大礼包Z(熟卤肉制品)', 'NWDLBZ(SLRZP)', NULL, '10.0000', '10.0000', '170.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (631, '00000656', '五香猪耳片散', 'WXZEPS', NULL, '10.0000', '1.0000', '88.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (632, '00000657', '烟熏鸭胸散', 'YXYXS', NULL, '10.0000', '1.0000', '26.88', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (633, '00000658', '武网10元套餐', 'WW10YZC', NULL, '100.0000', '10.0000', '15.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (634, '00000659', '武网20元套餐', 'WW20YTC', NULL, '100.0000', '10.0000', '25.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (635, '00000660', '新华西礼包', 'XHXLB', NULL, '100.0000', '100.0000', '248.00', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (636, '00000661', '富贵满堂大礼包', 'FGMTDLB', NULL, '100.0000', '100.0000', '188.00', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (637, '00000662', '中百大厨房新华西礼包', 'ZBDCFXHXLB', NULL, '10.0000', '1.0000', '248.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (638, '00000663', '10元盒饭套餐', '10YHFTC', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (639, '00000664', '12元盒饭套餐', '12YHFTC', NULL, '100.0000', '10.0000', '12.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (640, '00000665', '15元盒饭套餐', '15YHFTC', NULL, '100.0000', '10.0000', '15.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (641, '00000666', '18元盒饭套餐', '18YHFTC', NULL, '100.0000', '15.0000', '18.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (642, '00000667', '（停用）水煮肉片双层盒饭550克', '#SZRPSCHF550K', NULL, '20.0000', '5.0000', '0.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (643, '00000668', '（停用）韩式什锦拌饭', '#HSSGBF', NULL, '20.0000', '5.0000', '8.73', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (644, '00000669', '（停用)麻辣香锅饭530g', '#MLXGF530G', NULL, '20.0000', '8.0000', '8.56', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (645, '00000670', '#*千张黄豆芽', '*QZHDY', NULL, '20.0000', '5.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (646, '00000671', '#*黄豆芽三丝', '#*HDYSS', NULL, '20.0000', '5.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (647, '00000672', '#*麻辣香锅', '#*MLXG', NULL, '20.0000', '5.0000', '4.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (648, '00000673', '罗森团购盒饭', 'LSTGHF', NULL, '10.0000', '0.6550', '16.64', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (649, '00000674', '甜片牛奶吐司95g(Z)', 'TPNNTS95G(Z)', NULL, '1.0000', '1.0000', '4.13', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (650, '00000675', '布利欧吐司75g(Z)', 'BLOTS75G(Z)', NULL, '1.0000', '1.0000', '3.64', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (651, '00000676', '红豆沙吐司110g(Z)', 'HDSTS110G(Z)', NULL, '1.0000', '1.0000', '3.64', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (652, '00000677', '丹麦草莓奶油面包70g', 'DMCMNYMB70G', NULL, '1.0000', '1.0000', '3.85', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (653, '00000678', '色拉肉松面包90g', 'SLRSMB90G', NULL, '1.0000', '1.0000', '4.13', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (654, '00000679', '丹麦芝士面包90g', 'DMZSMB90G', NULL, '1.0000', '1.0000', '4.55', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (655, '00000680', '海绵巧克力卷85g', 'HMQKLJ85G', NULL, '1.0000', '1.0000', '4.55', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (656, '00000681', '海绵小蛋糕140g', 'HMXDG140G', NULL, '1.0000', '1.0000', '5.61', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (657, '00000682', '酥皮夹心蛋糕100g', 'SPJXDG100G', NULL, '1.0000', '1.0000', '3.64', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (658, '00000683', '(停购)茄汁鱼柳双色饭', 'QZYLSSF', NULL, '10.0000', '0.4450', '8.80', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (659, '00000684', '茄汁鱼柳', '*QZYL', NULL, '10.0000', '10.0000', '3.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (660, '00000685', '莴苣炒培根', '*WJCPG', NULL, '10.0000', '10.0000', '1.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (661, '00000686', '龙利鱼柳', '*LLYL', NULL, '10.0000', '10.0000', '2.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (662, '00000687', '豆沙包3个装240g', 'DSB3GZ240G', NULL, '1.0000', '1.0000', '2.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (663, '00000689', '肉条', '*RT', NULL, '10.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (664, '00000690', '双菇卤肉饭540g', 'SGLRF540G', NULL, '9.0000', '1.0000', '8.26', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (665, '00000691', '双菇卤肉', '*SGLR', NULL, '40.0000', '20.0000', '2.40', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 455, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (666, '00000692', '孜然梅条饭卷170g', 'ZRMTFJ170G', NULL, '40.0000', '40.0000', '3.40', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (667, '00000693', '腌制孜然肉条', '*YZZRRT', NULL, '20.0000', '20.0000', '1.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (668, '00000694', '孜然肉条', '*ZRRT', NULL, '20.0000', '10.0000', '1.20', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 414, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (669, '00000596', '孜然土豆片', '*ZRTDP', NULL, '20.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 413, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (670, '00000696', '联营销售', 'LYXS', NULL, '10.0000', '1.0000', '1.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (671, '00000697', '黑椒牛柳炒面', 'HJNRCYM', NULL, '20.0000', '10.0000', '8.91', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (672, '00000698', '黑椒意面', 'HJYM', NULL, '20.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, 402, NULL, '1', '0.940', '0', NULL, '', NULL, NULL, '1', 425, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (673, '00000699', '洋葱青红椒', '*YCQHJ', NULL, '20.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', 470, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (674, '00000700', '四荤四素', 'SHSS', NULL, '10.0000', '1.0000', '156.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (675, '00000701', '莲藕烧', 'LOS', NULL, '1.0000', '1.0000', '1.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (676, '00000702', '脆骨豆腐', 'CGDF', NULL, '1.0000', '1.0000', '1.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (677, '00000703', '鱼籽仙贝', 'YZXB', NULL, '1.0000', '1.0000', '1.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (678, '00000704', '黄金玉米棒', 'HJYMB', NULL, '1.0000', '1.0000', '1.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (679, '00000705', '竹轮鸡肉卷', 'ZLJRJ', NULL, '1.0000', '1.0000', '1.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (680, '00000706', '脆骨麻花', 'CGMH', NULL, '1.0000', '1.0000', '1.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (681, '00000707', '牛肠串', 'NCC', NULL, '1.0000', '1.0000', '1.35', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (682, '00000708', '牛肉串', 'NRC', NULL, '1.0000', '1.0000', '1.94', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (683, '00000709', '牛肚串', 'NDC', NULL, '1.0000', '1.0000', '1.94', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (684, '00000710', '丹麦肉松纽纹面包100g', 'DMRSNWMB100G', NULL, '1.0000', '1.0000', '4.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (685, '00000711', '缤纷QQ麻薯(四种口味)120g', 'BFQQMS(SZKW)120G', NULL, '1.0000', '1.0000', '5.61', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (686, '00000712', '香蕉奶昔蛋糕100g', 'XJNXDG100G', NULL, '1.0000', '1.0000', '6.04', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (687, '00000713', '冰皮月亮蛋糕（芒果）90g', 'BPYLDG（MG）90G', NULL, '1.0000', '1.0000', '7.79', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (688, '00000714', '牛油排包180g', 'NYPB180G', NULL, '1.0000', '1.0000', '5.08', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (689, '00000715', '肉松吐司385g', 'RSTS385G', NULL, '1.0000', '1.0000', '6.56', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (690, '00000716', '香醇蛋糕200g', 'XCDG200G', NULL, '1.0000', '1.0000', '6.04', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (691, '00000717', '香草蛋糕5个装60g', 'XCDG5GZ60G', NULL, '1.0000', '1.0000', '3.94', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (692, '00000719', '巧克力慕斯', 'QKLMS', NULL, '1.0000', '1.0000', '7.79', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (693, '00000720', '分享蛋糕', 'FXDG', NULL, '1.0000', '1.0000', '7.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (694, '00000721', '冰心巧克力蛋糕80g', 'BXQKLDG80G', NULL, '1.0000', '1.0000', '7.79', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (695, '00000722', '冰心芒果蛋糕90g', 'BXMGDG90G', NULL, '1.0000', '1.0000', '7.79', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (696, '00000723', '牛筋串', 'NJC', NULL, '1.0000', '1.0000', '1.94', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (697, '00000724', '肉筋串', 'RJC', NULL, '1.0000', '1.0000', '1.94', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (698, '00000725', '(停购)虾扯蛋雪菜炒饭340g', 'XCDXCCF340G', NULL, '20.0000', '20.0000', '6.43', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (699, '00000726', '雪菜鸡丁炒饭', 'XCJDCF', 45, '20.0000', '10.0000', '1.50', '', '0', 50, 41, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, '2018-02-01 16:33:18', 'admin', NULL);
INSERT INTO `prd_data` VALUES (700, '00000727', '沸水培根丝', '*FSPGS', NULL, '20.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (701, '00000728', '蒸盐饭', '*ZYF', NULL, '15.0000', '15.0000', '50.00', '', '1', 134, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (702, '00000729', '沸水虾仁（虾扯蛋）', '*FSXR（XCD）', NULL, '20.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (703, '00000730', '腌制鸡丁（虾扯蛋）', '*YZJD（XCD）', NULL, '20.0000', '10.0000', '0.50', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (704, '00000731', '煎鸡蛋（虾扯蛋）', '*JJD（XCD）', NULL, '0.0400', '1.0000', '1.00', '', '1', 134, NULL, NULL, 403, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (705, '00000732', '腌制鸡丝（辣子鸡）', '*YZJS（LZJ）', NULL, '20.0000', '20.0000', '0.50', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (706, '00000733', '唐扬鸡块（饭团用）', '*TYJK（FTY）', NULL, '3.0000', '3.0000', '1.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 417, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (707, '00000734', '腌制唐扬鸡块15g（饭团用）', '*YZTYJK15G（FTY）', NULL, '5.0000', '5.0000', '0.80', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (708, '00000735', '卤藕180g（H）', 'LO180G（H）', NULL, '1.0000', '1.0000', '5.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (709, '00000736', '卤豆干180g(H)', 'LDG180G(H)', NULL, '1.0000', '1.0000', '5.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (710, '00000737', '卤豆油皮180g(H)', 'LDYP180G(H)', NULL, '1.0000', '1.0000', '5.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (711, '00000738', '卤鸭肫180g（H）', 'LYZ180G（H）', NULL, '1.0000', '1.0000', '17.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (712, '00000739', '卤鸭掌180g（H）', 'LYZ180G（H）', NULL, '1.0000', '1.0000', '13.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (713, '00000740', '卤鸭翅180g（H）', 'LYC180G（H）', NULL, '1.0000', '1.0000', '9.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (714, '00000741', '香辣凤爪180g（H）', 'XLFZ180G（H）', NULL, '1.0000', '1.0000', '13.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (715, '00000742', '卤花生米（H）', 'LHSM（H）', NULL, '1.0000', '1.0000', '5.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (716, '00000743', '卤干豆角（H）', 'LGDJ（H）', NULL, '1.0000', '1.0000', '5.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (717, '00000744', '香辣凤尖180g(H)', 'XLFJ180G(H)', NULL, '1.0000', '1.0000', '10.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (718, '00000745', '香辣鸭锁骨180g(H)', 'XLYSG180G(H)', NULL, '1.0000', '1.0000', '8.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (719, '00000746', '肉松餐包110g', 'RSCB110G', NULL, '4.0000', '4.0000', '3.68', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (720, '00000747', '放心宽米粉600g', 'FXKMF600G', NULL, '30.0000', '30.0000', '3.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (721, '00000748', '红豆小餐包140g', 'HDXCB140G', NULL, '10.0000', '10.0000', '3.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (722, '00000749', '虎皮瑞士卷130g', 'HPRSJ130G', NULL, '10.0000', '10.0000', '5.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (723, '00000750', '抹茶瑞士卷110g', 'MCRSJ110G', NULL, '10.0000', '10.0000', '4.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (724, '00000751', '香草瑞士卷110g', 'XCRSJ110G', NULL, '10.0000', '10.0000', '4.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (725, '00000752', '加州提子排包200g', 'JZTZPB200G', NULL, '10.0000', '10.0000', '5.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (726, '00000753', '鲜奶吐司180g', 'XNTS180G', NULL, '10.0000', '10.0000', '5.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (727, '00000754', '毛毛虫120g', 'MMC120G', NULL, '10.0000', '10.0000', '4.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (728, '00000755', '牛奶棒130g', 'NNB130G', NULL, '10.0000', '10.0000', '4.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (729, '00000756', '散装荞麦馒头称重', 'SZQMMTCZ', NULL, '4.0000', '4.0000', '8.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (730, '00000757', '散装20g黑米馒头称重', 'SZ20GHMMTCZ', NULL, '4.0000', '4.0000', '9.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (731, '00000758', '紫薯面发糕', 'ZSMFG', NULL, '6.0000', '3.0000', '9.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (732, '00000759', '咖喱土豆包3个装240g', 'KLTDB3GZ240G', NULL, '10.0000', '10.0000', '3.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (733, '00000760', '铁锅馒头', 'TGMT', NULL, '10.0000', '10.0000', '1.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (734, '00000761', '枣泥蛋糕4个装130g', 'ZNDG4GZ130G', NULL, '10.0000', '10.0000', '4.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (735, '00000762', '法棒230g', 'FB230G', NULL, '10.0000', '10.0000', '3.90', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (736, '00000763', '红豆酥菠萝250g', 'HDSBL250G', NULL, '10.0000', '10.0000', '4.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (737, '00000764', '肉松蛋夹3个装120g', 'RSDJ3GZ120G', NULL, '10.0000', '10.0000', '4.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (738, '00000765', '椰香奶棒190g', 'YXNB190G', NULL, '10.0000', '10.0000', '4.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (739, '00000766', '芝士条80g', 'ZST80G', NULL, '10.0000', '10.0000', '3.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (740, '00000767', '蒸皮蛋', '*ZPD', NULL, '20.0000', '10.0000', '0.50', '', '1', 130, NULL, NULL, 396, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (741, '00000768', '皮蛋粥的粥', '*PDZDZ', NULL, '100.0000', '20.0000', '15.00', '', '1', 130, NULL, NULL, 405, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 404, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (742, '00000769', '美膳-皮蛋瘦肉粥450g', 'PDSRZ(KG)', NULL, '20.0000', '5.0000', '5.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (743, '00000770', '红豆粥', '*HDZ', NULL, '100.0000', '10.0000', '15.00', '', '1', 130, NULL, NULL, 405, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (744, '00000771', '便民银耳汤', 'YET(KG)', NULL, '20.0000', '10.0000', '9.60', '', '0', 135, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (745, '00000772', '美膳-银耳汤', 'YET450G', NULL, '20.0000', '10.0000', '3.00', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (746, '00000773', '椰子吐司385g', 'YZTS385G', NULL, '1.0000', '1.0000', '6.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (747, '00000774', '黑芝麻吐司290g', 'HZMTS290G', NULL, '1.0000', '1.0000', '7.10', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (748, '00000775', '菠萝餐包2个装75g', 'BLCB2GZ75G', NULL, '1.0000', '1.0000', '1.78', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (749, '00000776', '盒装肉松卷200g', 'HZRSJ200G', NULL, '1.0000', '1.0000', '6.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (750, '00000777', '蜂蜜蛋糕85g', 'FMDG85G', NULL, '1.0000', '1.0000', '2.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (751, '00000778', '香辣虾球180g（H）', 'XLXQ180G（H）', NULL, '1.0000', '1.0000', '16.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (752, '00000779', '卤鸭头3个装(H)', 'LYT3GZ(H)', NULL, '1.0000', '1.0000', '12.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (753, '00000780', '(停购)干豆角烧肉饭480g', 'GDJSRF480G', NULL, '20.0000', '10.0000', '8.91', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (754, '00000781', '红烧肉（干豆角烧肉）', '*HSR（GDJSR）', NULL, '20.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (755, '00000782', '干豆角', '*GDJ', NULL, '20.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (756, '00000783', '糖色', '*TS', NULL, '20.0000', '10.0000', '0.20', '', '1', 128, NULL, NULL, 401, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (757, '00000784', '14元盒饭套餐', '14YHFTC', NULL, '10.0000', '1.0000', '14.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (758, '00000785', '红鱼子军舰', '*HYZJJ', NULL, '20.0000', '10.0000', '1.00', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (759, '00000786', '黑米粥', '*HMZ', NULL, '100.0000', '20.0000', '15.00', '', '1', 130, NULL, NULL, 405, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 402, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (760, '00000787', '藕粉水(黑米粥用)', '*OFS', NULL, '20.0000', '10.0000', '0.50', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (761, '00000788', '鲁磨黑米粥', 'LMHMZ', NULL, '20.0000', '10.0000', '2.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (762, '00000789', '八宝粥', '*BBZ', NULL, '100.0000', '10.0000', '1.00', '', '1', 130, NULL, NULL, 405, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 401, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (763, '00000790', '红豆黑米莲子花生', '*HDHMLZHS', NULL, '20.0000', '20.0000', '1.00', '', '1', 130, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (764, '00000791', '鲁磨八宝粥', 'LMBBZ', NULL, '20.0000', '10.0000', '2.11', '', '0', 131, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (765, '00000792', '卤鸭肠180g（H）', 'LYC180G（H）', NULL, '1.0000', '1.0000', '12.10', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (766, '00000793', '卤鸭腿235g（H）', 'LYT235G（H）', NULL, '1.0000', '1.0000', '11.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (767, '00000794', '新宫保鸡丁盖浇饭', 'XGBJDGJF', NULL, '10.0000', '1.0000', '8.35', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (768, '00000795', '宫保鸡丁', '*GBJD', NULL, '50.0000', '10.0000', '3.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 448, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (769, '00000796', '炒蛋丝', 'CDS', NULL, '10.0000', '1.0000', '0.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.940', '0', NULL, '', NULL, NULL, '1', 446, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (770, '00000797', '盐水西兰花', '*YSXLH', NULL, '10.0000', '1.0000', '0.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (771, '00000798', 'J白萝卜', 'JBLB', NULL, '1.0000', '1.0000', '1.59', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (772, '00000799', 'J红萝卜', 'JHLB', NULL, '1.0000', '1.0000', '3.38', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (773, '00000800', 'J红薯', 'J', NULL, '1.0000', '1.0000', '3.71', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (774, '00000801', 'J土豆', 'JTD', NULL, '1.0000', '1.0000', '4.59', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (775, '00000802', 'J大莲藕', 'JDLO', NULL, '1.0000', '1.0000', '5.85', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (776, '00000803', 'J蒜苗', 'JSM', NULL, '1.0000', '1.0000', '20.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (777, '00000804', 'J西芹', 'JXQ', NULL, '1.0000', '1.0000', '4.16', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (778, '00000805', 'J净莴苣', 'JJWJ', NULL, '1.0000', '1.0000', '7.26', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (779, '00000806', 'J黄豆芽', 'JHDY', NULL, '1.0000', '1.0000', '3.64', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (780, '00000807', 'J绿豆芽', 'JLDY', NULL, '1.0000', '1.0000', '3.90', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (781, '00000808', 'J山药', 'JSY', NULL, '1.0000', '1.0000', '4.68', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (782, '00000809', 'J小葱', 'JXC', NULL, '1.0000', '1.0000', '10.71', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (783, '00000810', 'J大葱', 'JDC', NULL, '1.0000', '1.0000', '5.20', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (784, '00000811', 'J大蒜', 'JDS', NULL, '1.0000', '1.0000', '13.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (785, '00000812', 'J蒜头', 'JST', NULL, '1.0000', '1.0000', '19.50', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (786, '00000813', 'J洋葱', 'JYC', NULL, '1.0000', '1.0000', '3.64', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (787, '00000814', 'J生姜', 'JSJ', NULL, '1.0000', '1.0000', '8.58', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (788, '00000815', 'J小白菜', 'JXBC', NULL, '1.0000', '1.0000', '4.55', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (789, '00000816', 'J上海青', 'JSHQ', NULL, '1.0000', '1.0000', '3.38', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (790, '00000817', 'J娃娃菜', 'JWWC', NULL, '1.0000', '1.0000', '5.20', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (791, '00000818', 'J油麦菜', 'JYMC', NULL, '1.0000', '1.0000', '5.20', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (792, '00000819', 'J生菜', 'JSC', NULL, '1.0000', '1.0000', '5.20', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (793, '00000820', 'J球包菜', 'JQBC', NULL, '1.0000', '1.0000', '1.82', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (794, '00000821', 'J韭菜花', 'JJCH', NULL, '1.0000', '1.0000', '23.40', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (795, '00000822', 'J青梗芹菜', 'JQGQC', NULL, '1.0000', '1.0000', '5.85', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (796, '00000823', 'J香菜', 'JXC', NULL, '1.0000', '1.0000', '10.40', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (797, '00000824', 'J韭菜', 'JJC', NULL, '1.0000', '1.0000', '9.10', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (798, '00000825', 'J番茄', 'JFQ', NULL, '1.0000', '1.0000', '6.50', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (799, '00000826', 'J樱桃番茄', 'JYTFQ', NULL, '1.0000', '1.0000', '10.40', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (800, '00000827', 'J黄瓜', 'JHG', NULL, '1.0000', '1.0000', '5.98', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (801, '00000828', 'J冬瓜', 'JDG', NULL, '1.0000', '1.0000', '2.47', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (802, '00000829', 'J笋瓜', 'JSG', NULL, '1.0000', '1.0000', '4.94', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (803, '00000830', 'J花菜', 'JHC', NULL, '1.0000', '1.0000', '2.86', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (804, '00000831', 'J西兰花', 'JXLH', NULL, '1.0000', '1.0000', '7.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (805, '00000832', 'J青豆角', 'JQDJ', NULL, '1.0000', '1.0000', '11.70', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (806, '00000833', 'J蚕豆米', 'JCDM', NULL, '1.0000', '1.0000', '24.70', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (807, '00000834', 'J芜湖青椒', 'JWHQJ', NULL, '1.0000', '1.0000', '9.39', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (808, '00000835', 'J杭椒', 'JHJ', NULL, '1.0000', '1.0000', '12.24', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (809, '00000836', 'J红椒', 'JHJ', NULL, '1.0000', '1.0000', '9.75', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (810, '00000837', 'J黑木耳', 'JHME', NULL, '1.0000', '1.0000', '0.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (811, '00000838', 'J平菇', 'JPG', NULL, '1.0000', '1.0000', '9.75', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (812, '00000839', 'J姬菇', 'JJG', NULL, '1.0000', '1.0000', '15.60', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (813, '00000840', 'J杏鲍菇', 'JXBG', NULL, '1.0000', '1.0000', '13.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (814, '00000841', 'J板栗米', 'JBLM', NULL, '1.0000', '1.0000', '39.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (815, '00000842', 'J甜玉米', 'JTYM', NULL, '1.0000', '1.0000', '3.64', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (816, '00000843', 'J芋头', 'JYT', NULL, '1.0000', '1.0000', '7.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (817, '00000844', 'J鸡蛋', 'JJD', NULL, '1.0000', '1.0000', '7.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (818, '00000845', 'J大白菜秧', 'JDBCY', NULL, '1.0000', '1.0000', '5.51', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (819, '00000846', 'J小紫薯', 'JXZS', NULL, '1.0000', '1.0000', '9.10', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (820, '00000847', 'J香芹', 'JXQ', NULL, '1.0000', '1.0000', '6.50', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (821, '00000848', 'J茶树菇', 'JCSG', NULL, '1.0000', '1.0000', '23.40', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (822, '00000849', 'J四季豆', 'JSJD', NULL, '1.0000', '1.0000', '11.56', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (823, '00000850', 'J平包菜', 'JPBC', NULL, '1.0000', '1.0000', '1.43', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (824, '00000851', 'J青椒', 'JQJ', NULL, '1.0000', '1.0000', '7.22', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (825, '00000852', 'J金针菇', 'JJZG', NULL, '1.0000', '1.0000', '15.60', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (826, '00000853', 'J净篙芭', 'JJGB', NULL, '1.0000', '1.0000', '15.60', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (827, '00000854', 'J苦瓜', 'JKG', NULL, '1.0000', '1.0000', '26.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (828, '00000855', 'J瓠子', 'JHZ', NULL, '1.0000', '1.0000', '7.15', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (829, '00000856', 'J紫茄子', 'JZQZ', NULL, '1.0000', '1.0000', '7.15', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (830, '00000857', 'J蒜米', 'JSM', NULL, '1.0000', '1.0000', '20.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (831, '00000858', 'J菠菜', 'JBC', NULL, '1.0000', '1.0000', '6.93', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (832, '00000859', 'J金南瓜', 'JJNG', NULL, '1.0000', '1.0000', '5.85', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (833, '00000860', 'J刀豆', 'JDD', NULL, '1.0000', '1.0000', '11.70', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (834, '00000861', 'J西生菜', 'JXSC', NULL, '1.0000', '1.0000', '11.05', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (835, '00000862', 'J迷你黄瓜', 'JMNHG', NULL, '1.0000', '1.0000', '18.20', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (836, '00000863', 'J红尖椒', 'JHJJ', NULL, '1.0000', '1.0000', '15.60', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (837, '00000864', 'J青尖椒', 'JQJJ', NULL, '1.0000', '1.0000', '0.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (838, '00000865', 'J鲜小米椒', 'JXXMJ', NULL, '1.0000', '1.0000', '39.00', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (839, '00000866', 'J青丝瓜', 'JQSG', NULL, '1.0000', '1.0000', '16.90', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (840, '00000867', 'J韭黄', 'JJH', NULL, '1.0000', '1.0000', '18.20', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (841, '00000868', 'J菜心', 'JCX', NULL, '1.0000', '1.0000', '6.50', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (842, '00000869', 'J秋葵', 'JQK', NULL, '1.0000', '1.0000', '23.40', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (843, '00000870', 'J毛豆', 'JMD', NULL, '1.0000', '1.0000', '12.35', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (844, '00000871', 'J苋菜', 'JXC', NULL, '1.0000', '1.0000', '7.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (845, '00000872', 'J空心菜', 'JKXC', NULL, '1.0000', '1.0000', '8.45', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (846, '00000874', '腌制鸡丁（宫保）', '*YZJD（GB）', NULL, '20.0000', '20.0000', '1.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (847, '00000875', '(停购)腊皇煲仔饭415g', 'LHBZF415G', NULL, '40.0000', '10.0000', '9.81', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (848, '00000876', '蒸腊肠', '*ZLC', NULL, '20.0000', '10.0000', '1.00', '上汽蒸十分钟', '1', 128, NULL, NULL, 396, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (849, '00000877', '蒸腊肉', '*ZLR', NULL, '20.0000', '10.0000', '1.00', '上汽蒸十分钟', '1', 128, NULL, NULL, 396, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (850, '00000878', '拌饭味汁', '*BFWZ', NULL, '30.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (851, '00000879', '清炒酱瓜', '*QCJG', NULL, '20.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (852, '00000880', '墨西哥提子餐包100g', 'MXGTZCB100G', NULL, '20.0000', '10.0000', '2.94', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (853, '00000881', '30元盒饭', '30YHF', NULL, '60.0000', '30.0000', '30.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (854, '00000882', '35元盒饭', '35YHF', NULL, '60.0000', '30.0000', '35.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (855, '00000883', '鲁磨桂花糊（380g）', 'LMGHH（480G）', NULL, '50.0000', '10.0000', '2.00', '', '0', 131, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (856, '00000884', '鲁磨白粥（380g）', 'LMBZ（380G）', NULL, '50.0000', '10.0000', '1.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (857, '00000885', '江夏八宝粥', 'JXBBZ', NULL, '50.0000', '10.0000', '12.00', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (858, '00000886', '咖喱鸡块蛋包饭530g', 'KLJKDBF560G', NULL, '50.0000', '10.0000', '9.57', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (859, '00000887', '腌制鸡块（咖喱鸡块）', '*YZJK（KLJK）', NULL, '30.0000', '10.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (860, '00000888', '炸鸡块（咖喱鸡块）', '*ZJK（KLJK）', NULL, '20.0000', '10.0000', '3.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 459, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (861, '00000889', '清水粽（W）', 'QSZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (862, '00000890', '豆沙粽（W）', 'DSZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (863, '00000891', '金丝蜜枣粽（W）', 'JSMZZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (864, '00000892', '相思红豆粽（W）', 'XSHDZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (865, '00000893', '绿豆粽（W）', 'LDZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (866, '00000894', '养生杂粮粽（W）', 'YSZLZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (867, '00000895', '原味红枣粽（W）', 'YWHZZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (868, '00000896', '极味花生粽（W）', 'JWHSZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (869, '00000897', '葡萄干粽（W）', 'PTGZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (870, '00000898', '特制鲜肉粽（W）', 'TZXRZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (871, '00000899', '香菇鸡肉粽（W）', 'XGJRZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (872, '00000900', '腊肉火腿粽（W）', 'LRHTZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (873, '00000901', '鲜香牛肉粽（W）', 'XXNRZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (874, '00000902', '蛋黄粽（W）', 'DHZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (875, '00000903', '八宝粽（W）', 'BBZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (876, '00000904', '香菇粽（W）', 'XGZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (877, '00000905', '咸蛋黄粽（W）', 'XDHZ（W）', NULL, '1.0000', '1.0000', '16.25', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (878, '00000906', '双菇蚝油肉片炒面445g', 'SGHYRPCM445G', NULL, '30.0000', '20.0000', '8.35', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (879, '00000907', '腌制肉片（炒面）', '*YZRP', NULL, '30.0000', '20.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (880, '00000908', '过油肉片（炒面）', '*GYRP（CM）', NULL, '20.0000', '10.0000', '2.50', '', '1', 128, NULL, NULL, 397, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (881, '00000909', '蚝油双菇肉片', '*HYSGRP', NULL, '30.0000', '10.0000', '5.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (882, '00000910', '蚝汁炒面', '*HZCM', NULL, '20.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (883, '00000911', '卤海带结180g（H）', 'LHDJ180G（H）', NULL, '1.0000', '1.0000', '5.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (884, '00000912', '卤腐竹180g（H）', 'LFZ180G（H）', NULL, '1.0000', '1.0000', '5.80', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (885, '00000913', '京酱鸡丝饭510g', 'JJJSF510G', NULL, '30.0000', '10.0000', '7.83', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (886, '00000914', '腌制鸡丝（京酱）', '*YZJS（JJ）', NULL, '30.0000', '10.0000', '1.50', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (887, '00000915', '京酱鸡丝', '*JJJS', NULL, '30.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 445, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (888, '00000916', '京酱千张丝', '*JJQZS', NULL, '30.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 444, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (889, '00000917', '清炒黄瓜丝', '*QCHGS', NULL, '30.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', 443, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (890, '00000918', '三色花仁', '*SSHR', NULL, '30.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', 442, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (891, '00000919', '红豆餐包2个装', 'HDCB2GZ', NULL, '1.0000', '1.0000', '1.78', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (892, '00000920', '摩奇QQ120g', 'MQQQ120G', NULL, '20.0000', '10.0000', '4.99', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (893, '00000921', 'w培根时蔬三明治', 'WPGSSSMZ', NULL, '20.0000', '10.0000', '5.33', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (894, '00000922', 'w金典全麦三明治', 'WJDQMSMZ', NULL, '20.0000', '10.0000', '4.91', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (895, '00000923', 'w照烧鸡块三明治', 'WZSJKSMZ', NULL, '20.0000', '10.0000', '5.62', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (896, '00000924', 'w鸡蛋时蔬三明治', 'WJDSSSMZ', NULL, '20.0000', '10.0000', '3.56', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (897, '00000925', '鸡蛋火腿全麦三明治', 'JDHTQMSMZ', NULL, '20.0000', '10.0000', '6.04', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (898, '00000926', '烟熏鸡肉火腿三明治', 'YXJRHTSMZ', NULL, '20.0000', '10.0000', '6.04', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (899, '00000927', '香薰鸡肉三明治', 'XXJRSMZ', NULL, '20.0000', '10.0000', '10.03', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (900, '00000929', '现打中餐-干锅杏鲍菇（Z）', 'XDZC-GGXBG（Z）', NULL, '1.0000', '1.0000', '34.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (901, '00000930', '现打中餐-冬瓜烩汆丸（Z）', 'XDZC-DGHCW（Z）', NULL, '1.0000', '1.0000', '21.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (902, '00000931', '(停购)美膳-辣子鸡丁饭', 'MS-LZJDF', NULL, '30.0000', '10.0000', '9.69', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (903, '00000932', '美膳-奥尔良鸡排盖饭', 'MS-AELJPGF', NULL, '100.0000', '100.0000', '8.39', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (904, '00000933', '美膳-孜香牛肉盖饭', 'MS-ZXNRGF', NULL, '100.0000', '100.0000', '9.04', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (905, '00000934', '(停购)美膳-宫保鸡丁盖饭', 'MS-GBJDGF', NULL, '100.0000', '100.0000', '8.26', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (906, '00000935', '(停购)美膳-番茄汁蛋包饭', 'MS-FQZDBF', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (907, '00000936', '美膳-酥炸鸡排咖喱饭', 'MS-SZJPKLF', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (908, '00000937', '(停购)美膳-金牌泡椒滑鸡饭', 'MS-JPPJHJF', NULL, '100.0000', '100.0000', '8.70', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (909, '00000938', '美膳-黑椒牛肉盖饭', 'MS-HJNRGF', NULL, '100.0000', '100.0000', '9.50', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (910, '00000939', '(停购)美膳-香辣鱿鱼拼饭', 'MS-XLYYPF', NULL, '100.0000', '100.0000', '9.50', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (911, '00000940', '(停购)美膳-熏鸭双冬盖饭', 'MS-XYSDGF', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (912, '00000941', '美膳-水煮肉片饭', 'MS-SZRPF', NULL, '100.0000', '100.0000', '7.72', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (913, '00000942', '鲁磨-白粥', 'LM-BZ', NULL, '100.0000', '100.0000', '1.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (914, '00000943', '美膳-培根蟹柳寿司组合', 'MS-PGXLSSZH', NULL, '100.0000', '100.0000', '8.90', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (915, '00000944', '美膳-照烧鸡肉手卷', 'MS-ZSJRSJ', NULL, '100.0000', '100.0000', '3.84', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (916, '00000945', '美膳-香炸排条手卷', 'MS-XZPTSJ', NULL, '100.0000', '100.0000', '3.58', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (917, '00000946', '美膳-芝士培根手卷', 'MS-ZSPGSJ', NULL, '100.0000', '100.0000', '3.84', NULL, NULL, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (918, '00000947', '美膳-至尊饭团（新奥尔良鸡腿）', 'MS-ZZFT（XAELJT）', NULL, '100.0000', '100.0000', '3.84', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (919, '00000948', '美膳-至尊饭团（新美式辣鸡腿）', 'MS-ZZFT（XMSLJT）', NULL, '100.0000', '100.0000', '3.84', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (920, '00000949', '美膳-蛋黄酱虾仁饭团', 'MS-DHJXRFT', NULL, '100.0000', '40.0000', '2.45', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (921, '00000950', '美膳-蛋黄酱蟹柳饭团', 'MS-DHJXLFT', NULL, '100.0000', '40.0000', '2.45', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (922, '00000951', '美膳-番茄汁肉酱意面', 'MS-FQZRJYM', NULL, '100.0000', '100.0000', '8.39', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (923, '00000952', '美膳-猪肉丝葱油拌面', 'MS-ZRSCYBM', NULL, '100.0000', '100.0000', '7.09', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (924, '00000953', '甜甜圈（黑巧克力）80g', 'TTQ（HQKL）80G', NULL, '1.0000', '1.0000', '4.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (925, '00000954', '嘉义鸡肉饭520g', 'JYJRF520G', NULL, '100.0000', '100.0000', '8.71', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (926, '00000955', '熟鸡脯肉丝', '*CSJFR', NULL, '30.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (927, '00000956', '鸡丝汤冻', '*HJBTD', NULL, '30.0000', '10.0000', '3.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 433, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (928, '00000957', '西式浓汁鱼排饭530g', 'XSNZYPF530G', NULL, '100.0000', '100.0000', '9.53', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (929, '00000958', '鱼排', '*YP', NULL, '100.0000', '100.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (930, '00000959', '日式洋葱培根', '*RSYCPG', NULL, '100.0000', '100.0000', '2.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 453, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (931, '00000960', '炸鱼排', '*ZYP', NULL, '100.0000', '100.0000', '2.50', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 454, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (932, '00000961', '椰香面包', 'YXMB', NULL, '1.0000', '1.0000', '1.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (933, '00000962', '芝麻手指饼90g', 'ZMSZB90G', NULL, '1.0000', '1.0000', '5.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (934, '00000963', '玉子豆腐海鲜饭530g', 'YZDFHXF530G', NULL, '100.0000', '100.0000', '9.82', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (935, '00000964', '焯水大虾', '*CSDX', NULL, '20.0000', '20.0000', '2.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 441, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (936, '00000965', '焯水大白菜', '*CSDBC', NULL, '20.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 440, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (937, '00000966', '日本豆腐烧胡萝卜', '*RBDFSHLB', NULL, '20.0000', '20.0000', '2.00', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (938, '00000967', '焯水粗蟹肉棒', '*CSXXRB', NULL, '20.0000', '20.0000', '1.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (939, '00000968', '三鲜丸子', 'SXWZ', NULL, '1.0000', '1.0000', '34.09', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (940, '00000969', '卤制品五香牛舌散', 'LZPWXNSS', NULL, '1.0000', '1.0000', '128.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (941, '00000970', '卤制品五香牛耳散', 'LZPWXNES', NULL, '1.0000', '1.0000', '81.34', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (942, '00000971', '卤制品五香牛蹄散', 'LZPWXNTS', NULL, '1.0000', '1.0000', '75.71', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (943, '00000972', '卤制品五香牛脸散', 'LZPWXNLS', NULL, '1.0000', '1.0000', '62.86', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (944, '00000973', '卤制品五香口条散', 'LZPWXKTS', NULL, '1.0000', '1.0000', '100.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (945, '00000974', '美膳素卤', 'MSSL', NULL, '1.0000', '1.0000', '24.59', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (946, '00000975', '美膳荤卤', 'MSHL', NULL, '1.0000', '1.0000', '57.14', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (947, '00000976', '桂花糊', '*GHH', NULL, '50.0000', '10.0000', '2.00', '', '1', 130, NULL, NULL, 405, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 396, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (948, '00000977', '炸日本豆腐', '*ZRBDF', NULL, '30.0000', '10.0000', '2.00', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 437, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (949, '00000978', '麻酱凉面', 'MJLM', NULL, '100.0000', '10.0000', '3.25', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (950, '00000979', '凉面味水', '*LMWS', NULL, '50.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (951, '00000980', '凉面麻酱', '*LMMJ', NULL, '50.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 402, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (952, '00000981', '凉面', '*LM', NULL, '60.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, 405, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 395, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (953, '00000982', '焯水黄瓜(凉面用)', '*CSHG(LMY)', NULL, '50.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 394, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (954, '00000983', '焯水胡萝卜丝(凉面用)', '*CSHLBS(LMY)', NULL, '60.0000', '10.0000', '0.30', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 393, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (955, '00000984', '焯水海带丝(凉面用)', '*CSHDS(LMY)', NULL, '60.0000', '10.0000', '0.30', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 392, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (956, '00000985', '辣椒油(凉面用)', '*LJY(LMY)', NULL, '50.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.980', '0', NULL, '', NULL, NULL, '1', 391, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (957, '00000986', '藕粉水(八宝粥用)', 'OFS(BBZY)', NULL, '20.0000', '10.0000', '0.50', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (958, '00000987', '藕粉水(桂花糊用)', '*OFS(GHHY)', NULL, '20.0000', '10.0000', '0.50', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (959, '00000988', '凉面醋', '*LMC', NULL, '50.0000', '10.0000', '0.10', '', '1', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (960, '00000989', '卤海带散（H）', 'LHDS', NULL, '1.0000', '1.0000', '18.48', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (961, '00000990', '亲子盖浇饭520g', 'QZGJF520G', NULL, '100.0000', '100.0000', '8.77', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (962, '00000991', '蟹柳炒鸡蛋', '*XLCJD', NULL, '50.0000', '20.0000', '1.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (963, '00000992', '腌制鸡块（亲子饭用）', '*YZJK（QZFY）', NULL, '50.0000', '20.0000', '2.00', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (964, '00000993', '炸鸡块（亲子饭用）', '*ZJK（QZFY）', NULL, '50.0000', '20.0000', '2.50', '', '1', 128, NULL, NULL, 397, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (965, '00000994', '汤汁（亲子饭用）', '*TZ（QZFY）', NULL, '50.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (966, '00000995', '中百口味卤鸭脖', 'ZBKWLYB', NULL, '1.0000', '1.0000', '5.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (967, '00000996', '中百口味卤鸭翅', 'ZBKWLYC', NULL, '1.0000', '1.0000', '5.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (968, '00000997', '中百口味卤鸭锁骨', 'ZBKWLYSG', NULL, '1.0000', '1.0000', '5.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (969, '00000998', '中百口味卤鸭掌', 'ZBKWLYZ', NULL, '1.0000', '1.0000', '5.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (970, '00000999', '中百口味卤鸭肠', 'ZBKWLYC', NULL, '1.0000', '1.0000', '5.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (971, '00001000', '中百口味卤凤尖', 'ZBKWLFJ', NULL, '1.0000', '1.0000', '5.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (972, '00001001', '中百口味卤藕', 'ZBKWLO', NULL, '1.0000', '1.0000', '2.64', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (973, '00001002', '中百口味牛皮干', 'ZBKWNPG', NULL, '1.0000', '1.0000', '2.64', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (974, '00001003', '香卤鸭腿', 'XLYT', NULL, '1.0000', '1.0000', '3.30', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (975, '00001004', '青红椒圈', '*QHJQ', NULL, '50.0000', '10.0000', '0.50', '', '1', 130, NULL, NULL, 406, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (976, '00001005', '福嘉白素鸡250g', 'FJBSJ250G', NULL, '1.0000', '1.0000', '3.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (977, '00001006', '福嘉素火腿200g', 'FJSHT200G', NULL, '1.0000', '1.0000', '4.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (978, '00001007', '福嘉厚千张(220g)', 'FJHQZ(220G)', NULL, '1.0000', '1.0000', '3.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (979, '00001008', '福嘉手打千张结（200g）', 'FJSDQZJ（200G）', NULL, '1.0000', '1.0000', '4.10', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (980, '00001009', '福嘉龙井茶干(200g)', 'FJLJCG(200G)', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (981, '00001010', '福嘉五香干子(200g)', 'FJWXGZ(200G)', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (982, '00001011', '福嘉五香豆糕(200g)', 'FJWXDG(200G)', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (983, '00001012', '福嘉薄干子200g', 'FJBGZ200G', NULL, '1.0000', '1.0000', '3.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (984, '00001013', '福嘉白干子200g', 'FJBGZ200G', NULL, '1.0000', '1.0000', '2.50', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (985, '00001014', '福嘉酱干子200g', 'FJJGZ200G', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (986, '00001015', '福嘉油干子200g', 'FJYGZ200G', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (987, '00001016', '福嘉海绵干200g', 'FJHMG200G', NULL, '1.0000', '1.0000', '3.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (988, '00001017', '福嘉冻豆腐380g', 'FJDDF380G', NULL, '1.0000', '1.0000', '3.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (989, '00001018', '福嘉卤水豆腐450g', 'FJLSDF450G', NULL, '1.0000', '1.0000', '3.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (990, '00001019', '福嘉老豆腐350g', 'FJLDF350G', NULL, '1.0000', '1.0000', '2.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (991, '00001020', '福嘉嫩豆腐450g', 'FJNDF450G', NULL, '1.0000', '1.0000', '2.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (992, '00001021', '福嘉红烧豆腐380g', 'FJHSDF380G', NULL, '1.0000', '1.0000', '3.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (993, '00001022', '福嘉烤麸280g', 'FJKF280G', NULL, '1.0000', '1.0000', '3.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (994, '00001023', '福嘉鲜汁干200g', 'FJXZG200G', NULL, '1.0000', '1.0000', '3.80', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (995, '00001024', '福嘉五香素鸡片200g', 'FJWXSJP200G', NULL, '1.0000', '1.0000', '4.70', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (996, '00001025', '福嘉御豆卷220g', 'FJYDJ220G', NULL, '1.0000', '1.0000', '4.10', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (997, '00001026', '卤面筋200g', 'LMJ200G', NULL, '1.0000', '1.0000', '3.50', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (998, '00001027', '(停购)桂花绿豆汤250g', 'GHLDT250G', NULL, '50.0000', '10.0000', '2.23', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (999, '00001028', '桂花绿豆汤', '*GHLDT', NULL, '50.0000', '10.0000', '1.50', '', '1', 130, NULL, NULL, 405, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1000, '00001029', '迷你瑞士卷85g', 'MNRSJ85G', NULL, '1.0000', '1.0000', '5.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1001, '00001030', '天然酵母面包', 'TRJMMB', NULL, '1.0000', '1.0000', '4.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1002, '00001031', '豆芽（麻辣香锅）', '*DY（MLXG）', NULL, '50.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 464, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1003, '00001032', '土豆泥', '*TDN', NULL, '50.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, 396, NULL, '1', '0.920', '0', NULL, '', NULL, NULL, '1', 484, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1004, '00001033', '沸水红萝卜粒', '*FSHLBL', NULL, '50.0000', '20.0000', '0.20', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 497, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1005, '00001034', '沸水西芹粒', '*FSXQL', NULL, '50.0000', '20.0000', '0.20', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.940', '0', NULL, '', NULL, NULL, '1', 494, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1006, '00001035', '炸鸡块汤汁', '*ZJKTZ', NULL, '50.0000', '50.0000', '0.20', '', '1', 130, NULL, NULL, 405, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1007, '00001036', '蟹柳炒蛋汤汁', '*XLCDTZ', NULL, '50.0000', '50.0000', '0.30', '', '1', 128, NULL, NULL, 405, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1008, '00001037', 'W菠萝面包', 'WBLMB', NULL, '1.0000', '1.0000', '1.05', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1009, '00001038', '豆乳蛋糕120g', 'DRDG120G', NULL, '1.0000', '1.0000', '4.42', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1010, '00001039', '烟熏培根鸡蛋三明治120g', 'YXPGJDSMZ120G', NULL, '1.0000', '1.0000', '4.41', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1011, '00001040', '大话西鱿盒饭470g', 'DHXYHF470G', NULL, '100.0000', '100.0000', '9.18', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1012, '00001041', '沸水鱿鱼尾', '*FSYYW', NULL, '50.0000', '20.0000', '2.00', '', '1', 128, NULL, NULL, 406, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 456, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1013, '00001042', '沸水西葫芦片', '*FSXHL', NULL, '50.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1014, '00001043', '沸水红萝卜片', '*FSHLBP', NULL, '50.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1015, '00001044', '沸水千张片', '*FSQZP', NULL, '50.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 406, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1016, '00001045', '大话西游汤汁', '*DHXYTZ', NULL, '50.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 399, NULL, '1', '0.980', '0', NULL, '', NULL, NULL, '1', 458, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1017, '00001046', '大话西游蔬菜', '*DHXYSC', NULL, '50.0000', '50.0000', '1.50', '', '1', 128, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 457, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1018, '00001047', '香菇滑鸡粥410g', 'XGHJZ410G', NULL, '100.0000', '100.0000', '2.44', '', '0', 128, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1019, '00001048', '香菇滑鸡', '*XGHJ', NULL, '50.0000', '20.0000', '0.50', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.930', '0', NULL, '', NULL, NULL, '1', 406, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1020, '00001049', '柴鱼花海苔粥400g', 'CYHHTZ400G', NULL, '100.0000', '100.0000', '2.33', '', '0', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1021, '00001050', '金枪鱼色拉三明治115g', 'JQYSLSMZ115G', NULL, '1.0000', '1.0000', '4.41', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1022, '00001051', '日式豆乳蛋糕80g', 'RSDRDG80G', NULL, '1.0000', '1.0000', '7.17', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1023, '00001052', '冰皮月亮蛋糕（蛋黄肉松）95g', 'BPYLDG（DHRS）95G', NULL, '1.0000', '1.0000', '6.40', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1024, '00001053', '荞麦馒头3个装210g', 'QMMT3GZ210G', NULL, '1.0000', '1.0000', '1.47', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1025, '00001054', '米发糕240g', 'MFG240G', NULL, '1.0000', '1.0000', '2.63', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1026, '00001055', '奶黄包3个装240g', 'NHB3GZ240G', NULL, '1.0000', '1.0000', '2.75', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1027, '00001056', '鲜肉包2个装180g', 'XRB2GZ180G', NULL, '1.0000', '1.0000', '2.84', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1028, '00001057', '葱香花卷2个装180g', 'CXHJ2GZ180G', NULL, '1.0000', '1.0000', '1.47', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1029, '00001058', '腌制鸡丁（香菇滑鸡）', '*YZJD（XGHJ）', NULL, '50.0000', '50.0000', '0.50', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1030, '00001059', 'W虎皮蛋糕卷60g', 'WHPDGJ60G', NULL, '1.0000', '1.0000', '1.58', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1031, '00001060', 'W椰蓉面包', 'WYRMB', NULL, '1.0000', '1.0000', '1.05', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1032, '00001061', '玛芬蛋糕80g', 'MFDG80G', NULL, '1.0000', '1.0000', '3.54', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1033, '00001062', '丹麦飞碟面包120g(Z)', 'DMFDMB120G(Z)', NULL, '1.0000', '1.0000', '4.04', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1034, '00001063', '北海道牛奶土司(2片)', 'BHDNNTS(2P)', NULL, '1.0000', '1.0000', '3.74', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1035, '00001064', '肉松小贝蛋糕120g', 'RSXBDG120G', NULL, '1.0000', '1.0000', '6.60', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1036, '00001065', '牛乳蛋糕70g', 'NRDG70G', NULL, '1.0000', '1.0000', '5.33', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1037, '00001066', '港式菠萝包80g', 'GSBLB80G', NULL, '1.0000', '1.0000', '2.20', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1038, '00001067', '牛奶手撕包95g(Z)', 'NNSSB95G(Z)', NULL, '1.0000', '1.0000', '3.77', '', '0', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1039, '00001068', '牛奶餐包65g', 'NNCB65G', NULL, '1.0000', '1.0000', '1.84', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1040, '00001069', '草莓羊角面包90g', 'CMYJMB90G', NULL, '1.0000', '1.0000', '4.65', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1041, '00001070', '香菇滑鸡粥的粥', '*XGHJZDZ', NULL, '100.0000', '10.0000', '15.00', '', '1', 130, NULL, NULL, 405, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 405, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1042, '00001071', '紫薯寿司', 'ZSSS', NULL, '1.0000', '1.0000', '7.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1043, '00001072', '蒸紫薯末', '*ZZSM', NULL, '5.0000', '5.0000', '5.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1044, '00001073', '紫薯饭', 'ZSF', NULL, '16.5000', '16.5000', '100.00', '', '1', 134, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1045, '00001074', '紫薯饭团黄瓜条', '*ZSFTHGT', NULL, '10.0000', '10.0000', '0.50', '', '1', 128, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1046, '00001075', '紫薯寿司饭饭底', 'ZSSSFFD', NULL, '16.0000', '16.0000', '20.00', '', '1', 134, NULL, NULL, 405, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1047, '00001076', '五香猪头肉散', 'WXZTRS', NULL, '1.0000', '1.0000', '56.00', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1048, '00001077', '咸麻花180g', 'XMH', NULL, '1.0000', '1.0000', '3.54', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1049, '00001078', '酥皮夹心蛋糕100g(Z)', 'SPJXDG100G(Z)', NULL, '1.0000', '1.0000', '3.56', '', '0', 140, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1050, '00001079', '绿豆汤500g', 'LDT', NULL, '100.0000', '10.0000', '1.91', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1051, '00001080', '熟绿豆', '*SLD', NULL, '10.0000', '10.0000', '100.00', '', '1', 130, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 397, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1052, '00001081', '糖水', '*TS', NULL, '200.0000', '100.0000', '200.00', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1053, '00001082', '猪油', 'ZY', NULL, '10.0000', '10.0000', '50.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1054, '00001083', '什锦反卷', '*SJFJ', NULL, '0.2000', '100.0000', '5.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1055, '00001084', '双花寿司卷', 'SHSSJ', NULL, '100.0000', '100.0000', '3.96', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1056, '00001085', '台湾大口饭团', 'TWFT', NULL, '1000.0000', '10.0000', '3.42', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1057, '00001086', '辣萝卜', '*LLB', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1058, '00001087', '茄汁饭（新）的酱汁', 'QZF（X）DJZ', NULL, '20.0000', '10.0000', '20.00', NULL, NULL, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1059, '00001088', '台式鸡丝凉面350g', 'JSLM', NULL, '10.0000', '10.0000', '5.83', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1060, '00001089', '泡椒土豆', '*PJTD', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 430, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1061, '00001090', '泡椒鸭脯', '*PJYF', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 429, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1062, '00001091', '清炒西葫芦', '*QCXHL', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 428, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1063, '00001092', '泡椒鸭脯盖浇饭', 'PJYFGJF', NULL, '1.0000', '6.0000', '8.76', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1064, '00001093', '台湾饭团的拌饭', '*TWFTDF', NULL, '10.0000', '10.0000', '40.00', '', '1', 134, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 411, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1065, '00001094', '台湾饭团的盐饭', '*TWFTDYF', NULL, '15.0000', '15.0000', '50.00', '', '1', 134, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1066, '00001095', '台式麻酱凉面325g', 'TSMJLM325G', NULL, '100.0000', '100.0000', '4.63', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1067, '00001096', '玉子豆腐汤汁', '*YZDFTZ', NULL, '20.0000', '10.0000', '20.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 439, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1068, '00001097', '肥牛汤汁', '*FNTZ', NULL, '100.0000', '100.0000', '0.60', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 431, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1069, '00001098', '日式肥牛饭550g', 'RSFNF550G', NULL, '100.0000', '100.0000', '9.29', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1070, '00001099', '沸水红萝卜（玉子饭用）', 'FSHLB（YZFY）', NULL, '100.0000', '100.0000', '0.60', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 438, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1071, '00001100', '美味香肠', '*MWXC', NULL, '100.0000', '100.0000', '0.60', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 412, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1072, '00001101', '肥牛', '*FN', NULL, '100.0000', '100.0000', '2.04', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 432, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1073, '00001102', '柴鱼花海苔粥的粥', '*CYHHTZDZ', NULL, '100.0000', '100.0000', '1.20', '', '1', 130, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 400, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1074, '00001103', '藤椒鸡排（腌制）', '*TJJP', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, 398, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 410, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1075, '00001104', '沸水包菜丝（藤椒鸡排大口饭团用）', '*TJBC', NULL, '100.0000', '100.0000', '0.20', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 408, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1076, '00001105', '藤椒汁', '*TJZ', NULL, '100.0000', '100.0000', '0.20', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 409, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1077, '00001106', '藤椒鸡排大口饭团', 'TJJPDKFT', NULL, '100.0000', '100.0000', '4.14', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1078, '00001107', '鱼香鸡丝', '*YXJS', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 386, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1079, '00001108', '腌制鱼香肉末', '*CYRM', NULL, '100.0000', '100.0000', '0.60', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1080, '00001109', '葱油肉末刀豆', '*CYRMDD', NULL, '100.0000', '100.0000', '1.30', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 385, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1081, '00001110', '鱼香鸡丝拼饭', 'YXJSPF', NULL, '100.0000', '100.0000', '7.97', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1082, '00001111', '腌制鱼香鸡丝', '*YXJSDJS', NULL, '100.0000', '100.0000', '0.50', '', '1', 133, NULL, NULL, 407, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1083, '00001112', '银耳羹', 'YEG', NULL, '100.0000', '100.0000', '1.75', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1084, '00001113', '糖浆', '*TJ', NULL, '100.0000', '100.0000', '0.42', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1085, '00001114', '新银耳汤', '*YET', NULL, '100.0000', '100.0000', '0.40', '', '1', 130, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 399, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1086, '00001115', '蒸枸杞', '*ZGQ', NULL, '100.0000', '100.0000', '0.11', '', '1', 130, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 398, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1087, '00001116', '蓑衣干子汤料', '*SYGZTL', NULL, '100.0000', '100.0000', '0.13', '', '1', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1088, '00001117', '经济盒饭', 'JJHF', NULL, '1.0000', '1.0000', '7.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1089, '00001118', '香辣蓑衣干子', 'XLSYGZ', NULL, '50.0000', '50.0000', '0.60', '', '0', 135, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1090, '00001119', '香辣虎皮蛋', 'XLHPD', NULL, '100.0000', '100.0000', '0.70', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1091, '00001120', '藤椒猪肉', '*TJZR', NULL, '100.0000', '100.0000', '0.65', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1092, '00001121', '藤椒土豆', '*TJTD', NULL, '100.0000', '100.0000', '0.34', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1093, '00001122', '藤椒猪肉手卷', 'TJZRSJ', NULL, '100.0000', '100.0000', '2.30', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1094, '00001123', '炒肉松', '*CRS', NULL, '100.0000', '100.0000', '0.54', '', '1', 128, NULL, NULL, 401, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1095, '00001124', '香酥肉松饭团', 'XSRSSJFT', NULL, '100.0000', '100.0000', '2.89', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1096, '00001125', '腌制藤椒猪肉', '*YZTJZR', NULL, '100.0000', '100.0000', '0.65', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1097, '00001126', '炒面粉', '*CMF', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1098, '00001127', '红酱', '*HJ', NULL, '100.0000', '100.0000', '2.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 384, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1099, '00001128', '焯水培根（培根芝士焗饭用）', '*CSPG（PGZSJFY）', NULL, '100.0000', '100.0000', '0.20', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 383, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1100, '00001129', '培根芝士焗饭450g', 'PGZSJF450G', NULL, '100.0000', '100.0000', '8.78', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1101, '00001130', '胡萝卜小丁', '*HLBXD', NULL, '10.0000', '10.0000', '5.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 495, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1102, '00001131', '孜香牛肉（公交）', 'ZXNR', NULL, '100.0000', '100.0000', '9.60', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1103, '00001132', '茄子土豆(公交）', 'QZTD', NULL, '100.0000', '100.0000', '54.96', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1104, '00001133', '公交番茄炒蛋', 'FQCD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1105, '00001134', '公交爆炒鱼丁', 'BCNR（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1106, '00001135', '公交鱼香肉丝', 'YXRS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1107, '00001136', '公交番茄炒蛋', '*GJFQCD', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给油加热，倒入鸡蛋液煎炒，炒好舀起待用；\r\n2.夹层锅给油加热，加入调料、番茄炒制约5成熟，再加入炒好的鸡蛋一起混炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1108, '00001137', '公交茄子土豆', '*GJQZTD', NULL, '100.0000', '100.0000', '20.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1109, '00001139', '公交鱼香肉丝', '*GJYXRS', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，将腌制好的鸡丝沸水，将按比例混合的笋丝、胡萝卜丝、黑木耳丝沸水，捞出待用；\r\n2.夹层锅给油加热，调料炒香，倒入鸡丝，配菜丝，适量水一起烩炒均匀；勾芡，测中心温度，起锅装入白色成品盒；\r\n3.预留约4%的鸡丝，用烩炒后的鱼香肉丝的汤汁,单独熟制，便于包装待用；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1110, '00001140', '公交孜香牛肉', '*GJZXNR', NULL, '100.0000', '100.0000', '20.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1111, '00001141', '公交清炒西葫芦', '*GJQCXHL', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1112, '00001142', '清炒西葫芦（公交）', 'QCXHL（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1113, '00001143', '公交水煮肉片', 'SZRP（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1114, '00001144', '公交水煮肉片-肉片', '*GJSZRP', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1115, '00001145', '公交水煮肉片-豆芽千张', '*GJSZRPTZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1116, '00001146', '公交千张黄豆芽', '*GJQZHDY', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1117, '00001147', '公交宫保鸡丁', '*GJGBJD', NULL, '60.0000', '10.0000', '0.00', '1.电池炉给油加热，分别将花生米、鸡丁油炸、过油，捞起待用；\r\n2.夹层锅给水加热，将胡萝卜、黄瓜丁沸水，捞起待用；\r\n3.夹层锅给油加热，放入调味料炒香，放入鸡丁、胡萝卜黄瓜丁拌炒在一起；勾芡？测中心温度，起锅装入白色成品盒；\r\n4.油炸好的花生米单独放，包装时按量放在菜品上面；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1118, '00001148', '公交宫保鸡丁', 'GBJD（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1119, '00001149', '公交辣子鸡-土豆', '*GJLZJ', NULL, '80.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入土豆块沸水，捞起沥水后将土豆块与调味料裹拌均匀；\r\n2.用油炸箱过油，温度在150℃左右，轻放入拌好料的土豆块油炸，炸好装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1120, '00001150', '公交辣子鸡-鸡肉丁', '*GJYZLZJ', NULL, '60.0000', '10.0000', '0.00', '1.用油炸箱过油，温度在145℃左右，轻放入腌制好的鸡块油炸，炸好装入白色成品盒，待用；\r\n2.夹层锅给少量油加热，加入调味料、炸好的鸡块在锅中翻炒，测中心温度，起锅装入白色成品盒；\r\n3.炒香辣椒等点缀的调味料，分别浇于鸡块、土豆块上面；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1121, '00001151', '清炒苕尖（公交）', 'QCSJ', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1122, '00001152', '公交豆角肉丝', 'DJRS（GJ）', NULL, '10.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1123, '00001154', '青瓜炒培根（公交）', 'QGCPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1124, '00001159', '公交回锅肉', '*GJHGR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1125, '00001160', '土豆烧鸡（公交）', 'TDSJ（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1126, '00001161', '公交豆豉油麦菜', 'QCYMC（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1127, '00001162', '番茄汽水肉（公交）', 'FQQSR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1128, '00001163', '公交珍珠丸子馅（生）', '*GJZZWZX（S）', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1129, '00001164', '干子肉丝（公交）', 'GZRS（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1130, '00001165', '公交炒上海青', 'SHQ（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1131, '00001166', '公交炒上海青', '*GJSHQ', NULL, '50.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1132, '00001167', '千张肉丝（公交）', 'QZRS', NULL, '100.0000', '100.0000', '100.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1133, '00001168', '公交泡椒鸡块', '*GJPJJK', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1134, '00001169', '泡椒滑鸡（公交）', 'PJHJ（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1135, '00001170', '清炒莴苣丝（公交）', 'QCWJS（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1136, '00001171', '豆豉炒生菜（公交）', 'DCCSC（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1137, '00001172', '蒸鸡（公交）', 'ZJ（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1138, '00001173', '公交酱瓜炒蛋', '*GJJGCD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1139, '00001174', '酱瓜炒蛋（公交）', 'JGCD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1140, '00001175', '清炒空心菜（公交）', 'QCKXC（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1141, '00001176', '土豆烧鸭块（公交）', 'TDSYK（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1142, '00001177', '三丁（公交）', 'SD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1143, '00001178', '泡椒西芹炒熏鸭（公交）', 'PJXQCXY（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1144, '00001179', '豆花鱼柳（公交）', 'DHYL（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1145, '00001180', '公交腌龙利鱼', '*GJYLLY', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1146, '00001181', '干锅杏鲍菇胡萝卜炒肉片（公交）', 'GGXBGHLBCRP（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1147, '00001182', '清炒瓠子（公交）', 'QCHZ（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1148, '00001183', '公交清炒大白菜', 'DBCY（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1149, '00001184', '酸菜鱼（公交）', 'SCY（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1150, '00001185', '韭菜炒香干（公交）', 'JCCXG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1151, '00001186', '公交土豆粉蒸肉-肉片', '*GJFZR（JXW）', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1152, '00001187', '公交粉蒸肉', 'FZR（JX）（GJ）', NULL, '20.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1153, '00001189', '公交青椒鸡丝', '*GJQJJS', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1154, '00001190', '公交青椒鸡丝', 'QJJS（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1155, '00001191', '公交毛豆炒腌菜', '*GJMDCYC', NULL, '80.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1156, '00001192', '公交毛豆炒腌菜', 'MDCYC（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1157, '00001193', '公交青瓜炒蛋', 'QGCD（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1158, '00001194', '公交青瓜炒蛋', '*GJQGCD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1159, '00001195', '公交小炒肉-青红椒片', '*GJXCR', NULL, '20.0000', '10.0000', '0.00', '1.夹层锅给水加热，放入适量盐和油、青红椒片沸水，捞起待用；\r\n2.夹层锅给油加热，加调料炒香，倒入沸好水的青红椒片快速拌炒；测中心温度，起锅装入白色成品盒；\r\n3.10分钟之内及时速冷，护色；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1160, '00001196', '公交小炒肉', 'XCR（GJ）', NULL, '20.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1161, '00001198', '公交土豆烧牛腩', '*GJTDSNN', NULL, '120.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1162, '00001200', '青椒榨菜干子炒肉丝', '*GJQJZCGZRS', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，分别将肉丝、厚干、青红椒丝、榨菜丝沸水；捞起待用；\r\n2.夹层锅给油加热，放入调味料、肉丝炒香，放入沸好水的配菜一起烩炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, '120.0', '1', '0.900', '0', NULL, '', NULL, NULL, '1', 1, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1163, '00001202', '公交酸辣包菜', '*GJSLBC', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，适量盐，倒入包菜丝沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的包菜拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 2, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1164, '00001204', '迷你军舰组合', 'MNJJZH', NULL, '100.0000', '100.0000', '2.95', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1165, '00001205', '鱼香肉丝拌面', 'YXRSBM', NULL, '100.0000', '100.0000', '6.23', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1166, '00001206', '拌面（鱼香肉丝拌面）', '*BM（YXRSBM）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 390, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1167, '00001207', '黑椒猪排意面', 'HJZPYM', NULL, '100.0000', '100.0000', '8.44', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1168, '00001208', '黑椒猪排', '*HJZP', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1169, '00001209', '公交干子回锅肉', 'GZHGR（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1170, '00001210', '公交干子回锅肉-干子', '*GJGZHGR', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，分别将厚干片、洋葱青椒沸水，捞起沥水待用；\r\n2.夹层锅给油加热，放入调味料、沸好水的配菜一起烩炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1171, '00001211', '公交肉末茄子', 'RMQZ（GJ）', NULL, '10.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1172, '00001212', '公交肉末茄子', '*GJRMQZ', NULL, '10.0000', '10.0000', '0.00', '1.用提升式油炸机、过油温度在150℃左右，轻倒入茄子块油炸，炸好沥油待用；\r\n2.夹层锅给油加热，倒入肉末炒香，20KG/次；\r\n3.将过好油的茄子跟肉末一起烩炒拌匀，勾芡，测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1173, '00001213', '公交清炒大白菜', '*GJDBCY', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，适量盐，倒入白菜段沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的白菜拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1174, '00001215', '公交腐竹烧肉', 'FZSR（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1175, '00001216', '公交腐竹烧肉-肉丁', '*GJFZSR', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1176, '00001217', '黑椒猪扒（公交）', 'HJZB（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1177, '00001218', '公交黑椒猪扒', '*GJHJZB', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1178, '00001219', '回锅牛肉（公交）', 'HGNR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1179, '00001220', '公交回锅牛肉', '*GJHGNR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1180, '00001221', '番茄烧牛腩（公交）', 'FQSNN（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1181, '00001223', '公交番茄烧牛腩', '*GJFQSNN', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1182, '00001224', '白萝卜烧牛腩（公交）', 'BLBSNN（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1183, '00001225', '公交白萝卜烧牛腩', '*GJBLBSNN', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1184, '00001226', '红萝卜烧牛腩（公交）', 'HLBSNN（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1185, '00001227', '公交红萝卜烧牛腩', '*GJHLBSNN', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1186, '00001228', '绿豆汤400g', 'LDT400G', NULL, '10.0000', '10.0000', '1.91', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1187, '00001229', '回锅牛肚（公交）', 'HGND（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1188, '00001230', '公交回锅牛肚', '*GJHGND', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1189, '00001231', '公交五花肉炒包菜', 'WHR（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1190, '00001233', '沔阳蒸肉（公交）', 'MYZR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1191, '00001234', '公交沔阳蒸肉', '*GJMYZR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1192, '00001235', '莲藕蒸肉（公交）', 'LOZR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1193, '00001236', '公交莲藕蒸肉', '*GJLOZR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1194, '00001237', '冬瓜烧排骨（公交）', 'DGSPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1195, '00001238', '公交冬瓜烧排骨', '*GJDGSPG', NULL, '100.0000', '100.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1196, '00001239', '玉米烧排骨（公交）', 'YMSPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1197, '00001240', '公交玉米烧排骨', '*GJYMSPG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1198, '00001241', '土豆烧排骨（公交）', 'TDSPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1199, '00001242', '公交土豆烧排骨', '*GJTDSPG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1200, '00001243', '红萝卜烧排骨（公交）', 'HLBSPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1201, '00001244', '公交红萝卜烧排骨', '*GJHLBSPG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1202, '00001245', '香菇烧排骨（公交）', 'XGSPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1203, '00001246', '公交香菇烧排骨', '*GJXGSPG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1204, '00001247', '酱香蒸排骨（公交）', 'JXZPG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1205, '00001248', '公交酱香蒸排骨', '*GJJXZPG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1206, '00001249', '黄豆焖猪蹄（公交）', 'HDMZT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1207, '00001250', '公交黄豆焖猪蹄', '*GJHDMZT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1208, '00001251', '冬瓜烧氽丸（公交）', 'DGSTW（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1209, '00001252', '公交冬瓜烧氽肉', '*GJDGSTR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1210, '00001254', '公交珍珠丸子', '*GJZZWZ', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1211, '00001255', '回锅顺风（公交）', 'HGSF（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1212, '00001256', '公交回锅顺风', '*GJHGSF', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1213, '00001257', '茄汁鸡块（公交）', 'QZJK（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1214, '00001258', '公交茄汁鸡块', '*GJQZJK', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1215, '00001259', '奥尔良鸡排（公交）', 'AELJP（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1216, '00001260', '公交奥尔良鸡排', '*GJAELJP', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1217, '00001261', '粉蒸鸡块（公交）', 'FZJK（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1218, '00001262', '公交粉蒸鸡块', '*GJFZJK', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1219, '00001263', '法式鸡排（公交）', 'FSJP（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1220, '00001264', '公交法式鸡排', '*GJFSJP', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1221, '00001265', '糍粑鱼（公交）', 'CBY（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1222, '00001266', '公交糍粑鱼', '*GJCBY', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1223, '00001267', '金线鱼（公交）', 'JXY（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1224, '00001268', '公交金线鱼', '*GJJXY', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1225, '00001269', '番茄烧鱼丸（公交）', 'FQSYW（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1226, '00001270', '公交番茄烧鱼丸', '*GJFQSYW', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1227, '00001271', '鹌鹑蛋烧肉（公交）', 'ACDSR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1228, '00001272', '公交鹌鹑蛋烧肉', '*GJACDSR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1229, '00001273', '土豆烧鹌鹑蛋（公交）', 'TDSACD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1230, '00001274', '公交土豆烧鹌鹑蛋', '*GJTDSACD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1231, '00001275', '豆腐烧鹌鹑蛋（公交）', 'DFSACD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1232, '00001276', '公交豆腐烧鹌鹑蛋', '*GJDFSACD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1233, '00001277', '番茄烧鹌鹑蛋（公交）', 'FQSACD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1234, '00001278', '公交番茄烧鹌鹑蛋', '*GJFQSACD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1235, '00001279', '西芹炒虾仁（公交）', 'XQCXR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1236, '00001280', '公交西芹炒虾仁', '*GJXQCXR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1237, '00001281', '玉米烧脊骨（公交）', 'YMSJG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1238, '00001282', '公交玉米烧脊骨', '*GJYMSJG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1239, '00001283', '土豆烧脊骨（公交）', 'TDSJG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1240, '00001284', '公交土豆烧脊骨', '*GJTDSJG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1241, '00001285', '红萝卜烧脊骨（公交）', 'HLBSJG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1242, '00001286', '公交红萝卜烧脊骨', '*GJHLBSJG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1243, '00001287', '卤肉回锅肉（公交）', 'LRHGR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1244, '00001288', '公交卤肉回锅肉', '*GJLRHGR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1245, '00001289', '干锅杏鲍菇（公交）', 'GGXBG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1246, '00001290', '公交干锅杏鲍菇', '*GJGGXBG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1247, '00001291', '公交麻婆豆腐', 'MPDF（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1248, '00001293', '篙芭肉片（公交）', 'GBRP（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1249, '00001294', '公交篙芭肉片', '*GJGBRP', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1250, '00001295', '干锅花菜（公交）', 'GGHC（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1251, '00001296', '公交干锅花菜', '*GJGGHC', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1252, '00001297', '西红柿花菜烧肉（公交）', 'XHSHCSR（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1253, '00001298', '公交西红柿花菜烧肉', '*GJXHSHCSR', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1254, '00001299', '青椒肉丝（公交）', 'QJRS（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1255, '00001300', '公交青椒肉丝', '*GJQJRS', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1256, '00001303', '双冬烧肉片（公交）', 'SDSRP（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1257, '00001304', '公交双冬烧肉片', '*GJSDSRP', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1258, '00001305', '青瓜炒腊肠（公交）', 'QGCLC（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1259, '00001306', '公交青瓜炒腊肠', '*GJQGCLC', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1260, '00001307', '土豆烤翅根（公交）', 'TDKCG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1261, '00001308', '公交土豆烤翅根', '*GJTDKCG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1262, '00001160', '土豆烧鸡（公交）', 'TDSJ（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1263, '00001310', '公交土豆烧鸡', '*GJTDSJ', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1264, '00001311', '红萝卜烧鸡（公交）', 'HLBSJ（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1265, '00001312', '公交红萝卜烧鸡', '*GJHLBSJ', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1266, '00001313', '三色鸡丁（公交）', 'SSJD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1267, '00001314', '公交三色鸡丁', '*GJSSJD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1268, '00001315', '公交白萝卜烧鸭', 'HLBSY（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1269, '00001316', '白萝卜烧鸭-鸭边腿', '*GJHLBSY', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入鸭块沸水，捞出待用；\r\n2.夹层锅给油加热，加入调味料、适量水、鸭块进行红烧，烧熟捞出装入白色成品盒；\r\n3.待辅料熟制后，将汤汁勾芡浇汁；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1270, '00001317', '土豆烧鸭（公交）', 'TDSY（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1271, '00001318', '公交土豆烧鸭', '*GJTDSY', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1272, '00001319', '玉米烧鸭（公交）', 'YMSY（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1273, '00001320', '公交玉米烧鸭', '*GJYMSY', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1274, '00001321', '泡椒烧鸭胸（公交）', 'PJSYX（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1275, '00001322', '公交泡椒烧鸭脯', '*GJPJSYF', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1276, '00001323', '公交肉末炒豆角', 'RMDJ（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1277, '00001324', '公交肉末炒豆角', '*GJRMDJ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1278, '00001325', '家常豆腐（公交）', 'JCDF（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1279, '00001326', '公交家常豆腐', '*GJJCDF', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1280, '00001327', '韭菜炒鸡蛋（公交）', 'JCCJD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1281, '00001328', '公交韭菜炒鸡蛋', '*GJJCCJD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1282, '00001329', '剁椒烧煎蛋（公交）', 'DJSJD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1283, '00001330', '公交剁椒烧煎蛋', '*GJDJSJD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1284, '00001331', '南瓜炒蛋（公交）', 'NGCD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1285, '00001332', '公交南瓜炒蛋', '*GJNGCD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1286, '00001333', '山药炒木耳（公交）', 'SYCME（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1287, '00001334', '公交山药炒木耳', '*GJSYCME', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1288, '00001335', '红烧冬瓜（公交）', 'HSDG（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1289, '00001336', '公交红烧冬瓜', '*GJHSDG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1290, '00001337', '清炒娃娃菜', 'STWWC（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1291, '00001338', '公交上汤娃娃菜', '*GJSTWWC', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1292, '00001339', '山药炒藕片（公交）', 'SYCOP（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1293, '00001340', '公交山药炒藕片', '*GJSYCOP', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1294, '00001341', '公交清炒藕片', 'SLOD（GJ）', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1295, '00001342', '公交清炒藕片', '*GJSLOD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1296, '00001343', '三色包菜丝（公交）', 'SSBCS（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1297, '00001344', '公交三色包菜丝', '*GJSSBCS', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1298, '00001345', '西红柿烧花菜（公交）', 'XHSSHC（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1299, '00001346', '公交西红柿烧花菜', '*GJXHSSHC', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1300, '00001347', '粉蒸土豆（公交）', 'FZTD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1301, '00001348', '公交土豆粉蒸肉-土豆丁', '*GJFZTD', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1302, '00001349', '土豆烧刀豆（公交）', 'TDSDD（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1303, '00001350', '公交土豆烧刀豆', '*GJTDSDD', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1304, '00001351', '冬瓜大骨汤（公交）', 'DGDGT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1305, '00001352', '公交冬瓜大骨汤', '*GJDGDGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1306, '00001353', '白萝卜大骨汤（公交）', 'BLBDGT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1307, '00001354', '公交白萝卜大骨汤', '*GJBLBDGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1308, '00001355', '玉米大骨汤（公交）', 'YMDGT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1309, '00001356', '公交玉米大骨汤', '*GJYMDGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1310, '00001357', '冬瓜排骨汤（公交）', 'DGPGT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1311, '00001358', '公交冬瓜排骨汤', '*GJDGPGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1312, '00001360', '公交白萝卜排骨汤', '*GJBLBPGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1313, '00001361', '玉米排骨汤（公交）', 'YMPGT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1314, '00001362', '公交玉米排骨汤', '*GJYMPGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1315, '00001363', '香菇排骨汤（公交）', 'XGPGT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1316, '00001364', '公交香菇排骨汤', '*GJXGPGT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1317, '00001365', '香菇乌鸡汤（公交）', 'XGWJT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1318, '00001366', '公交香菇乌鸡汤', '*GJXGWJT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1319, '00001367', '绿豆老鸭汤（公交）', 'LDLYT（GJ）', NULL, '100.0000', '100.0000', '10.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1320, '00001368', '公交绿豆老鸭汤', '*GJLDLYT', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1321, '00001369', '便民现打餐-芸豆烧猪蹄', 'BMXDC-YDSZT', NULL, '1.0000', '1.0000', '54.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1322, '00001370', '便民现打餐-泡椒土豆烧鸡块', 'BMXDC-PJTDSJK', NULL, '1.0000', '1.0000', '23.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1323, '00001371', '腌鱼香肉丝（拌面）', '*YYXRS（BM）', NULL, '100.0000', '100.0000', '1.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1324, '00001372', '鱼香肉丝（拌面用）', '*YXRS（BMY）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 389, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1325, '00001376', '法式鸡排饭（公交）', 'FSJPF（GJ）', NULL, '100.0000', '100.0000', '9.60', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1326, '00001377', '豆豉虎皮青椒', '*GJDCHPQJ', NULL, '10.0000', '10.0000', '0.00', '1.用提升式油炸机、过油温度在150℃左右，轻倒入青椒块油炸，炸好装入白色成品盒；\r\n2.夹层锅加适量水、调味料，勾芡汁浇于虎皮椒表面；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1327, '00001378', '公交炒辣椒段', '*GJCLJD', NULL, '100.0000', '100.0000', '1.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1328, '00001379', '公交土豆滚刀块', '*GJTDGDK', NULL, '100.0000', '100.0000', '1.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1329, '00001382', '公交清炒娃娃菜', '*GJQCWWC', NULL, '50.0000', '10.0000', '0.00', '1.夹层锅给水加热，加入调味料，倒入娃娃菜段沸水，捞出装入白色成品盒；\r\n2.夹层锅给油炒香蒜米，加调味料、适量水，勾芡汁浇于娃娃菜表面；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1330, '00001383', '公交五香厚干', '*GJWXHG', NULL, '100.0000', '100.0000', '10.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1331, '00001384', '公交酸辣土豆丝', '*GJSLTDS', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入土豆丝沸水，捞出沥干待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的土豆丝拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1332, '00001385', '公交小炒肉-瘦肉片', '*GJYXCR', NULL, '20.0000', '10.0000', '0.00', '1.用电磁灶过油，温度在160℃左右，轻放入腌制好的肉片油炸，炸好沥油待用；\r\n2.夹层锅给油加热，放入调料、肉片炒香；调汁勾芡，测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1333, '00001387', '公交豆豉油麦菜', '*GJDCYMC', NULL, '50.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入油麦菜沸水，捞起沥水待用；\r\n2.夹层锅给油加热，加入调味料炒香(含豆豉)，倒入沸好水的油麦菜快速拌炒；测中心温度，起锅装入白色成品盒；\r\n3.10分钟之内及时速冷，护色；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1334, '00001390', '土豆红烧肉-肉丁', '*GJTDHSR', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1335, '00001391', '公交外婆菜炒鸡丁', '*GJWPCCJD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1336, '00001392', '公交红椒豆米炒肉末', '*GJHJDMCRM', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给油加热，倒入肉末炒香，20KG/次；\r\n2.夹层锅给水加热，倒入毛豆米沸水，捞出待用；\r\n3.夹层锅给油加热，调料炒香，倒入毛豆米与肉末一起烩炒好；加入红椒丁快速拌炒，测中心温度，起锅装入白色成品盒；\r\n4.10分钟之内及时速冷，护色；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1337, '00001395', '公交爆炒鱼丁-龙利鱼', '*GJBCYD', NULL, '10.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1338, '00001396', '黑木耳炒肉丝', '*GJHMECRS', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1339, '00001397', '公交千张炒豆芽', '*GJQZCDY', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1340, '00001398', '白萝卜烧鸭-白萝卜丁', '*GJBLBSYK', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入萝卜丁沸水，捞出倒入鸭块汤汁中烧制；\r\n2.试味，测中心温度，捞出装入白色成品盒，勾芡浇汁；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1341, '00001399', '公交五花肉炒包菜', '*GJWHRCBC', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，分别将五花肉片、包菜片沸水，捞出待用；\r\n2.夹层锅给油加热，加入调味料、五花肉片炒香，再加入包菜拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1342, '00001400', '腌鸡丁（沙茶手卷）', '*YJD（SCSJ）', NULL, '100.0000', '100.0000', '1.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1343, '00001402', '沙茶鸡丁', '*SCJD', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1344, '00001403', '沙茶鸡丁手卷160g', 'SCJDSJ160G', NULL, '100.0000', '100.0000', '3.77', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1345, '00001404', '红豆薏仁燕麦粥', 'HDYRYMZ', NULL, '100.0000', '100.0000', '2.81', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1346, '00001405', '红豆薏仁燕麦粥', '*HDYRYMZ', NULL, '100.0000', '100.0000', '1.00', '', '1', 130, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1347, '00001406', '卤鸡蛋(去皮)', 'LJD', NULL, '122.0000', '10.0000', '0.00', '1.蒸箱蒸制；人工剥壳；夹层锅卤制；\r\n2.包装备料组切半；\r\n3.装盒卤蛋放入副菜格，同时副菜减少20-25g；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 3, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1348, '00001407', '伍仁酱丁', 'WRJD', NULL, '20.0000', '10.0000', '0.00', '1.电磁灶给油加热，放入调料炒香，放入咸菜爆炒；测中心温度，起锅装入白色成品盒', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 4, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1349, '00001408', '土豆烧牛腩-土豆丁', 'HSTD', NULL, '80.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入土豆丁沸好水，捞出倒入牛肉汤中烧熟；\r\n2.试味，测中心温度，捞出装入白色成品盒，将汤汁勾芡浇汁；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 5, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1350, '00001409', '土豆烧牛腩-牛碎丁', 'HSNN', NULL, '80.0000', '10.0000', '0.00', '1.夹层锅给油加热，加入调料、适量水、牛碎丁进行红烧，烧熟捞出装入白色成品盒；\r\n2.待辅料熟制后，将汤汁勾芡浇汁；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 6, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1351, '00001411', '公交盒饭', 'GJHF', NULL, '1.0000', '1.0000', '9.76', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1352, '00001412', '青椒榨菜干子炒肉丝', 'QJZCGZRS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1353, '00001413', '公交酸辣包菜', 'SLBC', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1354, '00001414', '公交卤鸡蛋(去皮)', 'QPLJD', NULL, '122.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1355, '00001415', '公交伍仁酱丁', 'WRJD', NULL, '1.0000', '1.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1356, '00001416', '公交米饭', 'GJMF', NULL, '1.0000', '1.0000', '0.00', '', '0', 134, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1357, '00001417', '公交干子回锅肉-肉片', '*GJKRFP', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给油加热，将肉方片过油，捞出待用；\r\n2.夹层锅给油加热，放入调味料爆香，放入过好油的肉片、少量水炒制；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1358, '00001418', '公交炒外婆菜', 'WPC', NULL, '20.0000', '10.0000', '0.00', '1.电磁灶给油加热，放入调料炒香，放入咸菜爆炒；测中心温度，起锅装入白色成品盒', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1359, '00001419', '公交炒外婆菜', 'WPC', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1360, '00001420', '公交腌制鸡丁', '*YZJD', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1361, '00001421', '金枪鱼手握细卷', 'JQYSWXJ', NULL, '100.0000', '100.0000', '2.71', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1362, '00001422', '金枪鱼细卷', '*JQYXJ', NULL, '100.0000', '100.0000', '2.71', '', '1', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1363, '00001424', '番茄土豆烧牛腩-牛碎丁', '*FQTDSNN-ZL', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给油加热，加入调料、适量水、牛碎丁进行红烧，烧熟捞出装入白色成品盒；\r\n2.待辅料熟制后，将汤汁勾芡浇汁；\r\n3.速冷；装配盒饭主荤表层40G/份；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1364, '00001425', '番茄土豆烧牛腩-番茄土豆', '*GJTDSNN-PC', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入土豆丁沸好水，捞出与番茄块一起倒入牛肉汤中烧熟；\r\n2.试味，测中心温度，捞出装入白色成品盒，将汤汁勾芡浇汁；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1365, '00001426', '公交麻婆豆腐', '*MPDF', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给油加热，倒入肉末炒香，20KG/次；\r\n2.夹层锅给水加热，放入豆腐丁沸水，捞出待用；\r\n3.夹层锅给油加热，调料炒香，给水、豆腐与肉末一起烧制好；勾芡，测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1366, '00001427', '豆豉炒酸辣包菜', '*DCCSLBC', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，适量盐，倒入包菜丝沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料(含豆豉)，倒入沸好水的包菜拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1367, '00001428', '娃娃菜勾芡', '*WWCGQTL', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1368, '00001429', '公交腐竹烧肉-腐竹', '*GJFZSR-PC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1369, '00001430', '公交豆角肉丝', '*GJDJRS', NULL, '10.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1370, '00001431', '公交豆豉虎皮青椒', 'GJDCHPJJ', NULL, '10.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1371, '00001432', '公交酸辣土豆丝', 'GJSLTDS', NULL, '80.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1372, '00001433', '炒酸豆角', '*CSDJ', NULL, '20.0000', '10.0000', '0.00', '1.电磁灶给油加热，放入调料炒香，放入咸菜爆炒；测中心温度，起锅装入白色成品盒', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1373, '00001434', '公交炒酸豆角', 'GJCSDJ', NULL, '20.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1374, '00001435', '公交卤鸭腿(浇汁，卤水比例1：1)', '*GJLYT', NULL, '200.0000', '10.0000', '0.00', '', '1', 130, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1375, '00001436', '公交卤鸭腿', 'GJLYT', NULL, '200.0000', '10.0000', '0.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1376, '00001437', '孜香牛肉三拼饭', 'ZXNRSPF', NULL, '20.0000', '10.0000', '10.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1377, '00001438', '公交番茄土豆烧牛腩', 'GJFQTDSNN', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1378, '00001439', '公交豆豉炒酸辣包菜', 'GJDCCSLBC', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1379, '00001440', '公交卤鸡腿(浇汁，卤水比例1:1)', '*GJLJT', NULL, '200.0000', '10.0000', '0.00', '1.夹层锅调好卤水，放入腌制好的鸡腿卤制，捞出装入白色成品盒；\r\n2.勾卤汁，浇一层薄薄的汁于鸡腿表层；', '1', 130, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1380, '00001441', '公交卤鸡腿', 'GJLJT', NULL, '200.0000', '10.0000', '0.00', '', '0', 130, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1381, '00001442', '金枪鱼细卷酱', '*JQYXJJ', NULL, '100.0000', '100.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1382, '00001443', '快鼠茄子烧土豆', 'KSQZSTD', NULL, '20.0000', '10.0000', '5.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1383, '00001444', '公交卤花生米(微辣)', '*GJLHSM(WL)', NULL, '80.0000', '10.0000', '0.00', '1.花生米先发泡，加入调料拌匀；\r\n2.装入内胆不锈钢盒蒸制40分钟；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1384, '00001445', '公交卤花生米(微辣)', 'GJLHSM(WL)', NULL, '80.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1385, '00001446', '公交土豆红烧肉', 'GJTDHSR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1386, '00001447', '公交辣子鸡', 'GJLZJ', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1387, '00001448', '公交红椒豆米炒肉末', 'GJHJDMCRM', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1388, '00001449', '黑木耳炒肉丝', 'HMECRS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1389, '00001450', '公交千张炒豆芽', 'GJQZCDY', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1390, '00001451', '公交土豆红烧肉-土豆丁', '*TDHSR-PC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1391, '00001452', '公交外婆菜炒鸡丁', 'GJWPCCJD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1392, '00001453', '快鼠青椒榨菜千张丝', 'QJZCQZS', NULL, '20.0000', '10.0000', '0.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1393, '00001454', '快鼠孜香牛肉', '*KSZXNR', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1394, '00001455', '快鼠番茄鸡蛋', '*KSFQJD', NULL, '20.0000', '10.0000', '10.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1395, '00001456', '快鼠伍仁酱丁', '*KSWRJD', NULL, '20.0000', '10.0000', '0.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1396, '00001457', '公交爆炒鱼丁-青红椒洋葱丁', '*GJBCYD-PC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1397, '00001458', '藤椒鸡排饭510g', 'TJJPF510G', NULL, '100.0000', '100.0000', '9.60', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1398, '00001459', '红烧土豆', '*HSTD', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 388, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1399, '00001460', '藤椒鸡排（成品）', '*TJJP（CP）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 387, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1400, '00001461', '鲜打餐宫保鸡丁', 'XDCGBJD', NULL, '20.0000', '10.0000', '31.80', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1401, '00001462', '鲜打餐双菇卤肉', 'XDCSGLR', NULL, '20.0000', '10.0000', '19.08', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1402, '00001463', '鲜打餐香干回锅肉', 'XDCXGHGR', NULL, '20.0000', '10.0000', '29.15', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1403, '00001464', '鲜打餐番茄鸡蛋', 'XDCFQJD', NULL, '20.0000', '10.0000', '17.49', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1404, '00001465', '鲜打餐酸辣土豆丝', 'XDCSLTDS', NULL, '20.0000', '10.0000', '10.07', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1405, '00001466', '鲜打餐酱爆茄子', 'XDCJBQZ', NULL, '20.0000', '10.0000', '14.31', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1406, '00001467', '鲜打餐卤鸡蛋', 'XDCLJD', NULL, '20.0000', '10.0000', '10.60', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1407, '00001468', '鲜打餐卤蓑衣干子', 'XDCLSYGZ', NULL, '20.0000', '10.0000', '10.60', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1408, '00001469', '鲜打餐卤鸡腿', 'XDCLJT', NULL, '20.0000', '10.0000', '26.50', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1409, '00001470', '鲜打餐米饭', 'XDCMF', NULL, '20.0000', '10.0000', '12.40', '2kg包装，真空8秒', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1410, '00001471', '鲜打餐宫保鸡丁-过油鸡丁', '*XDCGBJD-GYJD', NULL, '20.0000', '10.0000', '0.00', '腌制鸡丁过油，速冷，高温8秒，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1411, '00001472', '鲜打餐宫保鸡丁-黄瓜', '*XDCGBJD-HG', NULL, '0.5000', '0.5000', '0.00', '由前处理直接抽真空，高温5秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1412, '00001473', '鲜打餐宫保鸡丁-花生米', '*XDCGBJD-HSM', NULL, '20.0000', '10.0000', '0.00', '高温10秒，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1413, '00001474', '鲜打餐宫保鸡丁-胡萝卜', '*XDCGBJD-HLB', NULL, '20.0000', '10.0000', '0.00', '沸水后速冷，高温10秒，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1414, '00001475', '鲜打餐宫保鸡丁-酱料', '*XDCGBJD-JL', NULL, '20.0000', '10.0000', '0.00', '熬好酱后摊凉，封口、贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1415, '00001476', '鲜打餐香干回锅肉-青红椒洋葱', '*XDCXGHGR-JL', NULL, '20.0000', '10.0000', '0.00', '洋葱、青红椒过油，速冷，高温10秒，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1416, '00001477', '鲜打餐双菇卤肉', '*XDCSGLR', NULL, '20.0000', '10.0000', '0.00', '肉方切丁、炒制，加水、调味，杏鲍菇、香菇沸水后一起蒸制20分钟，勾芡摊凉，封口，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1417, '00001478', '鲜打餐香干回锅肉-干子炒肉', '*XDCXGHGR-GZCR', NULL, '20.0000', '10.0000', '0.00', '干子、肉方过油，加酱料一起烧制，速冷，高温4秒，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1418, '00001479', '虎皮青椒酱汁', '*HPQJJZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1419, '00001480', '鲜打餐番茄炒鸡蛋', '*XDCFQCJD', NULL, '20.0000', '10.0000', '0.00', '鸡蛋过油，番茄炒半熟，加入鸡蛋炒匀，速冷，高温6秒，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1420, '00001481', '鲜打餐酱爆茄子-茄子', '*XDCJBQZ-QZ', NULL, '1.0000', '1.0000', '0.00', '切成丁，由前处理抽真空，高温10秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1421, '00001482', '鲜打餐酱爆茄子-酱料', '*XDCJBQZ-JB', NULL, '20.0000', '10.0000', '0.00', '炒酱，摊凉，封口，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1422, '00001483', '鲜打餐酸辣土豆丝', '*XDCSLTDS', NULL, '20.0000', '10.0000', '0.00', '土豆丝沸水，辣椒炒香，一起炒熟，速冷，高温6秒', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1423, '00001484', '鲜打餐腌制鸡丁', '*XDCYZJD', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1424, '00001485', '鲜打餐卤蓑衣干子', '*XDCLSYGZ', NULL, '20.0000', '10.0000', '0.00', '10个装，高温6秒', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1425, '00001486', '鲜打餐卤鸡蛋', '*XDCLJD', NULL, '20.0000', '10.0000', '0.00', '10个装，高温6秒', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1426, '00001487', '鲜打餐卤鸡腿', '*XDCLJT', NULL, '20.0000', '10.0000', '0.00', '10个装，高温6秒', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1427, '00001488', '鲜打餐卤水', 'XDCLS', NULL, '20.0000', '10.0000', '0.53', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1428, '00001489', '鲜打餐卤水', '*XDCLS', NULL, '20.0000', '10.0000', '0.53', '封口，贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1429, '00001490', '鲜打餐蚝油生菜-酱料', 'XDCHYSC', NULL, '20.0000', '10.0000', '0.00', '熬好酱后摊凉，封口、贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1430, '00001491', '鲜打餐蚝油生菜-生菜', '*XDCHYSC-SC', NULL, '1.0000', '1.0000', '0.00', '清洗，由前处理抽真空，高温6秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1431, '00001492', '鲜打餐蚝油生菜', 'XDCHYSC', NULL, '1.1000', '1.1000', '14.63', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1432, '00001493', '水煮肉片炒料', '*SZRPCL', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1433, '00001494', '豆豉油麦菜-油麦菜', 'DCLYYMC-MC', NULL, '1.0000', '1.0000', '0.00', '清洗，由前处理抽真空，高温6秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1434, '00001495', '豆豉油麦菜-酱汁', 'DCLYYMC-JZ', NULL, '20.0000', '10.0000', '0.00', '熬好酱后摊凉，封口、贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1435, '00001496', '鲜打餐豆豉油麦菜', 'XDCDCLYYMC', NULL, '1.1000', '1.1000', '12.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1436, '00001497', '公交腌制鸡丝', '*YZJS', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1437, '00001498', '公交腌制鸡腿肉', '*YZJSTP', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1438, '00001499', '公交三杯鸡块-鸡丁', '*GJSBJK', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1439, '00001500', '公交三杯鸡块-土豆红椒香菇', '*GJSBJK-PL', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1440, '00001501', '公交冬瓜肉末', '*GJDGRM', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1441, '00001502', '公交卤海带丝', '*GJLHDS', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅调卤水加热，倒入海带丝段卤制；捞出装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1442, '00001503', '公交三杯鸡块', 'GJSBJK', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1443, '00001504', '公交冬瓜肉末', 'GJDGRM', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1444, '00001505', '公交卤海带丝', 'GJLHDS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1445, '00001506', '炒什锦', '*CSJ', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1446, '00001507', '泰式咖喱什锦炒饭380g', 'TSKLSJCF380G', NULL, '100.0000', '100.0000', '8.89', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1447, '00001508', '蒸米饭（泰式咖喱炒饭）', '*ZMF（TSKLCF）', NULL, '100.0000', '100.0000', '1.00', '', '1', 134, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1448, '00001509', '什锦炒饭', '*SJCF', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1449, '00001510', '快鼠腌制孜香牛肉', '*KSYZZXNR', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1450, '00001511', '公交红烩丸子-丸子木耳', '*GJHHWZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1451, '00001512', '公交红烩丸子-大白菜', '*GJHHWZ-PC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1452, '00001513', '公交老干妈四季豆肉末', '*LBGSJDRM', NULL, '60.0000', '20.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1453, '00001514', '公交酸辣藕丁', '*GJSLOD', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入藕丁沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的藕丁拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1454, '00001515', '公交红烩丸子', 'GJHHWZ', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1455, '00001516', '公交老干妈四季豆肉末', 'GJLBGSJDRM', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1456, '00001517', '公交酸辣藕丁', 'GJSLOD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1457, '00001518', '鲜打餐麻婆豆腐', 'XDCMPDF', NULL, '20.0000', '10.0000', '17.60', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1458, '00001519', '鲜打餐酸辣藕丁', 'XDCSLOD', NULL, '20.0000', '10.0000', '22.05', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1459, '00001520', '鲜打餐麻婆豆腐', '*XDCMPDF', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1460, '00001521', '鲜打餐酸辣藕丁', '*XDCSLOD', NULL, '20.0000', '0.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1461, '00001524', '鲜打餐地三鲜', 'XDCDSX', NULL, '20.0000', '10.0000', '17.60', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1462, '00001526', '鲜打餐地三鲜-土豆', '*XDCDSX-TD', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1463, '00001527', '鲜打餐地三鲜-茄子', '*XDCDSX-QZ', NULL, '0.4000', '0.4000', '0.00', '由前处理直接抽真空，高温5秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1464, '00001528', '鲜打餐地三鲜-长豆角', '*XDCDSX-CDJ', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1465, '00001529', '公交红烧翅根-鸡翅根(毛重66g)', '*GJHSCG-ZL', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1466, '00001530', '公交红烧翅根-红萝卜丁', '*GJHSCG-PL', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1467, '00001531', '公交油淋茄子', '*GJYLQZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1468, '00001532', '公交冬瓜烧五花肉-肉丁', '*DGSWHR-ZL', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1469, '00001533', '公交冬瓜烧五花肉-冬瓜红椒', '*DGSWHR-PC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1470, '00001534', '公交千张芹菜肉丝', '*GJQZQCRS', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1471, '00001535', '公交卤藕片', '*GJLOP', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1472, '00001536', '公交红烧翅根', 'GJHSCG', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1473, '00001537', '公交油淋茄子', 'GJYLQZ', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1474, '00001538', '公交冬瓜烧五花肉', 'DGSWHR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1475, '00001539', '公交千张芹菜肉丝', 'GJQZQCRS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1476, '00001540', '公交卤藕片', 'GJLOP', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1477, '00001541', '公交啤酒鸭-鸭丁', '*GJPJY-YD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1478, '00001542', '公交啤酒鸭-红萝卜', '*GJPJY-HLB', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1479, '00001543', '公交地三鲜五花肉', '*DSXWHR', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1480, '00001544', '公交清炒包菜', '*GJQCBC', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，适量盐，倒入包菜沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的包菜拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1481, '00001545', '公交啤酒鸭', 'GJPJY', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1482, '00001546', '公交地三鲜五花肉', 'GJDSXWHR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1483, '00001547', '公交清炒包菜', 'GJQCBC', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1484, '00001548', '公交腐竹烧牛腩', 'GJTDSNN', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1485, '00001549', '公交腐竹烧牛腩-腐竹红萝卜', '*FZSNN-FZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1486, '00001551', '公交卤藕回锅肉-扣肉方', '*LOHGR-KRF', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1487, '00001552', '公交卤藕回锅肉-莲藕洋葱片', '*LOHGR-LOYC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1488, '00001553', '公交黑木耳肉末', '*HMERM', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1489, '00001554', '公交腐竹烧牛腩-牛碎丁', '*GJFZSNN-NSD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1490, '00001555', '公交肉末鸭血', '*RMYX', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1491, '00001556', '公交清炒土豆丝', '*GJQCTDS', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，倒入土豆丝沸水，捞出沥干待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的土豆丝拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1492, '00001557', '公交卤藕回锅肉', 'GJLOHGR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1493, '00001558', '公交黑木耳肉末', 'GJHMERM', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1494, '00001559', '公交肉末鸭血', 'GJRMYX', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1495, '00001560', '公交清炒土豆丝', 'GJQCTDS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1496, '00001561', '白米饭(补)', 'BMF(B)', NULL, '13.7000', '13.7000', '0.00', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1497, '00001562', '西芹洋葱炒培根', 'XQYCCPG', NULL, '20.0000', '10.0000', '20.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1498, '00001563', '公交酸辣大白菜', '*GJSLDBC', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，适量盐，倒入白菜段沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的白菜拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1499, '00001564', '公交酸辣大白菜', 'GJSLDBC', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1500, '00001565', '鲜打餐腌制牛霖', '*XDCYZMGNR', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1501, '00001566', '鲜打餐蒙古牛肉-过油', '*XDCMGNR-GY', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1502, '00001567', '鲜打餐蒙古牛肉-青红椒洋葱', '*XDCMGNR-QHJYC', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1503, '00001568', '鲜打餐蒙古牛肉-酱汁', '*XDCMGNR-JZ', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1504, '00001569', '鲜打餐泡椒鸭脯', '*XDCPJYF', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1505, '00001572', '鲜打餐干锅花菜-花菜', '*XDCGGHC-HC', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1506, '00001573', '鲜打餐干锅花菜-青红椒', '*XDCGGHC-QHJ', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1507, '00001574', '鲜打餐干锅花菜-酱', '*XDCGGHC-J', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1508, '00001575', '鲜打餐包菜回锅肉-酱', '*XDCGGBC', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1509, '00001576', '鲜打餐包菜回锅肉-包菜', '*XDCGGBC-BC', NULL, '0.8600', '0.8600', '0.00', '由前处理直接抽真空，高温5秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1510, '00001578', '鲜打餐土豆烧鸡-青红椒片', '*XDC-QHJP', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1511, '00001579', '鲜打餐红烧鸡块', '*XDCHSJK', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1512, '00001580', '鸡丝泡饭360g', 'JSPF360G', NULL, '100.0000', '100.0000', '4.42', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1513, '00001581', '鸡丝泡饭汤冻', '*JSPFTD', NULL, '100.0000', '10.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1514, '00001583', '鲜打餐炒烧白-共用', '*XDCGGBC-SB', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1515, '00001584', '鲜打餐黄瓜回锅肉-黄瓜', '*QGCHGR', NULL, '0.8000', '0.8000', '0.00', '由前处理直接抽真空，高温5秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1516, '00001586', '鲜打餐干锅花菜', 'XDCGGHC', NULL, '20.0000', '10.0000', '22.26', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1517, '00001587', '鲜打餐包菜回锅肉', 'XDCGGBC', NULL, '20.0000', '10.0000', '14.84', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1518, '00001588', '鲜打餐土豆烧鸡', 'XDCTDSJ', NULL, '20.0000', '10.0000', '25.44', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1519, '00001589', '鲜打餐黄瓜回锅肉', 'XDCHGHGR', NULL, '20.0000', '10.0000', '22.26', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1520, '00001591', '鲜打餐土豆烧鸡-鸡块土豆', '*XDCTDSJ-SJK', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1521, '00001592', '鲜打餐麻婆豆腐-炒料', '*XDCMPDF-CL', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1522, '00001593', '鲜打餐卤海带丝', '*XDCLHDS', NULL, '20.0000', '10.0000', '15.50', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1523, '00001594', '鲜打餐卤海带丝', '*XDCLHDS', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1524, '00001596', '鲜打餐泡椒鸭脯-洋葱青红椒', '*XDCPJYF-QHJ', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1525, '00001597', '鲜打餐泡椒鸭脯-酱汁', '*XDCPJYF-JZ', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1526, '00001598', '鲜打餐泡椒鸭脯', 'XDCPJYF', NULL, '20.0000', '10.0000', '34.98', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1527, '00001599', '鲜打餐鱼香肉丝', 'XDCYXRS', NULL, '20.0000', '10.0000', '28.62', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1528, '00001600', '鲜打餐鱼香肉丝', 'XDCYXRS', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1529, '00001601', '鲜打餐腌制肉丝', '*XDCYZJS', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1530, '00001602', '鱼豆腐', '*YDF', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1531, '00001603', '鸡丝（成品）', '*JS（CP）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1532, '00001604', '红豆沙', '*HDS', NULL, '100.0000', '100.0000', '1.00', '', '1', 137, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1533, '00001605', '现打餐-榨菜干子炒肉丝', 'XDC-ZCGZCRS', NULL, '20.0000', '10.0000', '18.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1534, '00001606', '公交水煮鸡肉片-鸡肉片', '*GJSZJRP-JRP', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1535, '00001607', '公交水煮鸡肉片-千张豆芽', '*GJSZJRP-QZDY', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1536, '00001608', '公交黄瓜火腿丁', '*GJHGHTD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1537, '00001609', '公交芹菜炒藕丝', '*GJQCCOS', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1538, '00001610', '公交油焖冬笋五花肉-肉片', '*GJYMDSWHR-RP', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1539, '00001611', '公交油焖冬笋五花肉-冬笋红萝卜', '*GJYMDSWHR-DSHLBP', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1540, '00001612', '公交五彩鸡丝', '*GJWCJS', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1541, '00001613', '公交尖椒黄豆芽', '*GJJJHDY', NULL, '60.0000', '10.0000', '0.00', '1.夹层锅给水加热，适量盐，倒入豆芽沸水，捞出待用；\r\n2.夹层锅给油加热，炒香调味料，倒入沸好水的豆芽拌炒；测中心温度，起锅装入白色成品盒；', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1542, '00001614', '公交水煮鸡肉片', 'GJSZJRP', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1543, '00001615', '公交黄瓜火腿丁', 'GJHGHTD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1544, '00001616', '公交芹菜炒藕丝', 'GJQCCOS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1545, '00001617', '公交油焖冬笋五花肉', 'GJYMDSWHR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1546, '00001618', '公交五彩鸡丝', 'GJWCJS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1547, '00001619', '公交尖椒黄豆芽', 'GJJJHDY', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1548, '00001620', '鲜打餐蒙古牛肉', 'XDCMGNR', NULL, '20.0000', '10.0000', '31.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1549, '00001621', '公交腌制肉片', '*GJYZRP', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1550, '00001622', '公交腌制肉丝', '*GJYZRS', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1551, '00001623', '泰式咖喱拌面400g', 'TSKLBM400G', NULL, '100.0000', '100.0000', '6.98', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1552, '00001624', '咖喱酱（泰式拌面用）', '*KLJ（TSBMY）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1553, '00001625', '腌鸡丁（泰式拌面用）', '*YJD（TSBMY）', NULL, '100.0000', '100.0000', '1.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1554, '00001626', '公交腌制鸡肉片', '*GJYZJRP', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1555, '00001627', '腌制琵琶腿125', '*YZPPT125', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1556, '00001628', '腌制鸡翅根66', '*YZJCG66', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1557, '00001629', '腌制鸭边腿200', '*YZYBT', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1558, '00001631', '鲜打餐黄瓜回锅肉-酱', '*XDCHGHGR-J', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1559, '00001632', '黄豆烧牛腩', '*HDSNN', NULL, '120.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1560, '00001633', '大白菜烧丸子', '*DBCSWZ', NULL, '120.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1561, '00001634', '学生餐卤鸡蛋（不去皮）', '*LJD', NULL, '122.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1562, '00001635', '瓠子炒牛柳', '*HZCNL', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1563, '00001636', '卤藕回锅肉', '*LOHGR', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1564, '00001637', '粉蒸土豆', '*FZTD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1565, '00001638', '豆泡烧鹌鹑蛋', '*DPSACD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1566, '00001639', '魔芋烧鸡', '*MYSY', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1567, '00001640', '番茄炒花菜', '*FQCHC', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1568, '00001641', '腐竹炒烧白肉', '*FZSR', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1569, '00001642', '土豆烧鸭子', '*TDSYZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1570, '00001643', '蒸水蛋', '*ZSD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1571, '00001644', '鸡米花', '*JMH', NULL, '20.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1572, '00001645', '大白菜猪肉炒粉条', '*DBCZRCFT', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1573, '00001646', '西芹土豆丝', '*XQTDS', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1574, '00001647', '玉米烧排骨', '*YMDPG', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1575, '00001648', '学生餐番茄炒蛋', '*FQCD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1576, '00001649', '红烧南瓜', '*HSNG', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1577, '00001650', '黄豆烧牛腩', 'HDSNN', NULL, '120.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1578, '00001651', '大白菜烧丸子', 'DBCSWZ', NULL, '120.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1579, '00001652', '学生餐卤鸡蛋', 'LJD', NULL, '122.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1580, '00001653', '瓠子炒牛柳', 'HZCNL', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1581, '00001654', '卤藕回锅肉', 'LOHGR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1582, '00001655', '粉蒸土豆', 'FZTD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1583, '00001656', '豆泡烧鹌鹑蛋', 'DPSACD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1584, '00001657', '魔芋烧鸡', 'MYSY', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1585, '00001658', '番茄炒花菜', 'FQCHC', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1586, '00001659', '腐竹炒烧白肉', 'FZSR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1587, '00001660', '土豆烧鸭子', 'TDSYZ', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1588, '00001661', '蒸水蛋', 'ZSD', NULL, '10.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1589, '00001662', '鸡米花', 'JMH', NULL, '20.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1590, '00001663', '大白菜猪肉炒粉条', 'DBCZRCFT', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1591, '00001664', '西芹土豆丝', 'XQTDS', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1592, '00001665', '玉米烧排骨', 'YMSPG', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1593, '00001666', '学生餐番茄炒蛋', 'FQCD', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1594, '00001667', '红烧南瓜', 'HSNG', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1595, '00001668', '鲜打餐蒜蓉上海青-上海青', '*XDCSRSHQ', NULL, '1.0000', '1.0000', '0.00', '清洗，由前处理抽真空，高温6秒，贴标', '1', 141, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1596, '00001669', '鲜打餐蒜蓉上海青-酱料', '*XDCSRSHQ-JL', NULL, '20.0000', '10.0000', '0.00', '熬好酱后摊凉，封口、贴标', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1597, '00001670', '蒜蓉上海青', 'SRSHQ', NULL, '1.0000', '1.0000', '15.00', '', '0', 132, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1598, '00001671', '腌制肉丁', '*YZRD', NULL, '20.0000', '10.0000', '0.00', '', '1', 133, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1599, '00001672', '公交土豆烧鸭-鸭块', '*GJTDSY', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.950', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1600, '00001673', '公交土豆烧鸭-土豆', '*GJTDSY-TD', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1601, '00001674', '公交豆泡烧五花肉-肉片', '*GJDPSWHR-RP', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '1.000', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1602, '00001675', '公交豆泡烧五花肉-豆泡木耳', '*GJDPSWHR-DPME', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1603, '00001676', '公交豆瓣茄子', '*GJDBQZ', NULL, '60.0000', '10.0000', '0.00', '', '1', 129, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1604, '00001677', '公交土豆烧鸭', 'GJTDSY', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1605, '00001678', '公交豆泡烧五花肉', 'GJDPSWHR', NULL, '60.0000', '10.0000', '0.00', '', '0', 129, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1608, '00001681', '日式叉烧双拼饭525g', 'RSCSSPF525G', NULL, '100.0000', '100.0000', '9.17', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1609, '00001682', '日式叉烧汤冻', 'RSCSTD', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1610, '00001683', '家常豆腐（日式叉烧）', 'JCDF（RSCS）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1611, '00001684', '*叉烧', 'CS', 79, '100.0000', '100.0000', '1.00', '', '1', 50, 42, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, '2018-02-21 16:07:02', 'admin', NULL);
INSERT INTO `prd_data` VALUES (1612, '00001685', '辣白菜培根手握细卷', 'LBCPGSWXJ', NULL, '100.0000', '100.0000', '2.94', '', '0', 131, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '', NULL, NULL, '1', 0, NULL, NULL, NULL);
INSERT INTO `prd_data` VALUES (1613, '00001686', '*辣白菜炒培根', 'LBCCPG', 45, '100.0000', '100.0000', '1.00', '', '1', 50, 42, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, '2018-02-21 16:06:37', 'admin', NULL);
INSERT INTO `prd_data` VALUES (1614, '00001687', '*上海青（鸡丝泡饭）', 'SHQ（JSPF）', NULL, '100.0000', '100.0000', '1.00', '', '1', 128, NULL, NULL, NULL, NULL, '1', '0.900', '0', NULL, '', NULL, NULL, '1', 0, '2018-02-01 01:42:35', 'admin', NULL);
INSERT INTO `prd_data` VALUES (2052, 'F0301616', '*至尊饭团(奥尔良鸡腿)180g', 'ZZFT(AELJT)180G', 92, '10', '1', '3.84', NULL, '1', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2018-02-01 01:42:10', 'admin', NULL);
INSERT INTO `prd_data` VALUES (2058, 'F010602057', '*葱油拌面420g', 'CYBM420G', 79, '10', '1', '7.09', '蒸炸煮', '1', 50, 41, NULL, 102, '3分钟', '1', '0.95', '1', NULL, '炸煮', NULL, NULL, '1', 4, '2018-02-01 01:42:29', 'admin', '100011');
INSERT INTO `prd_data` VALUES (2059, 'F010602059', '*麻酱', '*MJ', 79, '15', '0.5', '15', NULL, '1', 51, 41, NULL, 102, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2017-12-24 10:47:41', '1', NULL, '2018-02-01 01:42:23', 'admin', NULL);
INSERT INTO `prd_data` VALUES (2060, 'F010602060', '*测试类半成品', 'CSLBCP', 79, '20', '250', '2.8', NULL, '1', 50, 42, NULL, 102, '15', '0', NULL, '0', NULL, NULL, 'admin', '2017-12-27 00:26:44', '1', NULL, '2018-02-21 16:21:55', 'admin', NULL);
INSERT INTO `prd_data` VALUES (2062, 'F010602061', '测试类产品12', 'CSLCP12', 79, '150', '0.25', '4', NULL, '0', 50, 41, NULL, 102, NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2017-12-27 00:56:18', '1', NULL, '2018-02-21 16:22:19', 'admin', NULL);
INSERT INTO `prd_data` VALUES (2063, 'F010202063', '*测试半成品-2', 'CSBCP-2', 34, NULL, NULL, NULL, NULL, '1', 50, 41, NULL, 90, NULL, '0', NULL, '0', NULL, NULL, 'admin', '2018-04-10 23:29:09', '1', NULL, '2018-04-10 23:36:48', 'admin', NULL);

-- ----------------------------
-- Table structure for prd_nc_info
-- ----------------------------
DROP TABLE IF EXISTS `prd_nc_info`;
CREATE TABLE `prd_nc_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRD_ID` bigint(255) NULL DEFAULT NULL COMMENT '产品ID',
  `ENERGY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '能量／千焦',
  `ENERGY_NRV` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '能量／NRV%',
  `PROTEIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '蛋白质／克',
  `PROTEIN_NRV` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '蛋白质／NRV%',
  `FAT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脂肪／克',
  `FAT_NRV` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脂肪／NRV%',
  `CARBOHYDRATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '碳水化合物／克',
  `CARBOHYDRATE_NRV` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '碳水化合物／NRV%',
  `SODIUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钠／毫克',
  `SODIUM_NRV` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钠／NRV%',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品营养成分信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prd_nc_info
-- ----------------------------
INSERT INTO `prd_nc_info` VALUES (1, 2, '1', '2', '4', '2', '4', '1', '3', '44', '2', '44', NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (2, 3, '5000', '100', '2', '0.1', '4', '0.2', '50', '5', '6', '1', NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (4, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (5, 2053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (6, 2054, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (7, 2055, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (8, 2052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (9, 2056, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (11, 1609, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (12, 1613, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (13, 1611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (14, 1610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (15, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (16, 2058, '559千焦', '7%', '5.6克', '10%', '2.5克', '4%', '21.9克', '8%', '135毫克', '7%', NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (17, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (18, 166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (19, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (20, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (21, 2059, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (22, 2060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (23, 2061, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (24, 2062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (25, 1614, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (26, 699, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (27, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (28, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (29, 621, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prd_nc_info` VALUES (30, 2063, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.kirin.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2272656E72656E222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', NULL, 'com.kirin.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-MGMSTT01522468449170', 1522488116814, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
INSERT INTO `qrtz_simple_triggers` VALUES ('RenrenScheduler', 'MT_f1jlqdf8l371o', 'DEFAULT', 0, 0, 0);

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'MT_f1jlqdf8l371o', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1512807210054, -1, 5, 'PAUSED', 'SIMPLE', 1512807210054, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2272656E72656E222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1510819200000, -1, 5, 'PAUSED', 'CRON', 1510818655000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2272656E72656E222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1505896200000, -1, 5, 'PAUSED', 'CRON', 1505894807000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'test', 'renren', '0 0/30 * * * ?', 1, '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES (2, 'testTask', 'test2', NULL, '0 0/30 * * * ?', 1, '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'com.kirin.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 89, '0:0:0:0:0:0:0:1', '2017-09-20 16:08:29');
INSERT INTO `sys_log` VALUES (2, 'admin', '暂停定时任务', 'com.kirin.modules.job.controller.ScheduleJobController.pause()', '[1]', 16, '0:0:0:0:0:0:0:1', '2017-09-20 16:15:29');
INSERT INTO `sys_log` VALUES (3, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":2,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"用列表\",\"url\":\"modules/sys/user.html\",\"type\":1,\"icon\":\"fa fa-user\",\"orderNum\":1}', 14, '192.168.31.50', '2017-09-20 17:43:50');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":2,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"用户列表\",\"url\":\"modules/sys/user.html\",\"type\":1,\"icon\":\"fa fa-user\",\"orderNum\":1}', 13, '192.168.31.50', '2017-09-20 17:44:02');
INSERT INTO `sys_log` VALUES (5, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"nickname\":\"超级管理员\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 83, '192.168.31.50', '2017-09-20 18:11:08');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"nickname\":\"超级管理员\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 5, '192.168.31.50', '2017-09-20 18:11:36');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"nickname\":\"超级管理员\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 5, '192.168.31.50', '2017-09-20 18:13:21');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"nickname\":\"超级管理员\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 13, '192.168.31.50', '2017-09-20 18:15:39');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"nickname\":\"超级管理员\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"A@A.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 4, '192.168.31.50', '2017-09-20 18:16:35');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存角色', 'com.kirin.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"管理员\",\"remark\":\"基础数据管理员，用于基础数据的维护工作\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Sep 20, 2017 10:28:58 PM\"}', 73, '0:0:0:0:0:0:0:1', '2017-09-20 22:28:59');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"基础数据管理\",\"type\":0,\"icon\":\"fa fa-cubes\",\"orderNum\":1}', 15, '0:0:0:0:0:0:0:1', '2017-09-20 22:41:40');
INSERT INTO `sys_log` VALUES (12, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,31],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 17, '0:0:0:0:0:0:0:1', '2017-09-20 22:41:52');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"类型管理\",\"url\":\"baseData/typeinfo.html\",\"perms\":\"baseData:typeinfo:list,baseData:typeinfo:info,baseData:typeinfo:save,baseData:typeinfo:update,baseData:typeinfo:detele\",\"type\":1,\"orderNum\":0}', 32, '0:0:0:0:0:0:0:1', '2017-10-02 00:13:32');
INSERT INTO `sys_log` VALUES (14, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"类型管理\",\"url\":\"baseData/typeinfo.html\",\"perms\":\"baseData:typeinfo:list,baseData:typeinfo:info,baseData:typeinfo:save,baseData:typeinfo:update,baseData:typeinfo:detele\",\"type\":1,\"orderNum\":0}', 30, '0:0:0:0:0:0:0:1', '2017-10-02 00:20:07');
INSERT INTO `sys_log` VALUES (15, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"新增类型\",\"perms\":\"baseData:typeinfo:save\",\"type\":2,\"orderNum\":0}', 22, '0:0:0:0:0:0:0:1', '2017-10-02 00:21:04');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"类型管理\",\"url\":\"baseData/typeinfo.html\",\"perms\":\"baseData:typeinfo:list,baseData:typeinfo:info,baseData:typeinfo:save,baseData:typeinfo:update,baseData:typeinfo:detele\",\"type\":1,\"icon\":\"fa fa-th\",\"orderNum\":0}', 33, '0:0:0:0:0:0:0:1', '2017-10-02 00:34:30');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"新增\",\"perms\":\"baseData:typeinfo:save\",\"type\":2,\"orderNum\":0}', 22, '0:0:0:0:0:0:0:1', '2017-10-02 00:34:43');
INSERT INTO `sys_log` VALUES (18, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"查看\",\"perms\":\"baseData:typeinfo:info\",\"type\":2,\"orderNum\":0}', 36, '0:0:0:0:0:0:0:1', '2017-10-02 00:36:04');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"修改\",\"perms\":\"baseData:typeinfo:update\",\"type\":2,\"orderNum\":0}', 12, '0:0:0:0:0:0:0:1', '2017-10-02 00:37:18');
INSERT INTO `sys_log` VALUES (20, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"删除\",\"perms\":\"baseData:typeinfo:delete\",\"type\":2,\"orderNum\":0}', 29, '0:0:0:0:0:0:0:1', '2017-10-02 00:39:12');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"类型管理\",\"url\":\"modules/baseData/typeinfo.html\",\"perms\":\"baseData:typeinfo:list,baseData:typeinfo:info,baseData:typeinfo:save,baseData:typeinfo:update,baseData:typeinfo:detele\",\"type\":1,\"icon\":\"fa fa-th\",\"orderNum\":0}', 25, '0:0:0:0:0:0:0:1', '2017-10-07 12:25:34');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,31,32,33,34,35,36],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 153, '0:0:0:0:0:0:0:1', '2017-10-07 13:39:35');
INSERT INTO `sys_log` VALUES (23, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"基础数据\",\"url\":\"modules/baseData/typedata.html\",\"type\":1,\"icon\":\"fa fa-th\",\"orderNum\":1}', 43, '0:0:0:0:0:0:0:1', '2017-10-10 00:44:17');
INSERT INTO `sys_log` VALUES (24, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,31,32,33,34,35,36,37],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 164, '0:0:0:0:0:0:0:1', '2017-10-10 00:44:43');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":37,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"基础数据\",\"url\":\"modules/baseData/typedata.html\",\"perms\":\"baseData:typedata:list,baseData:typedata:info,baseData:typedata:save,baseData:typedata:update,baseData:typedata:detele\",\"type\":1,\"icon\":\"fa fa-th\",\"orderNum\":1}', 22, '0:0:0:0:0:0:0:1', '2017-10-10 00:49:45');
INSERT INTO `sys_log` VALUES (26, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":37,\"parentName\":\"基础数据\",\"name\":\"新增\",\"perms\":\"baseData:typedata:save\",\"type\":2,\"orderNum\":0}', 42, '0:0:0:0:0:0:0:1', '2017-10-10 00:58:02');
INSERT INTO `sys_log` VALUES (27, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":37,\"parentName\":\"基础数据\",\"name\":\"查看\",\"perms\":\"baseData:typedata:info\",\"type\":2,\"orderNum\":0}', 12, '0:0:0:0:0:0:0:1', '2017-10-10 00:58:53');
INSERT INTO `sys_log` VALUES (28, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":37,\"parentName\":\"基础数据\",\"name\":\"修改\",\"perms\":\"baseData:typedata:update\",\"type\":2,\"orderNum\":0}', 25, '0:0:0:0:0:0:0:1', '2017-10-10 00:59:22');
INSERT INTO `sys_log` VALUES (29, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":37,\"parentName\":\"基础数据\",\"name\":\"删除\",\"perms\":\"baseData:typedata:delete\",\"type\":2,\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-10-10 01:05:52');
INSERT INTO `sys_log` VALUES (30, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,31,32,33,34,35,36,37,38,39,40,41],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 35, '0:0:0:0:0:0:0:1', '2017-10-10 01:06:26');
INSERT INTO `sys_log` VALUES (31, 'admin', '修改密码', 'com.kirin.modules.sys.controller.SysUserController.password()', '\"admin\"', 36, '192.168.0.130', '2017-10-12 14:51:01');
INSERT INTO `sys_log` VALUES (32, 'admin', '保存角色', 'com.kirin.modules.sys.controller.SysRoleController.save()', '{\"roleId\":3,\"roleName\":\"查询\",\"createUserId\":1,\"menuIdList\":[1,2,15],\"createTime\":\"Oct 14, 2017 12:50:32 PM\"}', 152, '0:0:0:0:0:0:0:1', '2017-10-14 12:50:32');
INSERT INTO `sys_log` VALUES (33, 'admin', '保存用户', 'com.kirin.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"nickname\":\"查看\",\"username\":\"chakan\",\"password\":\"6c388396595f87b7d3db517dee7caadab89b9dc906d74415dba7625112644c9c\",\"salt\":\"DEtJCTmnxl5UuNqUjL06\",\"email\":\"0@0.com\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Oct 14, 2017 12:51:05 PM\"}', 49, '0:0:0:0:0:0:0:1', '2017-10-14 12:51:06');
INSERT INTO `sys_log` VALUES (34, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":2}', 7, '192.168.0.175', '2017-10-16 14:45:33');
INSERT INTO `sys_log` VALUES (35, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', 'null', 8, '192.168.0.175', '2017-10-16 17:13:49');
INSERT INTO `sys_log` VALUES (36, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', 'null', 3, '192.168.0.175', '2017-10-16 17:14:08');
INSERT INTO `sys_log` VALUES (37, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', 'null', 3, '192.168.0.175', '2017-10-16 17:17:30');
INSERT INTO `sys_log` VALUES (38, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', 'null', 4, '192.168.0.175', '2017-10-16 17:20:05');
INSERT INTO `sys_log` VALUES (39, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', 'null', 3, '192.168.0.175', '2017-10-16 17:24:27');
INSERT INTO `sys_log` VALUES (40, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', 'null', 2, '192.168.0.175', '2017-10-16 17:24:32');
INSERT INTO `sys_log` VALUES (41, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '10', 3, '192.168.0.175', '2017-10-16 17:26:16');
INSERT INTO `sys_log` VALUES (42, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '8', 3, '192.168.0.175', '2017-10-16 17:26:22');
INSERT INTO `sys_log` VALUES (43, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '7', 5, '192.168.0.175', '2017-10-16 17:31:36');
INSERT INTO `sys_log` VALUES (44, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '6', 5, '192.168.0.175', '2017-10-16 17:31:45');
INSERT INTO `sys_log` VALUES (45, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '5', 3, '192.168.0.175', '2017-10-16 17:31:48');
INSERT INTO `sys_log` VALUES (46, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '4', 3, '192.168.0.175', '2017-10-16 17:31:50');
INSERT INTO `sys_log` VALUES (47, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":33,\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"新增\",\"perms\":\"baseData:typeinfo:save,baseData:typeinfo:select\",\"type\":2,\"orderNum\":0}', 58, '0:0:0:0:0:0:0:1', '2017-10-16 17:52:37');
INSERT INTO `sys_log` VALUES (48, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":35,\"parentId\":32,\"parentName\":\"类型管理\",\"name\":\"修改\",\"perms\":\"baseData:typeinfo:update,baseData:typeinfo:select\",\"type\":2,\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-10-16 17:52:48');
INSERT INTO `sys_log` VALUES (49, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '3', 6, '0:0:0:0:0:0:0:1', '2017-10-16 22:41:11');
INSERT INTO `sys_log` VALUES (50, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '2', 5, '0:0:0:0:0:0:0:1', '2017-10-16 22:41:15');
INSERT INTO `sys_log` VALUES (51, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '1', 6, '0:0:0:0:0:0:0:1', '2017-10-16 22:41:19');
INSERT INTO `sys_log` VALUES (52, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"查询\",\"createUserId\":1,\"menuIdList\":[31,32,34,1,2,15],\"createTime\":\"Oct 14, 2017 12:50:32 PM\"}', 118, '192.168.0.175', '2017-10-17 13:53:27');
INSERT INTO `sys_log` VALUES (53, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"nickname\":\"查看\",\"username\":\"chakan\",\"password\":\"4b59aec760e2e0e8135d01eca82c4bc8ad35257238b75279e057a75474e81da9\",\"salt\":\"DEtJCTmnxl5UuNqUjL06\",\"email\":\"0@0.com\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Oct 14, 2017 12:51:06 PM\"}', 33, '192.168.0.175', '2017-10-17 13:54:10');
INSERT INTO `sys_log` VALUES (54, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"查询\",\"createUserId\":1,\"menuIdList\":[1,2,15],\"createTime\":\"Oct 14, 2017 12:50:32 PM\"}', 45, '0:0:0:0:0:0:0:1', '2017-10-17 14:09:06');
INSERT INTO `sys_log` VALUES (55, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"查询\",\"createUserId\":1,\"menuIdList\":[31,32,34,1,2,15],\"createTime\":\"Oct 14, 2017 12:50:32 PM\"}', 20, '0:0:0:0:0:0:0:1', '2017-10-17 14:10:54');
INSERT INTO `sys_log` VALUES (56, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"类型管理\",\"url\":\"modules/baseData/typeinfo.html\",\"perms\":\"baseData:typeinfo:list\",\"type\":1,\"icon\":\"fa fa-th\",\"orderNum\":0}', 56, '0:0:0:0:0:0:0:1', '2017-10-17 14:12:02');
INSERT INTO `sys_log` VALUES (57, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"原料维护\",\"url\":\"modules/baseData/mtrdata.html\",\"perms\":\"baseData:mtrdata:list\",\"type\":1,\"icon\":\"fa-balance-scale\",\"orderNum\":3}', 38, '192.168.0.175', '2017-10-17 15:56:30');
INSERT INTO `sys_log` VALUES (58, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,42,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 92, '192.168.0.175', '2017-10-17 15:57:08');
INSERT INTO `sys_log` VALUES (59, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"管理员\",\"remark\":\"基础数据管理员，用于基础数据的维护工作\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,42,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 10:28:59 PM\"}', 31, '192.168.0.175', '2017-10-17 15:57:46');
INSERT INTO `sys_log` VALUES (60, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"原料维护\",\"url\":\"modules/baseData/mtrdata.html\",\"perms\":\"baseData:mtrdata:list\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":3}', 11, '0:0:0:0:0:0:0:1', '2017-10-17 22:49:08');
INSERT INTO `sys_log` VALUES (61, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"新增原料\",\"perms\":\"baseData:mtrdata:save\",\"type\":2,\"orderNum\":0}', 28, '192.168.0.175', '2017-10-18 16:34:10');
INSERT INTO `sys_log` VALUES (62, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '25', 16, '0:0:0:0:0:0:0:1', '2017-10-18 23:40:39');
INSERT INTO `sys_log` VALUES (63, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"原料维护\",\"url\":\"modules/baseData/mtrdata.html\",\"perms\":\"baseData:mtrdata:list,baseData:mtrdata:info\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":3}', 30, '192.168.0.175', '2017-10-19 17:31:45');
INSERT INTO `sys_log` VALUES (64, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"修改原料信息\",\"perms\":\"baseData:mtrdata:update\",\"type\":2,\"orderNum\":0}', 18, '0:0:0:0:0:0:0:1', '2017-10-21 22:27:55');
INSERT INTO `sys_log` VALUES (65, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,42,43,44,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 91, '0:0:0:0:0:0:0:1', '2017-10-21 22:28:10');
INSERT INTO `sys_log` VALUES (66, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"删除原料\",\"perms\":\"baseData:mtrcut:delete\",\"type\":2,\"orderNum\":0}', 9, '0:0:0:0:0:0:0:1', '2017-10-24 00:18:11');
INSERT INTO `sys_log` VALUES (67, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 83, '0:0:0:0:0:0:0:1', '2017-10-24 00:18:25');
INSERT INTO `sys_log` VALUES (68, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 18, '0:0:0:0:0:0:0:1', '2017-10-24 00:23:36');
INSERT INTO `sys_log` VALUES (69, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"nickname\":\"超级管理员\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"A@A.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 11, 2016 11:11:11 AM\"}', 41, '0:0:0:0:0:0:0:1', '2017-10-24 00:23:55');
INSERT INTO `sys_log` VALUES (70, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":45,\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"删除原料\",\"perms\":\"baseData:mtrdata:delete\",\"type\":2,\"orderNum\":0}', 29, '0:0:0:0:0:0:0:1', '2017-10-24 00:33:11');
INSERT INTO `sys_log` VALUES (71, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"产品管理\",\"url\":\"modules/baseData/prddata.html\",\"perms\":\"baseData:prddata:list\",\"type\":1,\"icon\":\"fa fa-product-hunt\",\"orderNum\":0}', 13, '192.168.0.175', '2017-10-27 15:02:30');
INSERT INTO `sys_log` VALUES (72, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,46,37,38,39,40,41,42,43,44,45,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 111, '192.168.0.175', '2017-10-27 15:02:39');
INSERT INTO `sys_log` VALUES (73, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理\",\"url\":\"modules/baseData/bomdata.html\",\"perms\":\"baseData:bomdata:list\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":0}', 15, '192.168.0.175', '2017-10-27 15:13:19');
INSERT INTO `sys_log` VALUES (74, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,46,47,37,38,39,40,41,42,43,44,45,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 21, '192.168.0.175', '2017-10-27 15:13:27');
INSERT INTO `sys_log` VALUES (75, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":46,\"parentName\":\"产品管理\",\"name\":\"新增产品\",\"perms\":\"baseData:prddata:save\",\"type\":2,\"orderNum\":0}', 77, '0:0:0:0:0:0:0:1', '2017-10-28 02:15:23');
INSERT INTO `sys_log` VALUES (76, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,46,48,47,37,38,39,40,41,42,43,44,45,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 347, '0:0:0:0:0:0:0:1', '2017-10-28 02:15:34');
INSERT INTO `sys_log` VALUES (77, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"产品管理\",\"url\":\"modules/baseData/prddata.html\",\"perms\":\"baseData:prddata:list,baseData:prddata:info\",\"type\":1,\"icon\":\"fa fa-product-hunt\",\"orderNum\":0}', 66, '0:0:0:0:0:0:0:1', '2017-10-28 02:31:27');
INSERT INTO `sys_log` VALUES (78, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":46,\"parentName\":\"产品管理\",\"name\":\"修改产品\",\"perms\":\"baseData:prddata:update\",\"type\":2,\"orderNum\":0}', 75, '0:0:0:0:0:0:0:1', '2017-10-28 03:14:15');
INSERT INTO `sys_log` VALUES (79, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,46,48,49,47,37,38,39,40,41,42,43,44,45,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 213, '0:0:0:0:0:0:0:1', '2017-10-28 03:14:27');
INSERT INTO `sys_log` VALUES (80, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"nickname\":\"查看\",\"username\":\"chakan\",\"salt\":\"DEtJCTmnxl5UuNqUjL06\",\"email\":\"0@0.com\",\"status\":0,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Oct 14, 2017 12:51:06 PM\"}', 128, '0:0:0:0:0:0:0:1', '2017-10-28 10:26:37');
INSERT INTO `sys_log` VALUES (81, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":42,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"原料维护\",\"url\":\"modules/baseData/mtrdata.html\",\"perms\":\"baseData:mtrdata:list,baseData:mtrdata:info\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":1}', 10, '192.168.0.175', '2017-10-30 09:54:34');
INSERT INTO `sys_log` VALUES (82, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":37,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"基础数据\",\"url\":\"modules/baseData/typedata.html\",\"perms\":\"baseData:typedata:list,baseData:typedata:info,baseData:typedata:save,baseData:typedata:update,baseData:typedata:detele\",\"type\":1,\"icon\":\"fa fa-th\",\"orderNum\":9}', 4, '192.168.0.175', '2017-10-30 09:54:56');
INSERT INTO `sys_log` VALUES (83, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"产品管理\",\"url\":\"modules/baseData/prddata.html\",\"perms\":\"baseData:prddata:list,baseData:prddata:info\",\"type\":1,\"icon\":\"fa fa-product-hunt\",\"orderNum\":2}', 5, '192.168.0.175', '2017-10-30 09:55:18');
INSERT INTO `sys_log` VALUES (84, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":47,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理\",\"url\":\"modules/baseData/bomdata.html\",\"perms\":\"baseData:bomdata:list\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":3}', 5, '192.168.0.175', '2017-10-30 09:55:24');
INSERT INTO `sys_log` VALUES (85, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,47,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 105, '192.168.0.175', '2017-10-30 13:52:39');
INSERT INTO `sys_log` VALUES (86, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":46,\"parentName\":\"产品管理\",\"name\":\"删除产品\",\"perms\":\"baseData:prddata:delete\",\"type\":2,\"orderNum\":0}', 13, '192.168.0.175', '2017-10-30 20:01:42');
INSERT INTO `sys_log` VALUES (87, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,47,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 107, '192.168.0.175', '2017-10-30 20:01:53');
INSERT INTO `sys_log` VALUES (88, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理2\",\"url\":\"modules/baseData/bominfo.html\",\"perms\":\"baseData:bominfo:list\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":0}', 10, '192.168.0.175', '2017-10-31 17:12:01');
INSERT INTO `sys_log` VALUES (89, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":51,\"parentName\":\"配方管理2\",\"name\":\"新增配方\",\"perms\":\"baseData:bominfo:save\",\"type\":2,\"orderNum\":0}', 5, '192.168.0.175', '2017-10-31 17:14:05');
INSERT INTO `sys_log` VALUES (90, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理2\",\"url\":\"modules/baseData/bominfo.html\",\"perms\":\"baseData:bominfo:list\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":4}', 7, '192.168.0.175', '2017-10-31 17:16:05');
INSERT INTO `sys_log` VALUES (91, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 85, '192.168.0.175', '2017-10-31 17:16:17');
INSERT INTO `sys_log` VALUES (92, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":51,\"parentName\":\"配方管理2\",\"name\":\"修改配方\",\"perms\":\"baseData:bominfo:update\",\"type\":2,\"orderNum\":0}', 8, '192.168.0.175', '2017-11-01 14:14:57');
INSERT INTO `sys_log` VALUES (93, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理2\",\"url\":\"modules/baseData/bominfo.html\",\"perms\":\"baseData:bominfo:list,baseData:bominfo:info\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":4}', 5, '192.168.0.175', '2017-11-01 14:23:03');
INSERT INTO `sys_log` VALUES (94, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":51,\"parentName\":\"配方管理2\",\"name\":\"原料配置\",\"perms\":\"baseData:bominfo:detailConfig\",\"type\":2,\"orderNum\":0}', 10, '192.168.0.175', '2017-11-01 14:31:39');
INSERT INTO `sys_log` VALUES (95, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理2\",\"url\":\"modules/baseData/bominfo.html\",\"perms\":\"baseData:bominfo:list,baseData:bominfo:info,baseData:bomdetail:list\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":4}', 12, '192.168.0.175', '2017-11-01 15:25:22');
INSERT INTO `sys_log` VALUES (96, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"进销存管理\",\"type\":0,\"icon\":\"fa fa-truck\",\"orderNum\":0}', 2, '192.168.0.175', '2017-11-10 11:03:51');
INSERT INTO `sys_log` VALUES (97, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":55,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"进销存管理\",\"type\":0,\"icon\":\"fa fa-truck\",\"orderNum\":2}', 4, '192.168.0.175', '2017-11-10 11:04:06');
INSERT INTO `sys_log` VALUES (98, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":9}', 2, '192.168.0.175', '2017-11-10 11:04:18');
INSERT INTO `sys_log` VALUES (99, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"采购管理\",\"type\":0,\"icon\":\"fa fa-shopping-cart\",\"orderNum\":3}', 3, '192.168.0.175', '2017-11-10 11:06:08');
INSERT INTO `sys_log` VALUES (100, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"销售管理\",\"type\":0,\"icon\":\"fa fa-truck\",\"orderNum\":4}', 2, '192.168.0.175', '2017-11-10 11:15:48');
INSERT INTO `sys_log` VALUES (101, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":55,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"进销存管理\",\"type\":0,\"icon\":\"\",\"orderNum\":2}', 2, '192.168.0.175', '2017-11-10 11:15:58');
INSERT INTO `sys_log` VALUES (102, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"库存管理\",\"type\":0,\"icon\":\"fa fa-cubes\",\"orderNum\":5}', 2, '192.168.0.175', '2017-11-10 11:20:56');
INSERT INTO `sys_log` VALUES (103, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"基础数据管理\",\"type\":0,\"icon\":\"fa fa-archive\",\"orderNum\":1}', 2, '192.168.0.175', '2017-11-10 11:22:16');
INSERT INTO `sys_log` VALUES (104, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '55', 18, '192.168.0.175', '2017-11-10 11:22:23');
INSERT INTO `sys_log` VALUES (105, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"供应商管理\",\"url\":\"#\",\"type\":1,\"icon\":\"fa fa-handshake-o\",\"orderNum\":0}', 3, '192.168.0.175', '2017-11-10 11:41:06');
INSERT INTO `sys_log` VALUES (106, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"fa fa-file-text\",\"orderNum\":6}', 2, '192.168.0.175', '2017-11-10 11:44:29');
INSERT INTO `sys_log` VALUES (107, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":59,\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"供应商管理\",\"url\":\"purchase/supplierinfo.html\",\"type\":1,\"icon\":\"fa fa-handshake-o\",\"orderNum\":0}', 18, '0:0:0:0:0:0:0:1', '2017-11-12 13:00:02');
INSERT INTO `sys_log` VALUES (108, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 73, '0:0:0:0:0:0:0:1', '2017-11-12 13:00:23');
INSERT INTO `sys_log` VALUES (109, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":59,\"parentName\":\"供应商管理\",\"name\":\"新增供应商\",\"perms\":\"purchase:supplierinfo:save\",\"type\":2,\"orderNum\":0}', 5, '0:0:0:0:0:0:0:1', '2017-11-12 13:14:05');
INSERT INTO `sys_log` VALUES (110, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":59,\"parentName\":\"供应商管理\",\"name\":\"编辑供应商信息\",\"perms\":\"purchase:supplierinfo:update\",\"type\":2,\"orderNum\":0}', 7, '0:0:0:0:0:0:0:1', '2017-11-12 13:14:30');
INSERT INTO `sys_log` VALUES (111, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":59,\"parentName\":\"供应商管理\",\"name\":\"删除供应商\",\"perms\":\"purchase:supplierinfo:delete\",\"type\":2,\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2017-11-12 13:14:55');
INSERT INTO `sys_log` VALUES (112, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 14, '0:0:0:0:0:0:0:1', '2017-11-12 13:15:12');
INSERT INTO `sys_log` VALUES (113, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":59,\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"供应商管理\",\"url\":\"modules/purchase/supplierinfo.html\",\"perms\":\"purchase:supplierinfo:list\",\"type\":1,\"icon\":\"fa fa-handshake-o\",\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-11-12 13:30:47');
INSERT INTO `sys_log` VALUES (114, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"采购原料维护\",\"url\":\"modules/purcharse/suppiermtr.html\",\"perms\":\"purchase:suppiermtr:list\",\"type\":1,\"orderNum\":1}', 5, '0:0:0:0:0:0:0:1', '2017-11-12 20:22:58');
INSERT INTO `sys_log` VALUES (115, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '64', 13, '192.168.0.175', '2017-11-14 10:21:26');
INSERT INTO `sys_log` VALUES (116, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"采购计划管理\",\"url\":\"modules/purchase/procurementplan.html\",\"type\":1,\"orderNum\":1}', 8, '192.168.0.175', '2017-11-15 09:29:13');
INSERT INTO `sys_log` VALUES (117, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"采购订单管理\",\"url\":\"modules/purchase/orderinfo.html\",\"type\":1,\"orderNum\":2}', 3, '192.168.0.175', '2017-11-15 09:32:42');
INSERT INTO `sys_log` VALUES (118, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":64,\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"采购计划管理\",\"url\":\"modules/purchase/procurementplan.html\",\"perms\":\"purchase:procurementplan:list,purchase:procurementplan:info\",\"type\":1,\"orderNum\":1}', 6, '192.168.0.175', '2017-11-15 11:04:19');
INSERT INTO `sys_log` VALUES (119, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":64,\"parentName\":\"采购计划管理\",\"name\":\"新增采购计划\",\"perms\":\"purchase:procurementplan:save\",\"type\":2,\"orderNum\":0}', 4, '192.168.0.175', '2017-11-15 11:21:47');
INSERT INTO `sys_log` VALUES (120, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":64,\"parentName\":\"采购计划管理\",\"name\":\"修改采购计划\",\"perms\":\"purchase:procurementplan:update\",\"type\":2,\"orderNum\":0}', 3, '192.168.0.175', '2017-11-15 11:22:10');
INSERT INTO `sys_log` VALUES (121, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":64,\"parentName\":\"采购计划管理\",\"name\":\"删除采购计划\",\"perms\":\"purchase:procurementplan:del\",\"type\":2,\"orderNum\":0}', 3, '192.168.0.175', '2017-11-15 11:22:32');
INSERT INTO `sys_log` VALUES (122, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,64,66,67,68,65,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 81, '192.168.0.175', '2017-11-15 11:22:47');
INSERT INTO `sys_log` VALUES (123, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,64,66,67,68,65,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 10, '192.168.0.175', '2017-11-15 11:23:10');
INSERT INTO `sys_log` VALUES (124, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":68,\"parentId\":64,\"parentName\":\"采购计划管理\",\"name\":\"删除采购计划\",\"perms\":\"purchase:procurementplan:delete\",\"type\":2,\"orderNum\":0}', 3, '192.168.0.175', '2017-11-15 11:24:12');
INSERT INTO `sys_log` VALUES (125, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":64,\"parentName\":\"采购计划管理\",\"name\":\"生成订单\",\"perms\":\"purchase:procurementplan:createOrder\",\"type\":2,\"orderNum\":0}', 24, '192.168.0.175', '2017-11-17 16:55:14');
INSERT INTO `sys_log` VALUES (126, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,64,66,67,68,69,65,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 78, '192.168.0.175', '2017-11-17 16:55:25');
INSERT INTO `sys_log` VALUES (127, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":65,\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"采购订单管理\",\"url\":\"modules/purchase/orderinfo.html\",\"perms\":\"purchase:orderinfo:list\",\"type\":1,\"orderNum\":2}', 50, '192.168.0.175', '2017-11-17 21:35:03');
INSERT INTO `sys_log` VALUES (128, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":65,\"parentName\":\"采购订单管理\",\"name\":\"新建订单\",\"perms\":\"purchase:orderinfo:save\",\"type\":2,\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-11-18 11:24:07');
INSERT INTO `sys_log` VALUES (129, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":65,\"parentName\":\"采购订单管理\",\"name\":\"修改订单\",\"perms\":\"purchase:orderinfo:update\",\"type\":2,\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2017-11-18 11:24:31');
INSERT INTO `sys_log` VALUES (130, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":65,\"parentName\":\"采购订单管理\",\"name\":\"删除\",\"perms\":\"purchase:orderinfo:delete\",\"type\":2,\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-11-18 11:26:28');
INSERT INTO `sys_log` VALUES (131, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,64,66,67,68,69,65,70,71,72,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 70, '0:0:0:0:0:0:0:1', '2017-11-18 11:26:48');
INSERT INTO `sys_log` VALUES (132, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '47', 6, '0:0:0:0:0:0:0:1', '2017-11-18 13:07:40');
INSERT INTO `sys_log` VALUES (133, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":31,\"parentName\":\"基础数据管理\",\"name\":\"配方管理\",\"url\":\"modules/baseData/bominfo.html\",\"perms\":\"baseData:bominfo:list,baseData:bominfo:info,baseData:bomdetail:list\",\"type\":1,\"icon\":\"fa fa-superscript\",\"orderNum\":4}', 4, '0:0:0:0:0:0:0:1', '2017-11-18 13:07:48');
INSERT INTO `sys_log` VALUES (134, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '37', 2, '127.0.0.1', '2017-11-18 14:03:24');
INSERT INTO `sys_log` VALUES (135, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '37', 4, '127.0.0.1', '2017-11-18 14:03:50');
INSERT INTO `sys_log` VALUES (136, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '38', 99, '127.0.0.1', '2017-11-18 14:04:01');
INSERT INTO `sys_log` VALUES (137, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '39', 37, '127.0.0.1', '2017-11-18 14:04:17');
INSERT INTO `sys_log` VALUES (138, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '40', 68, '127.0.0.1', '2017-11-18 14:04:30');
INSERT INTO `sys_log` VALUES (139, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '41', 40, '127.0.0.1', '2017-11-18 14:04:38');
INSERT INTO `sys_log` VALUES (140, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '37', 38, '127.0.0.1', '2017-11-18 14:04:46');
INSERT INTO `sys_log` VALUES (141, 'admin', '保存角色', 'com.kirin.modules.sys.controller.SysRoleController.save()', '{\"roleId\":4,\"roleName\":\"采购部长\",\"createUserId\":1,\"menuIdList\":[31,42,43,44,45,46,48,49,50,56,59,61,62,63,64,66,67,68,69,65,70,71,72],\"createTime\":\"Nov 18, 2017 2:30:39 PM\"}', 129, '127.0.0.1', '2017-11-18 14:30:40');
INSERT INTO `sys_log` VALUES (142, 'admin', '保存用户', 'com.kirin.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"周舟\",\"password\":\"c7aa8421d5bc068ec0c0400a2b9666c1046233a87b1c3b53b1329e0c468ec568\",\"salt\":\"W3dwJgOgV18o5vEwKNFE\",\"email\":\"z@d.com\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Nov 18, 2017 2:31:26 PM\"}', 152, '127.0.0.1', '2017-11-18 14:31:27');
INSERT INTO `sys_log` VALUES (143, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '37', 2, '127.0.0.1', '2017-11-22 10:49:43');
INSERT INTO `sys_log` VALUES (144, 'admin', '保存角色', 'com.kirin.modules.sys.controller.SysRoleController.save()', '{\"roleId\":5,\"roleName\":\"财务部长\",\"createUserId\":1,\"menuIdList\":[31,37,39,57,58,60],\"createTime\":\"Nov 23, 2017 9:10:45 AM\"}', 177, '127.0.0.1', '2017-11-23 09:10:45');
INSERT INTO `sys_log` VALUES (145, 'admin', '保存用户', 'com.kirin.modules.sys.controller.SysUserController.save()', '{\"userId\":4,\"username\":\"徐昭\",\"password\":\"3bf594cfd5fa3b575867bae8762dade59152b4b83d77b2540fdbec60e11be8f1\",\"salt\":\"urKT8fxe4jS6rHzlzua9\",\"email\":\"a@w.com\",\"status\":1,\"roleIdList\":[5],\"createUserId\":1,\"createTime\":\"Nov 23, 2017 9:41:21 AM\"}', 165, '127.0.0.1', '2017-11-23 09:41:21');
INSERT INTO `sys_log` VALUES (146, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '73', 52, '127.0.0.1', '2017-11-23 10:46:01');
INSERT INTO `sys_log` VALUES (147, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '71', 52, '127.0.0.1', '2017-11-23 10:46:36');
INSERT INTO `sys_log` VALUES (148, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '77', 53, '127.0.0.1', '2017-11-23 14:40:42');
INSERT INTO `sys_log` VALUES (149, 'admin', '保存用户', 'com.kirin.modules.sys.controller.SysUserController.save()', '{\"userId\":5,\"username\":\"小明\",\"password\":\"c1ca505ee7acf534f4a76f549dcfabb4de72a9fb299529cfa42b90b10aa2c43e\",\"salt\":\"OLn8mcwq4ARRe4n4xQyJ\",\"email\":\"q@w.com\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Nov 23, 2017 4:07:37 PM\"}', 84, '127.0.0.1', '2017-11-23 16:07:38');
INSERT INTO `sys_log` VALUES (150, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":51,\"parentName\":\"配方管理\",\"name\":\"删除\",\"perms\":\"baseData:prddata:delete\",\"type\":2,\"orderNum\":0}', 47, '127.0.0.1', '2017-11-24 10:57:32');
INSERT INTO `sys_log` VALUES (151, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":51,\"parentName\":\"配方管理\",\"name\":\"删除配方\",\"perms\":\"baseData:prddata:delete\",\"type\":2,\"orderNum\":0}', 35, '127.0.0.1', '2017-11-24 10:59:40');
INSERT INTO `sys_log` VALUES (152, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"查看\",\"perms\":\"baseData:typeinfo:info\",\"type\":2,\"orderNum\":0}', 31, '127.0.0.1', '2017-11-24 11:01:00');
INSERT INTO `sys_log` VALUES (153, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":46,\"parentName\":\"产品管理\",\"name\":\"查看\",\"perms\":\"baseData:typeinfo:info\",\"type\":2,\"orderNum\":0}', 38, '127.0.0.1', '2017-11-24 13:02:50');
INSERT INTO `sys_log` VALUES (154, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"查询\",\"createUserId\":1,\"menuIdList\":[31,32,34,42,74,46,75,37,39,1,2,15],\"createTime\":\"Oct 14, 2017 12:50:32 PM\"}', 135, '127.0.0.1', '2017-11-24 13:05:03');
INSERT INTO `sys_log` VALUES (155, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":51,\"parentName\":\"配方管理\",\"name\":\"查看\",\"perms\":\"baseData:typeinfo:info\",\"type\":2,\"orderNum\":0}', 38, '127.0.0.1', '2017-11-24 13:05:58');
INSERT INTO `sys_log` VALUES (156, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":59,\"parentName\":\"供应商管理\",\"name\":\"查看\",\"perms\":\"baseData:typeinfo:info\",\"type\":2,\"orderNum\":0}', 40, '127.0.0.1', '2017-11-24 13:07:35');
INSERT INTO `sys_log` VALUES (157, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":65,\"parentName\":\"采购订单管理\",\"name\":\"查看\",\"perms\":\"baseData:typeinfo:info\",\"type\":2,\"orderNum\":0}', 29, '127.0.0.1', '2017-11-24 13:08:07');
INSERT INTO `sys_log` VALUES (158, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":3,\"roleName\":\"查询\",\"createUserId\":1,\"menuIdList\":[31,32,34,42,74,46,75,51,76,37,39,56,59,77,65,78,1,2,15],\"createTime\":\"Oct 14, 2017 12:50:32 PM\"}', 103, '127.0.0.1', '2017-11-24 13:08:48');
INSERT INTO `sys_log` VALUES (159, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '44', 25, '127.0.0.1', '2017-11-24 15:28:44');
INSERT INTO `sys_log` VALUES (160, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '98', 16, '127.0.0.1', '2017-11-25 09:19:38');
INSERT INTO `sys_log` VALUES (161, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '96', 47, '127.0.0.1', '2017-11-25 09:20:22');
INSERT INTO `sys_log` VALUES (162, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '95', 4, '127.0.0.1', '2017-11-25 09:20:28');
INSERT INTO `sys_log` VALUES (163, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '95', 3, '127.0.0.1', '2017-11-25 09:20:45');
INSERT INTO `sys_log` VALUES (164, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '97', 38, '127.0.0.1', '2017-11-25 09:20:51');
INSERT INTO `sys_log` VALUES (165, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '95', 0, '127.0.0.1', '2017-11-25 09:20:57');
INSERT INTO `sys_log` VALUES (166, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '95', 0, '127.0.0.1', '2017-11-25 09:21:09');
INSERT INTO `sys_log` VALUES (167, 'admin', '删除用户', 'com.kirin.modules.sys.controller.SysUserController.delete()', '[2]', 112, '127.0.0.1', '2017-11-25 13:57:27');
INSERT INTO `sys_log` VALUES (168, 'admin', '保存用户', 'com.kirin.modules.sys.controller.SysUserController.save()', '{\"userId\":6,\"username\":\"凡芸\",\"password\":\"44c111267400d7ee4edc6fb8ae8abc1eb3e5cb8076cd61afbfe2ad0be2dddb2e\",\"salt\":\"3XrO8lTF4Y5I6EDaZ3v9\",\"email\":\"w@1.com\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Dec 8, 2017 10:21:19 AM\"}', 220, '127.0.0.1', '2017-12-08 10:21:19');
INSERT INTO `sys_log` VALUES (169, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"管理员\",\"remark\":\"基础数据管理员，用于基础数据的维护工作\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,53,54,37,38,39,40,41,56,59,61,62,63,64,66,67,68,69,65,70,71,72,57,74,75,76,77,81,82,83,84,73,78,79,80,58,60],\"createTime\":\"Sep 20, 2017 10:28:59 PM\"}', 61, '127.0.0.1', '2017-12-08 10:28:39');
INSERT INTO `sys_log` VALUES (170, 'admin', '修改用户', 'com.kirin.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"周舟\",\"password\":\"638d3215551a355eb3a410c966b34fa503ddee6627a2d12051bb0a1ea681a4e4\",\"salt\":\"W3dwJgOgV18o5vEwKNFE\",\"email\":\"z@d.com\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Nov 18, 2017 2:31:27 PM\"}', 122, '127.0.0.1', '2017-12-09 14:46:12');
INSERT INTO `sys_log` VALUES (171, 'admin', '立即执行任务', 'com.kirin.modules.job.controller.ScheduleJobController.run()', '[1]', 70, '127.0.0.1', '2017-12-09 16:13:30');
INSERT INTO `sys_log` VALUES (172, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,65,70,71,72,57,74,75,76,77,81,82,83,84,73,78,79,80,58,87,89,90,91,88,92,94,93,95,96,97,98,99,100,101,60,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 79, '0:0:0:0:0:0:0:1', '2017-12-19 09:54:12');
INSERT INTO `sys_log` VALUES (173, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":57,\"parentName\":\"销售管理\",\"name\":\"生产计划单管理\",\"url\":\"modules/sales/productionplan.html\",\"perms\":\"sales:productionplan:list,sales:productionplandetail:info\",\"type\":1,\"orderNum\":1}', 24, '0:0:0:0:0:0:0:1', '2017-12-20 11:21:11');
INSERT INTO `sys_log` VALUES (174, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":57,\"parentName\":\"销售管理\",\"name\":\"客户订单管理\",\"url\":\"modules/sales/productionorder.html\",\"perms\":\"sales:productionorder:list,sales:productionorderdetail:info\",\"type\":1,\"orderNum\":1}', 12, '0:0:0:0:0:0:0:1', '2017-12-20 11:34:59');
INSERT INTO `sys_log` VALUES (175, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":73,\"parentName\":\"客户订单管理\",\"name\":\"新增客户订单\",\"perms\":\"sales:productionorder:save\",\"type\":2,\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-12-20 11:48:23');
INSERT INTO `sys_log` VALUES (176, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":73,\"parentName\":\"客户订单管理\",\"name\":\"修改客户订单\",\"perms\":\"sales:productionorder:update\",\"type\":2,\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2017-12-20 11:48:46');
INSERT INTO `sys_log` VALUES (177, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":73,\"parentName\":\"客户订单管理\",\"name\":\"删除客户订单\",\"perms\":\"sales:productionorder:delete\",\"type\":2,\"orderNum\":0}', 3, '0:0:0:0:0:0:0:1', '2017-12-20 11:49:12');
INSERT INTO `sys_log` VALUES (178, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":57,\"parentName\":\"销售管理\",\"name\":\"客户订单管理\",\"url\":\"modules/sales/productionorder.html\",\"perms\":\"sales:productionorder:list,sales:productionorderdetail:info,sales:productionorder:info\",\"type\":1,\"orderNum\":1}', 5, '0:0:0:0:0:0:0:1', '2017-12-20 11:49:32');
INSERT INTO `sys_log` VALUES (179, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":94,\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"仓库配货表\",\"url\":\"modules/businessPrint/ckph.html\",\"type\":1,\"orderNum\":2}', 14, '0:0:0:0:0:0:0:1', '2017-12-21 02:46:07');
INSERT INTO `sys_log` VALUES (180, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list\",\"type\":1,\"orderNum\":0}', 14, '0:0:0:0:0:0:0:1', '2017-12-21 15:34:54');
INSERT INTO `sys_log` VALUES (181, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,\",\"type\":1,\"orderNum\":0}', 5, '0:0:0:0:0:0:0:1', '2017-12-21 15:40:09');
INSERT INTO `sys_log` VALUES (182, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list\",\"type\":1,\"orderNum\":0}', 4, '0:0:0:0:0:0:0:1', '2017-12-21 15:40:41');
INSERT INTO `sys_log` VALUES (183, 'admin', '保存用户', 'com.kirin.modules.sys.controller.SysUserController.save()', '{\"userId\":7,\"nickname\":\"test\",\"username\":\"test\",\"password\":\"9a44fc61b6ae6d7bcd9ce76bb545d49f426b5af21a8bca0bae6c54f320faa0f7\",\"salt\":\"c6OKPNIuCcihm8MX1ZYv\",\"email\":\"test@test.com\",\"mobile\":\"00000000000\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Dec 21, 2017 4:10:18 PM\"}', 99, '0:0:0:0:0:0:0:1', '2017-12-21 16:10:19');
INSERT INTO `sys_log` VALUES (184, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list\",\"type\":1,\"orderNum\":0}', 16, '0:0:0:0:0:0:0:1', '2017-12-22 06:18:05');
INSERT INTO `sys_log` VALUES (185, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '88', 28, '0:0:0:0:0:0:0:1', '2017-12-23 00:11:38');
INSERT INTO `sys_log` VALUES (186, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":96,\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"前处理作业表\",\"url\":\"modules/businessPrint/printTest.html\",\"type\":1,\"orderNum\":4}', 64, '192.168.1.149', '2017-12-24 14:50:47');
INSERT INTO `sys_log` VALUES (187, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"领料出库\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', 12, '0:0:0:0:0:0:0:1', '2017-12-25 19:42:13');
INSERT INTO `sys_log` VALUES (188, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":108,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"领料出库\",\"url\":\"modules/storage/outportdetail.html\",\"type\":1,\"orderNum\":0}', 67, '0:0:0:0:0:0:0:1', '2017-12-25 23:53:55');
INSERT INTO `sys_log` VALUES (189, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":108,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"领料出库\",\"url\":\"modules/storage/outportdetail.html\",\"perms\":\"storage:outportdetail:list\",\"type\":1,\"orderNum\":0}', 49, '0:0:0:0:0:0:0:1', '2017-12-25 23:54:36');
INSERT INTO `sys_log` VALUES (190, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":108,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"领料出库\",\"url\":\"modules/storage/outportdetail.html\",\"perms\":\"storage:outportdetail:list,storage:outportdetail:save,storage:outportdetail:info,storage:outportdetail:update\",\"type\":1,\"orderNum\":0}', 29, '0:0:0:0:0:0:0:1', '2017-12-30 04:23:12');
INSERT INTO `sys_log` VALUES (191, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,65,70,71,72,57,74,75,76,77,81,82,83,84,73,78,79,80,58,87,89,90,91,108,92,93,94,95,96,97,98,99,100,101,60,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 96, '0:0:0:0:0:0:0:1', '2017-12-30 04:23:26');
INSERT INTO `sys_log` VALUES (192, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":108,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"领料出库\",\"url\":\"modules/storage/outportdetail.html\",\"perms\":\"storage:outportdetail:list,storage:outportdetail:save,storage:outportdetail:info,storage:outportdetail:update,storage:outportdetail:delete\",\"type\":1,\"orderNum\":0}', 10, '0:0:0:0:0:0:0:1', '2017-12-30 04:44:34');
INSERT INTO `sys_log` VALUES (193, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":95,\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"领料表\",\"url\":\"modules/businessPrint/ll.html\",\"type\":1,\"orderNum\":3}', 20, '0:0:0:0:0:0:0:1', '2017-12-30 09:57:28');
INSERT INTO `sys_log` VALUES (194, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '113', 4, '0:0:0:0:0:0:0:1', '2017-12-30 15:48:56');
INSERT INTO `sys_log` VALUES (195, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":104,\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"品牌\\u0026amp;规格\",\"perms\":\"baseData:mtrextend:save,baseData:mtrextend:list\",\"type\":2,\"orderNum\":0}', 14, '0:0:0:0:0:0:0:1', '2018-01-12 16:31:35');
INSERT INTO `sys_log` VALUES (196, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":104,\"parentId\":42,\"parentName\":\"原料维护\",\"name\":\"品牌\\u0026amp;规格\",\"perms\":\"baseData:mtrextend:save,baseData:mtrextend:list,baseData:mtrextend:update\",\"type\":2,\"orderNum\":0}', 8, '0:0:0:0:0:0:0:1', '2018-01-12 18:40:46');
INSERT INTO `sys_log` VALUES (197, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":59,\"parentId\":56,\"parentName\":\"采购管理\",\"name\":\"供应商管理\",\"url\":\"modules/purchase/supplierinfo.html\",\"perms\":\"purchase:supplierinfo:list,purchase:supplierinfo:info,baseData:mtrextend:info\",\"type\":1,\"icon\":\"fa fa-handshake-o\",\"orderNum\":0}', 23, '0:0:0:0:0:0:0:1', '2018-01-17 04:00:28');
INSERT INTO `sys_log` VALUES (198, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save\",\"type\":1,\"orderNum\":0}', 12, '0:0:0:0:0:0:0:1', '2018-01-23 05:09:34');
INSERT INTO `sys_log` VALUES (199, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save,storage:importmtrbatch:list\",\"type\":1,\"orderNum\":0}', 27, '0:0:0:0:0:0:0:1', '2018-01-23 05:45:05');
INSERT INTO `sys_log` VALUES (200, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save,storage:importmtrbatch:list,storage:importdetail:info\",\"type\":1,\"orderNum\":0}', 17, '0:0:0:0:0:0:0:1', '2018-01-23 06:21:55');
INSERT INTO `sys_log` VALUES (201, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save,storage:importmtrbatch:list,storage:importdetail:info,storage:importmtrbatch:info\",\"type\":1,\"orderNum\":0}', 20, '0:0:0:0:0:0:0:1', '2018-01-29 00:29:46');
INSERT INTO `sys_log` VALUES (202, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save,storage:importmtrbatch:list,storage:importdetail:info,storage:importmtrbatch:info,storage:importmtrbatch:update\",\"type\":1,\"orderNum\":0}', 8, '0:0:0:0:0:0:0:1', '2018-01-29 00:35:44');
INSERT INTO `sys_log` VALUES (203, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":87,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"采购入库\",\"url\":\"modules/storage/importInfo.html\",\"perms\":\"storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save,storage:importmtrbatch:list,storage:importdetail:info,storage:importmtrbatch:info,storage:importmtrbatch:update,storage:importmtrbatch:delete\",\"type\":1,\"orderNum\":0}', 13, '0:0:0:0:0:0:0:1', '2018-01-30 02:12:10');
INSERT INTO `sys_log` VALUES (204, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"库存查询\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', 14, '0:0:0:0:0:0:0:1', '2018-01-30 02:46:45');
INSERT INTO `sys_log` VALUES (205, 'admin', '修改角色', 'com.kirin.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"remark\":\"超级管理员角色，拥有所有权限\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,42,43,44,45,46,48,49,50,51,52,56,59,61,62,63,65,70,71,72,57,74,75,76,77,81,82,83,84,73,78,79,80,58,87,89,90,91,108,109,92,93,94,95,96,97,98,99,100,101,60,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Sep 20, 2017 4:08:29 PM\"}', 93, '0:0:0:0:0:0:0:1', '2018-01-30 02:47:03');
INSERT INTO `sys_log` VALUES (206, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"出库查询\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', 92, '0:0:0:0:0:0:0:1', '2018-04-01 20:41:09');
INSERT INTO `sys_log` VALUES (207, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":110,\"parentId\":58,\"parentName\":\"库存管理\",\"name\":\"出库查询\",\"url\":\"modules/storage/outputSearch.html\",\"type\":1,\"orderNum\":0}', 76, '0:0:0:0:0:0:0:1', '2018-04-02 07:02:04');
INSERT INTO `sys_log` VALUES (208, 'admin', '保存菜单', 'com.kirin.modules.sys.controller.SysMenuController.save()', '{\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"仓库备货表2\",\"url\":\"http://localhost:9090/report/ReportServer?reportlet\\u003dstock.cpt\",\"type\":1,\"orderNum\":0}', 55, '0:0:0:0:0:0:0:1', '2018-05-05 12:02:49');
INSERT INTO `sys_log` VALUES (209, 'admin', '删除菜单', 'com.kirin.modules.sys.controller.SysMenuController.delete()', '93', 280, '0:0:0:0:0:0:0:1', '2018-05-06 14:18:27');
INSERT INTO `sys_log` VALUES (210, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":111,\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"仓库备货表\",\"url\":\"http://localhost:9090/report/ReportServer?reportlet\\u003dstock.cpt\",\"type\":1,\"orderNum\":0}', 63, '0:0:0:0:0:0:0:1', '2018-05-06 14:18:41');
INSERT INTO `sys_log` VALUES (211, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":100,\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"速冷作业表\",\"url\":\"http://localhost:9090/report/ReportServer?reportlet\\u003dcooling.cpt\",\"type\":1,\"orderNum\":8}', 111, '0:0:0:0:0:0:0:1', '2018-05-06 14:19:09');
INSERT INTO `sys_log` VALUES (212, 'admin', '修改菜单', 'com.kirin.modules.sys.controller.SysMenuController.update()', '{\"menuId\":95,\"parentId\":92,\"parentName\":\"报表打印\",\"name\":\"领料表\",\"url\":\"http://localhost:9090/report/ReportServer?reportlet\\u003dobtain.cpt\",\"type\":1,\"orderNum\":3}', 80, '0:0:0:0:0:0:0:1', '2018-05-06 15:33:49');
INSERT INTO `sys_log` VALUES (213, 'admin', '删除菜单', 'com.kirin.modules.baseData.controller.TypeInfoController.delete()', '123', 42, '0:0:0:0:0:0:0:1', '2018-05-11 11:50:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 9);
INSERT INTO `sys_menu` VALUES (2, 1, '用户列表', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'modules/job/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '基础数据管理', NULL, NULL, 0, 'fa fa-archive', 1);
INSERT INTO `sys_menu` VALUES (32, 31, '类型管理', 'modules/baseData/typeinfo.html', 'baseData:typeinfo:list', 1, 'fa fa-th', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '新增', NULL, 'baseData:typeinfo:save,baseData:typeinfo:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 32, '查看', NULL, 'baseData:typeinfo:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 32, '修改', NULL, 'baseData:typeinfo:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 32, '删除', NULL, 'baseData:typeinfo:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (42, 31, '原料维护', 'modules/baseData/mtrdata.html', 'baseData:mtrdata:list,baseData:mtrdata:info', 1, 'fa fa-archive', 1);
INSERT INTO `sys_menu` VALUES (43, 42, '新增原料', NULL, 'baseData:mtrdata:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (44, 42, '修改原料信息', NULL, 'baseData:mtrdata:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (45, 42, '删除原料', NULL, 'baseData:mtrdata:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (46, 31, '产品管理', 'modules/baseData/prddata.html', 'baseData:prddata:list,baseData:prddata:info', 1, 'fa fa-product-hunt', 2);
INSERT INTO `sys_menu` VALUES (48, 46, '新增产品', NULL, 'baseData:prddata:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (49, 46, '修改产品', NULL, 'baseData:prddata:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (50, 46, '删除产品', NULL, 'baseData:prddata:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (51, 31, '配方管理', 'modules/baseData/bominfo.html', 'baseData:bominfo:list,baseData:bominfo:info,baseData:bomdetail:list', 1, 'fa fa-superscript', 4);
INSERT INTO `sys_menu` VALUES (52, 51, '新增配方', NULL, 'baseData:bominfo:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (53, 51, '修改配方', NULL, 'baseData:bominfo:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (54, 51, '原料配置', NULL, 'baseData:bominfo:detailConfig', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (56, 0, '采购管理', NULL, NULL, 0, 'fa fa-shopping-cart', 3);
INSERT INTO `sys_menu` VALUES (57, 0, '销售管理', NULL, NULL, 0, 'fa fa-truck', 4);
INSERT INTO `sys_menu` VALUES (58, 0, '库存管理', NULL, NULL, 0, 'fa fa-cubes', 5);
INSERT INTO `sys_menu` VALUES (59, 56, '供应商管理', 'modules/purchase/supplierinfo.html', 'purchase:supplierinfo:list,purchase:supplierinfo:info,baseData:mtrextend:info', 1, 'fa fa-handshake-o', 0);
INSERT INTO `sys_menu` VALUES (60, 0, '合同管理', NULL, NULL, 0, 'fa fa-file-text', 6);
INSERT INTO `sys_menu` VALUES (61, 59, '新增供应商', NULL, 'purchase:supplierinfo:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (62, 59, '编辑供应商信息', NULL, 'purchase:supplierinfo:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (63, 59, '删除供应商', NULL, 'purchase:supplierinfo:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (65, 56, '采购订单管理', 'modules/purchase/orderinfo.html', 'purchase:orderinfo:list', 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (70, 65, '新建订单', NULL, 'purchase:orderinfo:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (71, 65, '修改订单', NULL, 'purchase:orderinfo:update,purchase:orderinfo:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (72, 65, '删除', NULL, 'purchase:orderinfo:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (73, 57, '客户订单管理', 'modules/sales/productionorder.html', 'sales:productionorder:list,sales:productionorderdetail:info,sales:productionorder:info', 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (74, 57, '客户管理', 'modules/sales/customerinfo.html', 'sales:customerinfo:list', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (75, 74, '新增', NULL, 'sales:customerinfo:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (76, 74, '修改', NULL, 'sales:customerinfo:update,sales:customerinfo:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (77, 74, '删除', NULL, 'sales:customerinfo:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (78, 73, '新增', NULL, 'sales:productionplan:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (79, 73, '修改', NULL, 'sales:productionplan:update,sales:productionplan:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (80, 73, '删除', NULL, 'sales:productionplan:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (81, 74, '产品配置', NULL, 'sales:customerprd:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (82, 74, '新增产品', NULL, 'sales:customerprd:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (83, 74, '修改产品', NULL, 'sales:customerprd:update,sales:customerprd:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (84, 74, '删除产品', NULL, 'sales:customerprd:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (87, 58, '采购入库', 'modules/storage/importInfo.html', 'storage:import:list,purchase:orderinfo:list,storage:importdetail:list,storage:importmtrbatch:save,storage:importmtrbatch:list,storage:importdetail:info,storage:importmtrbatch:info,storage:importmtrbatch:update,storage:importmtrbatch:delete', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (89, 87, '新建入库', NULL, 'storage:import:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (90, 87, '修改入库信息', NULL, 'storage:import:update,storage:import:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (91, 87, '删除入库信息', NULL, 'storage:import:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (92, 0, '报表打印', NULL, NULL, 0, 'fa fa-print', 5);
INSERT INTO `sys_menu` VALUES (94, 92, '仓库配货表', 'modules/businessPrint/ckph.html', NULL, 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (95, 92, '领料表', 'http://localhost:9090/report/ReportServer?reportlet=obtain.cpt', NULL, 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (96, 92, '前处理作业表', 'modules/businessPrint/printTest.html', NULL, 1, NULL, 4);
INSERT INTO `sys_menu` VALUES (97, 92, '调料配料表', '#', NULL, 1, NULL, 5);
INSERT INTO `sys_menu` VALUES (98, 92, '食材配料表', '#', NULL, 1, NULL, 6);
INSERT INTO `sys_menu` VALUES (99, 92, '生产工艺指示书', '#', NULL, 1, NULL, 7);
INSERT INTO `sys_menu` VALUES (100, 92, '速冷作业表', 'http://localhost:9090/report/ReportServer?reportlet=cooling.cpt', NULL, 1, NULL, 8);
INSERT INTO `sys_menu` VALUES (101, 92, '前处理配料表', '#', NULL, 1, NULL, 9);
INSERT INTO `sys_menu` VALUES (102, 42, '新增原料', NULL, 'baseData:mtrdata:add', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (103, 42, '新增形状', NULL, 'baseData:mtrcut:add', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (104, 42, '品牌&amp;规格', NULL, 'baseData:mtrextend:save,baseData:mtrextend:list,baseData:mtrextend:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (105, 73, '新增客户订单', NULL, 'sales:productionorder:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (106, 73, '修改客户订单', NULL, 'sales:productionorder:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (107, 73, '删除客户订单', NULL, 'sales:productionorder:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (108, 58, '领料出库', 'modules/storage/outportdetail.html', 'storage:outportdetail:list,storage:outportdetail:save,storage:outportdetail:info,storage:outportdetail:update,storage:outportdetail:delete', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (109, 58, '库存查询', 'modules/storage/storageSearch.html', NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (110, 58, '出库查询', 'modules/storage/outputSearch.html', NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (111, 92, '仓库备货表', 'http://localhost:9090/report/ReportServer?reportlet=stock.cpt', NULL, 1, NULL, 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '超级管理员角色，拥有所有权限', 1, '2017-09-20 16:08:29');
INSERT INTO `sys_role` VALUES (2, '管理员', '基础数据管理员，用于基础数据的维护工作', 1, '2017-09-20 22:28:59');
INSERT INTO `sys_role` VALUES (3, '查询', NULL, 1, '2017-10-14 12:50:32');
INSERT INTO `sys_role` VALUES (4, '采购部长', NULL, 1, '2017-11-18 14:30:40');
INSERT INTO `sys_role` VALUES (5, '财务部长', NULL, 1, '2017-11-23 09:10:45');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1407 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1042, 4, 31);
INSERT INTO `sys_role_menu` VALUES (1043, 4, 42);
INSERT INTO `sys_role_menu` VALUES (1044, 4, 43);
INSERT INTO `sys_role_menu` VALUES (1045, 4, 44);
INSERT INTO `sys_role_menu` VALUES (1046, 4, 45);
INSERT INTO `sys_role_menu` VALUES (1047, 4, 46);
INSERT INTO `sys_role_menu` VALUES (1048, 4, 48);
INSERT INTO `sys_role_menu` VALUES (1049, 4, 49);
INSERT INTO `sys_role_menu` VALUES (1050, 4, 50);
INSERT INTO `sys_role_menu` VALUES (1051, 4, 56);
INSERT INTO `sys_role_menu` VALUES (1052, 4, 59);
INSERT INTO `sys_role_menu` VALUES (1053, 4, 61);
INSERT INTO `sys_role_menu` VALUES (1054, 4, 62);
INSERT INTO `sys_role_menu` VALUES (1055, 4, 63);
INSERT INTO `sys_role_menu` VALUES (1056, 4, 64);
INSERT INTO `sys_role_menu` VALUES (1057, 4, 66);
INSERT INTO `sys_role_menu` VALUES (1058, 4, 67);
INSERT INTO `sys_role_menu` VALUES (1059, 4, 68);
INSERT INTO `sys_role_menu` VALUES (1060, 4, 69);
INSERT INTO `sys_role_menu` VALUES (1061, 4, 65);
INSERT INTO `sys_role_menu` VALUES (1062, 4, 70);
INSERT INTO `sys_role_menu` VALUES (1063, 4, 71);
INSERT INTO `sys_role_menu` VALUES (1064, 4, 72);
INSERT INTO `sys_role_menu` VALUES (1065, 5, 31);
INSERT INTO `sys_role_menu` VALUES (1066, 5, 37);
INSERT INTO `sys_role_menu` VALUES (1067, 5, 39);
INSERT INTO `sys_role_menu` VALUES (1068, 5, 57);
INSERT INTO `sys_role_menu` VALUES (1069, 5, 58);
INSERT INTO `sys_role_menu` VALUES (1070, 5, 60);
INSERT INTO `sys_role_menu` VALUES (1083, 3, 31);
INSERT INTO `sys_role_menu` VALUES (1084, 3, 32);
INSERT INTO `sys_role_menu` VALUES (1085, 3, 34);
INSERT INTO `sys_role_menu` VALUES (1086, 3, 42);
INSERT INTO `sys_role_menu` VALUES (1087, 3, 74);
INSERT INTO `sys_role_menu` VALUES (1088, 3, 46);
INSERT INTO `sys_role_menu` VALUES (1089, 3, 75);
INSERT INTO `sys_role_menu` VALUES (1090, 3, 51);
INSERT INTO `sys_role_menu` VALUES (1091, 3, 76);
INSERT INTO `sys_role_menu` VALUES (1092, 3, 37);
INSERT INTO `sys_role_menu` VALUES (1093, 3, 39);
INSERT INTO `sys_role_menu` VALUES (1094, 3, 56);
INSERT INTO `sys_role_menu` VALUES (1095, 3, 59);
INSERT INTO `sys_role_menu` VALUES (1096, 3, 77);
INSERT INTO `sys_role_menu` VALUES (1097, 3, 65);
INSERT INTO `sys_role_menu` VALUES (1098, 3, 78);
INSERT INTO `sys_role_menu` VALUES (1099, 3, 1);
INSERT INTO `sys_role_menu` VALUES (1100, 3, 2);
INSERT INTO `sys_role_menu` VALUES (1101, 3, 15);
INSERT INTO `sys_role_menu` VALUES (1102, 2, 31);
INSERT INTO `sys_role_menu` VALUES (1103, 2, 32);
INSERT INTO `sys_role_menu` VALUES (1104, 2, 33);
INSERT INTO `sys_role_menu` VALUES (1105, 2, 34);
INSERT INTO `sys_role_menu` VALUES (1106, 2, 35);
INSERT INTO `sys_role_menu` VALUES (1107, 2, 36);
INSERT INTO `sys_role_menu` VALUES (1108, 2, 42);
INSERT INTO `sys_role_menu` VALUES (1109, 2, 43);
INSERT INTO `sys_role_menu` VALUES (1110, 2, 44);
INSERT INTO `sys_role_menu` VALUES (1111, 2, 45);
INSERT INTO `sys_role_menu` VALUES (1112, 2, 46);
INSERT INTO `sys_role_menu` VALUES (1113, 2, 48);
INSERT INTO `sys_role_menu` VALUES (1114, 2, 49);
INSERT INTO `sys_role_menu` VALUES (1115, 2, 50);
INSERT INTO `sys_role_menu` VALUES (1116, 2, 51);
INSERT INTO `sys_role_menu` VALUES (1117, 2, 52);
INSERT INTO `sys_role_menu` VALUES (1118, 2, 53);
INSERT INTO `sys_role_menu` VALUES (1119, 2, 54);
INSERT INTO `sys_role_menu` VALUES (1120, 2, 37);
INSERT INTO `sys_role_menu` VALUES (1121, 2, 38);
INSERT INTO `sys_role_menu` VALUES (1122, 2, 39);
INSERT INTO `sys_role_menu` VALUES (1123, 2, 40);
INSERT INTO `sys_role_menu` VALUES (1124, 2, 41);
INSERT INTO `sys_role_menu` VALUES (1125, 2, 56);
INSERT INTO `sys_role_menu` VALUES (1126, 2, 59);
INSERT INTO `sys_role_menu` VALUES (1127, 2, 61);
INSERT INTO `sys_role_menu` VALUES (1128, 2, 62);
INSERT INTO `sys_role_menu` VALUES (1129, 2, 63);
INSERT INTO `sys_role_menu` VALUES (1130, 2, 64);
INSERT INTO `sys_role_menu` VALUES (1131, 2, 66);
INSERT INTO `sys_role_menu` VALUES (1132, 2, 67);
INSERT INTO `sys_role_menu` VALUES (1133, 2, 68);
INSERT INTO `sys_role_menu` VALUES (1134, 2, 69);
INSERT INTO `sys_role_menu` VALUES (1135, 2, 65);
INSERT INTO `sys_role_menu` VALUES (1136, 2, 70);
INSERT INTO `sys_role_menu` VALUES (1137, 2, 71);
INSERT INTO `sys_role_menu` VALUES (1138, 2, 72);
INSERT INTO `sys_role_menu` VALUES (1139, 2, 57);
INSERT INTO `sys_role_menu` VALUES (1140, 2, 74);
INSERT INTO `sys_role_menu` VALUES (1141, 2, 75);
INSERT INTO `sys_role_menu` VALUES (1142, 2, 76);
INSERT INTO `sys_role_menu` VALUES (1143, 2, 77);
INSERT INTO `sys_role_menu` VALUES (1144, 2, 81);
INSERT INTO `sys_role_menu` VALUES (1145, 2, 82);
INSERT INTO `sys_role_menu` VALUES (1146, 2, 83);
INSERT INTO `sys_role_menu` VALUES (1147, 2, 84);
INSERT INTO `sys_role_menu` VALUES (1148, 2, 73);
INSERT INTO `sys_role_menu` VALUES (1149, 2, 78);
INSERT INTO `sys_role_menu` VALUES (1150, 2, 79);
INSERT INTO `sys_role_menu` VALUES (1151, 2, 80);
INSERT INTO `sys_role_menu` VALUES (1152, 2, 58);
INSERT INTO `sys_role_menu` VALUES (1153, 2, 60);
INSERT INTO `sys_role_menu` VALUES (1322, 1, 31);
INSERT INTO `sys_role_menu` VALUES (1323, 1, 32);
INSERT INTO `sys_role_menu` VALUES (1324, 1, 33);
INSERT INTO `sys_role_menu` VALUES (1325, 1, 34);
INSERT INTO `sys_role_menu` VALUES (1326, 1, 35);
INSERT INTO `sys_role_menu` VALUES (1327, 1, 36);
INSERT INTO `sys_role_menu` VALUES (1328, 1, 42);
INSERT INTO `sys_role_menu` VALUES (1329, 1, 43);
INSERT INTO `sys_role_menu` VALUES (1330, 1, 44);
INSERT INTO `sys_role_menu` VALUES (1331, 1, 45);
INSERT INTO `sys_role_menu` VALUES (1332, 1, 46);
INSERT INTO `sys_role_menu` VALUES (1333, 1, 48);
INSERT INTO `sys_role_menu` VALUES (1334, 1, 49);
INSERT INTO `sys_role_menu` VALUES (1335, 1, 50);
INSERT INTO `sys_role_menu` VALUES (1336, 1, 51);
INSERT INTO `sys_role_menu` VALUES (1337, 1, 52);
INSERT INTO `sys_role_menu` VALUES (1338, 1, 56);
INSERT INTO `sys_role_menu` VALUES (1339, 1, 59);
INSERT INTO `sys_role_menu` VALUES (1340, 1, 61);
INSERT INTO `sys_role_menu` VALUES (1341, 1, 62);
INSERT INTO `sys_role_menu` VALUES (1342, 1, 63);
INSERT INTO `sys_role_menu` VALUES (1343, 1, 65);
INSERT INTO `sys_role_menu` VALUES (1344, 1, 70);
INSERT INTO `sys_role_menu` VALUES (1345, 1, 71);
INSERT INTO `sys_role_menu` VALUES (1346, 1, 72);
INSERT INTO `sys_role_menu` VALUES (1347, 1, 57);
INSERT INTO `sys_role_menu` VALUES (1348, 1, 74);
INSERT INTO `sys_role_menu` VALUES (1349, 1, 75);
INSERT INTO `sys_role_menu` VALUES (1350, 1, 76);
INSERT INTO `sys_role_menu` VALUES (1351, 1, 77);
INSERT INTO `sys_role_menu` VALUES (1352, 1, 81);
INSERT INTO `sys_role_menu` VALUES (1353, 1, 82);
INSERT INTO `sys_role_menu` VALUES (1354, 1, 83);
INSERT INTO `sys_role_menu` VALUES (1355, 1, 84);
INSERT INTO `sys_role_menu` VALUES (1356, 1, 73);
INSERT INTO `sys_role_menu` VALUES (1357, 1, 78);
INSERT INTO `sys_role_menu` VALUES (1358, 1, 79);
INSERT INTO `sys_role_menu` VALUES (1359, 1, 80);
INSERT INTO `sys_role_menu` VALUES (1360, 1, 58);
INSERT INTO `sys_role_menu` VALUES (1361, 1, 87);
INSERT INTO `sys_role_menu` VALUES (1362, 1, 89);
INSERT INTO `sys_role_menu` VALUES (1363, 1, 90);
INSERT INTO `sys_role_menu` VALUES (1364, 1, 91);
INSERT INTO `sys_role_menu` VALUES (1365, 1, 108);
INSERT INTO `sys_role_menu` VALUES (1366, 1, 109);
INSERT INTO `sys_role_menu` VALUES (1367, 1, 92);
INSERT INTO `sys_role_menu` VALUES (1369, 1, 94);
INSERT INTO `sys_role_menu` VALUES (1370, 1, 95);
INSERT INTO `sys_role_menu` VALUES (1371, 1, 96);
INSERT INTO `sys_role_menu` VALUES (1372, 1, 97);
INSERT INTO `sys_role_menu` VALUES (1373, 1, 98);
INSERT INTO `sys_role_menu` VALUES (1374, 1, 99);
INSERT INTO `sys_role_menu` VALUES (1375, 1, 100);
INSERT INTO `sys_role_menu` VALUES (1376, 1, 101);
INSERT INTO `sys_role_menu` VALUES (1377, 1, 60);
INSERT INTO `sys_role_menu` VALUES (1378, 1, 1);
INSERT INTO `sys_role_menu` VALUES (1379, 1, 2);
INSERT INTO `sys_role_menu` VALUES (1380, 1, 15);
INSERT INTO `sys_role_menu` VALUES (1381, 1, 16);
INSERT INTO `sys_role_menu` VALUES (1382, 1, 17);
INSERT INTO `sys_role_menu` VALUES (1383, 1, 18);
INSERT INTO `sys_role_menu` VALUES (1384, 1, 3);
INSERT INTO `sys_role_menu` VALUES (1385, 1, 19);
INSERT INTO `sys_role_menu` VALUES (1386, 1, 20);
INSERT INTO `sys_role_menu` VALUES (1387, 1, 21);
INSERT INTO `sys_role_menu` VALUES (1388, 1, 22);
INSERT INTO `sys_role_menu` VALUES (1389, 1, 4);
INSERT INTO `sys_role_menu` VALUES (1390, 1, 23);
INSERT INTO `sys_role_menu` VALUES (1391, 1, 24);
INSERT INTO `sys_role_menu` VALUES (1392, 1, 25);
INSERT INTO `sys_role_menu` VALUES (1393, 1, 26);
INSERT INTO `sys_role_menu` VALUES (1394, 1, 5);
INSERT INTO `sys_role_menu` VALUES (1395, 1, 6);
INSERT INTO `sys_role_menu` VALUES (1396, 1, 7);
INSERT INTO `sys_role_menu` VALUES (1397, 1, 8);
INSERT INTO `sys_role_menu` VALUES (1398, 1, 9);
INSERT INTO `sys_role_menu` VALUES (1399, 1, 10);
INSERT INTO `sys_role_menu` VALUES (1400, 1, 11);
INSERT INTO `sys_role_menu` VALUES (1401, 1, 12);
INSERT INTO `sys_role_menu` VALUES (1402, 1, 13);
INSERT INTO `sys_role_menu` VALUES (1403, 1, 14);
INSERT INTO `sys_role_menu` VALUES (1404, 1, 27);
INSERT INTO `sys_role_menu` VALUES (1405, 1, 30);
INSERT INTO `sys_role_menu` VALUES (1406, 1, 29);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '超级管理员', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'A@A.com', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (3, NULL, '周舟', '638d3215551a355eb3a410c966b34fa503ddee6627a2d12051bb0a1ea681a4e4', 'W3dwJgOgV18o5vEwKNFE', 'z@d.com', NULL, 1, 1, '2017-11-18 14:31:27');
INSERT INTO `sys_user` VALUES (4, NULL, '徐昭', '3bf594cfd5fa3b575867bae8762dade59152b4b83d77b2540fdbec60e11be8f1', 'urKT8fxe4jS6rHzlzua9', 'a@w.com', NULL, 1, 1, '2017-11-23 09:41:21');
INSERT INTO `sys_user` VALUES (5, NULL, '小明', 'c1ca505ee7acf534f4a76f549dcfabb4de72a9fb299529cfa42b90b10aa2c43e', 'OLn8mcwq4ARRe4n4xQyJ', 'q@w.com', NULL, 1, 1, '2017-11-23 16:07:37');
INSERT INTO `sys_user` VALUES (6, NULL, '凡芸', '44c111267400d7ee4edc6fb8ae8abc1eb3e5cb8076cd61afbfe2ad0be2dddb2e', '3XrO8lTF4Y5I6EDaZ3v9', 'w@1.com', NULL, 1, 1, '2017-12-08 10:21:19');
INSERT INTO `sys_user` VALUES (7, 'test', 'test', '9a44fc61b6ae6d7bcd9ce76bb545d49f426b5af21a8bca0bae6c54f320faa0f7', 'c6OKPNIuCcihm8MX1ZYv', 'test@test.com', '00000000000', 1, 1, '2017-12-21 16:10:19');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (3, 1, 1);
INSERT INTO `sys_user_role` VALUES (6, 4, 5);
INSERT INTO `sys_user_role` VALUES (7, 5, 3);
INSERT INTO `sys_user_role` VALUES (8, 6, 2);
INSERT INTO `sys_user_role` VALUES (9, 3, 4);
INSERT INTO `sys_user_role` VALUES (10, 7, 1);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'a87b667f27b215bed74ebf03a2f84307', '2018-05-15 21:22:56', '2018-05-15 09:22:56');
INSERT INTO `sys_user_token` VALUES (2, '23d65788776a274ecc3d053ab8a15c14', '2017-10-18 01:54:47', '2017-10-17 13:54:47');
INSERT INTO `sys_user_token` VALUES (3, '97381261733ce9a902790df39745143a', '2017-12-10 02:46:21', '2017-12-09 14:46:21');
INSERT INTO `sys_user_token` VALUES (5, '299eef80a55626f04929f7c1f9ce2057', '2017-11-25 01:09:16', '2017-11-24 13:09:16');
INSERT INTO `sys_user_token` VALUES (6, '60412ef739436ae2e52bcf57701ac587', '2017-12-10 02:37:39', '2017-12-09 14:37:39');
INSERT INTO `sys_user_token` VALUES (7, '7a0610e305dd872f272634796bfa876d', '2017-12-22 04:10:44', '2017-12-21 16:10:44');

-- ----------------------------
-- Table structure for tb_contract
-- ----------------------------
DROP TABLE IF EXISTS `tb_contract`;
CREATE TABLE `tb_contract`  (
  `ID` bigint(20) NOT NULL COMMENT 'ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '机构ID',
  `contract_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `contract_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同名称',
  `contract_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同类型',
  `party_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '甲方',
  `party_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '乙方',
  `signing_date` datetime(0) NULL DEFAULT NULL COMMENT '签订日期',
  `due_date` datetime(0) NULL DEFAULT NULL COMMENT '到期日',
  `file_Url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_customer_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_info`;
CREATE TABLE `tb_customer_info`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUSTOMER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `CUSTOMER_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户代码',
  `CUSTOMER_PY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `CUSTOMER_SHORT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `LINKMAN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `LINKPHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer_info
-- ----------------------------
INSERT INTO `tb_customer_info` VALUES (1, '公交集团', '10001', 'GJJT', '公交集团', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (2, '纸坊一小', '10002', 'ZFYX', '纸坊一小', '一小', '02787878787', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (3, '仓储', '0001', 'CC', '02仓储便民', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (4, '便民', '0002', 'BM', '02仓储便民', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (5, '罗森', '0003', 'LS', '01罗森', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (6, '大客', '0005', 'DK', '09大客', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (7, '纸坊二小', '0006', 'ZFEX', '04学生餐', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (8, '纸坊三小', '0007', 'ZFSX', '04学生餐', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (9, '古田', '0008', 'GT', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (10, '江夏联营', '0009', 'JXLY', '02仓储便民', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (11, '质检取样', '0010', 'ZJQY', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (12, '工厂留样', '0011', 'GCLY', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (13, '展品', '0012', 'ZP', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (14, '学校汇总', '0013', 'XXHZ', '04学生餐', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (15, '食堂', '0014', 'ST', '10食堂', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (16, '品控', '0015', 'PK', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (17, '武网', '0016', 'WW', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (18, '荷贝克', '0017', 'HBK', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (19, '良品铺子', '0018', 'LPPZ', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (20, '赵家条', '0019', 'ZJT', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (21, '宏鑫餐饮', '0020', 'HXCY', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (22, '鲁磨路店', '0021', 'LMLD', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (23, '参观团餐', '0022', 'CGTC', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (24, '产品研发', '0023', 'CPYF', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (25, '团餐', '0024', 'TC', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (26, '华联', '0025', 'HL', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (27, '公交集团', '0026', 'GJJT', '05公交', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (28, '内部购买', '0027', 'NBGM', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (29, '吉祥如意KTV', '0028', 'JXRYKTV', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (30, '长虹机械厂', '0029', 'CHJXC', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (31, '职工食堂', '0030', 'ZGST', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (32, '(停用)外部客户', '0031', '(TY)WBKH', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (33, '奋斗', '0032', 'FD', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (34, '回味蟹钳', '0033', 'HWXQ', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (35, '大润发', '0034', 'DRF', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (36, '水果湖剧场', '0035', 'SGHJC', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (37, '标准化研究所', '0036', 'BZHYJS', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (38, '中石化', '0037', 'ZSH', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (39, '湖北电视台', '0038', 'HBDST', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (40, '尚友', '0039', 'SY', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (41, '金正茂', '0040', 'JZM', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (42, '泛海国际', '0041', 'FHGJ', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (43, '自由网吧', '0042', 'ZYWB', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (44, '天天网吧', '0043', 'TTWB', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (45, '蜜拓蜜', '0044', 'MTM', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (46, '金长城网吧', '0045', 'JCCWB', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (47, '浩天源网吧', '0046', 'HTYWB', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (48, '协警培训', '0047', 'XJPX', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (49, '中百团餐', '0048', 'ZBTC', '06中百团餐', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (50, '净菜', '0049', 'JC', '07净菜', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (51, '鲜食代工', '0050', 'XSDG', '08鲜食代工', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (52, '和平农庄', '0051', 'HPNZ', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (53, '煜盟商贸', '0052', 'YMSM', '08鲜食代工', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (54, '公交六公司总部', '0053', 'GJLGSZB', '05公交', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (55, '踢踢科技', '0054', 'TTKJ', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (56, '快鼠网络', '0055', 'KSWL', '03鲜打餐', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (57, '月半熊', '0056', 'YBX', '11其他', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (58, '中建三局', '0098', 'ZJSJ', '', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_info` VALUES (59, '公交集团', '0099', 'GJJT', '公交集团', '', '', '', '1', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_customer_prd
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_prd`;
CREATE TABLE `tb_customer_prd`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUSTOMER_ID` bigint(20) NULL DEFAULT NULL COMMENT '客户ID',
  `PRD_ID` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `PRD_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  `PRD_PRICE` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '产品售价',
  `TAG_SPEC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签规格',
  `TAG_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签编号',
  `TAG_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签条码',
  `TAG_POWER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加热时长',
  `TAG_PROD_TIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产时间',
  `TAG_QGP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保质期',
  `TAG_STORAGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '储存条件',
  `TAG_NETWGT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '净含量',
  `TAG_PRICE` decimal(10, 0) NULL DEFAULT NULL COMMENT '标签价格',
  `TAG_ADDR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `TAG_PROD_ADDR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地',
  `TAG_MANUFACTURER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `TAG_LINKPHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `TAG_BURDEN_LIST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配料表',
  `TAG_LICENSE_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '许可编号',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户采购产品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer_prd
-- ----------------------------
INSERT INTO `tb_customer_prd` VALUES (2, 1, 47, '00000047', 00000005.00, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (3, 2, 52, '00000052', 00000001.00, NULL, '2221113', NULL, '3', '0.30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (4, 2, 18, '00000016', 00000001.00, 'A', '223', '23', '2', '2322', '2', 'AA', '2', 22, 'AAAA', '3', 'AAA', '22', 'aaaa', '22', '1', '4', NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (5, 58, 3, 'V020300003', 00000038.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (6, 58, 469, '00000492', 00000002.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (9, 54, 622, '00000646', 00000010.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (11, 58, 621, '00000645', 00000006.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (12, 58, 1576, '00001649', 00000002.15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (13, 58, 55, '00000055', 00000004.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (14, 59, 55, '00000055', 00000004.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (15, 57, 55, '00000055', 00000004.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (16, 5, 5, '00000001', 00000001.20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (17, 5, 2058, 'F010602057', 00000007.09, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (18, 5, 699, '00000726', 00000001.50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (19, 5, 55, '00000055', 00000004.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (20, 1, 2058, 'F010602057', 00000007.09, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (21, 3, 55, '00000055', 00000003.50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (22, 3, 2062, 'F010602061', 00000007.50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_customer_prd` VALUES (23, 5, 621, '00000645', 00000006.39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_import
-- ----------------------------
DROP TABLE IF EXISTS `tb_import`;
CREATE TABLE `tb_import`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `IMPORT_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单号',
  `ORDER_ID` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `SUPPLIER_ID` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `SUPPLIER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `SUPPLIER_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编号',
  `IMPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入库日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库人',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库主记录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_import
-- ----------------------------
INSERT INTO `tb_import` VALUES (9, '201712230002', 13, 9, '武汉中粮集团', '005', '2017-12-23 00:10:46', '2', 'admin');
INSERT INTO `tb_import` VALUES (18, '201712230001', 14, 9, '武汉中粮集团', '005', '2017-12-25 19:56:16', '2', 'admin');
INSERT INTO `tb_import` VALUES (20, '201801250001', 15, 9, '武汉中粮集团', '005', '2018-01-25 09:41:39', '2', 'admin');
INSERT INTO `tb_import` VALUES (21, NULL, 18, 9, '武汉中粮集团', '005', '2018-03-31 09:45:48', '2', 'admin');
INSERT INTO `tb_import` VALUES (22, '201803300001', 21, 9, '武汉中粮集团', '005', '2018-03-30 11:59:11', '2', 'admin');
INSERT INTO `tb_import` VALUES (23, '201803300001', 22, 9, '武汉中粮集团', '005', '2018-03-30 14:08:28', '2', 'admin');
INSERT INTO `tb_import` VALUES (25, NULL, 20, 9, '武汉中粮集团', '005', NULL, '1', NULL);

-- ----------------------------
-- Table structure for tb_import_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_import_detail`;
CREATE TABLE `tb_import_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `IMPORT_ID` bigint(20) NULL DEFAULT NULL COMMENT '入库单ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `MTR_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料编号',
  `IN_UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单位',
  `IN_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库转换率',
  `ORDER_COUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购数量',
  `ORDER_PRICE` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '采购单价',
  `ORDER_SUM_PRICE` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '采购金额',
  `IN_COUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库数量',
  `IN_PRICE` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '入库单价',
  `IN_SUM_PRICE` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库金额',
  `ORDER_MTR_WGT` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '采购原料件重',
  `IN_WGT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库重量',
  `IN_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库单明细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_import_detail
-- ----------------------------
INSERT INTO `tb_import_detail` VALUES (16, 9, 100, '00000098', 'kg', '1.000', '50', 2.00, 100.00, '22', 2.00, 44.00, NULL, '0', '2017-12-23 00:10:40', '1');
INSERT INTO `tb_import_detail` VALUES (17, 16, 100, '00000098', 'kg', '1.000', '1111', 2.00, 2222.00, NULL, NULL, NULL, 0.00, NULL, NULL, '1');
INSERT INTO `tb_import_detail` VALUES (19, 18, 100, '00000098', 'kg', '1.000', '1111', 2.00, 2222.00, '900', 2.00, 1800.00, 0.00, '0.00', '2017-12-25 19:56:15', '1');
INSERT INTO `tb_import_detail` VALUES (22, 20, 1460, 'A0501460', '件', '900', '1.0', 378.00, 378.00, '0.00', 378.00, 0.00, 0.00, '0.0000', '2018-01-19 10:58:01', '1');
INSERT INTO `tb_import_detail` VALUES (23, 20, 1460, 'A0501460', 'kg', '1000.00', '6000.0', 1.50, 9000.00, '0.00', 1.50, 0.00, 0.00, '0.0000', '2018-01-23 05:27:21', '1');
INSERT INTO `tb_import_detail` VALUES (24, 20, 100, '00000098', 'kg', '1.000', '90.0', 2.00, 180.00, '90', 2.00, 180.00, 0.00, '0.00', '2018-01-19 02:24:57', '1');
INSERT INTO `tb_import_detail` VALUES (25, 20, 609, 'BC000096', '件', '5000.000', '5000.0', 0.07, 350.00, '1.00', 0.07, 0.07, 0.00, '0.0000', '2018-01-25 09:40:48', '1');
INSERT INTO `tb_import_detail` VALUES (26, 21, 1460, 'A0501460', '件', '1', '5.0', 378.00, 1890.00, '5.00', 378.00, 0.00, 0.50, '0.0000', '2018-01-26 23:41:34', '1');
INSERT INTO `tb_import_detail` VALUES (27, 21, 1460, 'A0501460', '件', '1', '6.0', 1.50, 9.00, '6.00', 1.50, 0.00, 0.50, '0.0000', '2018-01-26 23:41:32', '1');
INSERT INTO `tb_import_detail` VALUES (28, 22, 100, '00000098', 'kg', '1.000', '50.0', 1.80, 90.00, '45.00', NULL, NULL, 0.00, NULL, NULL, '1');
INSERT INTO `tb_import_detail` VALUES (29, 23, 287, '00000290', '桶', '20', '5.0', 138.00, 690.00, '4.00', NULL, NULL, 17.00, NULL, NULL, '1');
INSERT INTO `tb_import_detail` VALUES (32, 25, 609, 'BC000096', '件', '5000.000', '5.0', 35.00, 175.00, NULL, NULL, NULL, 0.00, NULL, NULL, '1');
INSERT INTO `tb_import_detail` VALUES (33, 25, 287, '00000290', '桶', '20.00', '9.0', 138.00, 1242.00, NULL, NULL, NULL, 17.00, NULL, NULL, '1');
INSERT INTO `tb_import_detail` VALUES (34, 25, 1460, 'A0501460', '件', '1.00', '15.0', 378.00, 5670.00, NULL, NULL, NULL, 0.50, NULL, NULL, '1');
INSERT INTO `tb_import_detail` VALUES (35, 25, 100, '00000098', 'kg', '1.00', '30.0', 1.80, 54.00, NULL, NULL, NULL, 0.00, NULL, NULL, '1');

-- ----------------------------
-- Table structure for tb_import_mtr_batch
-- ----------------------------
DROP TABLE IF EXISTS `tb_import_mtr_batch`;
CREATE TABLE `tb_import_mtr_batch`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `IMPORT_ID` bigint(20) NULL DEFAULT NULL COMMENT '入库单ID',
  `IMPORT_DETAIL_ID` bigint(20) NULL DEFAULT NULL COMMENT '入库明细ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `MTR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料名称',
  `MTR_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料编号',
  `EXTEND_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料扩展ID',
  `ORDER_UNIT_ID` bigint(20) NULL DEFAULT NULL COMMENT '采购单位ID',
  `ORDER_UNIT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购单位',
  `ORDER_UNIT_RATE` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购单位转换率',
  `ORDER_PRICE` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购单价',
  `ORDER_COUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购数量',
  `IN_UNIT_ID` bigint(20) NULL DEFAULT NULL COMMENT '入库单位ID',
  `IN_UNIT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库单位',
  `IN_UNIT_RATE` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库单位转换率',
  `IN_PRICE` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库单价',
  `IN_COUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库数量',
  `IN_UNIT1_COUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库件数',
  `WGT_UNIT1` decimal(10, 2) NULL DEFAULT NULL COMMENT '件重',
  `IN_WGT` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库总重量',
  `IN_TOTLA_PRICE` decimal(10, 2) NULL DEFAULT NULL COMMENT '入库总金额',
  `BATCH_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `PRODUCTION_DATE` datetime(0) NULL DEFAULT NULL COMMENT '生产日期',
  `EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '有效日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库原料批次信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_import_mtr_batch
-- ----------------------------
INSERT INTO `tb_import_mtr_batch` VALUES (4, 20, 22, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 378.00, 1.00, NULL, '件', 900.00, 378.00, 1.00, 0.00, 0.00, NULL, NULL, '2018012300', '2018-01-23 00:00:00', '2018-01-27 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (5, 20, 22, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 378.00, 1.00, NULL, '件', 900.00, 378.00, 1.00, 0.00, 0.00, NULL, NULL, '2018012301', '2018-01-23 00:00:00', '2018-01-28 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (6, 20, 22, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 378.00, 1.00, NULL, '件', 900.00, 378.00, 1.00, 0.00, 0.00, NULL, NULL, '2018012302', '2018-01-23 00:00:00', '2018-01-29 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (7, 20, 23, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 1.50, 6000.00, NULL, 'kg', 1000.00, 1.50, 55.00, 0.00, 0.00, NULL, NULL, '2018012500', NULL, NULL, NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (8, 20, 23, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 1.50, 6000.00, NULL, 'kg', 1000.00, 1.50, 55.00, 0.00, 0.00, NULL, NULL, '2018012500', '2018-01-25 00:00:00', '2018-01-27 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (10, 21, 26, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 378.00, 5.00, NULL, '件', 1.00, 378.00, 1.50, 0.00, 0.50, NULL, NULL, '2018012700', '2018-01-27 00:00:00', '2018-02-17 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (12, 21, 27, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 1.50, 6.00, NULL, '件', 1.00, 1.50, 2.00, 0.00, 0.50, NULL, 3.00, '2018013000', '2018-01-30 00:00:00', '2018-02-02 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (13, 21, 26, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 378.00, 5.00, NULL, '件', 1.00, 378.00, 3.00, 0.00, 0.50, NULL, 1134.00, '2018013001', '2018-01-16 00:00:00', '2018-02-03 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (14, 21, 27, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 1.50, 6.00, NULL, '件', 1.00, 1.50, 2.00, 0.00, 0.50, NULL, 3.00, '2018013001', '2018-01-17 00:00:00', '2018-02-02 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (15, 22, 28, 100, '大白菜', '00000098', NULL, NULL, NULL, NULL, 1.80, 50.00, NULL, 'kg', 1.00, 0.00, 10.00, 0.00, 0.00, NULL, 18.00, '2018033000', '2018-03-30 00:00:00', '2018-04-01 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (16, 22, 28, 100, '大白菜', '00000098', NULL, NULL, NULL, NULL, 1.80, 50.00, NULL, 'kg', 1.00, 0.00, 15.00, 0.00, 0.00, NULL, 27.00, '2018033001', '2018-03-29 00:00:00', '2018-03-31 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (17, 22, 28, 100, '大白菜', '00000098', NULL, NULL, NULL, NULL, 1.80, 50.00, NULL, 'kg', 1.00, 0.00, 20.00, 0.00, 0.00, NULL, 36.00, '2018033002', '2018-03-30 00:00:00', '2018-04-03 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (18, 23, 29, 287, '大豆油', '00000290', NULL, NULL, NULL, NULL, 138.00, 5.00, NULL, '桶', 20.00, 0.00, 2.00, 0.00, 17.00, NULL, 276.00, '2018033000', '2018-03-29 00:00:00', '2019-07-26 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (19, 23, 29, 287, '大豆油', '00000290', NULL, NULL, NULL, NULL, 138.00, 5.00, NULL, '桶', 20.00, 0.00, 2.00, 0.00, 17.00, NULL, 276.00, '2018033001', '2018-03-28 00:00:00', '2019-11-30 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (20, 21, 27, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 1.50, 6.00, NULL, '件', 1.00, 1.50, 2.00, 0.00, 0.50, NULL, 3.00, '2018033101', '2018-03-30 00:00:00', '2018-04-08 00:00:00', NULL);
INSERT INTO `tb_import_mtr_batch` VALUES (21, 21, 26, 1460, '测试咖喱饭2215身', 'A0501460', NULL, NULL, NULL, NULL, 378.00, 5.00, NULL, '件', 1.00, 378.00, 0.50, 0.00, 0.50, NULL, 189.00, '2018033101', '2018-03-28 00:00:00', '2018-04-07 00:00:00', NULL);

-- ----------------------------
-- Table structure for tb_mtr_extend
-- ----------------------------
DROP TABLE IF EXISTS `tb_mtr_extend`;
CREATE TABLE `tb_mtr_extend`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `EXTEND_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展编号,同一个原料的扩展编号以00开始，依次进行累加',
  `UNIT_ID` bigint(20) NULL DEFAULT NULL COMMENT '此规格采购单位',
  `UNIT_RATE` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '此规格单位下的转换率',
  `PRICE` decimal(10, 2) NULL DEFAULT NULL COMMENT '参考价格',
  `SPEC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `BRAND` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '原料扩展信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_mtr_extend
-- ----------------------------
INSERT INTO `tb_mtr_extend` VALUES (2, 1460, '01', 12, 109.00, 3.00, '90*90', 'opper', '1', 'opperkkk');
INSERT INTO `tb_mtr_extend` VALUES (3, 1460, '02', 46, 1000.00, 1.50, '1*15', 'oppor', '1', 'oppor1000');
INSERT INTO `tb_mtr_extend` VALUES (4, 1459, '01', 53, 1500.00, NULL, '1桶', '欧派', '1', NULL);
INSERT INTO `tb_mtr_extend` VALUES (5, 1460, '03', 11, 50.00, 8.00, '5*5', 'opper', '1', NULL);
INSERT INTO `tb_mtr_extend` VALUES (6, 1458, '01', 61, 15.00, 25.00, '15kg/件', '', '1', NULL);
INSERT INTO `tb_mtr_extend` VALUES (7, 1460, '04', 61, 5000.00, 400.00, '1件5000个', '', '1', NULL);
INSERT INTO `tb_mtr_extend` VALUES (8, 276, '01', 64, 1.00, 50.00, '50kg', NULL, '1', NULL);

-- ----------------------------
-- Table structure for tb_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_detail`;
CREATE TABLE `tb_order_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ORDER_ID` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `MTR_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料编码',
  `MTR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料名称',
  `MTR_TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '类型ID',
  `MTR_TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `MTR_UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `MTR_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转换率',
  `WAREHOSE_ID` bigint(20) NULL DEFAULT NULL COMMENT '仓库ID',
  `WAREHOSE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `WGT_UNIT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '件重',
  `WGT_UNIT2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盒重',
  `PURCHASE_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购编码',
  `AMOUNT` double(20, 0) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '采购数量',
  `IN_WGT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库重量',
  `IN_COUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入库数量',
  `IN_PRICE` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '入库单价',
  `PRICE` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '价格',
  `COST_TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '成分分类ID',
  `COST_TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本分类名称',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_detail
-- ----------------------------
INSERT INTO `tb_order_detail` VALUES (24, 13, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000050, NULL, NULL, 00000000.00, 00000002.00, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (25, 14, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000001111, NULL, NULL, 00000000.00, 00000002.00, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (26, 15, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000005000, NULL, NULL, NULL, 00000000.07, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (27, 15, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000090, NULL, '', NULL, 00000002.00, 101, '蔬菜类', NULL, NULL, 'admin', '2017-12-25 20:32:44');
INSERT INTO `tb_order_detail` VALUES (28, 15, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', 'kg', '1000.00', 26, '包材库', NULL, NULL, 'A0501460', 00000000000000006000, NULL, NULL, NULL, 00000001.50, 66, '包材', 'admin', '2018-01-19 02:22:24', NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (29, 15, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '900', 26, '包材库', NULL, NULL, 'A0501460', 00000000000000000001, NULL, NULL, NULL, 00000378.00, 66, '包材', 'admin', '2018-01-19 02:22:35', 'admin', '2018-01-19 02:23:05');
INSERT INTO `tb_order_detail` VALUES (30, 15, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', 'kg', '1000.00', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000050, NULL, NULL, NULL, 00000001.50, 66, '包材', 'admin', '2018-01-23 09:40:22', NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (31, 16, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000033, NULL, NULL, NULL, 00000001.50, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (32, 16, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000055, NULL, NULL, NULL, 00000001.80, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (33, 16, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000099, NULL, NULL, NULL, 00000378.00, 66, '包材', NULL, NULL, 'admin', '2018-01-23 13:09:48');
INSERT INTO `tb_order_detail` VALUES (34, 17, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000009, NULL, NULL, NULL, 00000001.50, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (35, 17, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000001, NULL, NULL, NULL, 00000020.00, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (36, 17, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000011, NULL, NULL, NULL, 00000378.00, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (37, 18, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000006, NULL, NULL, NULL, 00000001.50, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (38, 18, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000005, NULL, NULL, NULL, 00000378.00, 66, '包材', 'admin', '2018-01-23 16:38:29', NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (40, 20, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.00', 28, '冷藏库', '', '', '00000098', 00000000000000000030, '0.00', '0.00', 00000000.00, 00000001.80, 101, '蔬菜类', NULL, NULL, 'admin', '2018-05-15 15:48:18');
INSERT INTO `tb_order_detail` VALUES (42, 20, 1460, 'A0501460', '测试咖喱饭2215身', 62, '原料*包材', '件', '1.00', 26, '包材库', '0.5', NULL, 'A0501460', 00000000000000000015, '0.00', '0.00', 00000000.00, 00000378.00, 66, '包材', 'admin', '2018-01-25 21:26:12', 'admin', '2018-05-15 15:47:32');
INSERT INTO `tb_order_detail` VALUES (43, 21, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000050, NULL, NULL, NULL, 00000001.80, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (44, 22, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000005, NULL, NULL, NULL, 00000138.00, 59, '油脂类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (45, 20, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20.00', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000009, '0.00', '0.00', 00000000.00, 00000138.00, 59, '油脂类', 'admin', '2018-05-15 16:26:10', 'admin', '2018-05-15 16:26:50');
INSERT INTO `tb_order_detail` VALUES (48, 20, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000000005, NULL, NULL, NULL, 00000035.00, 66, '包材', 'admin', '2018-05-15 16:32:45', NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (49, 23, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000000008, NULL, NULL, NULL, 00000035.00, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (50, 23, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000004, NULL, NULL, NULL, 00000138.00, 59, '油脂类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (51, 24, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000005, NULL, NULL, NULL, 00000138.00, 59, '油脂类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (52, 24, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000000002, NULL, NULL, NULL, 00000035.00, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (53, 24, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000005, NULL, NULL, NULL, 00000001.80, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (54, 25, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000003, NULL, NULL, NULL, 00000001.80, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (55, 25, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000000009, NULL, NULL, NULL, 00000035.00, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (56, 25, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000006, NULL, NULL, NULL, 00000138.00, 59, '油脂类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (57, 26, 100, '00000098', '大白菜', 100, '原料*蔬菜类', 'kg', '1.000', 28, '冷藏库', '', '', '00000098', 00000000000000000004, NULL, NULL, NULL, 00000001.80, 101, '蔬菜类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (58, 26, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000003, NULL, NULL, NULL, 00000138.00, 59, '油脂类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (59, 26, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000000002, NULL, NULL, NULL, 00000035.00, 66, '包材', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (60, 27, 287, '00000290', '大豆油', 57, '原料*油脂类', '桶', '20', 29, '常温库', '17.0', '7.0', '00000290', 00000000000000000006, NULL, NULL, NULL, 00000138.00, 59, '油脂类', NULL, NULL, NULL, NULL);
INSERT INTO `tb_order_detail` VALUES (63, 27, 609, 'BC000096', '罗森-奥尔良鸡排盖饭45*95mm', 63, '原料*标签', '件', '5000.000', 30, '标签库', '0.0', '7.0', 'BC000096', 00000000000000000020, NULL, NULL, NULL, 00000035.00, 66, '包材', 'admin', '2018-05-15 17:05:56', NULL, NULL);

-- ----------------------------
-- Table structure for tb_order_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_info`;
CREATE TABLE `tb_order_info`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ORDER_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `SUPPLIER_ID` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `EXCEPTION_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期望到货日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态\r\n\"0.已撤销\n1.初始\n2.已确认\n3.已入库\n4.已结转\"\r\n',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_info
-- ----------------------------
INSERT INTO `tb_order_info` VALUES (13, 'CG201805140000', 9, '2017-12-23', '2', 'admin', '2017-12-22 05:49:38', NULL, NULL);
INSERT INTO `tb_order_info` VALUES (14, 'CG201805140001', 9, '2017-12-24', '2', 'admin', '2017-12-22 05:56:12', NULL, NULL);
INSERT INTO `tb_order_info` VALUES (15, 'CG201805140002', 9, '2017-12-25', '2', 'admin', '2017-12-25 20:32:15', NULL, NULL);
INSERT INTO `tb_order_info` VALUES (18, '004', 9, '2018-01-26', '2', 'admin', '2018-01-23 15:43:44', 'admin', '2018-01-23 16:38:37');
INSERT INTO `tb_order_info` VALUES (20, '005', 9, '2018-01-25', '2', 'admin', '2018-01-25 19:53:54', 'admin', '2018-01-25 23:37:06');
INSERT INTO `tb_order_info` VALUES (21, '006', 9, '2018-03-31', '2', 'admin', '2018-03-30 11:57:17', NULL, NULL);
INSERT INTO `tb_order_info` VALUES (22, '007', 9, '2018-03-31', '2', 'admin', '2018-03-30 14:07:20', NULL, NULL);
INSERT INTO `tb_order_info` VALUES (27, 'CG201805150000', 9, '2018-05-19', '1', 'admin', '2018-05-15 17:01:56', NULL, NULL);

-- ----------------------------
-- Table structure for tb_outport_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_outport_detail`;
CREATE TABLE `tb_outport_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OUTPORT_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库单ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `MTR_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料编号',
  `MTR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料名称',
  `MTR_TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料类型',
  `ORDER_COUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '需求数量',
  `OUT_COUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '领料数量',
  `BOM_GROSS_WGT` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '配方原料毛重',
  `OUT_UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库单位',
  `OUT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出库日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `BATCH_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原料入库批次号',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出库记录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_outport_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_outport_info`;
CREATE TABLE `tb_outport_info`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OUTPORRT_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库单编号',
  `ORDER_ID` bigint(20) NULL DEFAULT NULL COMMENT '客户销售单ID\r\n默认关联客户销售单进行出库\r\n新建出库单时，不需要关联客户销售单',
  `CUSTOMER_ID` bigint(20) NULL DEFAULT NULL COMMENT '客户ID\r\n新建客户销售单时需要选择客户、订单类型进行出库\r\n',
  `ORDER_TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '订单类型\r\n新建出库时，需要选择订单类型',
  `OUTPORT_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出库日期',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态\r\n0.已撤销\r\n1.初始\r\n2.已确认\r\n3.已出库',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_procurement_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_procurement_detail`;
CREATE TABLE `tb_procurement_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PROCUREMENT_ID` bigint(20) NULL DEFAULT NULL COMMENT '计划ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `SUPPLIER_ID` bigint(20) NULL DEFAULT NULL COMMENT '供应商',
  `UNIT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购单位',
  `RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转换率',
  `COUNT` decimal(10, 0) NULL DEFAULT NULL COMMENT '采购数量',
  `SPEC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购计划明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_procurement_detail
-- ----------------------------
INSERT INTO `tb_procurement_detail` VALUES (1, 1, 3, 2, '2', '1', 32, '');
INSERT INTO `tb_procurement_detail` VALUES (2, 1, 2, 3, '3', '2', 56, '');
INSERT INTO `tb_procurement_detail` VALUES (3, 1, 1, 3, '盒', '1', 20, NULL);
INSERT INTO `tb_procurement_detail` VALUES (4, 2, 2, 2, '套', '1', 23, NULL);
INSERT INTO `tb_procurement_detail` VALUES (5, 2, 2, 3, '套', '1', 90, NULL);
INSERT INTO `tb_procurement_detail` VALUES (6, 3, 1379, 4, '件', '600.000', 60, NULL);
INSERT INTO `tb_procurement_detail` VALUES (7, 4, 1379, 4, '件', '600.000', 150, NULL);
INSERT INTO `tb_procurement_detail` VALUES (8, 4, 1380, 4, '件', '600.000', 150, NULL);
INSERT INTO `tb_procurement_detail` VALUES (9, 4, 1381, 4, '件', '600.000', 150, NULL);
INSERT INTO `tb_procurement_detail` VALUES (10, 5, 100, 7, 'kg', '1.000', 60, NULL);
INSERT INTO `tb_procurement_detail` VALUES (11, 5, 86, 7, 'kg', '1.000', 300, NULL);
INSERT INTO `tb_procurement_detail` VALUES (12, 5, 52, 7, 'kg', '1.000', 650, NULL);
INSERT INTO `tb_procurement_detail` VALUES (13, 6, 864, 8, 'kg', '1.000', 350, NULL);
INSERT INTO `tb_procurement_detail` VALUES (14, 6, 902, 8, 'kg', '1.000', 600, NULL);

-- ----------------------------
-- Table structure for tb_procurement_plan
-- ----------------------------
DROP TABLE IF EXISTS `tb_procurement_plan`;
CREATE TABLE `tb_procurement_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PROCUREMENT_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购计划编号',
  `EXPECT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '期望到货日期',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '制单日期',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制单人',
  `SEND_DATE` datetime(0) NULL DEFAULT NULL COMMENT '发送日期',
  `CONFIRM_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '确认人',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_procurement_plan
-- ----------------------------
INSERT INTO `tb_procurement_plan` VALUES (1, '201711150001', '2017-11-17 17:11:37', '2017-11-15 17:11:40', '1', '2017-11-15 17:11:45', '1', '1');
INSERT INTO `tb_procurement_plan` VALUES (2, '201711170002', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `tb_procurement_plan` VALUES (3, '201711230003', NULL, NULL, '', NULL, '', '1');
INSERT INTO `tb_procurement_plan` VALUES (4, '201711240004', NULL, NULL, '周舟', NULL, '周舟', '1');
INSERT INTO `tb_procurement_plan` VALUES (5, '201711250005', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `tb_procurement_plan` VALUES (6, '201711250006', NULL, NULL, '周舟', NULL, NULL, '1');
INSERT INTO `tb_procurement_plan` VALUES (7, '201711250007', NULL, NULL, '小张', NULL, NULL, '1');

-- ----------------------------
-- Table structure for tb_production_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_production_order`;
CREATE TABLE `tb_production_order`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PRODUCTION_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `ORDER_TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '订单类型ID',
  `ORDER_TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单类型名称',
  `CUSTOMER_ID` bigint(20) NULL DEFAULT NULL COMMENT '客户ID',
  `CUSTOMER_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `CUSTOMER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `PLACE_ID` bigint(20) NULL DEFAULT NULL COMMENT '售点ID',
  `PLACE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售点名称',
  `REMAKR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `PRD_COST` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '成本',
  `PRD_INCOME` decimal(10, 0) NULL DEFAULT NULL COMMENT '收入',
  `DISCOUNT_INCOME` decimal(10, 0) NULL DEFAULT NULL COMMENT '折后收入',
  `PRD_MOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品总数',
  `COST_RATE` decimal(10, 0) NULL DEFAULT NULL COMMENT '成本率',
  `DISCOUNT_COST_RATE` decimal(10, 0) NULL DEFAULT NULL COMMENT '折扣成本比',
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_production_order
-- ----------------------------
INSERT INTO `tb_production_order` VALUES (1, '0001', 41, '鲜食', 5, '0003', '罗森', 83, '鲜食', NULL, '2', 'admin', '2018-02-05 10:48:42', NULL, NULL, NULL, NULL, NULL, NULL, '2018-02-05 12:43:07', 'admin');
INSERT INTO `tb_production_order` VALUES (2, '0002', 42, '熟食', 5, '0003', '罗森', 83, '熟食', NULL, '2', 'admin', '2018-02-23 15:44:08', NULL, NULL, NULL, NULL, NULL, NULL, '2018-02-23 15:45:11', 'admin');
INSERT INTO `tb_production_order` VALUES (3, '0003', 43, '企业团餐', 5, '0003', '罗森', 83, '企业团餐', NULL, '2', 'admin', '2018-02-24 01:31:05', NULL, NULL, NULL, NULL, NULL, NULL, '2018-02-24 01:33:17', 'admin');
INSERT INTO `tb_production_order` VALUES (4, '0004', 43, '企业团餐', 3, '0001', '仓储', 83, '企业团餐', NULL, '1', 'admin', '2018-03-30 14:30:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_production_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_production_order_detail`;
CREATE TABLE `tb_production_order_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PRODUCTION_ORDER_ID` bigint(20) NULL DEFAULT NULL COMMENT '生产订单ID',
  `PRODUCTION_ORDER_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产订单编号',
  `PRD_ID` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `PRD_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  `PRD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `PRD_TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '产品类型ID',
  `PRD_TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型名称',
  `AMOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求数量',
  `PRICE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定价',
  `PRICE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售价',
  `COST` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本',
  `REVENUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预估收入',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产订单明细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_production_plan
-- ----------------------------
DROP TABLE IF EXISTS `tb_production_plan`;
CREATE TABLE `tb_production_plan`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PLAN_NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划编号',
  `PLAN_SORT_NO` int(11) NULL DEFAULT NULL COMMENT '序号',
  `PLAN_COMPLETION_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成率',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `PRD_COST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本',
  `PRD_INCOME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收入',
  `DISCOUNT_INCOME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折后收入',
  `DISCOUNT_COST_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折扣成本比',
  `PRD_MOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品总数',
  `COST_RATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本率',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产计划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_production_plan
-- ----------------------------
INSERT INTO `tb_production_plan` VALUES (14, '201711290002', NULL, NULL, '2017-11-29 10:53:06', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_production_plan` VALUES (15, '201712130003', NULL, NULL, '2017-12-13 07:02:55', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_production_plan` VALUES (16, '201712140004', NULL, NULL, '2017-12-14 05:10:17', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_production_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_production_plan_detail`;
CREATE TABLE `tb_production_plan_detail`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PLAN_ID` bigint(20) NULL DEFAULT NULL COMMENT '计划ID',
  `PRD_ID` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `PRD_COST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品成本',
  `AMOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量',
  `PRICE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定价',
  `PRICE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售价',
  `INCOME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预估收入=（数量*定价）',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生产计划明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_quotation
-- ----------------------------
DROP TABLE IF EXISTS `tb_quotation`;
CREATE TABLE `tb_quotation`  (
  `ID` bigint(20) NULL DEFAULT NULL COMMENT 'ID',
  `quotation_date` datetime(0) NULL DEFAULT NULL COMMENT '报价日期',
  `suppier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `mtr_id` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `current_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '本次报价',
  `last_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '上次报价',
  `operation_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商原料报价信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_stocktaking
-- ----------------------------
DROP TABLE IF EXISTS `tb_stocktaking`;
CREATE TABLE `tb_stocktaking`  (
  `ID` bigint(20) NOT NULL,
  `STOCKTAKING_NO` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点单号',
  `STOCKTAKING_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点单名称',
  `OPERATION_DATE` datetime(0) NULL DEFAULT NULL COMMENT '盘点日期',
  `START_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点开始日期',
  `END_DATE` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点截止日期',
  `STOCK_ORG_ID` bigint(255) NULL DEFAULT NULL COMMENT '盘点机构，仓库以及车间或生产班组，数据来源TYPE_INFO',
  `INVENTORY_VALUE` decimal(20, 4) NULL DEFAULT NULL COMMENT '库存价值',
  `STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盘点单状态：\"0.已撤销\n1.初始\n2.已确认\n3.已完结\"\r\n',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` datetime(0) NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_stocktaking_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_stocktaking_detail`;
CREATE TABLE `tb_stocktaking_detail`  (
  `ID` bigint(20) NOT NULL,
  `STOCKTAKING_ID` bigint(20) NULL DEFAULT NULL COMMENT '盘点ID',
  `MTR_ID` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `MTR_UNIT_ID` bigint(20) NULL DEFAULT NULL COMMENT '单位ID',
  `INIT_COUNT` decimal(20, 4) NULL DEFAULT NULL COMMENT '期初数量&重量',
  `CURRENT_COUNT` decimal(20, 4) NULL DEFAULT NULL COMMENT '当前数量&重量',
  `REAL_COUNT` decimal(20, 4) NULL DEFAULT NULL COMMENT '实际盘存数量&重量',
  `SURPLUS_COUNT` decimal(20, 4) NULL DEFAULT NULL COMMENT '盘盈数量&重量',
  `DEFICIT_COUNT` decimal(20, 4) NULL DEFAULT NULL COMMENT '盘亏数量&重量',
  `MTR_PRICE` decimal(20, 2) NULL DEFAULT NULL COMMENT '库存单价：价格不一致，采用加权平均算法取得均值',
  `INVENTORY_VALUE` decimal(20, 4) NULL DEFAULT NULL COMMENT '原料库存价值=实盘数量*库存单价',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_suppier_mtr
-- ----------------------------
DROP TABLE IF EXISTS `tb_suppier_mtr`;
CREATE TABLE `tb_suppier_mtr`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `suppier_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商ID',
  `mtr_id` bigint(20) NULL DEFAULT NULL COMMENT '原料ID',
  `mtr_extend_id` bigint(20) NULL DEFAULT NULL COMMENT '采购规格Id，为0则使用默认规格，否则取规格扩展表信息',
  `mtr_extend_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购编码',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '采购价',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `last_edit_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次编辑人',
  `last_edit_date` datetime(0) NULL DEFAULT NULL COMMENT '上次编辑状态',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商供应产品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_suppier_mtr
-- ----------------------------
INSERT INTO `tb_suppier_mtr` VALUES (2, 3, 2, NULL, NULL, '1010300002', 8.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (3, 2, 3, NULL, NULL, '1010300003', 6.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (4, 2, 2, NULL, NULL, '1010300002A', 4.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (5, 3, 1, NULL, NULL, '1010300001', 3.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (6, 4, 1379, NULL, NULL, 'ZB000365', 144.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (7, 4, 1380, NULL, NULL, 'ZB000366', 126.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (8, 4, 1381, NULL, NULL, 'ZB000367', 270.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (9, 5, 576, 0, 'null-5000.000-¥:350.00', 'BC000063', 350.00, '1', 'admin', '2018-01-23 00:20:19', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (10, 5, 674, 0, '件-5000.000-¥:350.00', 'BCL0015', 350.00, '1', 'admin', '2018-01-23 00:18:47', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (11, 5, 577, 0, '件-5000.000-¥:350.00', 'BC000064', 350.00, '1', 'admin', '2018-01-23 00:18:39', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (12, 5, 679, 0, '件-5000.000-¥:250.00', 'BCL0020', 250.00, '1', 'admin', '2018-01-23 00:18:34', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (13, 5, 536, 0, '件-5000.000-¥:325.00', '00000544', 325.00, '1', 'admin', '2018-01-23 00:18:28', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (14, 6, 86, NULL, NULL, '00000083', 3.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (15, 6, 52, NULL, NULL, '00000049', 5.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (16, 6, 64, NULL, NULL, '00000061', 6.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (17, 6, 100, NULL, NULL, '00000098', 2.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (18, 7, 100, NULL, NULL, '00000098', 2.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (19, 7, 64, NULL, NULL, '00000061', 6.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (20, 7, 86, NULL, NULL, '00000083', 3.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (21, 7, 52, NULL, NULL, '00000049', 5.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (22, 8, 902, 0, 'kg-1.000-¥:79.000', 'WBC0001', 79.00, '1', 'admin', '2018-01-19 00:43:12', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (23, 8, 864, 0, 'kg-1.000-¥:58.00', 'W0000013', 58.00, '1', 'admin', '2018-01-19 00:43:04', NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (24, 7, 1455, NULL, NULL, 'A010301455', 9.00, '1', NULL, NULL, NULL, NULL);
INSERT INTO `tb_suppier_mtr` VALUES (25, 9, 100, 0, 'kg-1.000-¥:1.80', '00000098', 1.80, '1', 'admin', '2018-01-17 04:50:20', 'admin', '2017-12-16 12:39:34');
INSERT INTO `tb_suppier_mtr` VALUES (26, 9, 609, 0, '件-5000.000-¥:0.070', 'BC000096', 35.00, '1', 'admin', '2018-05-15 16:31:49', 'admin', '2017-12-18 23:37:54');
INSERT INTO `tb_suppier_mtr` VALUES (28, 9, 1460, 3, 'kg-1000-¥:1.5', 'A0501460', 1.50, '1', NULL, NULL, 'admin', '2018-01-17 04:17:28');
INSERT INTO `tb_suppier_mtr` VALUES (31, 9, 1460, 7, '件-5000-¥:20', 'A0501460', 20.00, '1', NULL, NULL, 'admin', '2018-01-23 15:02:38');
INSERT INTO `tb_suppier_mtr` VALUES (32, 9, 1460, 0, '件-1-¥:378.00', 'A0501460', 378.00, '1', NULL, NULL, 'admin', '2018-01-23 16:38:09');
INSERT INTO `tb_suppier_mtr` VALUES (33, 9, 287, 0, '桶-20-¥:138', '00000290', 138.00, '1', NULL, NULL, 'admin', '2018-03-30 14:06:54');

-- ----------------------------
-- Table structure for tb_supplier_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_supplier_info`;
CREATE TABLE `tb_supplier_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `suppier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `suppier_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商代码',
  `suppier_short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商简称',
  `suppier_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商类型',
  `suppier_py` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `link_man` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `link_tell` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `tax_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税率',
  `payment_days` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账期',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_supplier_info
-- ----------------------------
INSERT INTO `tb_supplier_info` VALUES (4, '苏州丰连实业有限公司', '001', '苏州丰连实业', NULL, 'SZFLSYYXGS', '小张', '1234567890', NULL, NULL, '17', '30', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_supplier_info` VALUES (5, '大阪希琳阁印刷(苏州)有限公司上海分公司', '002', '大阪希琳阁', '124', 'DBXLGYS(SZ)YXGSSHFGS', '黄银姣', '13501883661', 'QQ:2959899219', 'huang_yinjiao@osp-china.com.cn', '17', '30', '1', NULL, NULL, NULL, 'admin', '2018-05-11 17:23:20');
INSERT INTO `tb_supplier_info` VALUES (7, '武汉谷田种养殖专业合作社', '003', '武汉谷田种养殖', '117', 'WHGTZYZZYHZS', '123', '123456', '027-222222', NULL, '11', '30', '1', NULL, NULL, NULL, 'admin', '2018-05-11 17:08:43');
INSERT INTO `tb_supplier_info` VALUES (8, '河南尚品食品有限公司', '004', '河南尚品食品', '118', 'HNSPSPYXGS', '周明敬', '15038090657', '微信：wuyuepeople', NULL, '17', '30', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_supplier_info` VALUES (9, '武汉中粮集团', '005', '中粮', '119', 'WHZLJT', NULL, NULL, NULL, NULL, '17', '30', '1', 'admin', NULL, '2017-12-16 12:37:32', 'admin', '2018-05-11 17:22:22');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_type_data
-- ----------------------------
DROP TABLE IF EXISTS `tb_type_data`;
CREATE TABLE `tb_type_data`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `DATA_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型数据编码',
  `DATA_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型数据名称',
  `TYPE_ID` bigint(20) NULL DEFAULT NULL COMMENT '所属分类',
  `DATA_PY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `STATUS` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类型数据信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_type_data
-- ----------------------------
INSERT INTO `tb_type_data` VALUES (2, '0001', '测试客户1', 1, 'CS', 1);
INSERT INTO `tb_type_data` VALUES (3, '0002', '测试客户2', 1, 'CS2', 1);
INSERT INTO `tb_type_data` VALUES (4, '01', '团餐', 2, 'TC', 1);
INSERT INTO `tb_type_data` VALUES (5, '1', 'ccccd', NULL, 'cd', 1);
INSERT INTO `tb_type_data` VALUES (6, '1', 'dsdswwsc', NULL, 'd', 1);
INSERT INTO `tb_type_data` VALUES (7, '1', 'ssss', NULL, 's', 1);
INSERT INTO `tb_type_data` VALUES (9, '3', 'ddsws', NULL, 'd', 1);
INSERT INTO `tb_type_data` VALUES (10, '5', 'fff', NULL, 'f', 1);
INSERT INTO `tb_type_data` VALUES (12, 'pppp', 'p', 8, 'p', 1);
INSERT INTO `tb_type_data` VALUES (13, '9', '测试', 7, 'CS', 1);
INSERT INTO `tb_type_data` VALUES (14, '2244', '测试站点', 7, 'CSZD', 1);
INSERT INTO `tb_type_data` VALUES (15, '99', '测试单位', 10, 'CSDW', 1);

-- ----------------------------
-- Table structure for tb_type_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_type_info`;
CREATE TABLE `tb_type_info`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TYPE_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `TYPE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `PARENT_ID` bigint(20) NULL DEFAULT NULL COMMENT '上级ID',
  `TYPE_PY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `STATUS` int(11) NULL DEFAULT NULL COMMENT '状态',
  `CREATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPDATE_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类型信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_type_info
-- ----------------------------
INSERT INTO `tb_type_info` VALUES (4, 'A', '原料', 0, 'YL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (5, '01', '调味料', 4, 'DWL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (6, '01', '固态', 5, 'GT', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (7, '02', '粉态', 5, 'FT', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (8, '03', '液态', 5, 'YT', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (9, '02', '干货', 4, 'GH', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (10, 'B', '单位', 0, 'DW', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (11, '01', '盒', 10, 'H', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (12, '02', '筒', 10, 'T', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (13, '03', '套', 10, 'T', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (14, 'C', '成本分类', 0, 'CBFL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (15, '01', '调料类', 14, 'DLL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (16, '02', '干货类', 14, 'GHL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (17, '02', '鸡类', 105, 'JL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (18, '01', '鸭类', 105, 'YL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (19, 'D', '领料站点', 0, 'LL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (20, '01', '鲜食蔬菜', 19, 'XSSC', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (21, '02', '鲜食熟制', 19, 'XSSZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (22, '03', '鲜食肉类', 19, 'XSRL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (23, 'E', '仓库', 0, 'CK', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (24, '01', '干货调料库', 23, 'GHDL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (26, '02', '包材库', 23, 'BCK', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (27, '03', '冷冻库', 23, 'LDK', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (28, '04', '冷藏库', 23, 'LZK', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (29, '05', '常温库', 23, 'CWK', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (30, '06', '标签库', 23, 'BQK', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (31, 'F', '产品类别', 0, 'CPLB', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (32, '01', '主食类', 31, 'ZSL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (33, '01', '水洗类', 32, 'SXL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (34, '02', '泡水类', 32, 'PSL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (35, '03', '粥类', 32, 'ZL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (36, '02', '汤底类', 31, 'TDL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (37, '01', '糖水类', 36, 'TSL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (38, '02', '咸汤类', 36, 'XT', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (39, '03', '稠汤类', 36, 'CTL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (40, 'G', '订单类别', 0, 'DDLB', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (41, '01', '鲜食', 40, 'XS', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (42, '02', '熟食', 40, 'HXL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (43, '03', '企业团餐', 40, 'QYTC', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (45, '04', '米饭类', 32, 'MFL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (46, '04', 'kg', 10, 'KG', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (47, '05', 'g', 10, 'G', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (48, 'H', '生产站点', 0, 'SCZD', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (49, '01', '米饭熟制', 48, 'MFSZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (50, '02', '鲜食熟制', 48, 'XSSZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (51, '03', '调料配料', 48, 'DLPL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (52, '04', '鲜食包装', 48, 'XSBZ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (53, '06', '桶', 10, 'T', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (54, '03', '米面类', 4, 'MML', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (55, '05', '米面类', 14, 'MML', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (56, '04', '鲜食米饭线', 19, 'XSMFX', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (57, '04', '油脂类', 4, 'YZL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (58, '05', '调料配料', 19, 'DLPL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (59, '06', '油脂类', 14, 'YZL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (60, '07', '片', 10, 'P', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (61, '08', '件', 10, 'J', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (62, '05', '包材', 4, 'BC', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (63, '06', '标签', 4, 'BQ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (64, '09', '袋', 10, 'D', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (65, '10', '个', 10, 'G', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (66, '07', '包材', 14, 'BC', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (67, '06', '鲜食包装', 19, 'XSBZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (68, 'I', '切割形状', 0, 'QGXZ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (69, '01', '块45g奥尔良', 68, 'K45GAEL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (70, 'J', '客户', 0, 'KH', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (72, '02', '罗森', 70, 'LS', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (74, '03', '仓储', 70, 'CC', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (75, '04', '便民', 70, 'BM', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (76, '05', '公交集团', 70, 'GJJT', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (78, '05', '便当', 32, 'BD', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (79, '06', '面类', 32, 'ML', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (80, '02', '丝0.3*5', 68, 'S0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (81, '04', '学生餐', 40, 'XSC', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (82, 'K', '售点', 0, 'SD', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (83, '01', '罗森汇总', 82, 'LSHZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (84, '02', '仓储汇总', 82, 'CCHZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (85, '03', '便民汇总', 82, 'BMHZ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (86, '04', '公交六公司', 82, 'GJLGS', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (87, 'L', '烹调方式', 0, 'PD', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (88, '01', '炸', 87, 'Z', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (89, '02', '蒸', 87, 'Z', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (90, '03', '烤', 87, 'K', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (91, '04', '卤', 87, 'L', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (92, '07', '饭团', 32, 'FT', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (93, '08', '寿司', 32, 'SS', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (94, 'M', '盘点单位', 0, 'PDDW', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (95, '01', '青菜库', 94, 'QCK', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (99, '03', '半成品', 31, 'BCP', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (100, '07', '蔬菜类', 4, 'SCL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (101, '08', '蔬菜类', 14, 'SCL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (102, '05', '煮', 87, 'Z', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (103, '05', '鲜食蔬菜', 48, 'XSSC', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (104, '08', '贸易类', 4, 'MYL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (105, '09', '肉类', 14, 'RL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (106, '04', '猪牛类', 105, 'ZNL', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (107, '07', '贸易类', 19, 'MYL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (108, '11', '壶', 10, 'H', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (109, '09', '肉类', 4, 'RL', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (110, '06', '水锅班-测试', 48, 'SGB-CS', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (111, '09', '饭卷', 32, 'FJ', 1, NULL, NULL, NULL, NULL);
INSERT INTO `tb_type_info` VALUES (112, '10', '豆制品', 4, 'DZP', 1, 'admin', '2017-12-16 01:54:02', 'admin', '2017-12-16 02:04:23');
INSERT INTO `tb_type_info` VALUES (114, '01', 'aaa', 49, 'AAA', 1, 'admin', '2017-12-30 16:30:16', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (115, 'N', '供应商类型', 0, 'GYSLX', 1, 'admin', '2018-05-07 09:33:07', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (116, 'O', '客户类型', 0, 'KHLX', 1, 'admin', '2018-05-07 09:33:15', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (117, '01', '蔬菜类', 115, 'SCL', 1, 'admin', '2018-05-07 09:33:38', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (118, '02', '肉类', 115, 'RL', 1, 'admin', '2018-05-07 09:33:54', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (119, '03', '调料类', 115, 'DLL', 1, 'admin', '2018-05-07 09:34:13', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (120, '01', '学生餐类', 116, 'XSCL', 1, 'admin', '2018-05-07 09:34:29', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (121, '02', '企业团餐类', 116, 'QYTCL', 1, 'admin', '2018-05-07 09:34:43', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (122, '03', '连锁超市类', 116, 'LSCSL', 1, 'admin', '2018-05-07 09:35:00', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (124, '04', '包材类', 115, 'BCL', 1, 'admin', '2018-05-11 17:22:52', NULL, NULL);
INSERT INTO `tb_type_info` VALUES (125, '05', '粮油类', 115, 'LYL', 1, 'admin', '2018-05-11 17:23:05', NULL, NULL);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
