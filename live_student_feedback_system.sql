-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2023 at 10:12 AM
-- Server version: 5.7.40-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_feedback_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(100) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`) VALUES
(1, 'Raj shekar', 'admin', 'adminadminadmin', 'Active'),
(6, 'Akash sharma', 'akashsharma', '123456789', 'Active'),
(7, 'akashk', 'akashk', '123456789', 'Active'),
(9, 'Jyoti Wadmare', 'Jyoti Wadmare', 'jyoti@123', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` bigint(20) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `course_description` text NOT NULL,
  `course_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_title`, `course_description`, `course_status`) VALUES
(1, 'Computer Engineering', 'Computer Science', 'Active'),
(2, 'Information Technology', 'Information Technology', 'Active'),
(3, 'Electronics and Telecommunications', 'Electronics and Telecommunications', 'Active'),
(4, 'Artificial Intelligence and Data Science', 'Artificial Intelligence and Data Science', 'Active'),
(5, 'Electronics', 'Electronics', 'Active'),
(6, 'MTech in Artificial Intelligence', 'MTech in Artificial Intelligence', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` bigint(20) NOT NULL,
  `faculty_name` varchar(25) NOT NULL,
  `faculty_designation` varchar(30) NOT NULL,
  `faculty_img` varchar(300) NOT NULL,
  `faculty_profile` text NOT NULL,
  `faculty_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `faculty_designation`, `faculty_img`, `faculty_profile`, `faculty_status`) VALUES
