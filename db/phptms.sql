-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-08-09 10:55:21
-- 服务器版本： 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phptms`
--

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_client`
--

CREATE TABLE `tbl_base_client` (
  `PK` int(11) NOT NULL,
  `intSubCompanyPK` int(11) NOT NULL DEFAULT '0',
  `strName` varchar(50) NOT NULL,
  `strPhone` varchar(25) NOT NULL,
  `intSaveStatus` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_subcompany`
--

CREATE TABLE `tbl_base_subcompany` (
  `PK` int(11) NOT NULL,
  `strName` varchar(50) DEFAULT NULL,
  `strPhone` varchar(25) DEFAULT NULL,
  `strAddr` varchar(50) DEFAULT NULL,
  `strLinkman` varchar(20) DEFAULT NULL,
  `intSaveStatus` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_menu_action`
--

CREATE TABLE `tbl_menu_action` (
  `PK` int(11) NOT NULL,
  `intLeftmenuPK` int(11) NOT NULL,
  `intTablePK` int(11) NOT NULL,
  `strName` varchar(250) NOT NULL,
  `strController` varchar(50) NOT NULL,
  `strAction` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_menu_action`
--

INSERT INTO `tbl_menu_action` (`PK`, `intLeftmenuPK`, `intTablePK`, `strName`, `strController`, `strAction`) VALUES
(1, 4, 1, '分公司查询', 'sheet_subcompany', 'index'),
(2, 5, 1, '分公司新增', 'sheet_subcompany', 'add'),
(3, 12, 10, '查询', 'sheet_order', 'index'),
(4, 13, 10, '新增', 'sheet_order', 'add'),
(5, 6, 2, '查询', 'sheet_client', 'index');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_menu_big`
--

CREATE TABLE `tbl_menu_big` (
  `PK` int(11) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `intDefaultActionPK` int(11) NOT NULL,
  `strLeftPK` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='大导航图菜单表';

--
-- 转存表中的数据 `tbl_menu_big`
--

INSERT INTO `tbl_menu_big` (`PK`, `strName`, `intDefaultActionPK`, `strLeftPK`) VALUES
(1, '基础数据', 1, '1,2,3'),
(2, '订单管理', 3, '10,11');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_menu_left`
--

CREATE TABLE `tbl_menu_left` (
  `PK` int(11) NOT NULL,
  `intTopParent` int(11) NOT NULL,
  `intParentPK` int(11) NOT NULL,
  `strName` varchar(250) NOT NULL,
  `intLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='左侧导航夹名称';

--
-- 转存表中的数据 `tbl_menu_left`
--

INSERT INTO `tbl_menu_left` (`PK`, `intTopParent`, `intParentPK`, `strName`, `intLevel`) VALUES
(1, 1, 0, '分公司管理', 1),
(2, 2, 0, '客户管理', 1),
(3, 3, 0, '收货方管理', 1),
(4, 1, 1, '查询', 2),
(5, 1, 1, '新增', 2),
(6, 2, 2, '查询', 2),
(7, 2, 2, '新增', 2),
(8, 3, 3, '查询', 2),
(9, 3, 3, '新增', 2),
(10, 10, 0, '订单管理', 1),
(11, 11, 0, '客服管理', 1),
(12, 10, 10, '查询', 2),
(13, 10, 10, '新增', 2);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_field`
--

CREATE TABLE `tbl_sys_field` (
  `PK` int(11) NOT NULL,
  `intTablePK` int(11) NOT NULL,
  `intFieldClass` tinyint(4) NOT NULL DEFAULT '0' COMMENT '字段类别：0表头，1明细，2状态',
  `strTableStorage` varchar(30) NOT NULL,
  `strField` varchar(25) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `intType` tinyint(4) NOT NULL COMMENT '字段类型',
  `intTablePK_Ref` int(11) NOT NULL,
  `strTable_Ref` varchar(50) DEFAULT NULL,
  `strField_Ref` varchar(30) DEFAULT NULL,
  `strFileldShow_Ref` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sys_field`
--

INSERT INTO `tbl_sys_field` (`PK`, `intTablePK`, `intFieldClass`, `strTableStorage`, `strField`, `strName`, `intType`, `intTablePK_Ref`, `strTable_Ref`, `strField_Ref`, `strFileldShow_Ref`) VALUES
(1, 1, 0, 'tbl_base_subcompany', 'PK', '主键', 8, 0, NULL, NULL, NULL),
(2, 1, 0, 'tbl_base_subcompany', 'strName', '名称', 2, 0, NULL, NULL, NULL),
(3, 1, 0, 'tbl_base_subcompany', 'strPhone', '电话', 7, 0, NULL, NULL, NULL),
(4, 1, 0, 'tbl_base_subcompany', 'strAddr', '地址', 2, 0, NULL, NULL, NULL),
(5, 1, 0, 'tbl_base_subcompany', 'strLinkman', '联系人', 2, 0, NULL, NULL, NULL),
(6, 1, 2, 'tbl_base_subcompany', 'intSaveStatus', '保存状态', 13, 0, NULL, NULL, NULL),
(7, 2, 0, 'tbl_base_client', 'PK', '主键', 8, 0, NULL, NULL, NULL),
(8, 2, 0, 'tbl_base_client', 'intSubCompanyPK', '分公司名称', 5, 1, 'tbl_base_subcompany', 'PK', 'strName'),
(9, 2, 0, 'tbl_base_client', 'strName', '客户名称', 2, 0, NULL, NULL, NULL),
(10, 2, 0, 'tbl_base_client', 'strPhone', '电话', 7, 0, NULL, NULL, NULL),
(11, 2, 2, 'tbl_base_client', 'intSaveStatus', '保存状态', 13, 0, NULL, NULL, NULL),
(12, 2, 0, 'tbl_base_client', 'strSubCompanyLinkman', '分公司联系人', 6, 1, 'tbl_base_subcompany', 'PK', 'strLinkman');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_table`
--

CREATE TABLE `tbl_sys_table` (
  `PK` int(11) NOT NULL,
  `strTable` varchar(50) DEFAULT NULL,
  `strName` varchar(50) DEFAULT NULL,
  `strTableAbbr` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sys_table`
--

INSERT INTO `tbl_sys_table` (`PK`, `strTable`, `strName`, `strTableAbbr`) VALUES
(1, 'tbl_base_subcompany', '分公司', 'TBSC'),
(2, 'tbl_base_client', '客户', 'TBC');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_type`
--

CREATE TABLE `tbl_sys_type` (
  `PK` int(11) NOT NULL,
  `strName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sys_type`
--

INSERT INTO `tbl_sys_type` (`PK`, `strName`) VALUES
(1, '数字'),
(2, '文本'),
(3, '日期'),
(4, '日期时间'),
(5, '引用'),
(6, '带出'),
(7, '手机/电话号'),
(8, '主键'),
(9, 'email'),
(10, '附件'),
(11, '固定下拉'),
(12, '自定义下拉'),
(13, '保存状态'),
(14, '自生成单号'),
(15, '人员'),
(16, '累加');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_value`
--

CREATE TABLE `tbl_sys_value` (
  `PK` int(11) NOT NULL,
  `strCode` varchar(50) NOT NULL,
  `strValue` varchar(30) DEFAULT NULL,
  `strName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sys_value`
--

INSERT INTO `tbl_sys_value` (`PK`, `strCode`, `strValue`, `strName`) VALUES
(1, 'intSaveStatus', '0', '暂存'),
(2, 'intSaveStatus', '1', '已提交'),
(3, 'intSaveStatus', '2', '已弃用');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `PK` int(11) NOT NULL,
  `strID` varchar(25) NOT NULL,
  `strPassword` varchar(25) NOT NULL,
  `strName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_base_client`
--
ALTER TABLE `tbl_base_client`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_subcompany`
--
ALTER TABLE `tbl_base_subcompany`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_menu_action`
--
ALTER TABLE `tbl_menu_action`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_menu_big`
--
ALTER TABLE `tbl_menu_big`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_menu_left`
--
ALTER TABLE `tbl_menu_left`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_sys_field`
--
ALTER TABLE `tbl_sys_field`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_sys_table`
--
ALTER TABLE `tbl_sys_table`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_sys_type`
--
ALTER TABLE `tbl_sys_type`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_sys_value`
--
ALTER TABLE `tbl_sys_value`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`PK`),
  ADD KEY `strID` (`strID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tbl_base_client`
--
ALTER TABLE `tbl_base_client`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_subcompany`
--
ALTER TABLE `tbl_base_subcompany`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_menu_action`
--
ALTER TABLE `tbl_menu_action`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `tbl_menu_big`
--
ALTER TABLE `tbl_menu_big`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_menu_left`
--
ALTER TABLE `tbl_menu_left`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `tbl_sys_field`
--
ALTER TABLE `tbl_sys_field`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `tbl_sys_table`
--
ALTER TABLE `tbl_sys_table`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_sys_type`
--
ALTER TABLE `tbl_sys_type`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `tbl_sys_value`
--
ALTER TABLE `tbl_sys_value`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
