-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 
-- サーバのバージョン： 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecmall`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `cart_list`
--

CREATE TABLE `cart_list` (
  `cart_num` int(11) NOT NULL,
  `user_num` int(11) NOT NULL,
  `p_num` int(11) NOT NULL,
  `p_count` int(11) NOT NULL DEFAULT '0',
  `p_price` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `cart_list`
--

INSERT INTO `cart_list` (`cart_num`, `user_num`, `p_num`, `p_count`, `p_price`) VALUES
(8, 15, 14, 1, 900),
(11, 5, 14, 1, 900),
(12, 26, 14, 1, 900),
(13, 27, 9, 1, 300),
(14, 27, 13, 3, 500),
(15, 27, 14, 1, 900),
(17, 27, 14, 1, 900),
(20, 27, 2, 1, 1000),
(21, 27, 2, 1, 1000),
(22, 8, 2, 1, 1000),
(23, 8, 2, 1, 1000),
(24, 8, 14, 1, 900),
(25, 28, 14, 1, 900),
(26, 28, 2, 1, 1000),
(27, 8, 9, 1, 300),
(28, 8, 14, 1, 900),
(29, 8, 14, 1, 900),
(30, 8, 14, 1, 900),
(31, 8, 9, 1, 300),
(32, 8, 9, 1, 300),
(33, 8, 9, 1, 300),
(34, 8, 9, 1, 300),
(35, 8, 15, 1, 500),
(36, 29, 15, 1, 500);

-- --------------------------------------------------------

--
-- テーブルの構造 `customer_list`
--

CREATE TABLE `customer_list` (
  `order_num` varchar(30) NOT NULL,
  `user_num` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_mobile` varchar(15) NOT NULL,
  `customer_postnum` int(11) NOT NULL,
  `customer_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `customer_list`
--

INSERT INTO `customer_list` (`order_num`, `user_num`, `customer_name`, `customer_mobile`, `customer_postnum`, `customer_address`) VALUES
('20190626080941', 8, 'akaashi keiji', '2147483647', 665, 'hannam the hill'),
('20190626081206', 8, 'Tom hiddleston', '2147483647', 3, 'baker-3street, london, UK'),
('20190701074318', 27, 'å†…å±±æ˜‚è¼', '0816', 41567, 'åŸ¼çŽ‰çœŒ'),
('20190701092317', 0, 'JIMN', '0807595', 9785654, 'sapporo-shi'),
('20190702073255', 27, 'æ¾å²¡æž—', '0816', 50004, 'æœ­å¹Œå¸‚'),
('20190702073350', 27, 'ä»£ç†æ³¨æ–‡', '0816', 60003, 'å±±æ¢¨çœŒ'),
('20190702074230', 27, 'Tom Holand', '0816', 60009, 'å±±æ¢¨çœŒ'),
('20190806034438', 8, 'akaashi keiji', '08075897288', 0, ''),
('20190806034507', 27, 'å†…å±±æ˜‚è¼', '0816', 50004, 'åŒ—æµ·é“, æœ­å¹Œå¸‚å—åŒºæ¾„å·å››æ¡'),
('20190806034535', 27, 'å†…å±±æ˜‚è¼', '0816', 50004, 'åŒ—æµ·é“, æœ­å¹Œå¸‚å—åŒºæ¾„å·å››æ¡'),
('20190806055016', 27, 'å†…å±±æ˜‚è¼', '0816', 50004, 'åŒ—æµ·é“, æœ­å¹Œå¸‚å—åŒºæ¾„å·å››æ¡'),
('20190806055058', 5, 'matsuoka rin', '08075897288', 11000, 'åŒ—æµ·é“, æœ­å¹Œå¸‚å—åŒºæ¾„å·å››æ¡'),
('20190806055131', 4, 'ryugazaki rei', '08075897288', 90008, 'ryugazaki eki');

-- --------------------------------------------------------

--
-- テーブルの構造 `order_list`
--

CREATE TABLE `order_list` (
  `order_num` varchar(30) NOT NULL,
  `user_num` int(11) NOT NULL,
  `p_num` int(11) NOT NULL,
  `p_count` int(11) NOT NULL DEFAULT '0',
  `p_price` int(11) NOT NULL DEFAULT '0',
  `p_payment` varchar(30) NOT NULL,
  `p_deliveryDate` text NOT NULL,
  `order_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `order_list`
--

INSERT INTO `order_list` (`order_num`, `user_num`, `p_num`, `p_count`, `p_price`, `p_payment`, `p_deliveryDate`, `order_date`) VALUES
('20190626080941', 8, 15, 1, 500, 'convenience store', '2019/06/04', ''),
('20190626081206', 8, 14, 4, 3600, 'credit Card', '2019/07/26', ''),
('20190701074318', 27, 9, 36, 1200, 'convenience store', '2019/07/03', ''),
('20190701092317', 0, 15, 1, 500, 'credit Card', '2019/07/19', ''),
('20190702073255', 27, 13, 1, 500, 'daibiki', '2019/07/25', ''),
('20190702073350', 27, 15, 1, 500, 'ã‚³ãƒ³ãƒ“ãƒ‹æ±ºæ¸ˆ', '2019/07/18', ''),
('20190702074230', 27, 12, 5, 600, 'éƒµä¾¿å»ºæ›¿', '2019/07/19', ''),
('20190806055016', 27, 9, 1, 300, 'ã‚³ãƒ³ãƒ“ãƒ‹æ±ºæ¸ˆ', '2019/08/22', '20190806'),
('20190806055058', 5, 16, 3, 1800, 'ã‚³ãƒ³ãƒ“ãƒ‹æ±ºæ¸ˆ', '2019/08/07', '20190806'),
('20190806055131', 4, 13, 5, 2500, 'ã‚³ãƒ³ãƒ“ãƒ‹æ±ºæ¸ˆ', '2019/08/15', '20190806');