(1, 'Prakash K', 'Lecturer', '285277618Tulips.jpg', 'He is experience lecturer', 'Active'),
(2, 'Raj', 'Lecturer', '206418318Koala.jpg', 'He is experience lecturer', 'Active'),
(3, 'Raj', 'Lecturer', '1823306781Jellyfish.jpg', 'He is experience lecturer', 'Active'),
(4, 'Balakrishna', 'Professor', '1495582553Penguins.jpg', 'Balakrishna is experience', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `feedbackquestion`
--

CREATE TABLE `feedbackquestion` (
  `feedbackquestionid` int(11) NOT NULL,
  `feedbacktopicid` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `option5` text,
  `option6` text,
  `option7` text,
  `option8` text,
  `option9` text,
  `option10` text,
  `question_type` varchar(25) NOT NULL,
  `img` varchar(300) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbackquestion`
--

INSERT INTO `feedbackquestion` (`feedbackquestionid`, `feedbacktopicid`, `question`, `option1`, `option2`, `option3`, `option4`, `option5`, `option6`, `option7`, `option8`, `option9`, `option10`, `question_type`, `img`, `status`) VALUES
(76, 47, 'Permanent Address', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1564152982', 'Active'),
(77, 47, 'Current Address', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1312631350', 'Active'),
(78, 47, 'City', '', '', '', '', '', '', '', '', '', '', 'Text Box', '969677933', 'Active'),
(79, 47, 'State', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1855285037', 'Active'),
(80, 47, 'Pincode', '', '', '', '', '', '', '', '', '', '', 'Text Box', '891051275', 'Active'),
(81, 47, 'Email (Other than somaiya email id)', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1237007480', 'Active'),
(82, 47, 'Facebook Account', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1936402043', 'Active'),
(83, 47, 'Twitter Handle', '', '', '', '', '', '', '', '', '', '', 'Text Box', '341163087', 'Active'),
(84, 47, 'Any other social networking identity', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1566631525', 'Active'),
(85, 47, 'Do you have any immediate plans to attend post graduate school? *', 'Yes', 'No', '', '', '', '', '', '', '', '', 'Radio Button', '1758152333', 'Active'),
(86, 47, 'If yes, where India / Abroad in which field?', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1495198650', 'Active'),
(87, 47, 'Have you placed through on campus /off campus?Give details.', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1287717549', 'Active'),
(88, 47, 'Company Name', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1935277087', 'Active'),
(89, 47, 'Package', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1042516322', 'Active'),
(90, 47, 'Do you have any startup? If yes, provide details.', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1094977162', 'Active'),
(91, 47, 'Did you get knowledge of fundamental of computers after completion of this program?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '46474271', 'Active'),
(92, 47, 'Are you able to interpret and analyze the data after the completion of this program?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '689262524', 'Active'),
(93, 47, 'Are you able to design a system, component or process to meet desired needs and analyze data / information effectively for making decision?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '592472198', 'Active'),
(94, 47, 'Did this program help in solving real world problems?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '2026254342', 'Active'),
(95, 47, 'Did you learn the use of Engineering tools and techniques through this program?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '1622939971', 'Active'),
(96, 47, 'Are you able to	understand the impact of Engineering solutions in a individual / societal context?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '1133606343', 'Active'),
(97, 47, 'Are you able to understand environment response to create sustainable solutions through this program?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '1311183100', 'Active'),
(98, 47, 'Does completion of this program help in	understanding of professional and ethical responsibility?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '1217048105', 'Active'),
(99, 47, 'Are you able to	function effectively as an individual and as a team member in multidisciplinary streams?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '2123662270', 'Active'),
(100, 47, 'After completion of this program, are you able to communicate effectively with the society?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '136872571', 'Active'),
(101, 47, 'Are you able to find optimal solutions for computer engineering problems through this course?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '1983898357', 'Active'),
(102, 47, 'Are you confident to upgrade professional carrier through continuous learning?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '329682304', 'Active'),
(103, 47, 'Are you able to apply the core concepts of computer engineering to develop effective solutions through this program?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '441966988', 'Active'),
(104, 47, 'Are you able to analyze, design and develop computer programs in order to efficiently build to computer-based systems of various levels of complexity?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '767680086', 'Active'),
(105, 47, 'Are you able to build feasible solutions using cutting edge technologies in computer engineering?', 'Extremely Confident', 'Confident', 'Not very confident', 'Not at all', '', '', '', '', '', '', 'Radio Button', '1203221460', 'Active'),
(106, 48, 'Permanent Address', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1467504104', 'Active'),
(107, 48, 'City', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1595540335', 'Active'),
(108, 48, 'State', '', '', '', '', '', '', '', '', '', '', 'Text Box', '90028504', 'Active'),
(109, 48, 'Pincode', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1790056790', 'Active'),
(110, 48, 'Current Address', '', '', '', '', '', '', '', '', '', '', 'Text Box', '690282311', 'Active'),
(111, 48, 'City', '', '', '', '', '', '', '', '', '', '', 'Text Box', '976754118', 'Active'),
(112, 48, 'State', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1272230068', 'Active'),
(113, 48, 'Pincode', '', '', '', '', '', '', '', '', '', '', 'Text Box', '569612227', 'Active'),
(114, 48, 'Email (Other than somaiya email id)', '', '', '', '', '', '', '', '', '', '', 'Text Box', '332323399', 'Active'),
(115, 48, 'LinkedIn Profile', '', '', '', '', '', '', '', '', '', '', 'Text Box', '2022954210', 'Active'),
(116, 48, 'Any other social Profile', '', '', '', '', '', '', '', '', '', '', 'Text Box', '88870765', 'Active'),
(117, 48, 'Do you have any immediate plans to attend graduate school?', 'Yes', 'No', '', '', '', '', '', '', '', '', 'Radio Button', '559640718', 'Active'),
(118, 48, 'If yes, where India / Abroad in which field?', '', '', '', '', '', '', '', '', '', '', 'Text Box', '140421762', 'Active'),
(119, 48, 'Have you accepted a permanent position? If Yes, Where?', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1224014685', 'Active'),
(120, 48, 'Ability to knowledge of mathematics, science and engineering', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '532626242', 'Active'),
(121, 48, 'Ability to identify, formulate, review research literature, and analyze complex engineering problems in the field of Electronics Engineering', 'Very confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '590810540', 'Active'),
(122, 48, 'Ability to design solutions for complex engineering problems and conduct experiments, and design system components or processes that meet the specified needs with appropriate consideration for the public health and safety, and the cultural, societal, and environmental considerations', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '297072494', 'Active'),
(123, 48, 'Ability to use research-based knowledge to design a system, component or process to meet desired needs.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '265911935', 'Active'),
(124, 48, 'Ability to create, select, and apply appropriate techniques, resources, and modern engineering and IT tools including prediction and modeling to complex engineering activities with an understanding of the limitations.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1772786977', 'Active'),
(125, 48, 'Apply reasoning informed by the contextual knowledge to assess societal, health, safety, legal and cultural issues and the consequent responsibilities relevant to the professional engineering practice.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1218404402', 'Active'),
(126, 48, 'Understand the impact of the professional engineering solutions in societal and environmental contexts, and demonstrate the knowledge of, and need for sustainable development.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1730889789', 'Active'),
(127, 48, 'Apply ethical principles and commit to professional ethics and responsibilities and norms of the engineering practice.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1801811687', 'Active'),
(128, 48, 'Function effectively as an individual, and as a member or leader in diverse teams, and in multidisciplinary settings', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '887392340', 'Active'),
(129, 48, 'Ability to comprehend and write effective reports and design documentation, make effective presentations, and give and receive clear instructions.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1759795423', 'Active'),
(130, 48, 'Demonstrate knowledge and understanding of the engineering and management principles and apply these to one "s own work, as a member and leader in a team, to manage projects and in multidisciplinary environments.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '12451015', 'Active'),
(131, 48, 'Recognize the need for, and have the preparation and ability to engage in independent and life-long learning in the broadest context of technological change.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '335029347', 'Active'),
(132, 48, 'Will be able to execute at least one of the following: (i) Apply standard software engineering practices in real-world project development to deliver efficient, secure and novel solution; (ii) Apply the contemporary trends in Information technology like Internet of Things and Data Science in diverse application areas.', 'Very confident ', 'Confident ', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Check Box', '1359353246', 'Active'),
(133, 49, 'Permanent Address', '', '', '', '', '', '', '', '', '', '', 'Text Box', '509913600', 'Active'),
(134, 49, 'Current Address', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1503719738', 'Active'),
(135, 49, 'City', '', '', '', '', '', '', '', '', '', '', 'Text Box', '293892410', 'Active'),
(136, 49, 'State', '', '', '', '', '', '', '', '', '', '', 'Text Box', '620313677', 'Active'),
(137, 49, 'Pincode', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1142630131', 'Active'),
(138, 49, 'Email Address (other than Somaiya email id)', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1871100207', 'Active'),
(139, 49, 'Facebook Account', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1541571727', 'Active'),
(140, 49, 'Twitter Handle', '', '', '', '', '', '', '', '', '', '', 'Text Box', '2116799946', 'Active'),
(141, 49, 'Any other social networking identity', '', '', '', '', '', '', '', '', '', '', 'Text Box', '129032661', 'Active'),
(143, 49, 'Do you have any immediate plans to attend post graduate school', 'Yes', 'No', '', '', '', '', '', '', '', '', 'Radio Button', '1681910978', 'Active'),
(144, 49, 'If yes, where India / Abroad in which field?', '', '', '', '', '', '', '', '', '', '', 'Text Box', '344358689', 'Active'),
(145, 49, 'Have you placed through on campus /off campus / ( give details ).', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1422595315', 'Active'),
(146, 49, 'Company Name', '', '', '', '', '', '', '', '', '', '', 'Text Box', '272949709', 'Active'),
(147, 49, 'Package', '', '', '', '', '', '', '', '', '', '', 'Text Box', '743063496', 'Active'),
(148, 49, 'Do you have any startup? If yes, provide details.', '', '', '', '', '', '', '', '', '', '', 'Text Box', '325379658', 'Active'),
(149, 49, 'Apply knowledge of the fundamental concepts of Electronics engineering to solve complex engineering problems', 'Very confident', 'Confident', 'Neutral', 'not so confident', 'not confident at all', '', '', '', '', '', 'Radio Button', '1984281621', 'Active'),
(150, 50, 'Registration Number', '', '', '', '', '', '', '', '', '', '', 'Text Box', '859146753', 'Active'),
(151, 50, 'Permanent Address (Complete Address with City, State, Pin)', '', '', '', '', '', '', '', '', '', '', 'Text Box', '2025230703', 'Active'),
(152, 50, 'Current Address (Complete Address with City, State, Pin)', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1525699570', 'Active'),
(153, 49, 'Analyze complex engineering problems in the area of electronics engineering using first principles', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '608593504', 'Active'),
(154, 50, 'Email (Other than Somaiya email id)', '', '', '', '', '', '', '', '', '', '', 'Text Box', '851306565', 'Active'),
(155, 50, 'LinkedIn profile', '', '', '', '', '', '', '', '', '', '', 'Text Box', '494838877', 'Active'),
(156, 50, 'Facebook account', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1540820159', 'Active'),
(157, 50, 'Twitter handle', '', '', '', '', '', '', '', '', '', '', 'Text Box', '439651806', 'Active'),
(158, 50, 'Any other social networking identity', '', '', '', '', '', '', '', '', '', '', 'Text Box', '461742482', 'Active'),
(159, 50, 'Do you have any immediate plans to attend graduate school?', 'Yes', 'No', '', '', '', '', '', '', '', '', 'Radio Button', '1271209243', 'Active'),
(160, 50, 'If yes, where India / abroad and in which field ?', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1214357821', 'Active'),
(161, 50, 'Have you accepted a permanent position? If yes, where?', '', '', '', '', '', '', '', '', '', '', 'Text Box', '344345748', 'Active'),
(162, 49, 'Design solutions for complex engineering problems and design system components or processes that meet specified needs with consideration for  public health and safety, and the cultural, societal, and environmental considerations.', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '2009358762', 'Active'),
(163, 50, 'Knowledge of the fundamental concepts of Electronics and Telecommunication Engineering.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '127833883', 'Active'),
(164, 49, 'Ability to design and conduct experiments, as well as make measurement and interpret data.', 'Very confident\r\n', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '2045101695', 'Active'),
(165, 50, 'Ability to identify, formulate, review research literature, and analyze complex engineering problems in the field of Electronics Telecommunication Engineering.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '2098534974', 'Active'),
(166, 50, 'Ability to design solutions for complex engineering problems and conduct experiments, and design system components or processes that meet the specified needs with appropriate consideration for the public health and safety, and the cultural, societal, and environmental considerations.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1649093374', 'Active'),
(167, 50, 'Ability to use research-based knowledge to design a system, component or process to meet desired needs.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1519394980', 'Active'),
(168, 49, 'Ability to identify, formulate and solve engineering problems and to apply domain specific modern engineering tools for design system.', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '780786081', 'Active'),
(169, 50, 'Ability to create, select, and apply appropriate techniques, resources, and modern engineering and IT tools including prediction and modeling to complex engineering activities with an understanding of the limitations.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '865135922', 'Active'),
(170, 49, 'Develop cost effective electronics / embedded product for societal need.', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '539532381', 'Active'),
(171, 50, 'Apply reasoning informed by the contextual knowledge to assess societal, health, safety, legal and cultural issues and the consequent responsibilities relevant to the professional engineering practice.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '83256562', 'Active'),
(172, 50, 'Understand the impact of the professional engineering solutions in societal and environmental contexts, and demonstrate the knowledge of, and need for sustainable development.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '302672195', 'Active'),
(173, 49, 'Understand the impact of engineering solutions in environmental context and to demonstrate knowledge of and need for sustainable development .', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '771117586', 'Active'),
(174, 50, 'Apply ethical principles and commit to professional ethics and responsibilities and norms of the engineering practice.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '509668578', 'Active'),
(175, 49, 'Understanding of professional and ethical responsibility.', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '1596214351', 'Active'),
(176, 50, 'Function effectively as an individual, and as a member or leader in diverse teams, and in multidisciplinary settings.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '2123662804', 'Active'),
(177, 50, 'Ability to comprehend and write effective reports and design documentation, make effective presentations, and give and receive clear instructions.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1211113322', 'Active'),
(178, 49, 'Ability to function in a multidisciplinary team.', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '1109854469', 'Active'),
(179, 50, 'Demonstrate knowledge and understanding of the engineering and management principles and apply these to one "s own work, as a member and leader in a team, to manage projects and in multidisciplinary environments.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '569900699', 'Active'),
(180, 49, 'Ability to communicate effectively on complex engineering activities with engineering community and society.', 'Very confident', 'Confident', 'Neutral', 'Not so confident', 'Not confident at all', '', '', '', '', '', 'Radio Button', '648486017', 'Active'),
(181, 50, 'Recognize the need for, and have the preparation and ability to engage in independent and life-long learning in the broadest context of technological change.', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '2052683172', 'Active'),
(182, 49, 'Recognition of the need for and ability to engage in  the life long learning.', 'Very confident', 'Confident', 'Neutral', 'Not so confident ', 'Not confident at all', '', '', '', '', '', 'Radio Button', '1619255187', 'Active'),
(183, 50, 'Will you be able to design cost effective solutions using VLSI/ Embedded technologies for societal use?', 'Very Confident', 'Confident', 'Not so confident', 'Not confident at all', '', '', '', '', '', '', 'Radio Button', '1840642206', 'Active'),
(184, 49, 'Ability to design hardware/software systems for automation and signal processing applications.', 'Very confident', 'Confident', 'Neutral', 'Not so confident ', 'Not confident at all', '', '', '', '', '', 'Radio Button', '627519175', 'Active'),
(185, 49, 'Ability to complete project within time and budget.', 'Very confident', 'Confident', 'Neutral', 'Not so confident ', 'Not confident at all', '', '', '', '', '', 'Radio Button', '910973195', 'Active'),
(186, 51, 'Rate KJSIT\'s curriculum innovation through exposure courses, skill based learning, activity based learning and technology based learning (SAT). (Highly Innovative, Industry-related, Lifelong Learning, Technology Orientation and Skill Orientation).', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '91744687', 'Active'),
(187, 51, 'Rate KJSIT\'s Project Based Learning courses - Mini, Minor, and Major Project development (Ethics and Communication Skills, Technology Orientation, Design and Development Skills, Environment and Sustainability Skills, Project Management and Financial Skills).', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '73395715', 'Active'),
(188, 51, 'Rate the progression of the courses (subjects) in the curriculum (Professional courses knowledge, Choice-based courses knowledge, STEM courses knowledge - Science, Technology, Engineering and Mathematics, Innovation courses knowledge, Multi-disciplinary exposure courses knowledge). ', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '1940414593', 'Active'),
(189, 51, 'How do you rate the offering of electives in terms of their relevance to specialized streams? (Highly-specialized, Domain-specific orientation, Choice-based orientation, Software and Service industry specific)', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '1819555568', 'Active'),
(190, 51, 'How do you rate the electives offered in relation to the technological advancements? (Highly-relevant, Recent emerging areas specific, Domain specific technology orientation - Security, Automation, E-currency, analytics, etc)', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '1614288140', 'Active'),
(191, 51, 'How do content of courses encourages extra learning / self-learning? (Highly-innovative, Lifelong learning, Society and Ethical learning, Modern tools and technology learning, Exposure - SAT learning)', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '645047316', 'Active'),
(192, 51, 'How subjects encourage practical components? (Real-life problem solving, Automation reducing human efforts, Modern tools and technology usage, Increased national/international interaction, Creating global technocrates)', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '1407567600', 'Active'),
(193, 51, 'How is curriculum oriented towards placement, startups, entrepreneurs and higher studies? (Highly encouraging, Decision making choice, Supportive)', '90% - 100%', '80% - 89%', '70% - 79%', '60% - 69%', '50% - 59%', '', '', '', '', '', 'Radio Button', '588977876', 'Active'),
(194, 51, 'Suggestions for improvement through gaps if any.', '', '', '', '', '', '', '', '', '', '', 'Text Box', '1948880645', 'Active'),
(196, 53, 'How much of the syllabus was covered in the class? ', '85 to 100% ', ' 70 to 84% ', '55 to 69%', '30 to 54%', 'Below 30%', '', '', '', '', '', 'Radio Button', '1865178477', 'Active'),
(197, 53, 'How well did the teachers prepare for the classes? ', 'Thoroughly\r\n', ' Satisfactorily ', ' Poorly', ' Indifferently', 'Won "t teach at all ', '', '', '', '', '', 'Radio Button', '1736452638', 'Active'),
(198, 53, 'How well were the teachers able to communicate? ', 'Always effective', 'Sometimes effective', 'Just satisfactorily', 'Generally ineffective', 'Very poor communication', '', '', '', '', '', 'Radio Button', '1352664786', 'Active'),
(199, 53, 'The teacher "s approach to teaching can best be described as', ' Excellent', ' Very good', ' Good', 'Fair', 'Poor ', '', '', '', '', '', 'Radio Button', '682128814', 'Active'),
(200, 53, 'Fairness of the internal evaluation process by the teachers.', 'Always fair', 'Usually fair', 'Sometimes unfair ', 'Usually unfair', 'Unfair', '', '', '', '', '', 'Radio Button', '2078530653', 'Active'),
(201, 53, 'Was your performance in assignments discussed with you?', ' Every time', 'Usually ', 'Occasionally/Sometimes', 'Rarely', ' Never ', '', '', '', '', '', 'Radio Button', '619648351', 'Active'),
(202, 53, 'The institute takes active interest in promoting internship, student exchange, field visit opportunities for students.', 'Regularly\r\n', 'Often', 'Sometimes', 'Rarely\r\n', 'Never', '', '', '', '', '', 'Radio Button', '281659201', 'Active'),
(203, 53, 'The teaching and mentoring process in your institution facilitates you in cognitive, social and emotional growth.', ' Significantly', ' Very well', ' Moderately', 'Marginally', 'Not at all', '', '', '', '', '', 'Radio Button', '2102885457', 'Active'),
(204, 53, 'The institution provides multiple opportunities to learn and grow. ', 'Strongly agree', 'Agree', ' Neutral', 'Disagree ', ' Strongly disagree', '', '', '', '', '', 'Radio Button', '937546534', 'Active'),
(205, 53, 'Teachers inform you about your expected competencies, course outcomes and programme outcomes.', 'Every time', 'Usually', ' Occasionally/Sometimes', 'Rarely ', ' Never ', '', '', '', '', '', 'Radio Button', '982592394', 'Active'),
(206, 53, 'Your mentor does a necessary follow-up with an assigned task to you.', 'Every time', 'Usually', ' Occasionally/Sometimes', 'Rarely ', 'I don\'t have a mentor', '', '', '', '', '', 'Radio Button', '1109626787', 'Active'),
(207, 53, 'The teachers illustrate the concepts through examples and applications.', 'Every time', 'Usually', ' Occasionally/Sometimes', 'Rarely', 'Never', '', '', '', '', '', 'Radio Button', '343646888', 'Active'),
(208, 53, 'The teachers identify your strengths and encourage you with providing right level of challenges. ', 'Fully', 'Reasonably ', 'Partially', 'Slightly ', 'Unable to', '', '', '', '', '', 'Radio Button', '130207868', 'Active'),
(209, 53, 'Teachers are able to identify your weaknesses and help you to overcome them.\r\n', 'Every time', 'Usually', ' Occasionally/Sometimes', 'Rarely ', ' Never ', '', '', '', '', '', 'Radio Button', '733460012', 'Active'),
(210, 53, 'The institution makes effort to engage students in the monitoring, review and continuous quality improvement of the teaching learning process.', 'Strongly agree', 'Agree', 'Neutral', 'Disagree', ' Strongly disagree', '', '', '', '', '', 'Radio Button', '827772150', 'Active'),
(211, 53, 'The institute/ teachers use student centric methods, such as experiential learning, participative learning and problem solving methodologies for enhancing learning experiences.', 'To a great extent ', 'Moderate ', ' Some what', 'Very little', 'Not at all', '', '', '', '', '', 'Radio Button', '2021603902', 'Active'),
(212, 53, 'Teachers encourage you to participate in extracurricular activities.', 'Strongly agree', 'Agree', 'Neutral', 'Disagree', ' Strongly disagree ', '', '', '', '', '', 'Radio Button', '1333434067', 'Active'),
(213, 53, 'Efforts are made by the institute/ teachers to inculcate soft skills, life skills and employability skills to make you ready for the world of work. ', 'To a great extent ', 'Moderate ', 'Some what ', 'Very little\r\n', 'Not at all', '', '', '', '', '', 'Radio Button', '5360960', 'Active'),
(214, 53, 'What percentage of teachers use ICT tools such as LCD projector, Multimedia, etc. while teaching. ', 'Above 90%', '70   89%', '50   69%\r\n', '30   49%', 'Below 29%\r\n', '', '', '', '', '', 'Radio Button', '1013075323', 'Active'),
(215, 53, ' The overall quality of teaching-learning process in your institute is very good.', 'Strongly agree', 'Agree', 'Neutral', 'Disagree\r\n', 'Strongly disagree', '', '', '', '', '', 'Radio Button', '1348447866', 'Active'),
(216, 53, 'Give three observation / suggestions to improve the overall teaching   learning experience in your institution.', '', '', '', '', '', '', '', '', '', '', 'Text Box', '483890554', 'Active'),
(217, 53, 'How will you rate the laboratory facilities available in the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '1940938072', 'Active'),
(218, 53, 'How will you rate the Internet facility available in the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '921782609', 'Active'),
(219, 53, 'How will you rate the library  facility and services available in the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '702488670', 'Active'),
(220, 53, 'How will you rate the sports  facility available in the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '739300126', 'Active'),
(221, 53, 'How will you rate the students common room  facility available in the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '391631161', 'Active'),
(222, 53, 'How will you rate the administrative services(students section, accounts, exam section)  provided by the Institute?', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '993466703', 'Active'),
(223, 53, 'How will you rate the mentoring (proctor) provided by the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '1049067723', 'Active'),
(224, 53, 'How will you rate the medical facilities (first aid box), counsellor  provided by the Institute?', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '1868078832', 'Active'),
(225, 53, ' How will you rate the cleanliness of the common areas  of the Institute?', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '1459536982', 'Active'),
(226, 53, 'How will you rate the cleanliness of the washroom of the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '602227329', 'Active'),
(227, 53, 'Is the sanitisation protocol for pandemic followed by the institute?', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '943460552', 'Active'),
(228, 53, 'How will you rate the drinking water facilities  of the Institute?', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '59972927', 'Active'),
(229, 53, 'How will you rate the canteen facilities  of the Institute?\r\n', 'Excellent', 'Very Good', 'Good', 'Fair', 'Poor', '', '', '', '', '', 'Radio Button', '1362856520', 'Active'),
(230, 53, ' Give suggestions regarding the facilities provided by Institute.\r\n', '', '', '', '', '', '', '', '', '', '', 'Text Box', '974288325', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `feedbackquestion_result`
--

CREATE TABLE `feedbackquestion_result` (
  `feedbackquestion_resultid` bigint(20) NOT NULL,
  `feedbacktopicid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `feedbackquestionid` bigint(20) NOT NULL,
  `selectedanswer` text NOT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacktopic`
--

CREATE TABLE `feedbacktopic` (
  `feedbacktopicid` int(11) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `faculty_id` bigint(20) NOT NULL,
  `feedback_topic` varchar(250) NOT NULL,
  `feedbacktopic_date` datetime NOT NULL,
  `feedback_icon` varchar(100) NOT NULL,
  `feedback_disptype` varchar(25) NOT NULL,
  `feedbacktopic_detail` text NOT NULL,
  `feedbacktopic_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacktopic`
--

INSERT INTO `feedbacktopic` (`feedbacktopicid`, `course_id`, `faculty_id`, `feedback_topic`, `feedbacktopic_date`, `feedback_icon`, `feedback_disptype`, `feedbacktopic_detail`, `feedbacktopic_status`) VALUES
(47, 1, 0, 'Program Exit Survey- Comps (To be filled by LY students)', '2023-04-22 08:13:40', '1813609566', 'One Page Viewer', 'This survey to be filled only by Last Year (LY) Students.\r\nPlease rate the level of confidence in your accomplishment of the following program outcome as they apply to the Computer engineering program.', 'Approved'),
(48, 2, 0, 'Program Exit Survey- IT (To be filled by LY students)', '2023-04-22 09:47:44', '92817647', 'One Page Viewer', 'This survey to be filled only by Last Year (LY) Students.\r\nPlease rate the level of confidence in your accomplishment of the following program outcomes as they apply to the Information Technology program.', 'Approved'),
(49, 5, 0, 'Program Exit Survey- ETRX (To be filled by LY students)', '2023-04-22 10:26:30', '1247598195', 'One Page Viewer', 'This survey to be filled only by Last Year (LY) Students. Please rate the level of confidence in your accomplishment of the following program outcomes / program specific outcomes as they apply to the electronics engineering program.', 'Approved'),
(50, 3, 0, 'Program Exit Survey- EXTC (To be filled by LY students)', '2023-04-22 10:44:29', '1465402908', 'One Page Viewer', 'This survey to be filled only by Last Year (LY) Students. Please rate the level of confidence in your accomplishment of the following program outcomes / program specific outcomes as they apply to the electronics and Telecommunications engineering program.', 'Approved'),
(51, 0, 0, 'Students Feedback on Curriculum', '2023-04-22 12:15:08', '150940308', 'One Page Viewer', 'On a scale of 1-5 please rate the feedback with respect to curriculum. ', 'Approved'),
(53, 0, 0, 'Student Satisfaction Survey (SSS)', '2023-04-22 19:00:26', '793249097', 'One Page Viewer', 'All questions should be compulsorily attempted. Each question has five responses, choose the most appropriate one.', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `ward_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `years_id` bigint(20) NOT NULL,
  `section` varchar(25) CHARACTER SET latin1 NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 NOT NULL,
  `pname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `pemail` varchar(50) CHARACTER SET latin1 NOT NULL,
  `pcontact` text CHARACTER SET latin1 NOT NULL,
  `companyname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `companyaddress` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`parent_id`, `ward_name`, `course_id`, `years_id`, `section`, `password`, `status`, `pname`, `pemail`, `pcontact`, `companyname`, `companyaddress`) VALUES
(0, '', 2, 0, 'A', 'KJSomaiya#6677', 'Pending', '', '', '', '', ''),
(1, '', 3, 0, 'f', '111111111', 'Active', '', 'radha@gmail.com', '', '', ''),
(2, '', 3, 0, 'f', '111111111', 'Active', '', '', '', '', ''),
(3, '', 2, 0, 'A', '111111111', 'Pending', '', '', '', '', ''),
(4, '', 2, 0, 'A', '111111111', 'Pending', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pfeedbackquestion`
--

CREATE TABLE `pfeedbackquestion` (
  `pfeedbackquestionid` int(11) NOT NULL,
  `pfeedbacktopicid` int(11) NOT NULL,
  `question` text CHARACTER SET latin1 NOT NULL,
  `option1` text CHARACTER SET latin1 NOT NULL,
  `option2` text CHARACTER SET latin1 NOT NULL,
  `option3` text CHARACTER SET latin1 NOT NULL,
  `option4` text CHARACTER SET latin1 NOT NULL,
  `option5` text CHARACTER SET latin1 NOT NULL,
  `option6` text CHARACTER SET latin1 NOT NULL,
  `option7` text CHARACTER SET latin1 NOT NULL,
  `option8` text CHARACTER SET latin1 NOT NULL,
  `option9` int(11) NOT NULL,
  `option10` text CHARACTER SET latin1 NOT NULL,
  `question_type` varchar(25) CHARACTER SET latin1 NOT NULL,
  `img` varchar(300) CHARACTER SET latin1 NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pfeedbackquestion_result`
--

CREATE TABLE `pfeedbackquestion_result` (
  `pfeedbackquestion_resultid` bigint(20) NOT NULL,
  `pfeedbacktopicid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `pfeedbackquestionid` bigint(20) NOT NULL,
  `selectedanswer` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pfeedbacktopic`
--

CREATE TABLE `pfeedbacktopic` (
  `pfeedbacktopicid` int(11) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `faculty_id` bigint(20) NOT NULL,
  `pfeedback_topic` varchar(250) CHARACTER SET latin1 NOT NULL,
  `pfeedbacktopic_date` datetime NOT NULL,
  `pfeedback_icon` varchar(100) CHARACTER SET latin1 NOT NULL,
  `pfeedback_distype` varchar(25) CHARACTER SET latin1 NOT NULL,
  `pfeedbacktopic_detail` text CHARACTER SET latin1 NOT NULL,
  `pfeedbacktopic_status` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `report`
-- (See below for the actual view)
--
CREATE TABLE `report` (
`studentname` varchar(50)
,`rollno` int(20)
,`course_title` varchar(50)
,`years_title` varchar(50)
,`section` varchar(25)
,`feedback_topic` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentid` int(10) NOT NULL,
  `studentname` varchar(50) NOT NULL,
  `rollno` int(20) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `course_id` int(25) NOT NULL,
  `section` varchar(25) NOT NULL,
  `dateofbirth` date NOT NULL,
  `student_no` text CHARACTER SET utf8 NOT NULL,
  `fathers_no` text NOT NULL,
  `mothers_no` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `academicyear` varchar(50) DEFAULT NULL,
  `years_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentid`, `studentname`, `rollno`, `email_id`, `password`, `course_id`, `section`, `dateofbirth`, `student_no`, `fathers_no`, `mothers_no`, `status`, `academicyear`, `years_id`) VALUES
(89, 'Kapil Bhatia', 11, 'kapil.bhatia@somaiya.edu', 'kapil', 1, 'A', '2003-12-10', '7710886248', '7710033822', '9137508822', 'Active', '2022-23', 2),
(90, 'Palak Desai', 21, 'palak.pd@somaiya.edu', 'palak', 1, 'A', '2003-10-25', '3333333333', '2222222222', '1111111111', 'Active', '2022-23', 2),
(91, 'Kartikeya Dangat', 19, 'kartikeya.dangat@somaiya.edu', 'kartikeya', 1, 'A', '2003-10-01', '3333333333', '2222222222', '1111111111', 'Active', '2022-23', 2),
(92, 'Dakshita Kolte', 55, 'd.kolte@somaiya.edu', 'dakshita', 1, 'A', '2002-10-31', '8454018221', '9833298643', '9167467902', 'Active', '2022-23', 2),
(99, 'Kushal ', 58, 'kushal.savla@somaiya.edu', 'ChatHub@1234', 1, 'A', '2001-02-04', '8454854632', '8454854632', '8454854632', 'Active', '2022-23', 4),
(100, 'ATHARVA MANGESH PATIL', 49, 'atharva24@somaiya.edu', 'Atharva@2406', 1, 'A', '2001-06-24', '9594224122', '9594224122', '9594224122', 'Active', '2022-23', 4),
(101, 'Vinit Jayesh Patel', 48, 'vinit.jp@somaiya.edu', 'vicky1234', 1, 'A', '2001-12-28', '9769505680', '8879544602', '7977307341', 'Active', '2022-23', 4),
(102, 'Divyam Bakulesh Prajapati ', 53, 'divyam.prajapati@somaiya.edu', 'divyam2001', 1, 'A', '2001-06-16', '7718052555', '7718052555', '7718052555', 'Active', '2022-23', 4),
(103, 'Shreyans Hiren Solanki', 65, 'shreyans.solanki@somaiya.edu', 'Shreyans@10026021', 1, 'A', '2001-06-12', '9324061204', '8454971958', '9702058152', 'Active', '2022-23', 4),
(104, 'Shruti Sambhaji Shinde', 62, 'sss22@somaiya.edu', 'NatashaRomanoff@32', 1, 'A', '2001-02-26', '9867960471', '9820280471', '9867780471', 'Active', '2022-23', 4),
(105, 'Bhavit shah ', 60, 'bhavit.s@somaiya.edu', 'Bkb@2003', 1, 'A', '2001-01-21', '9699817561', '98212 2977', '9870176707', 'Active', '2022-23', 4),
(106, 'Vidit Jayesh Shah', 39, 'vidit.s@somaiya.edu', 'Vidit#123', 1, 'B', '2001-12-01', '9604927888', '9604927888', '9604927888', 'Active', '2022-23', 4),
(107, 'Sarang Arvind Kulkarni ', 62, 'sarang.kulkarni@somaiya.edu', 'temppass123', 1, 'A', '2002-08-05', '9421062179', '9881074107', '9881074106', 'Active', '2022-23', 3),
(108, 'Yash Chauhan', 70, 'yash.vc@somaiya.edu', 'Y@$h_1402', 1, 'B', '2004-02-14', '9324374713', '8369055228', '8369489312', 'Active', '2022-23', 2),
(109, 'Aryan koul ', 23, 'aryan.koul@somaiya.edu', 'OSCARpet#271', 1, 'A', '2023-04-24', '8851391099', '9868368169', '8851391099', 'Active', '2022-23', 3),
(110, 'Akshata Ashok Machagar ', 60, 'akshata.machagar@somaiya.edu', 'Somaiya@60', 1, 'B', '2003-06-24', '8421484781', '7303975223', '9325043361', 'Active', '2022-23', 2),
(111, 'Shruti Vasa', 53, 'shruti.vasa@somaiya.edu', 'Shruti123', 1, 'B', '2003-01-07', '9320688814', '9930050855', '9987087844', 'Active', '2022-23', 2),
(112, 'Haider Shuaib Jawadwala', 67, 'haider.j@somaiya.edu', 'Hqider@786', 1, 'B', '2003-02-13', '9769529713', '9653294624', 'N/A', 'Active', '2022-23', 2),
(113, 'Jay Oza', 30, 'jay.oza@somaiya.edu', 'megavenasaur', 1, 'A', '2002-04-05', '7977560957', '9022312495', '9320742950', 'Active', '2022-23', 3),
(114, 'Hrishin Bhamre', 5, 'hrishin.bhamre@somaiya.edu', 'Password', 1, 'A', '2003-08-11', '9967276504', '9967276504', '9967276504', 'Active', '2022-23', 2),
(115, 'Naman Anil Dagade', 19, 'naman.dagade@somaiya.edu', 'Namandagade@1234', 1, 'B', '2001-11-16', '7208007082', '9324668711', '9619698711', 'Active', '2022-23', 3),
(116, 'Pranav Dhaygude ', 23, 'pranav.dhaygude@somaiya.edu', 'Dhaygude764$', 1, 'A', '2003-08-26', '7678003572', '8879299267', '8879469250', 'Active', '2022-23', 2),
(117, 'Trushil Vijay Dhokiya ', 24, 'trushil.d@somaiya.edu', 'Trushil', 1, 'A', '2003-10-26', '9892124325', '9967147987', '9619395009', 'Active', '2022-23', 2),
(118, 'Abizer Najmuddin Agarwala ', 66, 'abizer.a@somaiya.edu', 'Abizer@786', 1, 'B', '2003-08-26', '8433854119', '9323791955', '9320851110', 'Active', '2022-23', 2),
(119, 'Harsh Waghela', 55, 'waghela.h@somaiya.edu', 'HW882@comps', 1, 'B', '2002-08-08', '9167662701', '9987870757', '89804621', 'Active', '2022-23', 2),
(120, 'Jaykumar Ravindrakumar Wadia', 51, 'jaykumar.w@somaiya.edu', 'Nila@2005', 1, 'B', '2001-01-25', '9082171962', '9833461320', '9819409385', 'Active', '2022-23', 4),
(121, 'Nikita Sachin Dayma ', 8, 'nikita.dayma@somaiya.edu', 'nikita@15208', 1, 'A', '2001-07-06', '8010281348', '9579344333', '9405485318', 'Active', '2022-23', 3),
(122, 'PARTH RUPESH BARAIYA', 4, 'parth.baraiya@somaiya.edu', 'Parth@12345', 1, 'A', '2002-09-09', '9326272624', '8779356342', '9022833939', 'Active', '2022-23', 2),
(123, 'Abdul hamid abdul wahid shabana shaikh', 2147483647, 'abdulhamid09@somaiya.edu', 'Ammijaan@12', 4, 'B', '2003-07-09', '7304758948', '9819292846', '9870792846', 'Active', '2022-23', 2),
(124, 'Srujal Sakhala', 50, 'srujal.sakhala@somaiya.edu', 'Sss250303', 4, 'B', '2003-03-25', '9022765516', '9922265554', '9373905554', 'Active', '2022-23', 2),
(125, 'Kasam Mapara ', 63, 'kasam.mapara@somaiya.edu', '12May2019', 1, 'A', '2003-11-14', '9011986206', '8237559786', '8652679490', 'Active', '2022-23', 2),
(126, 'Shrinidhi Maheshwaran ', 60, 'shrinidhi.m@somaiya.edu', 'Shri@123', 1, 'A', '2004-07-08', '8657842294', '8657842294', '9930627859', 'Active', '2022-23', 2),
(127, 'Niramay Kolalle', 54, 'niramay.kolalle@somaiya.edu', 'Nirakjsieit@95', 1, 'A', '2003-09-02', '8080482629', '9850509250', '9518343056', 'Active', '2022-23', 2),
(128, 'Shivam Thakkar ', 11, 'skt@somaiya.edu', 'Sh!v@m552', 1, 'B', '2002-05-05', '9619451797', '9892210390', '9869435550', 'Active', '2022-23', 3),
(129, 'Falguni Sanjay Vaidya', 69, 'falguni.vaidya@somaiya.edu', 'Falguni@2001', 2, 'A', '2001-10-23', '8208601397', '9970390561', '9860230561', 'Active', '2022-23', 4),
(130, 'Smit ', 0, 'smit.sp@somaiya.edu', 'Ssp.201200@', 2, 'A', '2000-12-20', '9820177010', '9987998755', '9920600703', 'Active', '2022-23', 4),
(131, 'Rutuja Kurhade', 53, 'rutuja.kurhade@somaiya.edu', 'Rs865530@', 2, 'A', '2001-01-30', '8779727733', '9967056605', '8655302330', 'Active', '2022-23', 4),
(132, 'Parth Dhakan', 22, 'parth.dhakan@somaiya.edu', 'Parth@29', 2, 'A', '2001-06-29', '8779687022', '9833850105', '9930829695', 'Active', '2022-23', 0),
(133, 'Vedant Tamgadge', 17, 'vedant.tamgadge@somaiya.edu', 'RX2k*303SIET', 2, 'A', '2023-04-24', '9757365303', '9757365303', '9757365303', 'Active', '2022-23', 4),
(134, 'Vihaan Jasani', 49, 'vihaan.j@somaiya.edu', 'Sucker99!', 2, 'A', '2001-01-06', '9987774414', '9867215555', '9619610020', 'Active', '2022-23', 4),
(135, 'Shrutik Sanjay Mali', 36, 'shrutik.mali@somaiya.edu', 'Zcxcx123', 1, 'A', '2001-08-15', '9324846868', '9324905713', '9321412476', 'Active', '2022-23', 4),
(136, 'Sridhar S Menon', 38, 'sridhar.m@somaiya.edu', 'KJSom@2510', 1, 'A', '2001-10-25', '8369376288', '9004296814', '9323570458', 'Active', '2022-23', 4),
(137, 'Omkar Kareppa', 26, 'omkar.kareppa@somaiya.edu', 'OmkarK@123', 1, 'A', '2001-03-12', '7798660915', '7798660915', '7798660915', 'Active', '2022-23', 4),
(138, 'Jay Munjapara ', 40, 'jay.munjapara@somaiya.edu', 'Think2@Somaiya1', 1, 'A', '2001-10-25', '8655580290', '9322607843', '9029734030', 'Active', '2022-23', 4),
(139, 'Vaibhav  Ashar', 42, 'vaibhav.ashar@somaiya.edu', 'Vaibhav9901@', 2, 'A', '2001-09-09', '9028986080', '9373689839', '9270056610', 'Active', '2022-23', 4),
(140, 'Aarnav', 10, 'aarnav.m@somaiya.edu', 'Aarnav@2001', 2, 'A', '2001-11-07', '9167038718', '9820100952', '9820332539', 'Active', '2022-23', 4),
(141, 'Varad Jayant Sawant ', 59, 'varad.js@somaiya.edu', 'varad kjsieit', 1, 'A', '2001-05-22', '8850581051', '9920305839', '9768355274', 'Active', '2022-23', 4),
(142, 'Peetamber Pancharia', 13, 'peetamber.p@somaiya.edu', 'nehanitin', 2, 'B', '2001-11-12', '8369227667', '9833244579', '7020460440', 'Active', '2022-23', 4),
(143, 'Krithika Naidu', 41, 'krithika.n@somaiya.edu', 'k123456a', 1, 'A', '2001-11-05', '9702625064', '9702625064', '9703625064', 'Active', '2022-23', 4),
(144, 'Utkarsha Mokashi', 39, 'utkarsha.mokashi@somaiya.edu', '#Utkuroxx1', 1, 'A', '2001-10-19', '9819658691', '9819609816', '9819228691', 'Active', '2022-23', 4),
(145, 'Radhika Kolhekar', 31, 'radhika.kolhekar@somaiya.edu', 'rad2023', 1, 'A', '2001-05-15', '9820402834', '9867302834', '9920672834', 'Active', '2022-23', 4),
(147, 'Nimish Patil', 50, 'nimish.patil@somaiya.edu', 'HELIX@nebula1', 1, 'A', '2001-08-16', '7900086103', '8652417305', '7738958400', 'Active', '2022-23', 4),
(148, 'Ananya M Kura', 8, 'ananya.kura@somaiya.edu', 'Swimming1', 2, 'A', '2001-04-14', '9594914716', '9322593511', '9820283511', 'Active', '2022-23', 4),
(149, 'Ashwathy Pillai', 51, 'ashwathy.p@somaiya.edu', '7Sep@2001', 1, 'A', '2001-09-07', '9594650635', '7506576787', '9869369478', 'Active', '2022-23', 4),
(151, 'Vipul Mayekar', 11, 'vipul.m@somaiya.edu', 'gta5rocks', 2, 'A', '2001-10-17', '9820291063', '9820294063', '9653316995', 'Active', '2022-23', 4),
(152, 'Aditya Prashant Shirke', 37, 'aditya.shirke@somaiya.edu', 'AdityaS@2003', 1, 'B', '2003-05-08', '9029591140', '9004675109', '9004699705', 'Active', '2022-23', 2),
(153, 'Tanuj Vijay Chavan', 2, 'tanuj.chavan@somaiya.edu', 'tanuj1221', 2, 'A', '2000-05-03', '7249417317', '9960399578', '9960329960', 'Active', '2022-23', 4),
(154, 'Harsh Sawant', 6, 'harsh.sawant@somaiya.edu', 'Feedback#2807', 1, 'A', '2001-11-07', '9511600966', '9511600966', '9511600966', 'Active', '2022-23', 4),
(155, 'Rahul Sandeep Deshmukh', 4, 'rahul.sd@somaiya.edu', 'awesome211', 2, 'A', '2002-02-11', '8879566230', '9819893123', '9819883123', 'Active', '2022-23', 4),
(156, 'Ehlaam', 36, 'ehlaam.h@somaiya.edu', 'ashujaan1628', 2, '', '2001-09-28', '9969282851', '9820771331', '9833906661', 'Active', '2022-23', 4),
(157, 'Smit Patel', 61, 'smit10@somaiya.edu', 'smit1001', 2, 'A', '2000-01-10', '8976561231', '9820298254', '9820758754', 'Active', '2022-23', 4),
(158, 'Soham Shekhar Katdare', 68, 'soham.k@somaiya.edu', 'sohamk015', 1, 'B', '2003-07-15', '9372126391', '9869324343', '7977948072', 'Active', '2022-23', 2),
(159, 'Nidhi Bhikhalal Patel', 27, 'patel.nb@somaiya.edu', 'Nidhi#1604', 2, 'A', '2002-02-06', '9833369864', '9870330864', '8097425324', 'Active', '2022-23', 4),
(160, 'Shubham Shah', 37, 'shubham.shah4@somaiya.edu', '12345678', 1, 'B', '2002-01-17', '9987661990', '9833992754', '9833690640', 'Active', '2022-23', 4),
(161, 'Om Deepak Parab', 15, 'om.parab@somaiya.edu', 'Btmc@7550', 2, 'A', '2001-09-03', '8779984171', '8779746481', '9757183206', 'Active', '2022-23', 4),
(162, 'Deep Dhar', 22, 'deep.dhar@somaiya.edu', 'SRTHUp5@#', 1, 'A', '2001-11-05', '9821310566', '9702196767', '9819660875', 'Active', '2022-23', 2),
(163, 'Pragathi Sanjay Mahale ', 55, 'pragathi.m@somaiya.edu', 'student@06', 2, 'A', '2000-12-06', '9324025108', '9833975444', '9833690444', 'Active', '2022-23', 4),
(164, 'Parth Patil', 43, 'parth.patil2@somaiya.edu', '44678KJS@pp', 4, 'A', '2004-01-05', '8976244678', '8976244678', '.', 'Active', '2022-23', 2),
(165, 'Yudhir Hiren Gala', 3, 'yudhir.gala@somaiya.edu', '#Yudhir2354', 1, 'A', '2001-04-13', '9987417359', '9819923180', '9833002333', 'Active', '2022-23', 4),
(166, 'Piyush Prashant Kulkarni', 61, 'piyush.kulkarni@somaiya.edu', 'Piyush#2023', 1, 'A', '2002-10-20', '9834937811', '8788480291', '9422016226', 'Active', '2022-23', 3),
(167, 'Samyak Jasani', 55, 'samyak.jasani@somaiya.edu', 'feedbacksim', 1, 'A', '2002-06-28', '9969304171', '7506028924', '9820967698', 'Active', '2022-23', 3),
(168, 'Haq Nawaz Nizami', 59, 'haq.nizami@somaiya.edu', 'Jammu@123', 2, 'A', '2001-02-05', '6006146766', '9858551480', '9086028579', 'Active', '2022-23', 4),
(169, 'Shivam Oza', 12, 'shivam.oza@somaiya.edu', 'shivam7300', 2, 'A', '2000-03-07', '8452911984', '9987557471', '9326083944', 'Active', '2022-23', 4),
(170, 'Sakshi Sunil Awate', 43, 's.awate@somaiya.edu', 'Sakshi@3110', 2, 'A', '2001-10-31', '9594482689', '9082651891', '9969860084', 'Active', '2022-23', 4),
(171, 'BHAVYA UDAY SHAH', 64, 'bhavya.us@somaiya.edu', 'BHavyashah_7777', 2, 'A', '2001-01-22', '9082940157', '9819714736', '9082137823', 'Active', '2022-23', 0),
(172, 'Khilti Savla', 63, 'khilti.s@somaiya.edu', 'Khilti@30', 2, 'A', '2001-08-30', '8097124461', '8097727111', '7208789219', 'Active', '2022-23', 4),
(173, 'Samira Ibrahim Shaikh ', 66, 'samira.shaikh@somaiya.edu', 'sam182050', 2, 'A', '2000-11-18', '9819780028', '9619131121', '9920567965', 'Active', '2022-23', 4),
(174, 'Meet Chudasama ', 45, 'meet.sc@somaiya.edu', 'meetyug99@', 2, 'A', '2001-11-10', '9082785801', '9869325499', '9869570770', 'Active', '2022-23', 4),
(177, 'Jainam Varia', 51, 'jainam.kv@somaiya.edu', 'Jainam@100504', 1, 'B', '2004-05-10', '9594861662', '9594861662', '9594745851', 'Active', '2022-23', 2),
(178, 'Dhrumil Vora ', 19, 'dhrumil.vora@somaiya.edu', 'dmc1201@vora', 2, 'A', '2002-01-12', '8355907414', '9819044729', '9702153275', 'Active', '2022-23', 4),
(179, 'amit naresh mandaliya', 57, 'amit.nm@somaiya.edu', '123', 2, 'A', '2002-11-29', '8369950724', '9930727626', '9819014756', 'Active', '2022-23', 4),
(180, 'Jaydeep Tigaiya', 48, 'jaydeep.tigaiya@somaiya.edu', 'jaideep0508@', 1, 'B', '2001-08-05', '9920886965', '9920886965', '9920886965', 'Active', '2022-23', 4),
(181, 'Karan Hitesh Shethia', 31, 'karan.hs@somaiya.edu', 'Kshethia@1211', 2, 'A', '2001-09-12', '8369891199', '9987567132', '8369220611', 'Active', '2022-23', 4),
(182, 'Harshit Samir Sonawala', 68, 'harshit.sonawala@somaiya.edu', 'Hss@54321', 2, 'A', '2001-09-15', '9969981206', '9322510609', '9869044341', 'Active', '2022-23', 4),
(183, 'Muskaan Mahajan', 35, 'muskaan.mahajan@somaiya.edu', 'kohinoor555@', 1, 'A', '2001-06-26', '9987512677', '9833934840', '9870236161', 'Active', '2022-23', 4),
(184, 'Mayuresh vijay Nivatkar', 41, 'mayuresg.n@somaiya.edu', 'Mayur@2109', 2, 'A', '2001-09-21', '9987659828', '9989765982', '9757215577', 'Active', '2022-23', 4),
(185, 'Yadav Shobhit Laxmishankar', 75, 'shobhit.y@somaiya.edu', '9029Shobhit@', 3, 'B', '2002-01-02', '9819038221', '9833900982', '9029100982', 'Active', '2022-23', 4),
(186, 'Akshat LImbachiya', 54, 'a.limbachiya@somaiya.edu', 'Akshat369', 2, 'A', '2001-09-06', '9967631533', '9892523488', '7710929006', 'Active', '2022-23', 4),
(187, 'Ashutosh Suresh Somavanshi', 15, 'somavanshi.a@somaiya.edu', 'manisha9599', 3, 'B', '2000-08-10', '8169221102', '9619082606', '9324306820', 'Active', '2022-23', 4),
(190, 'Tirth Panchal', 69, 'tirth.bp@somaiya.edu', 'TbPaNcHaL@3132002', 1, 'A', '2002-03-31', '9137217326', '9820414113', '9137217326', 'Active', '2022-23', 3),
(191, 'Taksha Limbashia', 9, 'taksha.l@somaiya.edu', '987012@takK', 2, 'A', '2001-12-12', '9302326095', '9320326095', '9320326095', 'Active', '2022-23', 4),
(192, 'Adnan Kadiwala', 51, 'adnan.kadiwala@somaiya.edu', 'Adnan@123', 2, 'A', '2002-04-19', '9136863655', '8779718619', '9768958963', 'Active', '2022-23', 4),
(193, 'Mayuresh vijay Nivatkar', 41, 'mayuresh.n@somaiya.edu', 'Mayur@2109', 2, 'A', '2001-09-21', '9987659828', '9989765982', '9757215577', 'Active', '2022-23', 4),
(195, 'Swaraj Yogesh Dusane ', 29, 'swaraj.dusane@somaiya.edu', 'swaraj90', 1, 'A', '2003-10-11', '7039011011', '9320509009', '8080869009', 'Active', '2022-23', 2),
(200, 'Mihir Savla', 46, 'savla.mp@somaiya.edu', '12Ab%%34', 1, 'B', '2003-05-10', '9137934905', '9137934905', '9137934905', 'Active', '2022-23', 3),

-- --------------------------------------------------------

--
-- Table structure for table `studymaterial`
--

CREATE TABLE `studymaterial` (
  `studymaterial_id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `reply_studymaterial_id` int(11) NOT NULL,
  `studymaterial_title` varchar(150) NOT NULL,
  `studymaterial_date` datetime NOT NULL,
  `studymaterial_description` text NOT NULL,
  `attachments` varchar(300) NOT NULL,
  `studymaterial_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studymaterial`
--

INSERT INTO `studymaterial` (`studymaterial_id`, `categoryid`, `studentid`, `adminid`, `reply_studymaterial_id`, `studymaterial_title`, `studymaterial_date`, `studymaterial_description`, `attachments`, `studymaterial_status`) VALUES
(1046, 5, 7, 0, 0, 'Make the Best of Uncertain Times..', '2020-05-28 00:02:32', 'Researchers around the world are trying to make the best of unprecedented and uncertain times. Take advantage of Academia "s full suite of Premium productivity and analytics tools.', '1870702857IRJET-V5I3345.pdf', 'Approved'),
(1047, 0, 7, 0, 1046, '', '2020-05-28 00:02:21', 'hello', '1432978145', 'Student Reply'),
(1048, 5, 32, 0, 0, 'ligible for Ezoic Premium', '2020-05-28 00:05:44', 'The concept of Premium is simple you\'ll make more money. This invite-only program will increase your revenue by giving you access to advanced features. Check out the benefits.', '1997377856Trade Notice.pdf', 'Approved'),
(1049, 0, 32, 0, 1048, '', '2020-05-28 00:06:26', 'hello', '85792285', 'Student Reply'),
(1050, 0, 0, 1, 1048, '', '2020-05-28 00:06:47', 'Thanks for sharing', '1262331359php.jpg', 'Admin Reply'),
(1051, 8, 32, 0, 0, 'Is your site reachable for search engines and visitors?', '2020-05-28 00:08:37', 'If you have a site, you probably want to know whether your site is reachable for search engines and visitors. So, did you know that Yoast SEO provides a tool that monitors your site "s indexability? You can find it in the WordPress Site Health tool. It "s time to check if your site is indexable!', '1203339224Trade Notice.pdf', 'Approved'),
(1052, 21, 3, 0, 0, 'Get the free app for faster savings near you..', '2020-05-28 21:34:54', 'Like our email?\r\nWe value your feedback to continuously improve our products.', '352428222Trade Notice.pdf', 'Approved'),
(1054, 0, 3, 0, 1052, '', '2020-05-28 21:33:28', 'Hello', '1495034522', 'Student Reply'),
(1055, 0, 3, 0, 1052, '', '2020-05-28 21:33:38', 'Hello', '435979628', 'Student Reply'),
(1056, 0, 3, 0, 1052, '', '2020-05-28 21:34:23', 'This is my record', '1867521861php.jpg', 'Student Reply'),
(1057, 21, 0, 1, 0, '5 BULLET FRIDAY - NEWS & INFO THIS WEEK', '2020-05-28 22:02:08', 'How Food Publishers are Helping the Restaurant Industry & Teen Vogue\'s Virtual Prom', '293365719Trade Notice.pdf', 'Approved'),
(1058, 0, 0, 1, 1052, '', '2020-05-28 22:20:55', 'Hello', '539755597', 'Admin Reply'),
(1059, 0, 0, 1, 1052, '', '2020-05-28 22:21:08', 'et us leave no stone\r\nunturned & join hands to\r\nfight the pandemic', '174927695floppy.jpg', 'Admin Reply'),
(1060, 0, 0, 1, 1052, '', '2020-05-28 22:23:43', 'For any contribution or payment done on\r\nPaytm, we will contribute an extra up to   10', '1183159667', 'Admin Reply'),
(1061, 21, 2, 0, 0, 'aaa', '2020-06-11 13:58:09', 'cc', '1393401860header3.pdf', 'Approved'),
(1062, 22, 2, 0, 0, 'cc', '2020-06-11 13:58:34', 'dd', '1304699671My Account _ Manage your Billing.pdf', 'Approved'),
(1065, 21, 0, 1, 0, 'aaccdd', '2020-06-13 13:53:39', 'atest', '1462754123My Account _ Manage your Billing.pdf', 'Approved'),
(1066, 0, 0, 1, 1063, '', '2020-06-13 13:54:51', 'Th', '2121320726', 'Admin Reply'),
(1068, 0, 0, 1, 1067, '', '2020-06-13 14:11:46', 'sf', '677989781', 'Admin Reply'),
(1069, 0, 0, 1, 1067, '', '2020-06-13 14:13:09', 'aaa', '402197990', 'Admin Reply');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `years_id` bigint(20) NOT NULL,
  `years_title` varchar(50) NOT NULL,
  `years_description` text NOT NULL,
  `years_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`years_id`, `years_title`, `years_description`, `years_status`) VALUES
(1, 'FY', 'First Year', 'Active'),
(2, 'SY', 'Second Year', 'Active'),
(3, 'TY', 'Third Year', 'Active'),
(4, 'LY', 'Last Year', 'Active');

-- --------------------------------------------------------

--
-- Structure for view `report`
--
DROP TABLE IF EXISTS `report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report`  AS SELECT DISTINCT `student`.`studentname` AS `studentname`, `student`.`rollno` AS `rollno`, `course`.`course_title` AS `course_title`, `years`.`years_title` AS `years_title`, `student`.`section` AS `section`, `feedbacktopic`.`feedback_topic` AS `feedback_topic` FROM ((((`student` left join `feedbackquestion_result` on((`student`.`studentid` = `feedbackquestion_result`.`studentid`))) left join `feedbacktopic` on((`feedbacktopic`.`feedbacktopicid` = `feedbackquestion_result`.`feedbacktopicid`))) left join `course` on((`course`.`course_id` = `student`.`course_id`))) left join `years` on((`years`.`years_id` = `student`.`years_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `feedbackquestion`
--
ALTER TABLE `feedbackquestion`
  ADD PRIMARY KEY (`feedbackquestionid`);

--
-- Indexes for table `feedbackquestion_result`
--
ALTER TABLE `feedbackquestion_result`
  ADD PRIMARY KEY (`feedbackquestion_resultid`);

--
-- Indexes for table `feedbacktopic`
--
ALTER TABLE `feedbacktopic`
  ADD PRIMARY KEY (`feedbacktopicid`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `pfeedbackquestion`
--
ALTER TABLE `pfeedbackquestion`
  ADD PRIMARY KEY (`pfeedbackquestionid`);

--
-- Indexes for table `pfeedbackquestion_result`
--
ALTER TABLE `pfeedbackquestion_result`
  ADD PRIMARY KEY (`pfeedbackquestion_resultid`);

--
-- Indexes for table `pfeedbacktopic`
--
ALTER TABLE `pfeedbacktopic`
  ADD PRIMARY KEY (`pfeedbacktopicid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `rollno` (`email_id`),
  ADD KEY `years_id` (`years_id`);

--
-- Indexes for table `studymaterial`
--
ALTER TABLE `studymaterial`
  ADD PRIMARY KEY (`studymaterial_id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`years_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedbackquestion`
--
ALTER TABLE `feedbackquestion`
  MODIFY `feedbackquestionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `feedbackquestion_result`
--
ALTER TABLE `feedbackquestion_result`
  MODIFY `feedbackquestion_resultid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105413;

--
-- AUTO_INCREMENT for table `feedbacktopic`
--
ALTER TABLE `feedbacktopic`
  MODIFY `feedbacktopicid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1211;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
