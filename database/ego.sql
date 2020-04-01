-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-03-31 05:54:40
-- 服务器版本： 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ego`
--

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `cid`) VALUES
(1, '家用电器', 1001),
(1, '手机/运营商/数码', 1002),
(1, '电脑/办公', 1003),
(1, '家具/家居', 1004),
(1001, '电视', 10001),
(1001, '空调', 10002),
(1001, '洗衣机', 10003),
(1001, '冰箱', 10004),
(1002, '手机通讯', 10001),
(1002, '运营商', 10002),
(1002, '摄影', 10003),
(1002, '摄像', 10004),
(1003, '电脑整机', 10001),
(1003, '电脑配件', 10002),
(1003, '外设产品', 10003),
(1003, '游戏设备', 10004),
(1004, '厨具', 10001),
(1004, '家纺', 10002),
(1004, '灯具', 10003),
(1004, '家具', 10004),
(10001, '超薄点视', 100001),
(10001, '全面屏点视', 100002);

-- --------------------------------------------------------

--
-- 表的结构 `content`
--

CREATE TABLE `content` (
  `id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `content`
--

INSERT INTO `content` (`id`, `name`, `pid`) VALUES
(1, '广告分类', 1001),
(1001, 'banner广告', 10001),
(1001, '直播代购', 10002),
(1001, '电子产品广告', 10003),
(10003, '小广告子元素', 44160),
(19412, '刚刚赚了很多钱', 89602);

-- --------------------------------------------------------

--
-- 表的结构 `contentinfo`
--

CREATE TABLE `contentinfo` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `contentinfo`
--

INSERT INTO `contentinfo` (`id`, `pid`, `name`, `url`, `image`) VALUES
(1, 10001, 'OPPO Watch', 'https://pro.jd.com/mall/active/tG3nBBhghqhfM69HoJw9ZoDaT7d/index.html?extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjg5YzRjMTUyLWUwZjktNGQ0OC05NDI4LTJhODQ4NWJjNTc1N1wiLFwibWF0ZXJpYWxfaWRcIjpcIjE4NTAxMDcyMjlcIixcInBvc19pZFwiOlwiNDI3MlwiLFwic2lkXCI6XCJmODcwZmM2MS1jYjc3LTQwN2UtOTM1ZC1jYzhlZTc0MTYyZTdcIn0ifQ==&jd_pop=89c4c152-e0f9-4d48-9428-2a8485bc5757&abt=1', '//img14.360buyimg.com/pop/s1180x940_jfs/t1/110562/14/10737/42247/5e81bb76E6fffa006/b3f703f750bd37ea.jpg.webp');

-- --------------------------------------------------------

--
-- 表的结构 `params`
--

CREATE TABLE `params` (
  `id` int(11) NOT NULL,
  `itemCatId` text NOT NULL,
  `paramData` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `params`
--

INSERT INTO `params` (`id`, `itemCatId`, `paramData`) VALUES
(10005, '10001', '[{"value":"品牌","children":[{"childValue":"戴尔","value":""},{"childValue":"宏碁","value":""},{"childValue":"mac","value":""},{"childValue":"小米","value":""}]},{"value":"内存","children":[{"value":"","childValue":"256"},{"childValue":"固态","value":""}]}]'),
(10007, '1001', '[{"value":"hello","children":[{"childValue":"wrodl","value":""}]}]'),
(10008, '1002', '[{"value":"主题","children":[{"childValue":"好看","value":""}]},{"value":"时么","children":[{"value":"","children":[],"childValue":"时的1"},{"childValue":"是的2","value":""}]}]');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` text NOT NULL,
  `sellPoint` text NOT NULL,
  `price` text NOT NULL,
  `cid` text NOT NULL,
  `num` text NOT NULL,
  `barcode` text NOT NULL,
  `status` text NOT NULL,
  `created` text NOT NULL,
  `updated` text NOT NULL,
  `descs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `title`, `image`, `sellPoint`, `price`, `cid`, `num`, `barcode`, `status`, `created`, `updated`, `descs`) VALUES
(10015, '三体-刘慈欣', '', '未来科幻', '99', '', '999', '', '', '', '', '<p>这是大刘的得意之作，连奥巴马都喜欢看！</p>'),
(10016, '流浪地球-刘慈欣', '', '已经拍成了电视剧', '22', '', '222', '', '', '', '', '<p>吴京主演的，感觉还可以的。厂面不错！</p>'),
(10028, '梦里花落知多少', '2.jpg', '小时代！！！', '11', '10001', '11', '', '', '', '', '<p>还不错，但是要看书籍，不要看电影</p>'),
(10031, '我与地坛', '', '做一个不动声色的人', '55', '', '464', '', '', '', '', '人生尔尔，错过了，就是一辈子'),
(10032, '舞！舞！舞！', '', '村上春树经典作品', '234', '43', '34', '', '', '', '', '人不是慢慢变老的，而是一瞬间变老的'),
(10033, '岁月神偷', '', '经典书籍', '23', '', '23', '', '', '', '', '我没有精力去认识一个新的人，或者花力气去宠福新维系一段感情，跟没办法在把自己的故事讲述一遍又一遍'),
(10035, '解忧杂货店', '', '无论现在有多么的不开心，你要相信明天会比今天更好', '34', '', '12', '', '', '', '', '<p>无论现在有多么的不开心，你要相信明天会比今天更好!!!!</p>'),
(10036, '挪威的森林', '', '村上春树经典作品，校园系列', '345', '45', '45', '', '', '', '', '哪里会有人喜欢孤独，只不过是不喜欢失望罢了'),
(10038, '小王子', '', '写给成年人的童话故事', '20', '', '1', '', '1', '', '', '所有人都曾是小孩，虽然之后少数人记得'),
(10039, '笑场', 'mock\\upload\\1585277506405-u=2137641711,889921437&fm=26&gp=0.jpg', '李诞的作品，很有意思，集成了扯经', '55', '100002', '1000', '', '1', '', '', '<p>未曾开言，我先笑场，笑过之后，听我来诉一诉衷肠</p>'),
(10040, '万历十五年', 'mock\\upload\\1585277681739-u=2137641711,889921437&fm=26&gp=0.jpg', '人民的名义里面出现过很多次', '45', '10002', '26', '', '1', '', '', '<p>在明朝当皇帝其实没那么幸福，比其清朝来说，还是清朝的皇帝牛逼，毕竟清朝才是更加牛逼的中央集权制</p>'),
(10041, '瓦尔登湖', 'mock\\upload\\1585277978775-u=2137641711,889921437&fm=26&gp=0.jpg', '非常优秀，值得阅读', '100', '', '100', '', '1', '', '', '<p>哲学类的书籍!!!</p>');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'iwen', '123'),
(2, 'sakura', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contentinfo`
--
ALTER TABLE `contentinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `contentinfo`
--
ALTER TABLE `contentinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `params`
--
ALTER TABLE `params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10009;
--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10042;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