-- --------------------------------------------------------

--
-- テーブルの構造 `product_list`
--

CREATE TABLE `product_list` (
  `p_num` int(11) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_memo` text NOT NULL,
  `p_price` int(10) NOT NULL,
  `p_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `product_list`
--

INSERT INTO `product_list` (`p_num`, `p_name`, `p_memo`, `p_price`, `p_img`) VALUES
(1, 'heart', 'ã‹ã‚ã„ã‚ˆ', 1000, '201906140849.png'),
(2, 'ã‹ã‚ã„', 'yee', 1000, '201906170315.png'),
(3, 'post it', 'post it', 200, '201906170322.png'),
(4, 'planet', 'planet', 300, '201906170327.png'),
(5, 'post it2', 'post it', 200, '201906170329.png'),
(6, 'hey', 'why dont you buy this product?', 600, '201906180800.png'),
(7, 'note', 'note des', 600, '201906180809.png'),
(8, 'memopad', 'memopad des', 500, '201906180810.png'),
(9, '3 color grid post it', 'when you buy all of variation , 1000Yen', 300, '201906180811.png'),
(10, 'molan', 'molan post it\r\nkawaii', 300, '201906180822.png'),
(11, 'color index', 'colorful index', 400, '201906180822.png'),
(12, 'simple', 'simple memo ', 600, '201906190741.png'),
(13, 'big size post it', 'post it', 500, '201906190741.png'),
(14, 'character memo', 'character memo pad', 900, '201906190742.png'),
(15, 'Landscape', 'landscape', 500, '201906250723.png'),
(16, 'product1', 'sdf', 600, '201907021044.png');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_list`
--

CREATE TABLE `user_list` (
  `user_num` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `user_pw` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `user_mobile` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `user_qualify` int(11) DEFAULT '1' COMMENT '1 = general user, 2 = manager qualify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `user_list`
--

INSERT INTO `user_list` (`user_num`, `user_id`, `user_pw`, `user_name`, `user_mobile`, `user_qualify`) VALUES
(2, 'clover', 'clover', 'uchiyama kouki', '08075897288', 1),
(3, 'test', 'test', 'fukushi souta', '08075897288', 1),
(4, 'rei', 'rei', 'ryugazaki rei', '08075897288', 1),
(5, 'rin', 'rin', 'matsuoka rin', '08075897288', 1),
(6, 'makoto', 'makoto', 'tachibana makoto', '08075897288', 1),
(7, 'haru', 'haru', 'nanase haruka', '08075897288', 1),
(8, 'keiji', 'keiji', 'akaashi keiji', '08075897288', 1),
(9, 'mura', 'mura', 'murashakibara atsushi', '08075897288', 1),
(10, 'takao', 'takao', 'takao kazunari', '08075897288', 1),
(11, 'miya', 'miya', 'miya osamu', '08075897288', 1),
(12, 'hajime', 'hajime', 'iwaizumi hajime', '08075897288', 1),
(13, 'kanri', 'kanri', 'shop manager', '08075897288', 2),
(14, 'akaashi', 'akaashi', 'akaashi', '1205', 1),
(15, 'kita', 'kita', 'kita sinsuke', '89', 1),
(24, 'kkaia', 'kaia', 'kaia', '1235', 1),
(25, 'suna', 'suna', 'suna', '56465', 1),
(26, 'park', 'park', 'ë°•ì„ í˜œ', '6363', 1),
(27, 'uchiyama', 'uchiyama', 'å†…å±±æ˜‚è¼', '0816', 1),
(28, 'niro', 'niro', 'Hutakuchi Kenji', '05095351369', 1),
(29, 'sunhyun', 'sunhyun', 'sunhyun', '6546', 1),
(30, 'jimin', 'jimin', 'JIMIN', '01027715745', 1),
(31, 'yun', 'yun', 'yun', '6666', 1),
(32, 'aka', 'aka', 'aka', '666', 1),
(33, 'so', 'so', 'so', '700', 1),
(34, 'MARI', 'MARI', 'MARI', '6546', 1),
(35, 'SATO', 'SATO', 'SATO', '310', 1),
(36, 'jin', 'jin', 'jin', '481', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`cart_num`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`p_num`);

--
-- Indexes for table `user_list`
--
ALTER TABLE `user_list`
  ADD PRIMARY KEY (`user_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `cart_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `p_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_list`
--
ALTER TABLE `user_list`
  MODIFY `user_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
