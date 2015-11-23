-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2015 at 11:23 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `library_software`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_author`
--

CREATE TABLE IF NOT EXISTS `tbl_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book`
--

CREATE TABLE IF NOT EXISTS `tbl_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `author` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `isbn` varchar(155) NOT NULL,
  `year` int(4) NOT NULL,
  `cat_id` varchar(100) NOT NULL,
  `author_id` int(11) NOT NULL,
  `shelf_id` int(11) NOT NULL,
  `written_lang` varchar(50) NOT NULL,
  `book_number` varchar(20) NOT NULL,
  `pages` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `cover_photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `tbl_book`
--

INSERT INTO `tbl_book` (`id`, `title`, `description`, `author`, `publisher`, `isbn`, `year`, `cat_id`, `author_id`, `shelf_id`, `written_lang`, `book_number`, `pages`, `stock`, `cover_photo`) VALUES
(3, 'Secure Development for Mobile Apps: How to Design and Code Secure Mobile Applications with PHP and JavaScript', 'asdfa', 'J. D. Glaser', 'Amazon', '23423dsf', 2014, '16,18', 0, 0, 'english', 'asdfasd', 222, 33, ''),
(4, 'MySQL Cookbook: Solutions for Database Developers and Administrators', NULL, 'Paul DuBois', 'Amazon', '', 20146, '0', 0, 0, '', '', 0, 0, ''),
(6, 'Head First PHP & MySQL (3rd Edition)', NULL, '', '', '', 0, '0', 0, 0, '', '', 0, 0, ''),
(7, 'Head First PHP & MySQL (4rd Edition)', 'sdfgs', 'sdfgsdfgsdfg', 'sdfg', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(9, 'my book', 'sdhfadsh', 'hskjldfhadslkfh', 'sdhfklajshd', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(11, 'abir', 'asdf', 'asdf', 'asdf', '32', 2015, '16', 0, 0, 'sdfsdf', '3', 1, 1, ''),
(12, 'Head First PHP & MySQL (33rd Edition)', 'lorem ipsum', 'mac', 'tomp', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(13, 'Head First PHP & MySQL (33rd Edition)', 'lorem ipsum', 'mac', 'tomp', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(14, 'Head First PHP & MySQL (33rd Edition)', 'adsfhsa', 'jhkjh', 'jkhfklj', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(15, 'Head First PHP & MySQL (4rrd Edition)', 'ewrqw', 'qwer', 'qwer', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(16, 'dsfg', 'dsfg', 'dsfg', 'sdfg', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(17, 'kjhgkjsh', 'kjfhdglkjh', 'kjhgl', 'gkjh', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(19, 'kshdfkj', 'hkjh', 'jhfkjh', 'hkjh', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(21, 'asdad', 'asd', 'asd', 'ssa', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(22, 'qwer', 'qwer', 'qwe', 'werq', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(24, 'sdfgd', 'sdfg', 'fdsgfsd', 'sdfg', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(25, 'sdfgd', 'sdfg', 'fdsgfsd', 'sdfg', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(26, 'mybok', 'tomta', 'dima', 'pro', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(29, 'abir', 'lkjg', 'kjg;l', 'dfg', '34', 32131, '11', 0, 0, 'sdffds', 'sdf', 1, 1, ''),
(30, 'sdfgd', 'jj', 'asdf', 'sdfg', '', 2015, '0', 0, 0, '', '', 0, 0, ''),
(31, 'sdfg', 'sdfg', 'sdfg', 'sdfg', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(32, 'sdfg', 'dfgqq', 'qwer', 'qwer', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(33, 'asdfs', 'sadf', 'asdf', 'asdf', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(34, 'sdfg', 'sdfg', 'dfsg', 'fdg', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(35, 'asfasf', 'retye', 'asdf', 'asdf', '', 20146, '0', 0, 0, '', '', 0, 0, ''),
(36, 'dsfg', 'sdfg', 'sdfg', 'dsfg', '', 34435, '0', 0, 0, '', '', 0, 0, ''),
(37, 'sgfd', 'sdfg', 'sdfg', 'sdfg', '', 3242, '0', 0, 0, '', '', 0, 0, ''),
(38, 'adslfas', 'lkj;lkj', 'fddsfa', 'asdfas', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(39, 'fasf', 'asf', 'asdf', 'fsdfs', '', 322, '0', 0, 0, '', '', 0, 0, ''),
(40, 'Head First PHP & MySQL (3rd Edition)-2', 'sadfads', 'mujo', 'Amazonh', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(41, 'sdfgsfd', 'sdfg', 'sdfg', 'sdfg', '', 2121, '0', 0, 0, '', '', 0, 0, ''),
(42, 'Head First PHP & MySQL (3rd Edition)', 'dsfg', 'sdfgsdf', 'sdfg', 'sdfg', 2121, '11', 0, 0, '', 'sdfgs', 33, 3, ''),
(43, 'jkjsljhdflk', 'sdfhd', 'fdh', 'dsdsg', '444', 343, '8', 0, 0, 'sdgs', '52532', 345, 4, ''),
(44, 'gsdahkj', 'kjhgkjhg', 'hjghkjg', 'hjgjkhg', '576576', 6677, '8', 0, 0, 'hkjhgh', '576576', 67, 6, ''),
(45, 'wetr', 'wert', 'ewrt', 'ewrt', 'dfgfd5345', 4543, '8,16', 0, 0, 'english', '3345', 44, 4, ''),
(46, 'sdfg', 'dfg', 'dfg', 'dfgfd', 'dfgdfg', 2015, '8', 0, 0, 'dfg', 'dfgfd', 44, 44, ''),
(47, 'lkdlkfgjkq', ';lkj;lk', 'lkjlkj', 'kljlkj', 'erter', 2121, '11,16,18', 0, 0, 'english', 'ertert', 44, 44, ''),
(48, 'asdlfhkh', 'ljkhlkj', 'kjhlkjh', 'kjhlkhj', 'asdfads', 2121, '8,11,16', 0, 0, 'asdfasd', 'asdfasd', 444, 44, ''),
(49, 'rrr', 'sdfdsf', 'eee', 'sdfsdf', '2313', 3222, '11,16,18', 0, 0, 'sdf', '23', 3, 2, ''),
(50, 'sdfs', 'sdfsd', 'dsfdf', 'dsfdsf', 'dfsdfs', 234532, '11', 0, 0, 'sdfsd', 'dsf3', 332, 23, ''),
(51, 'story book abir', 'dsfdsf', 'dsf', 'dsf', 'sfdsf', 3434, '8,11', 0, 0, 'sdfsdf', '344', 34, 34, ''),
(52, 'sdfdsfsd', 'dsfdsf', '234', '324', 'dsfsdf', 3432, '8,18', 0, 0, 'dsfdsf', '34', 34, 34, ''),
(53, 'dsfsdf', 'sdf', 'dsf', 'df', '34', 34, '16', 0, 0, 'dsf', '34', 34, 34, ''),
(54, 'dsfsd', 'sdf', '34', '32', '34', 23423, '16', 0, 0, 'sdf', '324', 34, 34, ''),
(55, 'sdfsdf', 'dsfdsf', '434', 'dfs', 'dsf', 324, '8', 0, 0, 'sdf', '23', 34, 34, ''),
(56, 'aaaa', 'aaaaa', '324', 'dfsdf', '234', 324, '16', 0, 0, 'sdf', '43', 34, 34, ''),
(57, 'dsf', 'dsf', '34', 'sdf', 'dsf', 34, '16', 0, 0, 'sdf', 'dsf', 34, 34, ''),
(58, 'asssaaa', 'eee', 'dsf34', '3r', '342', 34, '8', 0, 0, 'sfsd', '2', 3, 23, '_XktDTN5oMpEsndhEI7_tTHd3ClLhGUy.png'),
(59, 'dsfsd', 'dsf', 'dsf', 'dsfsdf', '234', 32, '8', 0, 0, 'sdfdf', '32', 234, 324, 'pnohZHtV58h0UYfxkG3YGSSXTQGpZQRe.png'),
(60, 'sdfs', 'sdf', 'dsf', 'dsf', '43', 324, '11', 0, 0, 'dsf', '32', 34, 34, 'GgBEOQbVlj-kpLpAlv3RIuy9QlesW6cp.png'),
(61, 'sdffdsf', 'dsf', 'dsf', 'dsf', '34', 32, '11', 0, 0, 'dsf', '34', 34, 34, 'jxEnN6xCHDr9n1xcHSBQICVJsiwRNlIn.png'),
(62, 'sdf', 'sdf', 'sdf', 'dfsd', '34', 23, '11', 0, 0, 'fs', '34', 34, 32, 'wVzBH-GHBuLshgIAMhL9p9EiRtxrGRQx.png'),
(63, 'sdfsdf', 'sdfd', 'dsf', 'dsf', '23', 324, '11', 0, 0, 'sdf', '324', 34, 34, 'Q5PE6LfmrR84BvqfDHeL0NiAQyIm71D4.png'),
(64, 'sdad', 'asdasd', 'sad', 'sad', '34', 32, '16', 0, 0, '34', '324', 34, 34, 'Snzxqx6YhLQHcWbc9H3jhIHEzUL04Mhy.png'),
(65, 'sdad', 'asdasd', 'sad', 'sad', '34', 32, '16', 0, 0, '34', '324', 34, 34, 'HJeqQWfdTA6IEF0lEZYkTld-uGTnO4-7.svg'),
(66, 'sdad', 'asdasd', 'sad', 'sad', '34', 32, '16', 0, 0, '34', '324', 34, 34, 'DNPBK7E4Mde0-P2L_SxnhWzr5oF4ruDJ.exe'),
(67, 'dsfdsf', 'sdfsdf', 'wer', '432', '34', 32, '8', 0, 0, 'sdfs', '32', 34, 34, 'muQf0rjhJNYpxcWbEvGzziOft-7sJ5ed.exe'),
(68, 'qwqwqw', 'sdfdf', 'dsf', 'dsfd', '4324', 234, '8', 0, 0, 'dsf', '324', 3, 43, 'ayxvZnLnvK2ViCbhk6s-5JOT-UqV-2G3.exe'),
(69, 'sdf', 'sdf', 'dsf', 'dsf', '234', 32, '8', 0, 0, 'dsf', '43', 34, 34, ''),
(70, 'erw', 'sdf', 'sdf', 'sdf', 'dfgdf', 43, '11', 0, 0, 'ert', '34', 3, 32, ''),
(71, 'erw', 'sdf', 'sdf', 'sdf', 'dfgdf', 43, '11', 0, 0, 'ert', '34', 3, 32, ''),
(72, 'erw', 'sdf', 'sdf', 'sdf', 'dfgdf', 43, '11', 0, 0, 'ert', '34', 3, 32, ''),
(73, 'erw', 'sdf', 'sdf', 'sdf', 'dfgdf', 43, '11', 0, 0, 'ert', '34', 3, 32, ''),
(74, 'erw', 'sdf', 'sdf', 'sdf', 'dfgdf', 43, '11', 0, 0, 'ert', '34', 3, 32, ''),
(75, 'erw', 'sdf', 'sdf', 'sdf', 'dfgdf', 43, '11', 0, 0, 'ert', '34', 3, 32, ''),
(76, 'erw', 'wqe', 'sdf', 'dsf', '34', 324, '18', 0, 0, 'sdf', '324', 2, 34, ''),
(77, 'sdfsdf', 'dfgsdfg', '34', 'sad', 'dfgdf', 43, '18', 0, 0, 'sdf', '324', 34, 32, ''),
(78, 'ssdfgsdf', 'fdsgsdfg', 'sad', 'sdfgf', 'dfgdf', 43, '11', 0, 0, 'fdsgfsd', '43', 3, 32, ''),
(79, 'sdfsdf', 'sdfgsdfg', 'sad', 'sad', '234', 43, '11', 0, 0, '34', '32', 234, 23, 'u3iM6QAOKxPDIQIq9h4hoXl29YgyMq7Y.png'),
(80, 'sdfg', 'dsfg', 'sdf', 'sad', 'dfgdf', 34, '11', 0, 0, 'dfs', '324', 3, 324, 'EAHLA0_tcfRE_58yrN_mxIj60cK2ixjn.png'),
(81, 'sdfg', 'sdfg', 'sdfg', 'sdf', 'dfgdf', 32423, '11', 0, 0, 'sdgsd', 'dfsgdfg', 3, 32, '2jLS7KDGGz3x0bEIbS5PBMqJP09vw4li.gif'),
(82, 'dsfdsf', 'dsfsdf', 'sdfsdf', 'sdfsdf', 'dsffds', 324242, '19', 0, 0, 'sdfdsf', 'sfsdf', 234324, 23, 'L_c11jS22RBIZCWgIBWnpTqoEORPVl6C.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookcategory`
--

