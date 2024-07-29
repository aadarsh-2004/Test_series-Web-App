-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2024 at 05:11 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testseries`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `question_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_b` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_d` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`) VALUES
(1, 'कौन सा रंग गुलाब का है?', 'लाल', 'पीला', 'नीला', 'हरा', 'A'),
(2, 'भारत की राजधानी क्या है?', 'मुंबई', 'कोलकाता', 'दिल्ली', 'चेन्नई', 'C'),
(3, 'कौन सा फल केला है?', 'सेब', 'आम', 'कीवी', 'केला', 'D'),
(4, 'भारत में सबसे ऊचा पर्वत कौन सा है?', 'कंचनजंघा', 'हिमाद्रि', 'धौलागिरि', 'माउंट एवरेस्ट', 'A'),
(5, 'सौरमंडल में कितने ग्रह हैं?', '8', '9', '10', '11', 'B'),
(6, 'महाभारत के युद्ध किसके बीच लड़े गए थे?', 'कौरवों और पाण्डवों', 'रावण और राम', 'कृष्ण और जरासंध', 'शिव और विष्णु', 'A'),
(7, 'भारतीय राजनीति का पहला विद्वेषी आरंभ हुआ था कब?', '1857', '1947', '1919', '1925', 'C'),
(8, 'पृथ्वी पर सबसे बड़ा महासागर कौन सा है?', 'भूमध्य सागर', 'हिन्द महासागर', 'आर्कटिक महासागर', 'अटलांटिक महासागर', 'D'),
(9, 'महात्मा गांधी का जन्म स्थान कहाँ है?', 'पोरबंदर', 'अहमदाबाद', 'राजकोट', 'मुंबई', 'A'),
(10, 'कौन सा फल आम है?', 'सेब', 'केला', 'आम', 'कीवी', 'C'),
(11, 'नारी शक्ति का प्रतीक क्या है?', 'चाँदी', 'सोना', 'ताज', 'स्वस्तिक', 'D'),
(12, 'भारत की सबसे लंबी नदी कौन सी है?', 'गंगा', 'यमुना', 'कृष्णा', 'ब्रह्मपुत्र', 'A'),
(13, 'किस खेल में गेंद, बैट और विकेट होते हैं?', 'हॉकी', 'क्रिकेट', 'फुटबॉल', 'बैडमिंटन', 'B'),
(14, 'सौरमंडल में कौन-कौन से ग्रह गैस युगम हैं?', 'बृहस्पति और शनि', 'मंगल और बृहस्पति', 'शनि और अरुण', 'बृहस्पति और वरुण', 'A'),
(15, 'भारत का सबसे बड़ा शहर कौन सा है?', 'दिल्ली', 'मुंबई', 'कोलकाता', 'चेन्नई', 'A'),
(16, 'महाभारत के युद्ध कब हुए थे?', '5000 ईसा पूर्व', '2000 ईसा पूर्व', '3000 ईसा पूर्व', '1000 ईसा पूर्व', 'A'),
(17, 'किस धातु का सूर्य मंदिर इतिहास में बना है?', 'सोने', 'चाँदी', 'तांबा', 'लोहा', 'B'),
(18, 'भारतीय राजव्यवस्था के अनुसार, विधायिका सदन की स्थायी सदस्यों की संख्या क्या है?', '500', '550', '600', '552', 'D'),
(19, 'विश्व का सबसे ऊचा पर्वत कौन सा है?', 'मॉन्ट ब्लैंक', 'कंचनजंघा', 'मॉउंट एवरेस्ट', 'मॉउंट किनलाबु', 'C'),
(20, 'जापान का प्रमुख खाद्य सिद्धांत क्या है?', 'सुशि', 'रामेन', 'टेम्पुरा', 'वासाभी', 'A'),
(21, 'भारतीय संगीत में राग कितने प्रकार के होते हैं?', '56', '72', '108', '12', 'C'),
(22, 'निम्नलिखित में से कौन सा देश एक द्वीप है?', 'भारत', 'रूस', 'ऑस्ट्रेलिया', 'केन्या', 'C'),
(23, 'विश्व में सबसे ज्यादा बोली जाने वाली भाषा कौन सी है?', 'हिन्दी', 'मैंडारिन', 'स्पेनिश', 'अंग्रेजी', 'B'),
(24, 'भारतीय राजनीति में "लोकतंत्र" का क्या अर्थ है?', 'लोकों की सत्ता', 'लोगों का शासन', 'लोकों की आदी', 'लोगों का समर्थन', 'B'),
(25, 'कौन सा गैस मुख्य रूप से सूर्यमंडल में पाया जाता है?', 'हाइड्रोजन', 'हीलियम', 'नाइट्रोजन', 'ऑक्सीजन', 'B'),
(26, 'विश्व में सबसे बड़ा महासागर कौन सा है?', 'प्रशांत महासागर', 'इंडियन महासागर', 'अटलांटिक महासागर', 'दक्षिणी महासागर', 'A'),
(27, 'कौन सा पशु गाय का रिश्तेदार है?', 'भालू', 'खरगोश', 'भैंस', 'बंदर', 'C'),
(28, 'महाभारत का किस युद्ध को एकादशी अखण्ड सेना कहा जाता है?', 'कुरुक्षेत्र युद्ध', 'भीष्म पर्व युद्ध', 'जरासंध युद्ध', 'वाराणसी युद्ध', 'A'),
(29, 'विश्व में सबसे ऊचा इमारत कौन सी है?', 'बर्ज खलीफा', 'टेपी टॉवर', 'शंघाई टावर', 'विलिस टावर', 'A'),
(30, 'महात्मा गांधी का असली नाम क्या था?', 'राजीव प्रसाद', 'मोहनदास करमचंद गांधी', 'जवाहरलाल नेहरू', 'सरदार पटेल', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_tests`
--

