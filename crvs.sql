-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2016 at 01:17 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sixaxist_crvs`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `school_id`, `class_teacher_id`) VALUES
(1, 'Class Uttara 1', 1, 1),
(3, 'Class Mirpur 2', 1, 2),
(4, 'Class Gulshan 1', 2, 12),
(5, 'Class Gulshan 2', 2, 13),
(6, 'Class Uttara 3', 1, 1),
(7, 'Class Motizhil', 1, 18);

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
(1, 'Uttara School Test', '76567', '2016-01-23 10:33:10', '2016-01-19 08:13:57', 2, 4, 10, 1, 1),
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
  `student_ed_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_serial_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `student_sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_nationality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_nationality_other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_classCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PSC` int(2) DEFAULT NULL,
  `JSC` int(2) DEFAULT NULL,
  `SSC` int(2) DEFAULT NULL,
  `ibtadayi` int(2) DEFAULT NULL,
  `JDC` int(2) DEFAULT NULL,
  `dakhil` int(2) DEFAULT NULL,
  `student_religion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_relegion_other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_bloodbroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_spotmark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_disability_if` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_disability_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate` date DEFAULT NULL,
  `student_younger_brother_brn` int(17) DEFAULT NULL,
  `student_younger_brother_name_ban1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate1` date DEFAULT NULL,
  `student_younger_brother_brn1` int(17) DEFAULT NULL,
  `student_younger_brother_name_ban2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate2` date DEFAULT NULL,
  `student_younger_brother_brn2` int(17) DEFAULT NULL,
  `student_younger_brother_name_ban3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate3` date DEFAULT NULL,
  `student_younger_brother_brn3` int(17) DEFAULT NULL,
  `student_father_death_if` int(2) DEFAULT NULL,
  `student_mother_death_if` int(2) DEFAULT NULL,
  `healthform_formno` int(7) DEFAULT NULL,
  `healthform_helthID` int(12) DEFAULT NULL,
  `healthform_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_birthdate` date DEFAULT NULL,
  `healthform_birthplace` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_sex` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_birth_no` int(18) DEFAULT NULL,
  `healthform_religion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_moblie` int(11) DEFAULT NULL,
  `healthform_occupation` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_nidbrn` int(17) DEFAULT NULL,
  `healthform_maritual_cellno` int(11) DEFAULT NULL,
  `healthform_father_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_father_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_father_nidbrn` int(17) DEFAULT NULL,
  `healthform_father_death_date` date DEFAULT NULL,
  `healthform_mather_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_mather_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_mather_nidbrn` int(17) DEFAULT NULL,
  `healthform_mather_death_date` date DEFAULT NULL,
  `healthform_present_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_permanent_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_operator_nid` int(17) DEFAULT NULL,
  `healthform_operator_entrydate` date DEFAULT NULL,
  `healthform_biometric_nid` int(17) DEFAULT NULL,
  `healthform_biometric_entrydate` date DEFAULT NULL,
  `student_father_nid_have` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_father_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_father_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_father_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_father_deathdate` date DEFAULT NULL,
  `student_mother_nid_have` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_mother_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_mother_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_mother_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_mother_deathdate` date DEFAULT NULL,
  `student_legalgurdian_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_legalgurdian_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_legalgurdian_rel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_address_pres` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_address_parm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_operator_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_operator_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_operator_entrydate` date DEFAULT NULL,
  `student_biometric_nid` int(17) DEFAULT NULL,
  `student_biometric_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_biometric_entrydate` date DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_ed_id`, `form_serial_no`, `name`, `name_ban`, `name_eng`, `birth_no`, `birth_place`, `birth_date`, `student_sex`, `student_nationality`, `student_nationality_other`, `student_classCode`, `PSC`, `JSC`, `SSC`, `ibtadayi`, `JDC`, `dakhil`, `student_religion`, `student_relegion_other`, `student_bloodbroup`, `student_spotmark`, `student_disability_if`, `student_disability_code`, `student_younger_brother_name_ban`, `student_younger_brother_name_eng`, `student_younger_brother_borndate`, `student_younger_brother_brn`, `student_younger_brother_name_ban1`, `student_younger_brother_name_eng1`, `student_younger_brother_borndate1`, `student_younger_brother_brn1`, `student_younger_brother_name_ban2`, `student_younger_brother_name_eng2`, `student_younger_brother_borndate2`, `student_younger_brother_brn2`, `student_younger_brother_name_ban3`, `student_younger_brother_name_eng3`, `student_younger_brother_borndate3`, `student_younger_brother_brn3`, `student_father_death_if`, `student_mother_death_if`, `healthform_formno`, `healthform_helthID`, `healthform_name_eng`, `healthform_name_ban`, `healthform_birthdate`, `healthform_birthplace`, `healthform_sex`, `healthform_birth_no`, `healthform_religion`, `healthform_moblie`, `healthform_occupation`, `healthform_maritual_status`, `healthform_maritual_name_eng`, `healthform_maritual_name_ban`, `healthform_maritual_nidbrn`, `healthform_maritual_cellno`, `healthform_father_name_ban`, `healthform_father_name_eng`, `healthform_father_nidbrn`, `healthform_father_death_date`, `healthform_mather_name_ban`, `healthform_mather_name_eng`, `healthform_mather_nidbrn`, `healthform_mather_death_date`, `healthform_present_address`, `healthform_permanent_address`, `healthform_operator_nid`, `healthform_operator_entrydate`, `healthform_biometric_nid`, `healthform_biometric_entrydate`, `student_father_nid_have`, `student_father_nid`, `student_father_name_ban`, `student_father_name_eng`, `student_father_deathdate`, `student_mother_nid_have`, `student_mother_nid`, `student_mother_name_ban`, `student_mother_name_eng`, `student_mother_deathdate`, `student_legalgurdian_nid`, `student_legalgurdian_name_ban`, `student_legalgurdian_rel`, `student_address_pres`, `student_address_parm`, `student_operator_nid`, `student_operator_name_ban`, `student_operator_entrydate`, `student_biometric_nid`, `student_biometric_name_ban`, `student_biometric_entrydate`, `school_id`, `class_id`, `created`, `modified`) VALUES
