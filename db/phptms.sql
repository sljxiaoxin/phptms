-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-29 08:12:10
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

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
(4, 13, 10, '新增', 'sheet_order', 'add');

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
(2, 2, 0, '发货方管理', 1),
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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`PK`),
  ADD KEY `strID` (`strID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tbl_menu_action`
--
ALTER TABLE `tbl_menu_action`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
