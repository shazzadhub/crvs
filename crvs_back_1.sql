-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2016 at 01:27 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crvs`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `class_teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `school_id`, `class_teacher_id`) VALUES
(1, 'Class Uttara 1', 1, 1),
(3, 'Class Uttara 2', 1, 2),
(4, 'Class Gulshan 1', 2, 12),
(5, 'Class Gulshan 2', 2, 13),
(6, 'Class Uttara 3', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `parent_id`, `type_id`) VALUES
(1, 'Dhaka', NULL, 1),
(2, 'Cumilla', NULL, 1),
(3, 'Dhaka City', 1, 2),
(4, 'Cumilla City', 2, 2),
(5, 'Jamalpur', 1, 2),
(6, 'Tangail', 1, 2),
(7, 'Gulshan', 3, 3),
(8, 'Banani', 3, 3),
(9, 'Uttara', 3, 3),
(10, 'Cumilla Bus Stand', 4, 3),
(11, 'Cumilla Thana', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eiin` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `division` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `subdistrict` int(11) DEFAULT NULL,
  `school_type_id` int(11) DEFAULT NULL,
  `head_teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `eiin`, `created`, `modified`, `division`, `district`, `subdistrict`, `school_type_id`, `head_teacher_id`) VALUES
(1, 'Uttara School Test', '76567', '2016-01-23 10:33:10', '2016-01-19 08:13:57', 2, 4, 10, 1, 0),
(2, 'Gulshan School Test', '1234', '2016-01-22 21:04:02', '2016-01-20 12:19:18', 1, 5, 8, 3, NULL),
(3, 'Mirpur School', '3444', '2015-01-19 00:00:00', '2016-01-20 13:05:59', 2, 4, 10, 3, NULL),
(5, 'Cumilla College', '23432', '2016-01-24 09:57:47', '2016-01-23 10:24:41', 1, 3, 7, 1, NULL),
(6, 'Dhaka School', '98789', '2015-01-19 00:00:00', '2016-01-20 14:51:13', 2, 4, 11, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_types`
--

CREATE TABLE IF NOT EXISTS `school_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `school_types`
--

INSERT INTO `school_types` (`id`, `name`) VALUES
(1, 'College'),
(2, 'Madrasa'),
(3, 'School'),
(4, 'TT College'),
(5, 'Tech & Voc');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `form_serial_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `student_sex` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_nationality` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_classCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_religion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_sibling_count` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `student_bloodbroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_spotmark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_younger_brother_name_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_younger_brother_name_eng` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_younger_brother_borndate` date NOT NULL,
  `student_father_nid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_father_name_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_father_name_eng` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_father_borndate` date NOT NULL,
  `student_father_occu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_father_deathdate` date NOT NULL,
  `student_mother_nid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_mother_name_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_mother_name_eng` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_mother_borndate` date NOT NULL,
  `student_mother_occu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_mother_deathdate` date NOT NULL,
  `student_legalgurdian_nid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_legalgurdian_name_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_legalgurdian_rel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_address_pres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_address_parm` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_operator_nid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_operator_name_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_operator_entrydate` date NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `form_serial_no`, `name`, `name_ban`, `name_eng`, `birth_no`, `birth_place`, `birth_date`, `student_sex`, `student_nationality`, `student_classCode`, `student_religion`, `student_sibling_count`, `student_bloodbroup`, `student_spotmark`, `student_younger_brother_name_ban`, `student_younger_brother_name_eng`, `student_younger_brother_borndate`, `student_father_nid`, `student_father_name_ban`, `student_father_name_eng`, `student_father_borndate`, `student_father_occu`, `student_father_deathdate`, `student_mother_nid`, `student_mother_name_ban`, `student_mother_name_eng`, `student_mother_borndate`, `student_mother_occu`, `student_mother_deathdate`, `student_legalgurdian_nid`, `student_legalgurdian_name_ban`, `student_legalgurdian_rel`, `student_address_pres`, `student_address_parm`, `student_operator_nid`, `student_operator_name_ban`, `student_operator_entrydate`, `school_id`, `class_id`, `created`, `modified`) VALUES
(3, '1234567891011', '10101110101010', 'shazzad', 'সাজ্জাদুর রহমান', 'shazzadur rahaman', '1245678', 'Uttara', '1988-05-01', 'পুরুষ', 'বাংলাদেশী', 'বি এস সি পাশ', 'ইসলাম', '৩', 'AB+', 'তেমন কিছু নাই', 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '1945-07-15', 'Other', '2014-10-20', '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '1960-06-15', 'other', '1899-12-02', '১২৩৪৫৮৫৫৮৭৫৫২১', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', 'somthing address', '3015147785899', 'আবদুল মজিদ', '2016-01-26', 1, 1, '2016-01-24 17:39:25', '2016-01-26 11:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `nid`, `school_id`) VALUES
(1, 'Zodu', NULL, 1),
(2, 'Shojib', NULL, 1),
(12, 'Masud', NULL, 2),
(13, 'Masud', NULL, 2),
(14, 'Masud Cumilla 1', NULL, 5),
(15, 'Masud Cumilla 2', NULL, 5),
(16, 'Masud Mirpur 1', NULL, 3),
(17, 'Masud Mirpur 2', NULL, 3),
(18, 'Masud', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created`) VALUES
(2, 'masud', 'masud@kiteplexit.com', 'a8ccfb8652be6a517156d7387eca9b1d', '2016-01-19 11:20:32'),
(3, 'shazzad', 'shazzad@kiteplexit.com', '5c3cd4b50ac9fc5e1836859568d76a2d', '2016-01-25 06:57:41');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
