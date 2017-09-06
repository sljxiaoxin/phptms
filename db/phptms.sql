-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-09-06 05:37:45
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
  `strName` varchar(50) DEFAULT NULL,
  `strLinkman` varchar(50) DEFAULT NULL COMMENT '客户联系人',
  `strPhone` varchar(25) DEFAULT NULL,
  `strSubCompanyLinkman` varchar(25) DEFAULT NULL,
  `intBussCount` varchar(20) DEFAULT NULL,
  `dtDate` datetime DEFAULT NULL,
  `intSaveStatus` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_base_client`
--

INSERT INTO `tbl_base_client` (`PK`, `intSubCompanyPK`, `strName`, `strLinkman`, `strPhone`, `strSubCompanyLinkman`, `intBussCount`, `dtDate`, `intSaveStatus`) VALUES
(1, 1, '张三', NULL, '13672051068', '杨建新', NULL, NULL, 1),
(4, 1, 'A', NULL, 'D', 'C', NULL, NULL, 0),
(5, 1, '李四', NULL, '13920331922', '杨建新', NULL, NULL, 2),
(6, 1, '王五', NULL, '1111', '王武林', NULL, NULL, 1),
(7, 1, '刘六', NULL, '13920331922', '呜呜呜', NULL, NULL, 2),
(8, 1, '张三', NULL, '13672051068', '杨建新', NULL, NULL, 1),
(9, 1, 'A', NULL, 'D', 'C', NULL, NULL, 0),
(10, 1, '李四', NULL, '13920331922', '杨建新', NULL, NULL, 2),
(11, 1, '王五', NULL, '1111', '王武林', NULL, NULL, 1),
(12, 1, '刘六', NULL, '13920331922', '呜呜呜', NULL, NULL, 2),
(13, 1, '张三', NULL, '13672051068', '杨建新', NULL, NULL, 1),
(14, 1, 'A', NULL, 'D', 'C', NULL, NULL, 0),
(15, 1, '李四', NULL, '13920331922', '杨建新', NULL, NULL, 2),
(16, 1, '王五', NULL, '1111', '王武林', NULL, NULL, 1),
(17, 1, '刘六', NULL, '13920331922', '呜呜呜', NULL, NULL, 2),
(18, 1, '张三', NULL, '13672051068', '杨建新', NULL, NULL, 1),
(19, 1, 'A', NULL, 'D', 'C', NULL, NULL, 0),
(20, 1, '李四', NULL, '13920331922', '杨建新', NULL, NULL, 2),
(21, 1, '王五', NULL, '1111', '王武林', NULL, NULL, 1),
(22, 1, '刘六', NULL, '13920331922', '呜呜呜', NULL, NULL, 2),
(23, 1, '张三', NULL, '13672051068', '杨建新', NULL, NULL, 1),
(24, 1, 'A', NULL, 'D', 'C', NULL, NULL, 0),
(25, 1, '李四', NULL, '13920331922', '杨建新', NULL, NULL, 2),
(26, 1, '王五', NULL, '1111', '王武林', NULL, NULL, 1),
(27, 1, '刘六', NULL, '13920331922', '呜呜呜', NULL, NULL, 2),
(28, 1, '张三', NULL, '13672051068', '杨建新', NULL, NULL, 1),
(29, 1, 'A', NULL, 'D', 'C', NULL, NULL, 0),
(30, 1, '李四', NULL, '13920331922', '杨建新', NULL, NULL, 2),
(31, 1, '王五', NULL, '1111', '王武林', NULL, NULL, 1),
(32, 1, '李七', NULL, '13920331922', '呜呜呜', NULL, NULL, 2),
(33, 0, '', NULL, '', '', NULL, NULL, 0),
(34, 1, 'A', NULL, 'B', 'D', NULL, NULL, 1),
(35, 0, '', NULL, '', '', NULL, NULL, 0),
(36, 0, 'A', NULL, '', '', NULL, NULL, 0),
(37, 1, 'aaa', NULL, 'ddd', 'sdfsdfsdf', NULL, NULL, 0),
(38, 1, 'aaa+1', NULL, 'ddd', 'sdfsdfsdf', NULL, NULL, 0),
(39, 1, '客户1', NULL, '电话1', 'FFFFF', NULL, NULL, 0),
(40, 1, 'ttttttt', NULL, 'ffffff', 'fsdfsfdfdsfs', NULL, NULL, 0),
(41, 1, 'A', NULL, '33333333333', 'FFFFFF', '99', NULL, 1),
(42, 1, '客户444', NULL, '66666666', 'FFFFF', '3', NULL, 0),
(43, 1, 'GGG', NULL, '33333333', 'GGGS', '33', NULL, 1),
(44, 1, '555', NULL, '33', '222', '0', NULL, 0),
(45, 1, 'FF', NULL, 'SFDSDF', 'FSFDDSF', '3', NULL, 1),
(46, 1, '3', NULL, '3', '3', '3', '0000-00-00 00:00:00', 1),
(47, 1, '2', NULL, '2', '2', '6', '2018-01-05 12:00:00', 1),
(48, 1, 'ff', NULL, '33333', '杨建新', '50', '2017-08-13 08:47:20', 0),
(49, 2, '吉利汽车', NULL, '13520011111', '王艳芳', '90', '2017-08-16 15:15:51', 1),
(50, 2, '奇瑞 汽车', NULL, '1955665555', '王艳芳', '20', '2017-08-15 15:20:09', 1),
(51, 4, '长城汽车', NULL, '22867777', '王伟', '20', '2017-08-21 15:25:20', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_goods`
--