CREATE TABLE `upcoming_tests` (
  `id` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `date_of_exam` date NOT NULL,
  `topic` varchar(255) NOT NULL,
  `status` varchar(25) DEFAULT 'upcoming'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upcoming_tests`
--

INSERT INTO `upcoming_tests` (`id`, `test_name`, `date_of_exam`, `topic`, `status`) VALUES
(16, 'Science Test 2', '2024-07-23', 'Chemistry', 'active'),
(15, 'Math Test 2', '2024-07-24', 'Calculus', 'upcoming'),
(14, 'History Test 1', '2024-07-27', 'World War II', 'upcoming'),
(13, 'Science Test 1', '2024-07-26', 'Physics', 'upcoming'),
(12, 'Math Test 1', '2024-07-25', 'Algebra', 'upcoming'),
(18, 'Math Test 3', '2024-08-01', 'Geometry', 'upcoming'),
(19, 'Science Test 3', '2024-08-02', 'Biology', 'upcoming'),
(20, 'History Test 3', '2024-08-03', 'Ancient Rome', 'upcoming'),
(21, 'Math Test 4', '2024-08-04', 'Trigonometry', 'upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subscription` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `subscription`) VALUES
('sidd', 'didd', 'True'),
('1', '1', 'True'),
('2', '2', 'True'),
('tj', 'tj', 'True'),
('11', '11', 'True'),
('12', '12', 'True'),
('15', '15', 'True'),
('admin', 'admin', 'False'),
('ads', 'ads', 'False'),
('aadarsh', 'aadarsh', 'True'),
('240281', '240281', 'True'),
('123456789', '123456789', 'True'),
('GG', 'GG', 'False'),
('ishita', 'ishita', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `user_test_attempts`
--

CREATE TABLE `user_test_attempts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `attempt_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `upcoming_tests`
--
ALTER TABLE `upcoming_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_test_attempts`
--
ALTER TABLE `user_test_attempts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `upcoming_tests`
--
ALTER TABLE `upcoming_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `user_test_attempts`
--
ALTER TABLE `user_test_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
