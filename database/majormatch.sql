-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 04:11 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `majormatch`
--

-- ---------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `course_name_ar` varchar(150) NOT NULL,
  `course_name_en` varchar(150) NOT NULL DEFAULT '',
  `credit_hours` tinyint(4) NOT NULL,
  `prerequisite` varchar(100) DEFAULT NULL,
  `is_sample` tinyint(1) NOT NULL DEFAULT 1,
  `course_type` varchar(30) NOT NULL DEFAULT 'required'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `major_id`, `level`, `course_code`, `course_name`, `course_name_ar`, `course_name_en`, `credit_hours`, `prerequisite`, `is_sample`, `course_type`) VALUES
(1, 1, 1, 'CSC105', 'مهارات الحاسب', '', '', 4, '', 0, 'required'),
(2, 1, 1, 'PHYS110', 'فيزياء(١)', 'فيزياء(١)', '', 2, '', 0, 'required'),
(3, 1, 1, 'PSYCH101', 'مهارات التفكير وأساليب التعلم', 'مهارات التفكير وأساليب التعلم', '', 2, '', 0, 'required'),
(4, 1, 1, 'STAT100', 'إحصاء', 'إحصاء', '', 2, '', 0, 'required'),
(5, 1, 5, 'COE223', 'عمارة الحاسب', 'عمارة الحاسب', '', 3, 'COE121', 0, 'required'),
(6, 1, 5, 'CS211', 'مفاهيم الخوارزميات', 'مفاهيم الخوارزميات', '', 3, 'CS181', 0, 'required'),
(7, 1, 5, 'CS213', 'مبادئ لغات البرمجة', 'مبادئ لغات البرمجة', '', 3, 'CS182', 0, 'required'),
(8, 1, 5, 'IC102', 'الإسلام وبناء المجتمع', 'الإسلام وبناء المجتمع', '', 2, 'IC101', 0, 'required'),
(9, 1, 5, 'MATH212', 'رياضيات محددة', 'رياضيات محددة', '', 3, 'MATH116', 0, 'required'),
(10, 1, 2, 'CSC111', 'برمجة الحاسب', 'برمجة الحاسب', '', 3, 'CSC105', 0, 'required'),
(11, 1, 2, 'ESP102', 'لغة إنجليزية لتخصصات الهندسة وعلوم الحاسب', 'لغة إنجليزية لتخصصات الهندسة وعلوم الحاسب', '', 2, '', 0, 'required'),
(12, 1, 2, 'MATH105', 'حساب التفاضل', 'حساب التفاضل', '', 3, '', 0, 'required'),
(13, 1, 2, 'PHYS115', 'فيزياء(٢)', 'فيزياء(٢)', '', 3, 'PHYS110', 0, 'required'),
(14, 1, 6, 'CS214', 'تراكيب البيانات', 'تراكيب البيانات', '', 3, 'MATH212', 0, 'required'),
(15, 1, 6, 'CS221', 'لغة التجميع', 'لغة التجميع', '', 3, 'COE223', 0, 'required'),
(16, 1, 6, 'CS222', 'نظام التشغيل', 'نظام التشغيل', '', 3, 'CS182', 0, 'required'),
(17, 1, 6, 'CS224', 'تصميم المترجمات', 'تصميم المترجمات', '', 3, 'CS213', 0, 'required'),
(18, 1, 6, 'IC103', 'النظام الإقتصادي في الإسلام', 'النظام الإقتصادي في الإسلام', '', 2, 'IC101', 0, 'required'),
(19, 1, 6, 'IT362', 'مهارات الإتصال وأخلاقيات المهنة', 'مهارات الإتصال وأخلاقيات المهنة', '', 2, '', 0, 'required'),
(20, 1, 3, 'ARAB101', 'المهارات اللغوية', 'المهارات اللغوية', '', 2, '', 0, 'required'),
(21, 1, 3, 'CS181', 'برمجة الحاسب(٢)', 'برمجة الحاسب(٢)', '', 3, 'CSC111', 0, 'required'),
(22, 1, 3, 'IT131', 'قواعد بيانات', 'قواعد بيانات', '', 3, 'CSC111', 0, 'required'),
(23, 1, 3, 'MATH115', 'حساب التكامل', 'حساب التكامل', '', 3, 'MATH105', 0, 'required'),
(24, 1, 3, 'PHYS116', 'فيزياء عامه(٣)', 'فيزياء عامه(٣)', '', 4, 'PHYS115', 0, 'required'),
(25, 1, 7, 'CS315', 'تحليل وتصميم الخوارزميات', 'تحليل وتصميم الخوارزميات', '', 3, 'CS211', 0, 'required'),
(26, 1, 7, 'CS341', 'الرسم بالحاسب', 'الرسم بالحاسب', '', 3, 'CS182', 0, 'required'),
(27, 1, 7, 'CS342', 'البرمجة المرئية', 'البرمجة المرئية', '', 3, 'CS182', 0, 'required'),
(28, 1, 7, 'MATH317', 'الطرق العددية', 'الطرق العددية', '', 3, 'MATH116', 0, 'required'),
(29, 1, 7, 'MATH329', 'بحوث العمليات', 'بحوث العمليات', '', 3, 'MATH116', 0, 'required'),
(30, 1, 4, 'ARAB103', 'التحرير العربي', 'التحرير العربي', '', 2, '', 0, 'required'),
(31, 1, 4, 'COE121', 'التصميم المنطقي', 'التصميم المنطقي', '', 3, 'COE122, CSC111', 0, 'required'),
(32, 1, 4, 'COE122', 'التصميم المنطقي(معمل)', 'التصميم المنطقي(معمل)', '', 1, 'COE121', 0, 'required'),
(33, 1, 4, 'CS182', 'برمجة الحاسب(٣)', 'برمجة الحاسب(٣)', '', 3, 'CS181', 0, 'required'),
(34, 1, 4, 'IC101', 'المدخل إلى الثقافة الإسلامية', 'المدخل إلى الثقافة الإسلامية', '', 2, '', 0, 'required'),
(35, 1, 4, 'MATH116', 'الجبر الخطي والحساب متعدد المتغيرات', 'الجبر الخطي والحساب متعدد المتغيرات', '', 3, 'MATH115', 0, 'required'),
(36, 1, 4, 'STAT126', 'الإحصاء والإحتمالات', 'الإحصاء والإحتمالات', '', 3, 'STAT100', 0, 'required'),
(37, 1, 8, 'COE351', 'شبكات الحاسب', 'شبكات الحاسب', '', 3, 'COE352, CS222', 0, 'required'),
(38, 1, 8, 'COE352', 'معمل شبكات الحاسب', 'معمل شبكات الحاسب', '', 1, 'COE351', 0, 'required'),
(39, 1, 8, 'CS348', 'تقنيات الأمثليات', 'تقنيات الأمثليات', '', 3, 'MATH329', 0, 'required'),
(40, 1, 8, 'CS361', 'النظم الموزعة والمعالجات المتوازية', 'النظم الموزعة والمعالجات المتوازية', '', 3, 'CS222', 0, 'major_elective'),
(41, 1, 8, 'CS431', 'النمذجة و المحاكاة', 'النمذجة و المحاكاة', '', 3, 'MATH329', 0, 'major_elective'),
(42, 1, 8, 'CS433', 'البيانات والمعلومات والمعرفة', 'البيانات والمعلومات والمعرفة', '', 3, 'MATH329', 0, 'major_elective'),
(43, 1, 8, 'CS434', 'المنطق في عدم التأكد', 'المنطق في عدم التأكد', '', 3, 'MATH329', 0, 'major_elective'),
(44, 1, 8, 'CS435', 'تعلم الآلة', 'تعلم الآلة', '', 3, 'MATH329', 0, 'major_elective'),
(45, 1, 8, 'CS452', 'التشفير', 'التشفير', '', 3, 'CS315', 0, 'major_elective'),
(46, 1, 8, 'CS453', 'عمارة وأمن النظام', 'عمارة وأمن النظام', '', 3, 'CS315', 0, 'major_elective'),
(47, 1, 8, 'CS484', 'تقنيات البرمجة المتقدمة', 'تقنيات البرمجة المتقدمة', '', 3, 'CS342', 0, 'major_elective'),
(48, 1, 8, 'CS485', 'البرمجة المنطقية', 'البرمجة المنطقية', '', 3, 'CS342', 0, 'major_elective'),
(49, 1, 8, 'CS492', 'موضوعات خاصة في علوم الحاسب(١)', 'موضوعات خاصة في علوم الحاسب(١)', '', 3, 'CS315', 0, 'major_elective'),
(50, 1, 8, 'CS493', 'موضوعات خاصة في علوم الحاسب(٢)', 'موضوعات خاصة في علوم الحاسب(٢)', '', 3, 'CS315', 0, 'major_elective'),
(51, 1, 8, 'CS383', 'هندسة البرمجيات', 'هندسة البرمجيات', '', 3, 'CS222', 0, 'required'),
(52, 1, 8, 'CS497', 'تدريب صيفي', 'تدريب صيفي', '', 1, '', 0, 'required'),
(53, 1, 8, 'MATH314', 'رياضيات محددة متقدمة', 'رياضيات محددة متقدمة', '', 3, 'MATH212', 0, 'required'),
(54, 1, 9, 'CS423', 'برمجة النظم', 'برمجة النظم', '', 3, 'CS224', 0, 'required'),
(55, 1, 9, 'CS451', 'مقدمة في أمن الحاسب', 'مقدمة في أمن الحاسب', '', 3, 'CS315', 0, 'required'),
(56, 1, 9, 'CS498', 'مشروع تخرج(١)', 'مشروع تخرج(١)', '', 2, '', 0, 'required'),
(57, 1, 10, 'CS432', 'الذكاء الاصطناعي', 'الذكاء الاصطناعي', '', 3, 'MATH329', 0, 'required'),
(58, 1, 10, 'CS471', 'تقنيات الويب', 'تقنيات الويب', '', 3, 'CS342', 0, 'required'),
(59, 1, 10, 'CS499', 'مشروع تخرج(٢)', 'مشروع تخرج(٢)', '', 3, 'CS498', 0, 'required'),
(60, 1, 10, 'IC104', 'أسس النظام السياسي في الإسلام', 'أسس النظام السياسي في الإسلام', '', 2, 'IC101', 0, 'required'),
(61, 1, 10, 'STAT327', 'استدلالي إحصائي(٢)', 'استدلالي إاحصائي(٢)', '', 3, 'STAT126', 0, 'free_elective'),
(62, 1, 10, 'CHEM101', 'كيمياء عامة(١)', 'كيمياء عامة(١)', '', 4, '', 0, 'free_elective'),
(63, 1, 10, 'CHEM111', 'كيمياء عامة', 'كيمياء عامة', '', 4, '', 0, 'free_elective'),
(64, 1, 10, 'COE361', 'تحليل الإشارات والنظم', 'تحليل الإشارات والنظم', '', 3, 'COE362, MATH218', 0, 'free_elective'),
(65, 1, 10, 'COE362', 'معمل تحليل الإشارات والنظم', 'معمل تحليل الإشارات والنظم', '', 1, 'COE361', 0, 'free_elective'),
(66, 1, 10, 'IT351', 'علم البيانات لإنترنت الاشياء', 'علم البيانات لإنترنت الاشياء', '', 3, '', 0, 'free_elective'),
(67, 1, 10, 'MATH204', 'حساب المتجهات', 'حساب المتجهات', '', 3, '', 0, 'required'),
(68, 1, 10, 'MATH218', 'المعادلات التفاصلية', 'المعادلات التفاصلية', '', 3, '', 0, 'free_elective'),
(69, 1, 10, 'MATH244', 'الجبر الخطي(٢)', 'الجبر الخطي(٢)', '', 3, 'MATH116', 0, 'free_elective'),
(70, 1, 10, 'MATH319', 'نظرية الترميز والتشفير', 'نظرية الترميز والتشفير', '', 3, '', 0, 'free_elective'),
(71, 1, 10, 'MATH326', 'الطرائق الرياضية', 'الطرائق الرياضية', '', 4, '', 0, 'free_elective'),
(72, 1, 10, 'MATH345', 'تطبيقات الجبر', 'تطبيقات الجبر', '', 3, '', 0, 'free_elective'),
(73, 1, 10, 'MATH351', 'التحليل العددي', 'التحليل العددي', '', 4, '', 0, 'free_elective'),
(74, 1, 10, 'MATH382', 'التحليل الحقيقي(١)', 'التحليل الحقيقي(١)', '', 4, '', 0, 'free_elective'),
(75, 1, 10, 'PHYS243', 'الديناميكا الحرارية', 'الديناميكا الحرارية', '', 3, '', 0, 'free_elective'),
(76, 1, 10, 'PHYS321', 'كهرومغناطيسية(٢)', 'كهرومغناطيسية(٢)', '', 3, '', 0, 'free_elective'),
(77, 1, 10, 'PHYS422', 'إلكترونيات', 'إلكترونيات', '', 4, '', 0, 'free_elective'),
(78, 2, 1, 'CSC105', 'مهارات الحاسب', 'مهارات الحاسب', '', 4, '', 0, 'required'),
(79, 2, 1, 'PHYS110', 'فيزياء(١)', 'فيزياء(١)', '', 2, '', 0, 'required'),
(80, 2, 1, 'PSYCH101', 'مهارات التفكير وأساليب التعلم', 'مهارات التفكير وأساليب التعلم', '', 2, '', 0, 'required'),
(81, 2, 1, 'STAT100', 'إحصاء', 'إحصاء', '', 2, '', 0, 'required'),
(82, 2, 5, 'CS211', 'مفاهيم الخوارزميات', 'مفاهيم الخوارزميات', '', 3, 'CS181', 0, 'required'),
(83, 2, 5, 'IC102', 'الإسلام وبناء المجتمع', 'الإسلام وبناء المجتمع', '', 2, 'IC101', 0, 'required'),
(84, 2, 5, 'IT214', 'البرمجة الشيئية(١)', 'البرمجة الشيئية(١)', '', 3, 'CS182', 0, 'required'),
(85, 2, 5, 'IT251', 'مبادئ تكنولوجيا المعلومات', 'مبادئ تكنولوجيا المعلومات', '', 3, '', 0, 'required'),
(86, 2, 5, 'IT271', 'تكنولوجيا الويب', 'تكنولوجيا الويب', '', 3, 'CS182', 0, 'required'),
(87, 2, 5, 'MATH212', 'رياضيات محددة', 'رياضيات محددة', '', 3, 'MATH116', 0, 'required'),
(88, 2, 2, 'CSC111', 'برمجة الحاسب', 'برمجة الحاسب', '', 3, 'CSC105', 0, 'required'),
(89, 2, 2, 'ESP102', 'لغة إنجليزية لتخصصات الهندسة وعلوم الحاسب', 'لغة إنجليزية لتخصصات الهندسة وعلوم الحاسب', '', 2, '', 0, 'required'),
(90, 2, 2, 'MATH105', 'حساب التفاضل', 'حساب التفاضل', '', 3, '', 0, 'required'),
(91, 2, 2, 'PHYS115', 'فيزياء(٢)', 'فيزياء(٢)', '', 3, 'PHYS110', 0, 'required'),
(92, 2, 6, 'CS214', 'تراكيب البيانات', 'تراكيب البيانات', '', 3, 'MATH212', 0, 'required'),
(93, 2, 6, 'CS222', 'نظام التشغيل', 'نظام التشغيل', '', 3, 'CS182', 0, 'required'),
(94, 2, 6, 'IC103', 'النظام الاقتصادي في الإسلام', 'النظام الاقتصادي في الإسلام', '', 2, 'IC101', 0, 'required'),
(95, 2, 6, 'IT221', 'سرية وتأمين المعلومات', 'سرية وتأمين المعلومات', '', 3, 'IT251', 0, 'required'),
(96, 2, 6, 'IT352', 'تحليل وتصميم نظم المعلومات', 'تحليل وتصميم نظم المعلومات', '', 3, 'IT251', 0, 'required'),
(97, 2, 3, 'ARAB101', 'المهارات اللغوية', 'المهارات اللغوية', '', 2, '', 0, 'required'),
(98, 2, 3, 'CS181', 'برمجة الحاسب(٢)', 'برمجة الحاسب(٢)', '', 3, 'CSC111', 0, 'required'),
(99, 2, 3, 'IT131', 'قواعد بيانات', 'قواعد بيانات', '', 3, 'CSC111', 0, 'required'),
(100, 2, 3, 'MATH115', 'حساب التكامل', 'حساب التكامل', '', 3, 'MATH105', 0, 'required'),
(101, 2, 3, 'PHYS116', 'فيزياء عامه(٣)', 'فيزياء عامه(٣)', '', 4, 'PHYS115', 0, 'required'),
(102, 2, 7, 'CS383', 'هندسة البرمجيات', 'هندسة البرمجيات', '', 3, 'CS222', 0, 'required'),
(103, 2, 7, 'IT215', 'اتصال الإنسان بالحاسب', 'اتصال الإنسان بالحاسب', '', 2, 'IT214', 0, 'required'),
(104, 2, 7, 'IT332', 'قواعد بيانات متقدمة', 'قواعد بيانات متقدمة', '', 4, 'IT131', 0, 'required'),
(105, 2, 7, 'IT361', 'نظام الإدارة والصيانة', 'نظام الإدارة والصيانة', '', 3, 'IT251', 0, 'required'),
(106, 2, 4, 'ARAB103', 'التحرير العربي', 'التحرير العربي', '', 2, '', 0, 'required'),
(107, 2, 4, 'COE121', 'التصميم المنطقي', 'التصميم المنطقي', '', 3, 'COE122, CSC111', 0, 'required'),
(108, 2, 4, 'COE122', 'التصميم المنطقي(معمل)', 'التصميم المنطقي(معمل)', '', 1, 'COE121', 0, 'required'),
(109, 2, 4, 'CS182', 'برمجة الحاسب(٣)', 'برمجة الحاسب(٣)', '', 3, 'CS181', 0, 'required'),
(110, 2, 4, 'IC101', 'المدخل إلى الثقافة الإسلامية', 'المدخل إلى الثقافة الإسلامية', '', 2, '', 0, 'required'),
(111, 2, 4, 'MATH116', 'الجبر الخطي والحساب متعدد المتغيرات', 'الجبر الخطي والحساب متعدد المتغيرات', '', 3, 'MATH115', 0, 'required'),
(112, 2, 4, 'STAT126', 'الإحصاء والإحتمالات', 'الإحصاء والإحتمالات', '', 3, 'STAT100', 0, 'required'),
(113, 2, 8, 'COE351', 'شبكات الحاسب', 'شبكات الحاسب', '', 3, 'COE352, CS222', 0, 'required'),
(114, 2, 8, 'COE352', 'معمل شبكات الحاسب', 'معمل شبكات الحاسب', '', 1, 'COE351', 0, 'required'),
(115, 2, 8, 'IT315', 'البرمجة الشيئية(٢)', 'البرمجة الشيئية(٢)', '', 3, 'IT214', 0, 'required'),
(116, 2, 8, 'IT342', 'الحوسبة السحابية والمتنقلة', 'الحوسبة السحابية والمتنقلة', '', 3, 'IT214', 0, 'required'),
(117, 2, 8, 'IT362', 'مهارات الإتصال وأخلاقيات المهنة', 'مهارات الإتصال وأخلاقيات المهنة', '', 2, '', 0, 'required'),
(118, 2, 8, 'IT372', 'تنقيب وتخزين البيانات', 'تنقيب وتخزين البيانات', '', 3, 'IT332', 0, 'required'),
(119, 2, 8, 'STAT327', 'استدلالي إحصائي(٢)', 'استدلالي إحصائي(٢)', '', 3, 'STAT126', 0, 'free_elective'),
(120, 2, 8, 'CHEM101', 'كيمياء عامة(١)', 'كيمياء عامة(١)', '', 4, '', 0, 'free_elective'),
(121, 2, 8, 'CHEM111', 'كيمياء عامة', 'كيمياء عامة', '', 4, '', 0, 'free_elective'),
(122, 2, 8, 'COE362', 'معمل تحليل الإشارات والنظم', 'معمل تحليل الإشارات والنظم', '', 1, 'COE361', 0, 'free_elective'),
(123, 2, 8, 'CS241', 'الرسم بالحاسب', 'الرسم بالحاسب', '', 3, '', 0, 'free_elective'),
(124, 2, 8, 'CS315', 'تحليل وتصميم الخوارزميات', 'تحليل وتصميم الخوارزميات', '', 3, 'CS211', 0, 'free_elective'),
(125, 2, 8, 'IT351', 'علم البيانات لإنترنت الاشياء', 'علم البيانات لإنترنت الاشياء', '', 3, 'IT332', 0, 'free_elective'),
(126, 2, 8, 'MATH218', 'المعادلات التفاضلية', 'المعادلات التفاضلية', '', 3, 'MATH116', 0, 'free_elective'),
(127, 2, 8, 'MATH244', 'الجبر الخطي(٢)', 'الجبر الخطي(٢)', '', 3, '', 0, 'free_elective'),
(128, 2, 8, 'MATH319', 'نظرية الترميز والتشفير', 'نظرية الترميز والتشفير', '', 3, 'MATH116', 0, 'free_elective'),
(129, 2, 8, 'MATH326', 'الطرائق الرياضية', 'الطرائق الرياضية', '', 4, '', 0, 'free_elective'),
(130, 2, 8, 'MATH329', 'بحوث العمليات', 'بحوث العمليات', '', 3, 'MATH116', 0, 'free_elective'),
(131, 2, 8, 'MATH345', 'تطبيقات الجبر', 'تطبيقات الجبر', '', 3, '', 0, 'free_elective'),
(132, 2, 8, 'MATH351', 'التحليل العددي', 'التحليل العددي', '', 4, '', 0, 'free_elective'),
(133, 2, 8, 'MATH382', 'التحليل الحقيقي(١)', 'التحليل الحقيقي(١)', '', 4, '', 0, 'free_elective'),
(134, 2, 8, 'PHYS211', 'الميكانيكا التقليدية(١)', 'الميكانيكا التقليدية(١)', '', 3, '', 0, 'free_elective'),
(135, 2, 8, 'PHYS243', 'الديناميكا الحرارية', 'الديناميكا الحرارية', '', 3, '', 0, 'free_elective'),
(136, 2, 8, 'PHYS422', 'إلكترونيات', 'إلكترونيات', '', 4, '', 0, 'free_elective'),
(137, 2, 8, 'PHYS221', 'كهرومغناطيسية(١)', 'كهرومغناطيسية(١)', '', 3, 'PHYS116', 0, 'free_elective'),
(138, 2, 8, 'IT497', 'تدريب صيفي', 'تدريب صيفي', '', 1, 'IT352', 0, 'required'),
(139, 2, 9, 'IT473', 'نظم التجارة الالكترونية', 'نظم التجارة الالكترونية', '', 3, 'IT352', 0, 'required'),
(140, 2, 9, 'IT498', 'مشروع تخرج(١)', 'مشروع تخرج(١)', '', 2, '', 0, 'required'),
(141, 2, 10, 'IC104', 'أسس النظام السياسي في الإسلام', 'أسس النظام السياسي في الإسلام', '', 2, 'IC101', 0, 'required'),
(142, 2, 10, 'IT435', 'نظم دعم القرار', 'نظم دعم القرار', '', 3, 'IT332', 0, 'required'),
(143, 2, 10, 'IT499', 'مشروع تخرج(٢)', 'مشروع تخرج(٢)', '', 3, 'IT498', 0, 'required'),
(144, 2, 10, 'IT424', 'تطبيقات الأنظمة المبنية على المعرفة', 'تطبيقات الأنظمة المبنية على المعرفة', '', 3, 'IT251', 0, 'major_elective'),
(145, 2, 10, 'IT425', 'نظم المعلومات الجغرافية', 'نظم المعلومات الجغرافية', '', 3, 'IT352', 0, 'major_elective'),
(146, 2, 10, 'IT433', 'قاعدة البيانات الكائنية الموزعة', 'قاعدة البيانات الكائنية الموزعة', '', 3, 'IT332', 0, 'major_elective'),
(147, 2, 10, 'IT434', 'تقنية الويب المتقدمة', 'تقنية الويب المتقدمة', '', 3, 'IT271', 0, 'major_elective'),
(148, 2, 10, 'IT442', 'الشبكات اللاسلكية وشبكات بيانات المحمول', 'الشبكات اللاسلكية وشبكات بيانات المحمول', '', 3, 'COE351', 0, 'major_elective'),
(149, 2, 10, 'IT443', 'ضغط بيانات الوسائط المتعددة', 'ضغط بيانات الوسائط المتعددة', '', 3, 'IT214', 0, 'major_elective'),
(150, 2, 10, 'IT462', 'إدارة الشبكات وقواعد البيانات', 'إدارة الشبكات وقواعد البيانات', '', 3, 'COE351, IT332', 0, 'major_elective'),
(151, 2, 10, 'IT463', 'النظم الموزعة والمتوازية', 'النظم الموزعة والمتوازية', '', 3, 'IT352', 0, 'major_elective'),
(152, 2, 10, 'IT474', 'تحليل البيانات الضخمة', 'تحليل البيانات الضخمة', '', 3, 'IT332', 0, 'major_elective'),
(153, 2, 10, 'IT475', 'توجيه بيانات الويب', 'توجيه بيانات الويب', '', 3, 'IT271', 0, 'major_elective'),
(154, 2, 10, 'IT491', 'مواضيع مختارة في تقنية المعلومات(١)', 'مواضيع مختارة في تقنية المعلومات(١)', '', 3, 'IT332', 0, 'major_elective'),
(155, 2, 10, 'IT492', 'مواضيع مختارة في تقنية المعلومات(٢)', 'مواضيع مختارة في تقنية المعلومات(٢)', '', 3, 'IT372', 0, 'major_elective'),
(156, 2, 10, 'COE361', 'تحليل الإشارات والنظم', 'تحليل الإشارات والنظم', '', 3, 'MATH218', 0, 'free_elective'),
(157, 2, 10, 'CS451', 'مقدمة في أمن الحاسب', 'مقدمة في أمن الحاسب', '', 3, 'CS315', 0, 'free_elective'),
(158, 2, 10, 'PHYS321', 'كهرومغناطيسية(٢)', 'كهرومغناطيسية(٢)', '', 3, 'PHYS221', 0, 'free_elective'),
(159, 4, 4, 'IC101', 'المدخل إلى الثقافة الإسلامية', 'المدخل إلى الثقافة الإسلامية', '', 2, '', 0, 'required'),
(160, 4, 4, 'IT131', 'قواعد بيانات', 'قواعد بيانات', '', 3, 'CSC111', 0, 'required'),
(161, 4, 4, 'MATH116', 'الجبر الخطي والحساب متعدد المتغيرات', 'الجبر الخطي والحساب متعدد المتغيرات', '', 3, 'MATH115', 0, 'required'),
(162, 4, 1, 'CSC105', 'مهارات الحاسب', 'مهارات الحاسب', '', 4, '', 0, 'required'),
(163, 4, 1, 'ENG0011', 'اللغة الإنجليزية تحضيري(١)', 'لغة الإنجليزية تحضيري(١)', '', 8, '', 0, 'required'),
(164, 4, 1, 'PHYS110', 'فيزياء(١)', 'فيزياء(١)', '', 2, '', 0, 'required'),
(165, 4, 1, 'PSYCH101', 'مهارات التفكير وأساليب التعلم', 'مهارات التفكير وأساليب التعلم', '', 2, '', 0, 'required'),
(166, 4, 1, 'STAT100', 'إحصاء', 'إحصاء', '', 2, '', 0, 'required'),
(167, 4, 5, 'COE211', 'الدوائر الكهربائية', 'الدوائر الكهربائية', '', 3, 'COE212, MATH115, PHYS116', 0, 'required'),
(168, 4, 5, 'COE212', 'معمل الدوائر الكهربائية', 'معمل الدوائر الكهربائية', '', 1, 'COE211', 0, 'required'),
(169, 4, 5, 'COE223', 'عمارة الحاسب', 'عمارة الحاسب', '', 3, 'COE121', 0, 'required'),
(170, 4, 5, 'CS211', 'مفاهيم الخوارزميات', 'مفاهيم الخوارزميات', '', 3, 'CS181', 0, 'required'),
(171, 4, 5, 'IC102', 'الإسلام وبناء المجتمع', 'الإسلام وبناء المجتمع', '', 2, 'IC101', 0, 'required'),
(172, 4, 5, 'MATH212', 'رياضيات محددة', 'رياضيات محددة', '', 3, 'MATH116', 0, 'required'),
(173, 4, 2, 'CSC111', 'برمجة الحاسب', 'برمجة الحاسب', '', 3, 'CSC105', 0, 'required'),
(174, 4, 2, 'ENG0012', 'اللغة الإنجليزية تحضيري(٢)', 'اللغة الإنجليزية تحضيري(٢)', '', 5, '', 0, 'required'),
(175, 4, 2, 'ESP102', 'لغة إنجليزية لتخصصات الهندسة وعلوم الحاسب', 'لغة إنجليزية لتخصصات الهندسة وعلوم الحاسب', '', 2, '', 0, 'required'),
(176, 4, 2, 'MATH105', 'حساب التفاضل', 'حساب التفاضل', '', 3, '', 0, 'required'),
(177, 4, 2, 'PHYS115', 'فيزياء(٢)', 'فيزياء(٢)', '', 3, 'PHYS110', 0, 'required'),
(178, 4, 6, 'COE213', 'إلكترونيات', 'إلكترونيات', '', 3, 'COE211, COE214', 0, 'required'),
(179, 4, 6, 'COE214', 'معمل إلكترونيات', 'معمل إلكترونيات', '', 1, 'COE212, COE213', 0, 'required'),
(180, 4, 6, 'COE224', 'لغة التجميع', 'لغة التجميع', '', 3, 'COE223', 0, 'required'),
(181, 4, 6, 'COE231', 'تفاعل الإنسان مع الحاسب', 'تفاعل الإنسان مع الحاسب', '', 2, 'CS181', 0, 'required'),
(182, 4, 6, 'CS214', 'تراكيب البيانات', 'تراكيب البيانات', '', 3, 'MATH212', 0, 'required'),
(183, 4, 6, 'CS222', 'نظام التشغيل', 'نظام التشغيل', '', 3, 'CS182', 0, 'required'),
(185, 4, 3, 'ARAB101', 'المهارات اللغوية', 'المهارات اللغوية', '', 2, '', 0, 'required'),
(186, 4, 3, 'CS181', 'برمجة الحاسب(٢)', 'برمجة الحاسب(٢)', '', 3, 'CSC111', 0, 'required'),
(187, 4, 3, 'MATH115', 'حساب التكامل', 'حساب التكامل', '', 3, 'MATH105', 0, 'required'),
(188, 4, 3, 'PHYS116', 'فيزياء عامه(٣)', 'فيزياء عامه(٣)', '', 4, 'PHYS115', 0, 'required'),
(189, 4, 3, 'STAT126', 'الإحصاء والإحتمالات ', 'الإحصاء والإحتمالات ', '', 3, 'STAT100', 0, 'required'),
(190, 4, 4, 'ARAB103', 'التحرير العربي', 'التحرير العربي', '', 2, '', 0, 'required'),
(191, 4, 4, 'COE121', 'التصميم المنطقي', 'التصميم المنطقي', '', 3, 'COE122, CSC111', 0, 'required'),
(192, 4, 4, 'COE122', 'التصميم المنطقي(معمل)', 'التصميم المنطقي(معمل)', '', 1, 'COE121', 0, 'required'),
(193, 4, 4, 'CS182', 'برمجة الحاسب(٣)', 'برمجة الحاسب(٣)', '', 3, 'CS181', 0, 'required'),
(194, 4, 7, 'COE325', 'نظم المعالجات الدقيقة', 'نظم المعالجات الدقيقة', '', 3, 'COE213, COE224, COE326', 0, 'required'),
(195, 4, 7, 'COE326', 'معمل نظم المعالجات الدقيقة', 'معمل نظم المعالجات الدقيقة', '', 1, 'COE325', 0, 'required'),
(196, 4, 7, 'COE361', 'تحليل الإشارات والنظم', 'تحليل الإشارات والنظم', '', 3, 'COE362', 0, 'required'),
(197, 4, 7, 'COE416', 'تصميم أنظمة VLSI باستخدام VHDL', 'تصميم أنظمة VLSI باستخدام VHDL', '', 3, '', 0, 'major_elective'),
(198, 4, 7, 'COE417', 'تصميم واختبار والتحقق من أنظمة VLSI', 'تصميم واختبار والتحقق من أنظمة VLSI', '', 3, '', 0, 'major_elective'),
(199, 4, 7, 'COE418', 'الإلكترونيات الرقمية', 'الإلكترونيات الرقمية', '', 3, 'COE213', 0, 'major_elective'),
(200, 4, 7, 'COE427', 'عمارة الحاسبات المتقدمة', 'عمارة الحاسبات المتقدمة', '', 3, 'COE325', 0, 'major_elective'),
(201, 4, 7, 'COE428', 'المعالجة المتوازية', 'المعالجة المتوازية', '', 3, 'COE333', 0, 'major_elective'),
(202, 4, 7, 'COE429', 'تصميم المنطق الرقمي المتقدم', 'تصميم المنطق الرقمي المتقدم', '', 3, 'COE325', 0, 'major_elective'),
(203, 4, 7, 'COE432', 'نظم التحكم الرقمي', 'نظم التحكم الرقمي', '', 3, 'COE361', 0, 'major_elective'),
(204, 4, 7, 'COE436', 'الأنظمة المدمجة المتقدمة', 'الأنظمة المدمجة المتقدمة', '', 3, '', 0, 'major_elective'),
(205, 4, 7, 'COE437', 'أنظمة التشغيل في الزمن الحقيقي', 'أنظمة التشغيل في الزمن الحقيقي', '', 3, '', 0, 'major_elective'),
(206, 4, 7, 'COE441', 'الروبوتية والتحكم', 'الروبوتية والتحكم', '', 3, 'COE361', 0, 'major_elective'),
(207, 4, 7, 'COE442', 'الذكاء الاصطناعي والنظم الخبيرة', 'الذكاء الاصطناعي والنظم الخبيرة', '', 3, 'COE333', 0, 'major_elective'),
(208, 4, 7, 'COE443', 'الرؤية الحاسوبية والتعرف على الأنماط', 'الرؤية الحاسوبية والتعرف على الأنماط', '', 3, 'COE361', 0, 'major_elective'),
(209, 4, 7, 'COE453', 'نظم الإتصالات', 'نظم الإتصالات', '', 3, 'COE351', 0, 'major_elective'),
(210, 4, 7, 'COE454', 'الشبكات اللاسلكية والحوسبة المتنقلة', 'الشبكات اللاسلكية والحوسبة المتنقلة', '', 3, 'COE351', 0, 'major_elective'),
(211, 4, 7, 'COE455', 'أمن الشبكات والحاسب', 'أمن الشبكات والحاسب', '', 3, 'COE351', 0, 'major_elective'),
(212, 4, 7, 'COE456', 'نظم الاتصالات اللاسلكية', 'نظم الاتصالات اللاسلكية', '', 3, 'COE351', 0, 'major_elective'),
(213, 4, 7, 'COE457', 'الحوسبة السحابية', 'الحوسبة السحابية', '', 3, 'COE351', 0, 'major_elective'),
(214, 4, 7, 'COE463', 'معالجة الإشارات الرقمية', 'معالجة الإشارات الرقمية', '', 3, 'COE361', 0, 'major_elective'),
(215, 4, 7, 'COE464', 'معالجة الصور والوسائط المتعددة', 'معالجة الصور والوسائط المتعددة', '', 3, 'COE361', 0, 'major_elective'),
(216, 4, 7, 'COE492', 'موضوعات خاصة في هندسة الحاسب(١)', 'موضوعات خاصة في هندسة الحاسب(١)', '', 3, 'COE325', 0, 'major_elective'),
(217, 4, 7, 'COE493', 'موضوعات خاصة في هندسة الحاسب(٢)', 'موضوعات خاصة في هندسة الحاسب(٢)', '', 3, 'COE325', 0, 'major_elective'),
(218, 4, 7, 'COE362', 'معمل تحليل الإشارات والنظم', 'معمل تحليل الإشارات والنظم', '', 1, 'COE361', 0, 'required'),
(219, 4, 7, 'CS383', 'هندسة البرمجيات', 'هندسة البرمجيات', '', 3, 'CS222', 0, 'required'),
(220, 4, 7, 'IC103', 'النظام الاقتصادي في الإسلام ', 'النظام الاقتصادي في الإسلام ', '', 2, 'IC101', 0, 'required'),
(221, 4, 7, 'MATH329', 'بحوث العمليات', 'بحوث العمليات', '', 3, 'MATH116', 0, 'required'),
(222, 4, 8, 'COE332', 'تطبيقات المتحكم الدقيق', 'تطبيقات المتحكم الدقيق', '', 2, 'COE325', 0, 'required'),
(223, 4, 8, 'COE333', 'هندسة نظم الحاسب', 'هندسة نظم الحاسب', '', 3, 'CS383', 0, 'required'),
(224, 4, 8, 'COE351', 'شبكات الحاسب', 'شبكات الحاسب', '', 3, 'COE352, CS222', 0, 'required'),
(225, 4, 8, 'COE352', 'معمل شبكات الحاسب', 'معمل شبكات الحاسب', '', 1, 'COE351', 0, 'required'),
(226, 4, 8, 'IT362', 'مهارات الإتصال وأخلاقيات المهنة', 'مهارات الإتصال وأخلاقيات المهنة', '', 2, '', 0, 'required'),
(227, 4, 9, 'COE434', 'الأنظمة المدمجة', 'الأنظمة المدمجة', '', 3, 'COE325', 0, 'required'),
(228, 4, 9, 'COE435', 'معمل الأنظمة المدمجة', 'معمل الأنظمة المدمجة', '', 1, 'COE434', 0, 'required'),
(229, 4, 9, 'COE497', 'تدريب صيفي', 'تدريب صيفي', '', 1, '', 0, 'required'),
(230, 4, 9, 'COE498', 'مشروع تخرج(١)', 'مشروع تخرج(١)', '', 2, '', 0, 'required'),
(231, 4, 9, 'IC104', 'أسس النظام السياسي في الإسلام', 'أسس النظام السياسي في الإسلام', '', 2, 'IC101', 0, 'required'),
(232, 4, 10, 'COE415', 'تصميم الدوائر المتكاملة التطبيقية وعالية الاندماج', 'تصميم الدوائر المتكاملة التطبيقية وعالية الاندماج', '', 3, 'COE213', 0, 'required'),
(233, 4, 10, 'COE499', 'مشروع تخرج(٢)', 'مشروع تخرج(٢)', '', 3, 'COE498', 0, 'required'),
(234, 4, 10, 'STAT327', 'استدلال إحصائي(٢)', 'استدلال إحصائي(٢)', '', 3, 'STAT126', 0, 'free_elective'),
(235, 4, 10, 'CHEM101', 'كيمياء عامة(١)', 'كيمياء عامة(١)', '', 4, '', 0, 'free_elective'),
(236, 4, 10, 'CS315', 'تحليل وتصميم الخوارزميات', 'تحليل وتصميم الخوارزميات', '', 3, '', 0, 'free_elective'),
(237, 4, 10, 'CS341', 'الرسم بالحاسب', 'الرسم بالحاسب', '', 3, 'CS182', 0, 'free_elective'),
(238, 4, 10, 'CS451', 'مقدمة في أمن الحاسب', 'مقدمة في أمن الحاسب', '', 3, '', 0, 'free_elective'),
(239, 4, 10, 'IT351', 'علم البيانات لإنترنت الاشياء', 'علم البيانات لإنترنت الاشياء', '', 3, '', 0, 'free_elective'),
(240, 4, 10, 'MATH204', 'حساب المتجهات', 'حساب المتجهات', '', 3, '', 0, 'free_elective'),
(241, 4, 10, 'MATH244', 'الجبر الخطي(٢)', 'الجبر الخطي(٢)', '', 3, '', 0, 'free_elective'),
(242, 4, 10, 'MATH319', 'نظرية الترميز والتشفير', 'نظرية الترميز والتشفير', '', 3, '', 0, 'free_elective'),
(243, 4, 10, 'MATH326', 'الطرائق الرياضية', 'الطرائق الرياضية', '', 4, '', 0, 'free_elective'),
(244, 4, 10, 'MATH345', 'تطبيقات الجبر', 'تطبيقات الجبر', '', 3, '', 0, 'free_elective'),
(245, 4, 10, 'MATH351', 'التحليل العددي', 'التحليل العددي', '', 4, '', 0, 'free_elective'),
(246, 4, 10, 'MATH382', 'التحليل الحقيقي(١)', 'التحليل الحقيقي(١)', '', 4, '', 0, 'free_elective'),
(247, 4, 10, 'PHYS211', 'الميكانيكا التقليدية(١)', 'الميكانيكا التقليدية(١)', '', 3, '', 0, 'free_elective'),
(248, 4, 10, 'PHYS243', 'الديناميكا الحرارية', 'الديناميكا الحرارية', '', 3, '', 0, 'free_elective'),
(249, 4, 10, 'PHYS321', 'كهرومغناطيسية(٢)', 'كهرومغناطيسية(٢)', '', 3, '', 0, 'free_elective'),
(250, 4, 10, 'PHYS422', 'إلكترونيات', 'إلكترونيات', '', 4, '', 0, 'free_elective'),
(251, 4, 10, 'PHYS221', 'كهرومغناطيسية(١)', 'كهرومغناطيسية(١)', '', 3, 'PHYS116', 0, 'free_elective');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `major_id`, `field_id`, `title`, `description`, `type`) VALUES
(1, 1, 2, 'Classify the data', 'Teach a tiny \"model\" to sort points into Category A or B.', 'classify'),
(2, 1, 3, 'Style a button', 'Change a button\'s colour and text and see the result instantly.', 'button'),
(3, 1, 5, 'Sorting challenge', 'Put the bars in order using as few swaps as you can.', 'sort'),
(4, 1, 6, 'Logic puzzle', 'Follow a few lines of pseudo-code and predict the output.', 'logic_puzzle'),
(5, 2, 10, 'Organise the data', 'Drag pieces of information into the right database table.', 'db_sort'),
(6, 2, 11, 'Connect the network', 'Link Computer, Router and Server in the right order.', 'network'),
(7, 2, 9, 'Build a mini web page', 'Customise a simple page and watch it update.', 'webpage'),
(8, 2, 12, 'Send it to the cloud', 'Upload a file to the cloud, then open it from another device.', 'cloud'),
(13, 4, 25, 'Drive the robot', 'Move a robot on a grid to the goal.', 'robot'),
(14, 4, 24, 'LED board', 'Switch virtual LEDs on and off with buttons.', 'leds'),
(15, 4, 27, 'Logic gates', 'Switch inputs and see how AND / OR gates respond.', 'gates'),
(16, 4, 29, 'Camera detects an object', 'Move an object in front of a virtual camera.', 'vision'),
(17, 4, 33, 'Photo filters', 'Apply grayscale and other filters to a picture.', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `experience_ratings`
--

CREATE TABLE `experience_ratings` (
  `id` int(11) NOT NULL,
  `exp_name` varchar(50) NOT NULL,
  `rating_value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experience_ratings`
--

INSERT INTO `experience_ratings` (`id`, `exp_name`, `rating_value`) VALUES
(1, 'Network', 'Liked'),
(2, 'Filters', 'Normal'),
(3, 'Logic', 'Disliked');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `major_id`, `name`, `description`, `category`) VALUES
(1, 1, 'AI', 'A field area listed for this major (verify against the official plan).', 'ai'),
(2, 1, 'Machine Learning', 'A field area listed for this major (verify against the official plan).', 'ai'),
(3, 1, 'Web Technologies', 'A field area listed for this major (verify against the official plan).', 'web'),
(4, 1, 'Software Engineering', 'A field area listed for this major (verify against the official plan).', 'prog'),
(5, 1, 'Algorithms', 'A field area listed for this major (verify against the official plan).', 'prog'),
(6, 1, 'Programming', 'A field area listed for this major (verify against the official plan).', 'prog'),
(7, 1, 'Computer Security', 'A field area listed for this major (verify against the official plan).', 'sec'),
(8, 1, 'Cryptography', 'A field area listed for this major (verify against the official plan).', 'sec'),
(9, 2, 'Web Technologies', 'A field area listed for this major (verify against the official plan).', 'web'),
(10, 2, 'Databases', 'A field area listed for this major (verify against the official plan).', 'data'),
(11, 2, 'Networks', 'A field area listed for this major (verify against the official plan).', 'net'),
(12, 2, 'Cloud Computing', 'A field area listed for this major (verify against the official plan).', 'net'),
(13, 2, 'Data Mining', 'A field area listed for this major (verify against the official plan).', 'data'),
(14, 2, 'Information Systems', 'A field area listed for this major (verify against the official plan).', 'data'),
(15, 2, 'Data Analysis', 'A field area listed for this major (verify against the official plan).', 'data'),
(24, 4, 'Embedded Systems', 'A field area listed for this major (verify against the official plan).', 'hw'),
(25, 4, 'Robotics and Control', 'A field area listed for this major (verify against the official plan).', 'robo'),
(26, 4, 'Computer Architecture', 'A field area listed for this major (verify against the official plan).', 'hw'),
(27, 4, 'Digital Logic', 'A field area listed for this major (verify against the official plan).', 'hw'),
(28, 4, 'Computer Networks', 'A field area listed for this major (verify against the official plan).', 'net'),
(29, 4, 'Computer Vision', 'A field area listed for this major (verify against the official plan).', 'ai'),
(30, 4, 'AI', 'A field area listed for this major (verify against the official plan).', 'ai'),
(31, 4, 'VLSI', 'A field area listed for this major (verify against the official plan).', 'hw'),
(32, 4, 'Digital Signal Processing', 'A field area listed for this major (verify against the official plan).', 'hw'),
(33, 4, 'Image Processing', 'A field area listed for this major (verify against the official plan).', 'ai');

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `slug` varchar(5) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `slug`, `name_ar`, `name_en`, `description`, `icon`) VALUES
(1, 'cs', 'علوم الحاسب', 'Computer Science', 'Focuses on computing, programming, algorithms, software, AI and related areas.', '🧠'),
(2, 'it', 'تقنية المعلومات', 'Information Technology', 'Focuses on building and running information systems: web, databases, networks and cloud.', '🌐'),
(4, 'ce', 'هندسة الحاسب', 'Computer Engineering', 'Focuses on the hardware side of computing: embedded systems, robotics, digital logic and vision.', '🦾');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_options`
--

CREATE TABLE `quiz_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `major_id` int(11) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `major2_id` int(11) DEFAULT NULL,
  `score2` tinyint(4) NOT NULL DEFAULT 0,
  `dim` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_options`
--

INSERT INTO `quiz_options` (`id`, `question_id`, `option_text`, `major_id`, `score`, `major2_id`, `score2`, `dim`) VALUES
(1, 1, 'Building an intelligent system', 1, 3, 4, 1, 'ai'),
(2, 1, 'Connecting systems and services', 2, 3, 3, 1, 'net'),
(4, 1, 'Building a physical device or robot', 4, 3, 1, 1, 'robo'),
(5, 2, 'An AI application', 1, 3, 4, 1, 'ai'),
(6, 2, 'A cloud / web system', 2, 3, 1, 1, 'web'),
(8, 2, 'A robot with sensors', 4, 3, 1, 1, 'robo'),
(9, 3, 'Making an app smarter at predicting things', 1, 3, 4, 1, 'ai'),
(10, 3, 'Organising data so a team can find it fast', 2, 3, 1, 1, 'data'),
(12, 3, 'Making a machine react to the real world', 4, 3, 1, 1, 'robo'),
(13, 4, 'A code editor and an algorithms book', 1, 3, 3, 1, 'prog'),
(14, 4, 'Database and dashboard tools', 2, 3, 1, 1, 'data'),
(16, 4, 'A circuit board and sensors', 4, 3, 1, 1, 'hw'),
(17, 5, 'Writing the core logic', 1, 3, 4, 1, 'prog'),
(18, 5, 'Setting up the servers, site and database', 2, 3, 1, 1, 'web'),
(20, 5, 'Wiring and programming the hardware', 4, 3, 1, 1, 'hw'),
(21, 6, 'Solving hard problems with code and math', 1, 3, 4, 1, 'prog'),
(22, 6, 'Making systems reliable and useful for people', 2, 3, 3, 1, 'net'),
(24, 6, 'Seeing code control real objects', 4, 3, 1, 1, 'robo');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `category` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question`, `category`) VALUES
(1, 'What would you rather spend an afternoon doing?', 'preference'),
(2, 'Which project sounds most exciting?', 'project'),
(3, 'Which problem would you enjoy solving most?', 'problem'),
(4, 'Which \"toolbox\" would you open first?', 'tools'),
(5, 'In a team project, which job would you volunteer for?', 'team'),
(6, 'What do you care about most in technology?', 'values');

