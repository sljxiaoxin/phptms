-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-07-28 11:00:26
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
-- 表的结构 `tbl_action`
--

CREATE TABLE `tbl_action` (
  `PK` int(11) NOT NULL,
  `intLeftmenuPK` int(11) NOT NULL,
  `intTablePK` int(11) NOT NULL,
  `strName` varchar(250) NOT NULL,
  `strController` varchar(50) NOT NULL,
  `strAction` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_action`
--

INSERT INTO `tbl_action` (`PK`, `intLeftmenuPK`, `intTablePK`, `strName`, `strController`, `strAction`) VALUES
(1, 5, 1, '分公司查询', 'basedata', 'index'),
(2, 6, 1, '分公司新增', 'basedata', 'add');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_bigmenu`
--

CREATE TABLE `tbl_bigmenu` (
  `PK` int(11) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `intDefaultActionPK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='大导航图菜单表';

--
-- 转存表中的数据 `tbl_bigmenu`
--

INSERT INTO `tbl_bigmenu` (`PK`, `strName`, `intDefaultActionPK`) VALUES
(1, '基础数据', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_leftmenu`
--

CREATE TABLE `tbl_leftmenu` (
  `PK` int(11) NOT NULL,
  `intParentPK` int(11) NOT NULL,
  `strName` varchar(250) NOT NULL,
  `intLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='左侧导航夹名称';

--
-- 转存表中的数据 `tbl_leftmenu`
--

INSERT INTO `tbl_leftmenu` (`PK`, `intParentPK`, `strName`, `intLevel`) VALUES
(1, 0, '基础数据', 1),
(2, 1, '分公司管理', 2),
(3, 1, '发货方管理', 2),
(4, 1, '收货方管理', 2),
(5, 2, '查询', 3),
(6, 2, '新增', 3),
(7, 3, '查询', 3),
(8, 3, '新增', 3),
(9, 4, '查询', 3),
(10, 4, '新增', 3),
(11, 0, '订单管理', 1),
(12, 11, '订单', 2),
(13, 11, '客服管理', 2),
(14, 12, '查询', 3),
(15, 12, '新增', 3);

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
-- Indexes for table `tbl_action`
--
ALTER TABLE `tbl_action`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_bigmenu`
--
ALTER TABLE `tbl_bigmenu`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_leftmenu`
--
ALTER TABLE `tbl_leftmenu`
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
-- 使用表AUTO_INCREMENT `tbl_action`
--
ALTER TABLE `tbl_action`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_bigmenu`
--
ALTER TABLE `tbl_bigmenu`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tbl_leftmenu`
--
ALTER TABLE `tbl_leftmenu`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
