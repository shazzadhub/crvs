-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2016 at 03:35 PM
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
(1, 'Class Uttara 1', 1, 22),
(3, 'Class Mirpur 2', 1, 24),
(4, 'Class Gulshan 1', 2, 12),
(5, 'Class Gulshan 2', 2, 13),
(6, 'Class Uttara 3', 1, 26),
(7, 'Class Motizhil', 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `head_teachers`
--

CREATE TABLE IF NOT EXISTS `head_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ht_name` varchar(255) DEFAULT NULL,
  `ht_nid` varchar(255) DEFAULT NULL,
  `ht_mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `head_teachers`
--

INSERT INTO `head_teachers` (`id`, `ht_name`, `ht_nid`, `ht_mobile`) VALUES
(1, 'জুয়েল স্যার', '121344656', '1741228971'),
(2, 'মাসুদ ভাই', '12345678', '1741228971'),
(3, 'প্রধান শিক্ষক ১', '12345789', '1741228971'),
(4, 'প্রধান শিক্ষক ২', '123456789', '1741228971'),
(5, 'প্রধান শিক্ষক ৩', '123456789', '1741228971'),
(6, 'প্রধান শিক্ষক ৪', '123456789', '1741228971');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=128 ;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `parent_id`, `type_id`) VALUES
(1, 'ঢাকা', NULL, 1),
(2, 'ঢাকা', 1, 2),
(3, 'ফরিদপুর', 1, 2),
(4, 'গাজীপুর', 1, 2),
(5, 'গোপালগঞ্জ', 1, 2),
(6, 'কিশোরগঞ্জ', 1, 2),
(7, 'মাদারীপুর', 1, 2),
(8, 'মানিকগঞ্জ', 1, 2),
(9, 'মুন্সীগঞ্জ', 1, 2),
(10, 'নারায়ণগঞ্জ', 1, 2),
(11, 'নরসিংদী', 1, 2),
(12, 'খুলনা', NULL, 1),
(13, 'খুলনা', 12, 2),
(14, 'কুষ্টিয়া', 12, 2),
(15, 'মাগুরা', 12, 2),
(16, 'মেহেরপুর', 12, 2),
(17, 'নড়াইল', 12, 2),
(18, 'সাতক্ষিরা', 12, 2),
(19, 'বরিশাল', NULL, 1),
(20, 'বরগুনা', 19, 2),
(21, 'বরিশাল', 19, 2),
(22, 'ভোলা', 19, 2),
(23, 'ঝালকাঠি', 19, 2),
(24, 'পিরোজপুর', 19, 2),
(25, 'চট্টগ্রাম', NULL, 1),
(26, 'বান্দরবান', 25, 2),
(27, 'ব্রাহ্মণবাড়ীয়া', 25, 2),
(28, 'চাঁদপুর', 25, 2),
(29, 'চট্টগ্রাম', 25, 2),
(30, 'কুমিল্লা', 25, 2),
(31, 'ময়মনসিংহ', NULL, 1),
(32, 'ময়মনসিংহ', 31, 2),
(33, 'জামালপুর', 31, 2),
(34, 'নেত্রকোনা', 31, 2),
(35, 'শেরপুর', 31, 2),
(36, 'রাজশাহী', NULL, 1),
(37, 'রাজশাহী', 36, 2),
(38, 'বগুড়া', 36, 2),
(39, 'জয়পুরহাট', 36, 2),
(40, 'নওগাঁ', 36, 2),
(41, 'নাটোর', 36, 2),
(42, 'নওয়াবগঞ্জ', 36, 2),
(43, 'সিলেট', NULL, 1),
(44, 'সুনামগঞ্জ', 43, 2),
(45, 'হবিগঞ্জ', 43, 2),
(46, 'মৌলভীবাজার', 43, 2),
(47, 'সিলেট', 43, 2),
(48, 'ধামরাই', 2, 3),
(49, 'কেরানীগঞ্জ', 2, 3),
(50, 'সাভার', 2, 3),
(51, 'দোহার', 2, 3),
(52, 'নওয়াবগঞ্জ', 2, 3),
(53, 'উত্তরা', 2, 3),
(54, 'গাজীপুর সদর', 4, 3),
(55, 'শ্রীপুর', 4, 3),
(56, 'আলফাডাঙ্গা', 3, 3),
(57, 'ফরিদপুর সদর ', 3, 3),
(58, 'গোপালগঞ্জ সদর', 5, 3),
(59, 'কোটালিপাড়া', 5, 3),
(60, 'কিশোরগঞ্জ সদর', 6, 3),
(61, 'বাজিতপুর', 6, 3),
(62, 'মাদারীপুর সদর', 7, 3),
(63, 'কালকিনি ', 7, 3),
(64, 'মানিকগঞ্জ সদর', 8, 3),
(65, 'হরিরামপুর', 8, 3),
(66, 'মুন্সীগঞ্জ সদর', 9, 3),
(67, 'সিরাজদিখান', 9, 3),
(68, 'নারায়ানগঞ্জ সদর', 10, 3),
(69, 'রুপগঞ্জ', 10, 3),
(70, 'নরসিংদী সদর', 11, 3),
(71, 'মনহারদি', 11, 3),
(72, 'রূপসা', 13, 3),
(73, 'ডুমুরিয়া', 13, 3),
(74, 'কুষ্টিয়া সদর', 14, 3),
(75, 'কুমারখালি', 14, 3),
(76, 'মাগুরা সদর', 15, 3),
(77, 'শালিকা', 15, 3),
(78, 'মেহেরপুর সদর', 16, 3),
(79, 'মুজিবনগর', 16, 3),
(80, 'বরগুনা সদর', 20, 3),
(81, 'তালতলি', 20, 3),
(82, 'বরিশাল সদর', 21, 3),
(83, 'বানারিপারা', 21, 3),
(84, 'ভোলা সদর', 22, 3),
(85, 'দৌলতখান ', 22, 3),
(86, 'ঝালকাঠি সদর', 23, 3),
(87, 'নলচিতি', 23, 3),
(88, 'পিরোজপুর সদর', 24, 3),
(89, 'মঠবাড়িয়া', 24, 3),
(90, 'চিম্বুক', 26, 3),
(91, 'নীলাচল', 26, 3),
(92, 'ব্রাহ্মণবাড়ীয়া সদর', 27, 3),
(93, 'কসবা', 27, 3),
(94, 'চাঁদপুর সদর', 28, 3),
(95, 'হাজিগঞ্জ', 28, 3),
(96, 'রাউজান', 29, 3),
(97, 'সাতকানিয়া', 29, 3),
(98, 'কুমিল্লা সদর', 30, 3),
(99, 'লাকসাম', 30, 3),
(100, 'ময়মনসিংহ সদর', 32, 3),
(101, 'ত্রিশাল', 32, 3),
(102, 'জামালপুর সদর', 33, 3),
(103, 'বকশিগঞ্জ', 33, 3),
(104, 'নেত্রকোনা সদর', 34, 3),
(105, 'মদন', 34, 3),
(106, 'শেরপুর সদর', 35, 3),
(107, 'শ্রীবরদী', 35, 3),
(108, 'রাজশাহী সদর', 37, 3),
(109, 'বাঘা', 37, 3),
(110, 'বগুড়া সদর', 38, 3),
(111, 'আদমদিঘী', 38, 3),
(112, 'জয়পুরহাট সদর', 39, 3),
(113, 'কালাই', 39, 3),
(114, 'নওগাঁ সদর', 40, 3),
(115, 'আত্রাই', 40, 3),
(116, 'নাটোর সদর', 41, 3),
(117, 'গুরুদাসপুর ', 41, 3),
(118, 'নওয়াবগঞ্জ সদর', 42, 3),
(119, 'শিবগঞ্জ', 42, 3),
(120, 'সুনামগঞ্জ সদর', 44, 3),
(121, 'চতক', 44, 3),
(122, 'হবিগঞ্জ সদর', 45, 3),
(123, 'লক্ষ্মী', 45, 3),
(124, 'মৌলভীবাজার সদর', 46, 3),
(125, 'জুরি', 46, 3),
(126, 'সিলেট সদর', 47, 3),
(127, 'বালাগঞ্জ', 47, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `eiin`, `created`, `modified`, `division`, `district`, `subdistrict`, `school_type_id`, `head_teacher_id`) VALUES
(1, 'Uttara School Test', '76567', '2016-03-08 07:18:26', '2016-01-19 08:13:57', 2, 4, 10, 2, 1),
(2, 'Gulshan School Test', '1234', '2016-01-22 21:04:02', '2016-01-20 12:19:18', 1, 5, 8, 3, 1),
(3, 'Mirpur School', '3444', '2015-01-19 00:00:00', '2016-01-20 13:05:59', 2, 4, 10, 3, 1),
(5, 'Cumilla College', '23432', '2016-01-24 09:57:47', '2016-01-23 10:24:41', 1, 3, 7, 1, 1),
(6, 'Dhaka School', '98789', '2015-01-19 00:00:00', '2016-01-20 14:51:13', 2, 4, 11, 4, 1),
(7, 'রাজউক উত্তরা মডেল কলেজ', '1124', '2016-03-08 09:07:06', '2016-03-02 12:48:44', 1, 3, 9, 1, 5),
(8, 'বালাগঞ্জ প্রাথমিক বিদ্যালয়', '8878', '2016-03-08 11:47:53', '2016-03-08 10:47:53', 43, 47, 127, 3, 5);

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
(1, 'কলেজ'),
(2, 'মাদ্রাসা'),
(3, 'স্কুল'),
(4, 'টিচার্স ট্রেনিং কলেজ'),
(5, 'কারিগরি');

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
  `student_younger_brother_brn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_ban1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate1` date DEFAULT NULL,
  `student_younger_brother_brn1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_ban2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate2` date DEFAULT NULL,
  `student_younger_brother_brn2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_ban3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_name_eng3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_younger_brother_borndate3` date DEFAULT NULL,
  `student_younger_brother_brn3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_father_death_if` int(2) DEFAULT NULL,
  `student_mother_death_if` int(2) DEFAULT NULL,
  `healthform_formno` int(7) DEFAULT NULL,
  `healthform_helthID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_birthdate` date DEFAULT NULL,
  `healthform_birthplace` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_sex` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_birth_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_religion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_moblie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_occupation` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_nidbrn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_maritual_cellno` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_father_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_father_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_father_nidbrn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_father_death_date` date DEFAULT NULL,
  `healthform_mather_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_mather_name_eng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_mather_nidbrn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_mather_death_date` date DEFAULT NULL,
  `healthform_present_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_permanent_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_operator_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `healthform_operator_entrydate` date DEFAULT NULL,
  `healthform_biometric_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `student_address_pres_word` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_address_pres_upozilla` int(2) DEFAULT NULL,
  `student_address_pres_zilla` int(2) DEFAULT NULL,
  `student_address_pres_dist` int(1) DEFAULT NULL,
  `student_address_pres_postcode` int(4) DEFAULT NULL,
  `student_address_parm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_address_prmt_word` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_address_prmt_upozilla` int(2) DEFAULT NULL,
  `student_address_prmt_zilla` int(2) DEFAULT NULL,
  `student_address_prmt_dist` int(1) DEFAULT NULL,
  `student_address_prmt_postcode` int(4) DEFAULT NULL,
  `student_operator_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_operator_name_ban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_operator_entrydate` date DEFAULT NULL,
  `student_biometric_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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

INSERT INTO `students` (`id`, `student_ed_id`, `form_serial_no`, `name`, `name_ban`, `name_eng`, `birth_no`, `birth_place`, `birth_date`, `student_sex`, `student_nationality`, `student_nationality_other`, `student_classCode`, `PSC`, `JSC`, `SSC`, `ibtadayi`, `JDC`, `dakhil`, `student_religion`, `student_relegion_other`, `student_bloodbroup`, `student_spotmark`, `student_disability_if`, `student_disability_code`, `student_younger_brother_name_ban`, `student_younger_brother_name_eng`, `student_younger_brother_borndate`, `student_younger_brother_brn`, `student_younger_brother_name_ban1`, `student_younger_brother_name_eng1`, `student_younger_brother_borndate1`, `student_younger_brother_brn1`, `student_younger_brother_name_ban2`, `student_younger_brother_name_eng2`, `student_younger_brother_borndate2`, `student_younger_brother_brn2`, `student_younger_brother_name_ban3`, `student_younger_brother_name_eng3`, `student_younger_brother_borndate3`, `student_younger_brother_brn3`, `student_father_death_if`, `student_mother_death_if`, `healthform_formno`, `healthform_helthID`, `healthform_name_eng`, `healthform_name_ban`, `healthform_birthdate`, `healthform_birthplace`, `healthform_sex`, `healthform_birth_no`, `healthform_religion`, `healthform_moblie`, `healthform_occupation`, `healthform_maritual_status`, `healthform_maritual_name_eng`, `healthform_maritual_name_ban`, `healthform_maritual_nidbrn`, `healthform_maritual_cellno`, `healthform_father_name_ban`, `healthform_father_name_eng`, `healthform_father_nidbrn`, `healthform_father_death_date`, `healthform_mather_name_ban`, `healthform_mather_name_eng`, `healthform_mather_nidbrn`, `healthform_mather_death_date`, `healthform_present_address`, `healthform_permanent_address`, `healthform_operator_nid`, `healthform_operator_entrydate`, `healthform_biometric_nid`, `healthform_biometric_entrydate`, `student_father_nid_have`, `student_father_nid`, `student_father_name_ban`, `student_father_name_eng`, `student_father_deathdate`, `student_mother_nid_have`, `student_mother_nid`, `student_mother_name_ban`, `student_mother_name_eng`, `student_mother_deathdate`, `student_legalgurdian_nid`, `student_legalgurdian_name_ban`, `student_legalgurdian_rel`, `student_address_pres`, `student_address_pres_word`, `student_address_pres_upozilla`, `student_address_pres_zilla`, `student_address_pres_dist`, `student_address_pres_postcode`, `student_address_parm`, `student_address_prmt_word`, `student_address_prmt_upozilla`, `student_address_prmt_zilla`, `student_address_prmt_dist`, `student_address_prmt_postcode`, `student_operator_nid`, `student_operator_name_ban`, `student_operator_entrydate`, `student_biometric_nid`, `student_biometric_name_ban`, `student_biometric_entrydate`, `school_id`, `class_id`, `created`, `modified`) VALUES
(3, '445566332211', '10101110101010', 'shazzad', 'মুসা ভহাই', 'shazzadur rahaman', '1245678', 'DK', '1988-05-01', 'পুরুষ', 'অন্যান্য', 'Canadian', '০৯', 1, 0, 1, 0, 0, 1, 'অন্যান্য', 'unknown religion', 'AB+', 'নাই', 'হ্যাঁ', '', 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', '0', '', '', '2000-11-30', '0', '', '', '2000-11-30', '0', '', '', '2000-11-30', '0', 0, 0, 4027, '2147483647', 'Shazzadur Rahaman', 'সাজ্জাদুর রহমান', '2016-02-12', 'DK', 'পুরুষ', '2147483647', 'ইসলাম', '1741228971', 'Ra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'হ্যাঁ', '1234567987', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '2000-11-30', 'হ্যাঁ', '', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '2000-11-30', '', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', 'Dhaka', 1, 2, 3, 1230, 'somthing address', 'Dhaka', 1, 2, 3, 1230, '3015147785899', 'আবদুল মজিদ', '2016-01-26', '1321354657', 'bangla', '2016-03-25', 1, 1, '2016-01-24 17:39:25', '2016-03-01 12:48:54'),
(4, '1234567891011', '', 'shazzad test 1', '', '', '', '', '0000-00-00', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'ইসলাম', NULL, '', '', NULL, NULL, 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '2014-10-20', NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '1899-12-02', '১২৩৪৫৮৫৫৮৭৫৫২১', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', NULL, NULL, NULL, NULL, NULL, 'somthing address', NULL, NULL, NULL, NULL, NULL, '3015147785899', 'আবদুল মজিদ', '2016-01-26', NULL, NULL, NULL, 1, 1, '2016-01-24 17:39:25', '2016-02-03 10:09:38'),
(5, '1234567891011', '10101110101010', 'shazzad test 2\r\n', 'সাজ্জাদুর রহমান', 'shazzadur rahaman', '1245678', 'Uttara', '1988-05-01', 'পুরুষ', 'বাংলাদেশী', NULL, 'বি এস সি পাশ', NULL, NULL, NULL, NULL, NULL, NULL, 'ইসলাম', NULL, 'AB+', 'তেমন কিছু নাই', NULL, NULL, 'মঞ্জুরে হেলাল তুহিন', 'Manjurey Helal Tuhin', '1975-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'মোঃ মজিবুর রহমান', 'Md. Mozibur Rahman', '2014-10-20', NULL, '১২৩৪৫২২৫৪৪৫৭৯৮৫', 'হাওয়া রহমান', 'Mrs. Hawa Rahaman', '1899-12-02', '১২৩৪৫৮৫৫৮৭৫৫২১', 'মুস্তাফিজুর রহমান', 'ভাই/বোন', 'somthing address', NULL, NULL, NULL, NULL, NULL, 'somthing address', NULL, NULL, NULL, NULL, NULL, '3015147785899', 'আবদুল মজিদ', '2016-01-26', NULL, NULL, NULL, 1, 1, '2016-01-24 17:39:25', '2016-02-01 06:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_nid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `teacher_nid`, `teacher_email`, `school_id`) VALUES
(12, 'Masud', NULL, NULL, 2),
(13, 'Masud', NULL, NULL, 2),
(14, 'Masud Cumilla 1', '12346798', 'sha@gmail.com', 5),
(15, 'Masud Cumilla 2', NULL, NULL, 5),
(16, 'Masud Mirpur 1', NULL, NULL, 3),
(17, 'Masud Mirpur 2', NULL, NULL, 3),
(22, 'facebook', '12314679879876465', 'shawon05@yahoo.com', 1),
(23, 'teacher 2', '2147483647', 'shazzad@gmail.com', 1),
(24, 'teacher 3', NULL, NULL, 1),
(25, 'teacher 4', NULL, NULL, 1),
(26, 'teacher 5', NULL, NULL, 1),
(27, 'teacher 6', '1234987', 'sha@gmail.com', 1),
(28, 'teacher 7', '123456', 'sha@gmail.com', 1),
(29, 'tea', NULL, NULL, 1),
(30, 'মোঃ মনিরুল ইসলাম', NULL, NULL, 7),
(31, 'শাহরিয়ার ', NULL, NULL, 7),
(32, 'মইনুদ্দিন ম মাসুদ', NULL, NULL, 7),
(33, 'জুয়েল স্যার', NULL, NULL, 7),
(34, 'emailtestTeacher', '123456789', 'shazzadurrahaman@gmail.com', 1),
(35, 'shazzad', '123456789', 'testemail@gmail.com', 1),
(36, 'Roni Cumilla', '123456', 'roni@kiteplexit.com', 5);

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
