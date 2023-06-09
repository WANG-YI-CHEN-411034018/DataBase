-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 140.127.74.226
-- 產生時間： 2023-06-09 10:11:13
-- 伺服器版本： 10.11.3-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `411034018`
--

-- --------------------------------------------------------

--
-- 資料表結構 `商店（store）`
--

CREATE TABLE `商店（store）` (
  `商店ID` int(11) NOT NULL,
  `商店名稱` varchar(50) NOT NULL,
  `地區` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `商店（store）`
--

INSERT INTO `商店（store）` (`商店ID`, `商店名稱`, `地區`) VALUES
(40, 'PPHome左營店', '高雄'),
(41, 'PPHome燕巢店', '高雄'),
(42, 'PPHome楠梓店', '高雄'),
(43, 'PPHome關山店', '台東');

-- --------------------------------------------------------

--
-- 資料表結構 `客戶（customer）`
--

CREATE TABLE `客戶（customer）` (
  `客戶ID` int(11) NOT NULL,
  `客戶姓名` varchar(50) NOT NULL,
  `付款方式` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `客戶（customer）`
--

INSERT INTO `客戶（customer）` (`客戶ID`, `客戶姓名`, `付款方式`) VALUES
(60, '兔田佩可拉', '月計費'),
(61, '白上吹雪', '月計費'),
(62, '戌神沁音', '信用卡'),
(63, '拉普拉斯·達克尼斯', '信用卡'),
(64, '沙花叉克蘿耶', '信用卡'),
(65, '噶嗚·古拉', '月計費'),
(66, '七詩無名', '信用卡'),
(67, '小鳥遊琪亞拉', '信用卡'),
(68, '角卷綿芽', '信用卡');

-- --------------------------------------------------------

--
-- 資料表結構 `庫存(inventory)`
--

CREATE TABLE `庫存(inventory)` (
  `庫存ID` int(11) NOT NULL,
  `產品ID` int(11) NOT NULL,
  `商店ID` int(11) NOT NULL,
  `庫存數量` int(11) NOT NULL,
  `製造商ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `庫存(inventory)`
--

INSERT INTO `庫存(inventory)` (`庫存ID`, `產品ID`, `商店ID`, `庫存數量`, `製造商ID`) VALUES
(50, 10, 40, 66, 30),
(51, 11, 40, 13, 31),
(52, 14, 40, 3, 34),
(53, 18, 40, 55, 37),
(54, 12, 42, 18, 32),
(55, 15, 42, 88, 35),
(56, 17, 42, 25, 36),
(57, 16, 43, 0, 30),
(58, 19, 41, 11, 38),
(59, 14, 43, 35, 34);

-- --------------------------------------------------------

--
-- 資料表結構 `產品（product）`
--

CREATE TABLE `產品（product）` (
  `產品ID` int(11) NOT NULL,
  `產品名稱` varchar(50) NOT NULL,
  `產品售價` int(11) NOT NULL,
  `類別ID` int(11) NOT NULL,
  `製造商ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `產品（product）`
--

INSERT INTO `產品（product）` (`產品ID`, `產品名稱`, `產品售價`, `類別ID`, `製造商ID`) VALUES
(10, 'PlayStation6', 12000, 20, 30),
(11, 'Apple Vision Pro', 100000, 24, 31),
(12, 'RTX4090', 62000, 21, 32),
(13, '48吋 OLED 4K AI語音智慧聯網電視', 36000, 22, 33),
(14, 'Nintendo Switch', 9000, 20, 34),
(15, 'Razer 奎蛇 V2 Pro 電競滑鼠', 1800, 21, 35),
(16, 'SONY α1 8K錄影全幅單機身', 174980, 23, 30),
(17, '飛利浦PHILIPS奈米級抗敏空氣清淨機 ', 10990, 21, 36),
(18, 'Xbox Series X', 15000, 20, 37),
(19, 'Dyson omni-glide多向無線吸塵器', 12900, 22, 38);

-- --------------------------------------------------------

--
-- 資料表結構 `製造商（manufacturer）`
--

CREATE TABLE `製造商（manufacturer）` (
  `製造商ID` int(11) NOT NULL,
  `製造商名稱` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `製造商（manufacturer）`
--

INSERT INTO `製造商（manufacturer）` (`製造商ID`, `製造商名稱`) VALUES
(30, 'Sony'),
(31, 'Apple'),
(32, 'NVIDIA'),
(33, 'LG'),
(34, 'Nintendo'),
(35, 'RAZER_雷蛇'),
(36, '飛利浦'),
(37, 'Xbox'),
(38, 'Dyson戴森');

-- --------------------------------------------------------

--
-- 資料表結構 `訂單(order)`
--

CREATE TABLE `訂單(order)` (
  `訂單ID` int(11) NOT NULL,
  `產品ID` int(11) NOT NULL,
  `客戶ID` int(11) NOT NULL,
  `購買數量` int(11) NOT NULL,
  `訂單價格` int(11) NOT NULL,
  `購買年分` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `訂單(order)`
--

INSERT INTO `訂單(order)` (`訂單ID`, `產品ID`, `客戶ID`, `購買數量`, `訂單價格`, `購買年分`) VALUES
(123456, 10, 60, 1, 12000, 2023),
(456789, 18, 65, 1, 15000, 2023),
(654321, 14, 60, 1, 9000, 2023),
(987654, 11, 68, 2, 200000, 2022);

-- --------------------------------------------------------

--
-- 資料表結構 `貨運人（carrier）`
--

CREATE TABLE `貨運人（carrier）` (
  `運輸公司ID` int(11) NOT NULL,
  `狀態` varchar(50) NOT NULL,
  `訂單ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `貨運人（carrier）`
--

INSERT INTO `貨運人（carrier）` (`運輸公司ID`, `狀態`, `訂單ID`) VALUES
(70, '已出貨', 123456),
(71, '未出貨', 987654),
(72, '遲到', 456789),
(73, '遲到', 654321);

-- --------------------------------------------------------

--
-- 資料表結構 `銷售額（sale）`
--

CREATE TABLE `銷售額（sale）` (
  `銷售ID` int(11) NOT NULL,
  `產品ID` int(11) NOT NULL,
  `類別ID` int(11) NOT NULL,
  `時間` int(11) NOT NULL,
  `區域` varchar(50) NOT NULL,
  `銷售額` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `銷售額（sale）`
--

INSERT INTO `銷售額（sale）` (`銷售ID`, `產品ID`, `類別ID`, `時間`, `區域`, `銷售額`) VALUES
(70, 10, 20, 2023, '高雄', 2000000),
(71, 12, 21, 2023, '高雄', 4500000),
(72, 14, 20, 2023, '台東', 1800000),
(73, 18, 20, 2023, '台東', 1700000);

-- --------------------------------------------------------

--
-- 資料表結構 `類別（category）`
--

CREATE TABLE `類別（category）` (
  `類別ID` int(11) NOT NULL,
  `類別名稱` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `類別（category）`
--

INSERT INTO `類別（category）` (`類別ID`, `類別名稱`) VALUES
(20, '娛樂'),
(21, '電腦'),
(22, '家電'),
(23, '數位'),
(24, '通訊');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `商店（store）`
--
ALTER TABLE `商店（store）`
  ADD PRIMARY KEY (`商店ID`);

--
-- 資料表索引 `客戶（customer）`
--
ALTER TABLE `客戶（customer）`
  ADD PRIMARY KEY (`客戶ID`);

--
-- 資料表索引 `庫存(inventory)`
--
ALTER TABLE `庫存(inventory)`
  ADD PRIMARY KEY (`庫存ID`),
  ADD KEY `商店ID` (`商店ID`),
  ADD KEY `產品ID` (`產品ID`),
  ADD KEY `製造商ID` (`製造商ID`);

--
-- 資料表索引 `產品（product）`
--
ALTER TABLE `產品（product）`
  ADD PRIMARY KEY (`產品ID`),
  ADD KEY `製造商ID` (`製造商ID`),
  ADD KEY `類別ID` (`類別ID`);

--
-- 資料表索引 `製造商（manufacturer）`
--
ALTER TABLE `製造商（manufacturer）`
  ADD PRIMARY KEY (`製造商ID`);

--
-- 資料表索引 `訂單(order)`
--
ALTER TABLE `訂單(order)`
  ADD PRIMARY KEY (`訂單ID`),
  ADD KEY `客戶ID` (`客戶ID`),
  ADD KEY `產品ID` (`產品ID`);

--
-- 資料表索引 `貨運人（carrier）`
--
ALTER TABLE `貨運人（carrier）`
  ADD PRIMARY KEY (`運輸公司ID`),
  ADD KEY `訂單ID` (`訂單ID`);

--
-- 資料表索引 `銷售額（sale）`
--
ALTER TABLE `銷售額（sale）`
  ADD PRIMARY KEY (`銷售ID`),
  ADD KEY `產品ID` (`產品ID`),
  ADD KEY `類別ID` (`類別ID`);

--
-- 資料表索引 `類別（category）`
--
ALTER TABLE `類別（category）`
  ADD PRIMARY KEY (`類別ID`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `庫存(inventory)`
--
ALTER TABLE `庫存(inventory)`
  ADD CONSTRAINT `庫存(inventory)_ibfk_1` FOREIGN KEY (`商店ID`) REFERENCES `商店（store）` (`商店ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `庫存(inventory)_ibfk_2` FOREIGN KEY (`產品ID`) REFERENCES `產品（product）` (`產品ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `庫存(inventory)_ibfk_3` FOREIGN KEY (`製造商ID`) REFERENCES `製造商（manufacturer）` (`製造商ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `產品（product）`
--
ALTER TABLE `產品（product）`
  ADD CONSTRAINT `產品（product）_ibfk_1` FOREIGN KEY (`製造商ID`) REFERENCES `製造商（manufacturer）` (`製造商ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `產品（product）_ibfk_2` FOREIGN KEY (`類別ID`) REFERENCES `類別（category）` (`類別ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `訂單(order)`
--
ALTER TABLE `訂單(order)`
  ADD CONSTRAINT `訂單(order)_ibfk_1` FOREIGN KEY (`客戶ID`) REFERENCES `客戶（customer）` (`客戶ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `訂單(order)_ibfk_2` FOREIGN KEY (`產品ID`) REFERENCES `產品（product）` (`產品ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `貨運人（carrier）`
--
ALTER TABLE `貨運人（carrier）`
  ADD CONSTRAINT `貨運人（carrier）_ibfk_1` FOREIGN KEY (`訂單ID`) REFERENCES `訂單(order)` (`訂單ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `銷售額（sale）`
--
ALTER TABLE `銷售額（sale）`
  ADD CONSTRAINT `銷售額（sale）_ibfk_1` FOREIGN KEY (`產品ID`) REFERENCES `產品（product）` (`產品ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `銷售額（sale）_ibfk_2` FOREIGN KEY (`類別ID`) REFERENCES `類別（category）` (`類別ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
