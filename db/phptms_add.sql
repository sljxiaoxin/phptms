-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-09-01 11:10:40
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
-- 表的结构 `tbl_base_goods`
--

CREATE TABLE `tbl_base_goods` (
  `PK` int(11) NOT NULL,
  `intClientPK` int(11) NOT NULL,
  `intUnitConvertgroupPK` int(11) NOT NULL COMMENT '货物所属计量单位转换率组',
  `intBaseUnitPK` int(11) NOT NULL COMMENT '基本计量单位PK',
  `intOrderDefaultUnitPK` int(11) NOT NULL COMMENT '订单常用计量单位PK',
  `strGoodsNo` varchar(50) NOT NULL,
  `strGoodsName` varchar(50) NOT NULL,
  `strGoodsModel` varchar(50) NOT NULL COMMENT '型号',
  `strGoodsSpec` varchar(50) NOT NULL COMMENT '规格',
  `intWeight` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每基本计量单位的重量',
  `intVolume` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每基本计量单位体积'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货物表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_receiver`
--

CREATE TABLE `tbl_base_receiver` (
  `PK` int(11) NOT NULL,
  `intClientPK` int(11) NOT NULL,
  `strReceiverName` varchar(50) NOT NULL,
  `strLinkMan` varchar(50) NOT NULL,
  `strPhone` varchar(25) NOT NULL COMMENT '联系人电话',
  `strAddress` varchar(50) NOT NULL COMMENT '送货地址',
  `intMileage` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '里程',
  `intSaveStatus` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货方';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_unit`
--

CREATE TABLE `tbl_base_unit` (
  `PK` int(11) NOT NULL,
  `strName` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_unit_convert_detail`
--

CREATE TABLE `tbl_base_unit_convert_detail` (
  `PK` int(11) NOT NULL,
  `intConvertgroupPK` int(11) NOT NULL,
  `intUnitPK` int(11) NOT NULL,
  `isBaseUnit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是基本计量单位，基本计量单位换算率必须等1',
  `intConvertRate` decimal(11,0) NOT NULL COMMENT '转换率'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位转换表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_unit_convert_group`
--

CREATE TABLE `tbl_base_unit_convert_group` (
  `PK` int(11) NOT NULL,
  `intUnitgroupPK` int(11) NOT NULL,
  `strConvertgroupName` varchar(20) DEFAULT NULL COMMENT '转换率组名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位转换率组';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_unit_group`
--

CREATE TABLE `tbl_base_unit_group` (
  `PK` int(11) NOT NULL,
  `strGroupName` varchar(20) DEFAULT NULL,
  `strUnitPKs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位组';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_base_goods`
--
ALTER TABLE `tbl_base_goods`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_receiver`
--
ALTER TABLE `tbl_base_receiver`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_unit`
--
ALTER TABLE `tbl_base_unit`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_unit_convert_detail`
--
ALTER TABLE `tbl_base_unit_convert_detail`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_unit_convert_group`
--
ALTER TABLE `tbl_base_unit_convert_group`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_unit_group`
--
ALTER TABLE `tbl_base_unit_group`
  ADD PRIMARY KEY (`PK`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tbl_base_goods`
--
ALTER TABLE `tbl_base_goods`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_receiver`
--
ALTER TABLE `tbl_base_receiver`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit`
--
ALTER TABLE `tbl_base_unit`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit_convert_detail`
--
ALTER TABLE `tbl_base_unit_convert_detail`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit_convert_group`
--
ALTER TABLE `tbl_base_unit_convert_group`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit_group`
--
ALTER TABLE `tbl_base_unit_group`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