CREATE TABLE IF NOT EXISTS `tbl_bookcategory` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(155) NOT NULL,
  `shelf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `tbl_bookcategory`
--

INSERT INTO `tbl_bookcategory` (`cat_id`, `cat_name`, `shelf_id`) VALUES
(8, 'sciencs455', 2),
(11, 'etity', 8),
(16, 'jaajj', 7),
(18, 'pool', 3),
(19, 'abiryyy', 3),
(20, 'ehgfhdfg', 55),
(22, 'dsfsd', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lend_book`
--

CREATE TABLE IF NOT EXISTS `tbl_lend_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lendingDate` date NOT NULL,
  `returningDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `tbl_lend_book`
--

INSERT INTO `tbl_lend_book` (`id`, `book_id`, `name`, `email`, `phone`, `address`, `lendingDate`, `returningDate`) VALUES
(28, 9, 'sdfdsfsdf', 'abrarshenan@gmail.com', '234324', 'sdfsdf', '2015-11-23', '1970-01-01'),
(29, 6, 'abuir', 'a@yahoo.com', '234234234', 'sdfsdfsdf', '2015-11-23', '1970-01-01'),
(30, 9, 'ruhul', 'abrarshena1@gmail.com', '234523', 'sfsdf', '2015-11-23', '2015-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shelf`
--

CREATE TABLE IF NOT EXISTS `tbl_shelf` (
  `shelf_id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_name` varchar(155) NOT NULL,
  PRIMARY KEY (`shelf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(1) NOT NULL DEFAULT '4',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `role`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demon', 4, 'u4qnlunMrSWqcyitTV06gH5C8ZlAaWar', '$2y$13$dN9ipH0Pc2zLBsDGfIkLOuZDvG0Lv5YACMWCAUIYeCHqNKfw3VbDa', NULL, 'demo@localhost.com', 10, 1428424049, 1428424049);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