-- --------------------------------------------------------

--
-- Table structure for table `user_exploration`
--

CREATE TABLE `user_exploration` (
  `id` int(11) NOT NULL,
  `session_id` varchar(64) NOT NULL,
  `experience_id` int(11) NOT NULL,
  `rating` varchar(10) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Student 3: Quiz results table
-- Integrated into MajorMatch main database
--

CREATE TABLE IF NOT EXISTS `quiz_results` (
  `session_id` VARCHAR(64) NOT NULL,
  `answers_json` LONGTEXT NOT NULL,
  `cs_score` INT NOT NULL DEFAULT 0,
  `it_score` INT NOT NULL DEFAULT 0,
  `ce_score` INT NOT NULL DEFAULT 0,
  `dims_json` LONGTEXT NOT NULL,
  `answered` INT NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_id` (`major_id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_id` (`major_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `experience_ratings`
--
ALTER TABLE `experience_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_id` (`major_id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `quiz_options`
--
ALTER TABLE `quiz_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `major_id` (`major_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_exploration`
--
ALTER TABLE `user_exploration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experience_id` (`experience_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `experience_ratings`
--
ALTER TABLE `experience_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz_options`
--
ALTER TABLE `quiz_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_exploration`
--
ALTER TABLE `user_exploration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `experiences_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_options`
--
ALTER TABLE `quiz_options`
  ADD CONSTRAINT `quiz_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_options_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_exploration`
--
ALTER TABLE `user_exploration`
  ADD CONSTRAINT `user_exploration_ibfk_1` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