(3, '445566332211', '10101110101010', 'shazzad', 'সাজ্জাদুর রহমান', 'SHAZZADUR RAHAMAN', '1245678', 'DK', '1988-05-01', 'পুরুষ', 'অন্যান্য', 'Canadian', '০৯', 1, 0, 1, 0, 0, 1, 'অন্যান্য', 'unknown religion', 'AB+', 'নাই', 'হ্যাঁ', '', 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 4027, 2147483647, 'Shazzadur Rahaman', 'সাজ্জাদুর রহমান', '2016-02-12', 'DK', 'পুরুষ', 2147483647, 'ইসলাম', 1741228971, 'Ra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'হ্যাঁ', '1234567987', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '2000-11-30', 'হ্যাঁ', '', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '0000-00-00', '১২৩৪৫৮৫৫৮৭৫৫২১', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', 'somthing address', '3015147785899', 'আবদুল মজিদ', '2016-01-26', NULL, NULL, NULL, 1, 1, '2016-01-24 17:39:25', '2016-02-29 08:48:52'),
(4, '1234567891011', '', 'shazzad test 1', '', '', '', '', '0000-00-00', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'ইসলাম', NULL, '', '', NULL, NULL, 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '2014-10-20', NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '1899-12-02', '১২৩৪৫৮৫৫৮৭৫৫২১', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', 'somthing address', '3015147785899', 'আবদুল মজিদ', '2016-01-26', NULL, NULL, NULL, 1, 1, '2016-01-24 17:39:25', '2016-02-03 10:09:38'),
(5, '1234567891011', '10101110101010', 'shazzad test 2\r\n', 'সাজ্জাদুর রহমান', 'shazzadur rahaman', '1245678', 'Uttara', '1988-05-01', 'পুরুষ', 'বাংলাদেশী', NULL, 'বি এস সি পাশ', NULL, NULL, NULL, NULL, NULL, NULL, 'ইসলাম', NULL, 'AB+', 'তেমন কিছু নাই', NULL, NULL, 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '2014-10-20', NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '1899-12-02', '১২৩৪৫৮৫৫৮৭৫৫২১', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', 'somthing address', '3015147785899', 'আবদুল মজিদ', '2016-01-26', NULL, NULL, NULL, 1, 1, '2016-01-24 17:39:25', '2016-02-01 06:13:53');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `nid`, `school_id`) VALUES
(12, 'Masud', NULL, 2),
(13, 'Masud', NULL, 2),
(14, 'Masud Cumilla 1', NULL, 5),
(15, 'Masud Cumilla 2', NULL, 5),
(16, 'Masud Mirpur 1', NULL, 3),
(17, 'Masud Mirpur 2', NULL, 3),
(22, 'teacher 1', NULL, 1),
(23, 'teacher 2', NULL, 1),
(24, 'teacher 3', NULL, 1),
(25, 'teacher 4', NULL, 1),
(26, 'teacher 5', NULL, 1),
(27, 'teacher 6', NULL, 1),
(28, 'teacher 7', NULL, 1),
(29, 'tea', NULL, 1);

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