CREATE TABLE `tbl_base_goods` (
  `PK` int(11) NOT NULL,
  `intClientPK` int(11) NOT NULL,
  `intUnitgroupPK` int(11) NOT NULL COMMENT '计量单位组',
  `intUnitConvertgroupPK` int(11) NOT NULL COMMENT '货物所属计量单位转换率组',
  `intDefaultUnitPK` int(11) NOT NULL COMMENT '当前货物默认计量单位PK',
  `intOrderDefaultUnitPK` int(11) NOT NULL COMMENT '订单常用计量单位PK',
  `strGoodsNo` varchar(50) NOT NULL,
  `strGoodsName` varchar(50) NOT NULL,
  `strGoodsModel` varchar(50) NOT NULL COMMENT '型号',
  `strGoodsSpec` varchar(50) NOT NULL COMMENT '规格',
  `intWeight` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每基本计量单位的重量',
  `intVolume` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '每基本计量单位体积'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货物表';

--
-- 转存表中的数据 `tbl_base_goods`
--

INSERT INTO `tbl_base_goods` (`PK`, `intClientPK`, `intUnitgroupPK`, `intUnitConvertgroupPK`, `intDefaultUnitPK`, `intOrderDefaultUnitPK`, `strGoodsNo`, `strGoodsName`, `strGoodsModel`, `strGoodsSpec`, `intWeight`, `intVolume`) VALUES
(1, 51, 1, 1, 1, 1, '3', 'A', 'A', 'C', '2.00', '3.00'),
(2, 51, 1, 1, 1, 2, 'a', 'a', 'a', 'a', '3.00', '3.00'),
(3, 45, 0, 0, 0, 0, '2', '2', '2', '2', '2.00', '2.00'),
(4, 48, 0, 0, 0, 0, '2', '2', '2', '2', '2.00', '2.00'),
(5, 48, 0, 0, 0, 0, '4', '4', '4', '4', '4.00', '4.00'),
(6, 48, 0, 0, 0, 0, '4', '4', '4', '4', '4.00', '4.00'),
(7, 48, 0, 0, 0, 0, '4', '4', '4', '4', '4.00', '4.00'),
(8, 49, 0, 0, 0, 0, '5', '5', '5', '5', '5.00', '5.00'),
(9, 49, 0, 0, 0, 0, '6', '6', '6', '6', '6.00', '6.00'),
(10, 49, 0, 0, 0, 0, '7', '7', '7', '7', '7.00', '7.00'),
(11, 49, 0, 0, 0, 0, '8', '8', '8', '8', '8.00', '8.00'),
(12, 49, 1, 1, 1, 2, '1', '1', '1', '1', '1.00', '1.00');

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

--
-- 转存表中的数据 `tbl_base_receiver`
--

INSERT INTO `tbl_base_receiver` (`PK`, `intClientPK`, `strReceiverName`, `strLinkMan`, `strPhone`, `strAddress`, `intMileage`, `intSaveStatus`) VALUES
(1, 51, '河北省三河市长城4s店', '王柏川', '13920331222', '三河市长江道12号', '200.00', 1);

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

--
-- 转存表中的数据 `tbl_base_subcompany`
--

INSERT INTO `tbl_base_subcompany` (`PK`, `strName`, `strPhone`, `strAddr`, `strLinkman`, `intSaveStatus`) VALUES
(1, '北京分公司', '13820052732', '北京市西城区', '杨建新', 1),
(2, '天津分公司', '13920331922', '天津市北辰区', '王艳芳', 1),
(3, '上海分公司', '13788889999', '上海中心路', '杨建国', 1),
(4, '重庆分公司', '13699999999', '重庆一支路', '王伟', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_truck`
--

CREATE TABLE `tbl_base_truck` (
  `PK` int(11) NOT NULL,
  `strPlateNo` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `intTruckTypePK` int(11) NOT NULL DEFAULT '0' COMMENT '车型',
  `strOwner` varchar(20) DEFAULT NULL,
  `strOwnerPhone` varchar(50) DEFAULT NULL,
  `strDriver` varchar(20) DEFAULT NULL,
  `strDriverPhone` varchar(50) DEFAULT NULL,
  `intUseType` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息表';

--
-- 转存表中的数据 `tbl_base_truck`
--

INSERT INTO `tbl_base_truck` (`PK`, `strPlateNo`, `intTruckTypePK`, `strOwner`, `strOwnerPhone`, `strDriver`, `strDriverPhone`, `intUseType`) VALUES
(1, '津A xxxx', 1, '3', '3', '3', '3', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_truck_type`
--

CREATE TABLE `tbl_base_truck_type` (
  `PK` int(11) NOT NULL,
  `strModel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆型号表';

--
-- 转存表中的数据 `tbl_base_truck_type`
--

INSERT INTO `tbl_base_truck_type` (`PK`, `strModel`) VALUES
(1, '前四后八'),
(2, '4.8米箱货');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_unit`
--

CREATE TABLE `tbl_base_unit` (
  `PK` int(11) NOT NULL,
  `strName` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位表';

--
-- 转存表中的数据 `tbl_base_unit`
--

INSERT INTO `tbl_base_unit` (`PK`, `strName`) VALUES
(1, '箱'),
(2, '盒'),
(3, '桶'),
(4, '个'),
(5, '袋'),
(6, '打'),
(7, '条'),
(8, '盘'),
(9, '卷'),
(10, '根');

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

--
-- 转存表中的数据 `tbl_base_unit_convert_detail`
--

INSERT INTO `tbl_base_unit_convert_detail` (`PK`, `intConvertgroupPK`, `intUnitPK`, `isBaseUnit`, `intConvertRate`) VALUES
(1, 1, 1, 1, '1'),
(2, 1, 2, 0, '6');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_unit_convert_group`
--

CREATE TABLE `tbl_base_unit_convert_group` (
  `PK` int(11) NOT NULL,
  `intUnitgroupPK` int(11) NOT NULL,
  `strConvertgroupName` varchar(20) DEFAULT NULL COMMENT '转换率组名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位转换率组';

--
-- 转存表中的数据 `tbl_base_unit_convert_group`
--

INSERT INTO `tbl_base_unit_convert_group` (`PK`, `intUnitgroupPK`, `strConvertgroupName`) VALUES
(1, 1, '长城润滑脂'),
(2, 1, '奇瑞润滑脂'),
(3, 2, '鞍钢');

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
-- 转存表中的数据 `tbl_base_unit_group`
--

INSERT INTO `tbl_base_unit_group` (`PK`, `strGroupName`, `strUnitPKs`) VALUES
(1, '润滑油组', '1,2,3'),
(2, '钢铁组', '9,10');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_user`
--

CREATE TABLE `tbl_base_user` (
  `PK` int(11) NOT NULL,
  `strUserID` varchar(20) DEFAULT NULL,
  `strPassword` char(32) DEFAULT NULL,
  `strUserName` varchar(20) DEFAULT NULL,
  `intSubcompanyPKs` varchar(100) DEFAULT NULL,
  `intRolePKs` varchar(100) DEFAULT NULL,
  `strPhone` varchar(50) DEFAULT NULL,
  `strEmail` varchar(30) DEFAULT NULL,
  `isWorking` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础用户/员工表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_base_user_role`
--

CREATE TABLE `tbl_base_user_role` (
  `PK` int(11) NOT NULL,
  `strRoleName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

--
-- 转存表中的数据 `tbl_base_user_role`
--

INSERT INTO `tbl_base_user_role` (`PK`, `strRoleName`) VALUES
(1, '计划调度'),
(2, '值班调度');

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
(1, 4, 1, '分公司维护', 'sheet_subcompany', 'index'),
(3, 12, 10, '订单查询', 'sheet_order', 'index'),
(4, 13, 10, '订单新增', 'sheet_order', 'add'),
(5, 6, 2, '客户维护', 'sheet_client', 'index'),
(6, 8, 3, '收货方维护', 'sheet_receiver', 'index'),
(7, 20, 4, '货物维护', 'sheet_goods', 'index'),
(8, 22, 9, '车辆维护', 'sheet_truck', 'index'),
(9, 23, 10, '车型维护', 'sheet_trucktype', 'index'),
(10, 25, 11, '用户维护', 'sheet_user', 'index'),
(11, 26, 12, '角色维护', 'sheet_role', 'index');

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
(1, '基础数据', 1, '1,2,3,19,14,21'),
(2, '订单管理', 3, '10'),
(3, '系统管理', 10, '24');

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
(4, 1, 1, '维护', 2),
(6, 2, 2, '维护', 2),
(8, 3, 3, '维护', 2),
(10, 10, 0, '订单管理', 1),
(12, 10, 10, '查询', 2),
(13, 10, 10, '新增', 2),
(14, 14, 0, '计量单位管理', 1),
(15, 14, 14, '基础计量单位', 2),
(16, 14, 14, '计量单位组', 2),
(17, 14, 14, '计量单位转换率组', 2),
(18, 14, 14, '转换率设置', 2),
(19, 19, 0, '货物管理', 1),
(20, 19, 19, '维护', 2),
(21, 21, 0, '车辆管理', 1),
(22, 21, 21, '车辆', 2),
(23, 21, 21, '车型', 2),
(24, 24, 0, '用户管理', 1),
(25, 24, 24, '用户', 2),
(26, 24, 24, '角色', 2);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sheet_order`
--

CREATE TABLE `tbl_sheet_order` (
  `PK` int(11) NOT NULL,
  `strSheetNo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `dtDate` date NOT NULL,
  `intSubmiterPK` int(11) NOT NULL,
  `intSubcompanyPK` int(11) NOT NULL,
  `intClientPK` int(11) NOT NULL,
  `intReceiverPK` int(11) NOT NULL,
  `strClientLinkman` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '客户联系人',
  `strReceiverLinkman` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '收货方联系人',
  `strReceiverPhone` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '收货方电话',
  `strReceiverAddress` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '送货地址',
  `intReceiverMileage` decimal(11,2) NOT NULL,
  `dtRequireDate` date NOT NULL COMMENT '要求送达日期',
  `intTotalWeight` decimal(11,2) NOT NULL COMMENT '总重量',
  `intTotalVolume` decimal(11,2) NOT NULL,
  `strMemo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sheet_order_detail`
--

CREATE TABLE `tbl_sheet_order_detail` (
  `PK` int(11) NOT NULL,
  `strSheetNo_Detail` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `intGoodsPK` int(11) DEFAULT '0',
  `strGoodsName` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物名称',
  `strGoodsModel` varchar(50) DEFAULT NULL,
  `strGoodsSpec` varchar(50) DEFAULT NULL,
  `intCounts` decimal(11,2) NOT NULL DEFAULT '0.00',
  `intUnitPK` int(11) NOT NULL,
  `intWeight` decimal(11,2) NOT NULL,
  `intVolume` decimal(11,2) NOT NULL,
  `intTotalWeight` decimal(11,2) NOT NULL,
  `intTotalVolume` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单明细表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_field`
--

CREATE TABLE `tbl_sys_field` (
  `PK` int(11) NOT NULL,
  `intTablePK` int(11) NOT NULL COMMENT '逻辑表PK',
  `intFieldClass` tinyint(4) NOT NULL DEFAULT '0' COMMENT '字段类别：0表头，1明细，2状态',
  `intTableStoragePK` int(11) NOT NULL DEFAULT '0' COMMENT '存储表PK',
  `strTableStorage` varchar(30) NOT NULL,
  `strField` varchar(25) NOT NULL,
  `strName` varchar(50) NOT NULL,
  `intType` tinyint(4) NOT NULL COMMENT '字段类型',
  `intTablePK_Ref` int(11) NOT NULL,
  `strTable_Ref` varchar(50) DEFAULT NULL,
  `strField_Ref` varchar(30) DEFAULT NULL,
  `strFileldShow_Ref` varchar(30) DEFAULT NULL,
  `strRefTrigger` varchar(50) DEFAULT NULL COMMENT '5和17类型触发方式，load：初始化时触发；某个字段设值后触发（都是17类型联动用）；空：手动触发（都是5类型用）',
  `strRefFilter` varchar(255) DEFAULT NULL COMMENT '引用类型过滤条件，多个分号分割。点选表字段=[当前表字段名] ；点选表字段={系统预定量}；点选表字段=具体值；程序中替换处理',
  `isEditable` tinyint(4) NOT NULL DEFAULT '1',
  `isMustHave` tinyint(4) NOT NULL DEFAULT '0',
  `strDefaultValue` varchar(50) DEFAULT NULL,
  `strSelectText` varchar(255) DEFAULT NULL COMMENT '固定下拉显示文本',
  `strSelectValue` varchar(50) DEFAULT NULL,
  `intMinValue` varchar(50) NOT NULL DEFAULT '-999999999999',
  `intMaxValue` varchar(50) NOT NULL DEFAULT '999999999999',
  `intOrder` int(5) NOT NULL DEFAULT '0',
  `isDragOut` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是带出'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sys_field`
--

INSERT INTO `tbl_sys_field` (`PK`, `intTablePK`, `intFieldClass`, `intTableStoragePK`, `strTableStorage`, `strField`, `strName`, `intType`, `intTablePK_Ref`, `strTable_Ref`, `strField_Ref`, `strFileldShow_Ref`, `strRefTrigger`, `strRefFilter`, `isEditable`, `isMustHave`, `strDefaultValue`, `strSelectText`, `strSelectValue`, `intMinValue`, `intMaxValue`, `intOrder`, `isDragOut`) VALUES
(1, 1, 0, 1, 'tbl_base_subcompany', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(2, 1, 0, 1, 'tbl_base_subcompany', 'strName', '名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(3, 1, 0, 1, 'tbl_base_subcompany', 'strPhone', '电话', 7, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(4, 1, 0, 1, 'tbl_base_subcompany', 'strAddr', '地址', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(5, 1, 0, 1, 'tbl_base_subcompany', 'strLinkman', '联系人', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(6, 1, 2, 1, 'tbl_base_subcompany', 'intSaveStatus', '状态', 11, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, '1', '停用,启用', '0,1', '-999999999999', '999999999999', 0, 0),
(7, 2, 0, 2, 'tbl_base_client', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(8, 2, 0, 2, 'tbl_base_client', 'intSubCompanyPK', '分公司名称', 5, 1, 'tbl_base_subcompany', 'PK', 'strName', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(9, 2, 0, 2, 'tbl_base_client', 'strName', '客户名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(10, 2, 0, 2, 'tbl_base_client', 'strPhone', '电话', 7, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(11, 2, 2, 2, 'tbl_base_client', 'intSaveStatus', '状态', 11, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, '1', '停用,启用', '0,1', '-999999999999', '999999999999', 0, 0),
(12, 2, 0, 2, 'tbl_base_client', 'strSubCompanyLinkman', '分公司联系人', 2, 1, 'tbl_base_subcompany', 'PK', 'strLinkman', NULL, NULL, 1, 0, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 1),
(13, 2, 0, 2, 'tbl_base_client', 'intBussCount', '业务量', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '0', '100', 0, 0),
(14, 2, 0, 2, 'tbl_base_client', 'dtDate', '日期', 4, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(18, 3, 0, 3, 'tbl_base_receiver', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(19, 3, 0, 3, 'tbl_base_receiver', 'intClientPK', '客户名称', 5, 2, 'tbl_base_client', 'PK', 'strName', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(20, 3, 0, 3, 'tbl_base_receiver', 'strReceiverName', '收货方名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(21, 3, 0, 3, 'tbl_base_receiver', 'strLinkMan', '收货方联系人', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(22, 3, 0, 3, 'tbl_base_receiver', 'strPhone', '联系电话', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(23, 3, 0, 3, 'tbl_base_receiver', 'strAddress', '送货地址', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(24, 3, 0, 3, 'tbl_base_receiver', 'intMileage', '里程', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999', 0, 0),
(25, 3, 0, 3, 'tbl_base_receiver', 'intSaveStatus', '状态', 11, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, '1', '停用,启用', '0,1', '-999999999999.00 ', '999999999999', 0, 0),
(26, 4, 0, 4, 'tbl_base_goods', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 1, 0),
(27, 4, 0, 4, 'tbl_base_goods', 'intClientPK', '客户名称', 5, 2, 'tbl_base_client', 'PK', 'strName', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 4, 0),
(28, 4, 0, 4, 'tbl_base_goods', 'intUnitgroupPK', '计量单位组', 17, 6, 'tbl_base_unit_group', 'PK', 'strGroupName', 'load', NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 9, 0),
(29, 4, 0, 4, 'tbl_base_goods', 'intUnitConvertgroupPK', '计量单位转换率组', 17, 7, 'tbl_base_unit_convert_group', 'PK', 'strConvertgroupName', 'intUnitgroupPK', 'intUnitgroupPK=[intUnitgroupPK]', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 10, 0),
(30, 4, 0, 4, 'tbl_base_goods', 'intDefaultUnitPK', '基本计量单位', 17, 5, 'tbl_base_unit', 'PK', 'strName', 'intUnitConvertgroupPK', 'TBUCD.intConvertgroupPK=[intUnitConvertgroupPK];TBUCD.isBaseUnit = 1', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 11, 0),
(31, 4, 0, 4, 'tbl_base_goods', 'intOrderDefaultUnitPK', '订单常用计量单位', 17, 5, 'tbl_base_unit', 'PK', 'strName', 'intUnitConvertgroupPK', 'TBUCD.intConvertgroupPK=[intUnitConvertgroupPK]', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 12, 0),
(32, 4, 0, 4, 'tbl_base_goods', 'strGoodsNo', '货物编号', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 2, 0),
(33, 4, 0, 4, 'tbl_base_goods', 'strGoodsName', '货物名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 3, 0),
(34, 4, 0, 4, 'tbl_base_goods', 'strGoodsModel', '型号', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 5, 0),
(35, 4, 0, 4, 'tbl_base_goods', 'strGoodsSpec', '规格', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 6, 0),
(36, 4, 0, 4, 'tbl_base_goods', 'intWeight', '重量', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 7, 0),
(37, 4, 0, 4, 'tbl_base_goods', 'intVolume', '体积', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 8, 0),
(38, 5, 0, 5, 'tbl_base_unit', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(39, 5, 0, 5, 'tbl_base_unit', 'strName', '名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(40, 6, 0, 6, 'tbl_base_unit_group', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(41, 6, 0, 6, 'tbl_base_unit_group', 'strGroupName', '名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(42, 7, 0, 7, 'tbl_base_unit_convert_group', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(43, 7, 0, 7, 'tbl_base_unit_convert_group', 'intUnitgroupPK', '计量单位组名称', 17, 6, 'tbl_base_unit_group', 'PK', 'strGroupName', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(44, 7, 0, 7, 'tbl_base_unit_convert_group', 'strConvertgroupName', '转换率组名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(45, 8, 0, 8, 'tbl_base_unit_convert_detail', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(46, 8, 0, 8, 'tbl_base_unit_convert_detail', 'intConvertgroupPK', '转换率组名称', 17, 7, 'tbl_base_unit_convert_group', 'PK', 'strConvertgroupName', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(47, 8, 0, 8, 'tbl_base_unit_convert_detail', 'intUnitPK', '计量单位', 17, 5, 'tbl_base_unit', 'PK', 'strName', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(48, 8, 0, 8, 'tbl_base_unit_convert_detail', 'isBaseUnit', '是否基本计量单位', 11, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, '0', '否,是', '0,1', '-999999999999.00 ', '999999999999.00 ', 0, 0),
(49, 8, 0, 8, 'tbl_base_unit_convert_detail', 'intConvertRate', '转换率', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(50, 21, 0, 20, 'tbl_sheet_order', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(51, 21, 0, 20, 'tbl_sheet_order', 'strSheetNo', '订单编号', 14, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(52, 21, 0, 20, 'tbl_sheet_order', 'dtDate', '开单日期', 3, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(53, 21, 0, 20, 'tbl_sheet_order', 'intSubmiterPK', '开单人', 17, 11, 'tbl_base_user', 'PK', 'strUserName', 'load', 'TBU.PK = {LOGIN_USER_PK}', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(54, 21, 0, 20, 'tbl_sheet_order', 'intSubcompanyPK', '分公司', 5, 1, 'tbl_base_subcompany', 'PK', 'strName', 'load', 'TBS.PK in {SUBCOMPANY_RIGHT}', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(55, 21, 0, 20, 'tbl_sheet_order', 'intClientPK', '客户名称', 5, 2, 'tbl_base_client', 'PK', 'strName', NULL, 'TBC.intSubCompanyPK = [intSubcompanyPK]', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(56, 21, 0, 20, 'tbl_sheet_order', 'intReceiverPK', '收货方', 5, 3, 'tbl_base_receiver', 'PK', 'strReceiverName', NULL, 'TBR.intClientPK = [intClientPK]', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(57, 21, 0, 20, 'tbl_sheet_order', 'strClientLinkman', '客户联系人', 2, 2, 'tbl_base_client', 'PK', 'strLinkman', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(58, 21, 0, 20, 'tbl_sheet_order', 'strReceiverLinkman', '收货方联系人', 2, 3, 'tbl_base_receiver', 'PK', 'strLinkMan', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(59, 21, 0, 20, 'tbl_sheet_order', 'strReceiverPhone', '收货方电话', 2, 3, 'tbl_base_receiver', 'PK', 'strPhone', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(60, 21, 0, 20, 'tbl_sheet_order', 'strReceiverAddress', '送达地址', 2, 3, 'tbl_base_receiver', 'PK', 'strAddress', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(61, 21, 0, 20, 'tbl_sheet_order', 'intReceiverMileage', '里程', 1, 3, 'tbl_base_receiver', 'PK', 'intMileage', NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(62, 21, 0, 20, 'tbl_sheet_order', 'dtRequireDate', '要求送达日期', 3, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(63, 21, 0, 20, 'tbl_sheet_order', 'intTotalWeight', '总重量', 16, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(64, 21, 0, 20, 'tbl_sheet_order', 'intTotalVolume', '总体积', 16, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(65, 21, 0, 20, 'tbl_sheet_order', 'strMemo', '备注', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(66, 21, 1, 21, 'tbl_sheet_order_detail', 'PK', '明细主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(67, 21, 1, 21, 'tbl_sheet_order_detail', 'strSheetNo_Detail', '订单编号', 14, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(68, 21, 1, 21, 'tbl_sheet_order_detail', 'intGoodsPK', '货物编号', 5, 4, 'tbl_base_goods', 'PK', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(69, 21, 1, 21, 'tbl_sheet_order_detail', 'strGoodsName', '货物名称', 2, 4, 'tbl_base_goods', 'PK', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(70, 21, 1, 21, 'tbl_sheet_order_detail', 'strGoodsModel', '货物型号', 2, 4, 'tbl_base_goods', 'PK', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(71, 21, 1, 21, 'tbl_sheet_order_detail', 'strGoodsSpec', '货物规格', 2, 4, 'tbl_base_goods', 'PK', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 1),
(72, 21, 1, 21, 'tbl_sheet_order_detail', 'intCounts', '数量', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(73, 21, 1, 21, 'tbl_sheet_order_detail', 'intUnitPK', '单位', 17, 5, 'tbl_base_unit', 'PK', 'strName', 'intGoodsPK', 'TBG.PK = [intGoodsPK]', 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(74, 21, 1, 21, 'tbl_sheet_order_detail', 'intWeight', '重量', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(75, 21, 1, 21, 'tbl_sheet_order_detail', 'intVolume', '体积', 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(76, 21, 1, 21, 'tbl_sheet_order_detail', 'intTotalWeight', '总重量', 19, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(77, 21, 1, 21, 'tbl_sheet_order_detail', 'intTotalVolume', '总体积', 19, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(78, 2, 0, 2, 'tbl_base_client', 'strLinkman', '客户联系人', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999', '999999999999', 0, 0),
(79, 9, 0, 9, 'tbl_base_truck', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(80, 9, 0, 9, 'tbl_base_truck', 'strPlateNo', '车牌号', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(81, 9, 0, 9, 'tbl_base_truck', 'intTruckTypePK', '车型', 17, 10, 'tbl_base_truck_type', 'PK', 'strModel', 'load', NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(82, 9, 0, 9, 'tbl_base_truck', 'strOwner', '车主', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(83, 9, 0, 9, 'tbl_base_truck', 'strOwnerPhone', '车主电话', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(84, 9, 0, 9, 'tbl_base_truck', 'strDriver', '司机', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(85, 9, 0, 9, 'tbl_base_truck', 'strDriverPhone', '司机电话', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(86, 9, 0, 9, 'tbl_base_truck', 'intUseType', '车辆所属', 11, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, '0', '自营车,外调车', '0,1', '-999999999999.00 ', '999999999999.00 ', 0, 0),
(87, 10, 0, 10, 'tbl_base_truck_type', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(88, 10, 0, 10, 'tbl_base_truck_type', 'strModel', '车型', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(89, 11, 0, 11, 'tbl_base_user', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(90, 11, 0, 11, 'tbl_base_user', 'strUserID', '用户账号', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(91, 11, 0, 11, 'tbl_base_user', 'strUserName', '用户名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(92, 11, 0, 11, 'tbl_base_user', 'intSubcompanyPKs', '分公司权限', 18, 1, 'tbl_base_subcompany', 'PK', 'strName', 'load', NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(93, 11, 0, 11, 'tbl_base_user', 'intRolePKs', '角色', 18, 12, 'tbl_base_user_role', 'PK', 'strRoleName', 'load', NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(94, 11, 0, 11, 'tbl_base_user', 'strPhone', '手机号', 7, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(95, 11, 0, 11, 'tbl_base_user', 'strEmail', '邮件', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(96, 11, 0, 11, 'tbl_base_user', 'isWorking', '在职', 11, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, '1', '在职,离职', '1,0', '-999999999999.00 ', '999999999999.00 ', 0, 0),
(97, 12, 0, 12, 'tbl_base_user_role', 'PK', '主键', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0),
(98, 12, 0, 12, 'tbl_base_user_role', 'strRoleName', '角色名称', 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '-999999999999.00 ', '999999999999.00 ', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sys_table`
--

CREATE TABLE `tbl_sys_table` (
  `PK` int(11) NOT NULL,
  `strTable` varchar(50) DEFAULT NULL,
  `strName` varchar(50) DEFAULT NULL,
  `strTableAbbr` varchar(10) DEFAULT NULL,
  `strSheetIndex` varchar(50) DEFAULT NULL COMMENT '表头和明细链接条件，一般是单号字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sys_table`
--

INSERT INTO `tbl_sys_table` (`PK`, `strTable`, `strName`, `strTableAbbr`, `strSheetIndex`) VALUES
(1, 'tbl_base_subcompany', '分公司', 'TBSC', NULL),
(2, 'tbl_base_client', '客户', 'TBC', NULL),
(3, 'tbl_base_receiver', '收货方', 'TBR', NULL),
(4, 'tbl_base_goods', '货物', 'TBG', NULL),
(5, 'tbl_base_unit', '基础计量单位', 'TBU', NULL),
(6, 'tbl_base_unit_group', '计量单位组', 'TBUG', NULL),
(7, 'tbl_base_unit_convert_group', '计量单位转换率组', 'TBUCG', NULL),
(8, 'tbl_base_unit_convert_detail', '计量单位转换率明细', 'TBUCD', NULL),
(9, 'tbl_base_truck', '车辆表', 'TBT', NULL),
(10, 'tbl_base_truck_type', '车辆类型表', 'TBTT', NULL),
(11, 'tbl_base_user', '用户表', 'TBU', NULL),
(12, 'tbl_base_user_role', '角色表', 'TBUR', NULL),
(20, 'tbl_sheet_order', '订单表头', 'TSO', 'strSheetNo'),
(21, 'tbl_sheet_order_detail', '订单明细表', 'TSOD', 'strSheetNo_Detail');

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
(6, '带出（已删）'),
(7, '手机/电话号'),
(8, '主键'),
(9, 'email'),
(10, '附件'),
(11, '固定下拉'),
(12, '自定义下拉'),
(13, '自定义状态'),
(14, '自生成单号'),
(15, '人员'),
(16, '累加'),
(17, '引用单选下拉'),
(18, '引用多选下拉'),
(19, '统计');

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
-- Indexes for table `tbl_base_subcompany`
--
ALTER TABLE `tbl_base_subcompany`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_truck`
--
ALTER TABLE `tbl_base_truck`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_truck_type`
--
ALTER TABLE `tbl_base_truck_type`
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
-- Indexes for table `tbl_base_user`
--
ALTER TABLE `tbl_base_user`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_base_user_role`
--
ALTER TABLE `tbl_base_user_role`
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
-- Indexes for table `tbl_sheet_order`
--
ALTER TABLE `tbl_sheet_order`
  ADD PRIMARY KEY (`PK`);

--
-- Indexes for table `tbl_sheet_order_detail`
--
ALTER TABLE `tbl_sheet_order_detail`
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
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- 使用表AUTO_INCREMENT `tbl_base_goods`
--
ALTER TABLE `tbl_base_goods`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `tbl_base_receiver`
--
ALTER TABLE `tbl_base_receiver`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tbl_base_subcompany`
--
ALTER TABLE `tbl_base_subcompany`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `tbl_base_truck`
--
ALTER TABLE `tbl_base_truck`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tbl_base_truck_type`
--
ALTER TABLE `tbl_base_truck_type`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit`
--
ALTER TABLE `tbl_base_unit`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit_convert_detail`
--
ALTER TABLE `tbl_base_unit_convert_detail`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit_convert_group`
--
ALTER TABLE `tbl_base_unit_convert_group`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `tbl_base_unit_group`
--
ALTER TABLE `tbl_base_unit_group`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_base_user`
--
ALTER TABLE `tbl_base_user`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_base_user_role`
--
ALTER TABLE `tbl_base_user_role`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tbl_menu_action`
--
ALTER TABLE `tbl_menu_action`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `tbl_menu_big`
--
ALTER TABLE `tbl_menu_big`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `tbl_menu_left`
--
ALTER TABLE `tbl_menu_left`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `tbl_sheet_order`
--
ALTER TABLE `tbl_sheet_order`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_sheet_order_detail`
--
ALTER TABLE `tbl_sheet_order_detail`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tbl_sys_field`
--
ALTER TABLE `tbl_sys_field`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- 使用表AUTO_INCREMENT `tbl_sys_table`
--
ALTER TABLE `tbl_sys_table`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `tbl_sys_type`
--
ALTER TABLE `tbl_sys_type`
  MODIFY `PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
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
