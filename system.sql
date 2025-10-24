-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 24, 2025 at 10:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@example.com', 'pbkdf2:sha256:600000$S2LcAj6Do90pzgJK$05d80e2e7192572ae1b5d533d44c5414dd7f22dde5415e897a0bba3b14b4d12a'),
(2, 'Bunny3@gmail.com', 'scrypt:32768:8:1$m7XVGs0wXHYQaYn8$a0bfc589f1f4d72023ccc0cb9cc24427e6b87dc4e1e7f34336ebed5b6d34d532b79094dff7006bb933140569d5635c92524dbf5c5bec6ea1816994154e8e9800'),
(3, 'admin@gmail.com', 'scrypt:32768:8:1$X7ZBRvJGxY64gxoC$c1a0cea11ae031a2968c1e765e6610f113f022e9d011f77c033d84710eb4b86ac6221fee0c8f45a8bf35651c4a866c30671f1559f0216ede8a888aa8e23e9da7');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `content`, `created_at`) VALUES
(5, 'hello 7', '2025-10-22 19:41:50'),
(6, 'hello8', '2025-10-22 19:42:59'),
(7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2025-10-22 19:43:27'),
(8, 'hekll22', '2025-10-22 19:44:11'),
(9, 'hello4555', '2025-10-22 19:44:14'),
(10, 'hellllll', '2025-10-22 19:44:18'),
(11, 'f', '2025-10-22 19:44:20'),
(12, 'fgg', '2025-10-22 19:44:22'),
(13, 'wwwe', '2025-10-22 19:44:24'),
(14, 'gggggg', '2025-10-22 19:44:25'),
(15, 'eeewewr', '2025-10-22 19:44:27'),
(16, 'fdfdsffdf', '2025-10-22 19:44:28'),
(17, 'fsdfddsfsdfsd', '2025-10-22 19:44:30'),
(18, '3332222', '2025-10-22 19:44:32'),
(20, 'admin@gmail.com | admin123', '2025-10-22 20:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(200) NOT NULL,
  `contact` varchar(120) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'Vip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `email`, `password`, `contact`, `role`) VALUES
(2, 'mg mg', 'mgmg@gmail.com', 'pbkdf2:sha256:1000000$qNVQcUFxlbVZ7pUT$a4325d5c91ffc0391d96ad9b5a83acd4893875e7fd0cf674dbb97d01f200ea1f', '09342234442', 'Vip'),
(5, 'Add', 'add2@gmail.com', 'pbkdf2:sha256:1000000$ochdJIj1yjbEztTf$529d9cd5b1642cbe9124676684a350ceb72abeb43129db882f8cb3cdd0a6a53b', '0944354535', 'Premium'),
(6, 'Crown', 'crown@gmail.com', 'pbkdf2:sha256:1000000$0wvhSOEgaAdxw6L9$d94373180ea04a0ba112f000bdf06069107a4285c356a45a5b415f62cd0c941a', '09344232232', 'Crown'),
(27, 'alice', 'alice@example.com', 'pbkdf2:sha256:1000000$2cGLIsEPrboqBcxB$22f8f5610da4a8e515ed4c385de49242dbea8c352445b3d72368815d6bcf1dcb', '0912345678', 'Vip'),
(28, 'bob', 'bob@example.com', 'pbkdf2:sha256:1000000$dXbyj7d7WeE7AKkH$1946c8421e246bc60980cefa8577b0eed42a19e9b9b962141edde1e5586240ca', '0923456789', 'Premium'),
(29, 'carol', 'carol@example.com', 'pbkdf2:sha256:1000000$ypdIxevGv09npodU$44fd477c008ddacf7e2618c11dabe07d8cfdd3f4b52ee28667b97f68281cd39a', '0934567890', 'Crown'),
(30, 'dave', 'dave@example.com', 'pbkdf2:sha256:1000000$Ek56G4d9gGecTFCg$22ebd225b6dfaffc33c213e50aa964a88a5c8748d29327cc2c0fbdf380dd2993', '0945678901', 'Vip'),
(31, 'eve', 'eve@example.com', 'pbkdf2:sha256:1000000$XPBGQmiFq8SJ340L$728da95493f6f783422d0a2fe1b82c7c826b24f942b9736a6ab0e04abae3bd2f', '0956789012', 'Premium'),
(32, 'frank', 'frank@example.com', 'pbkdf2:sha256:1000000$Dzxqa7dsITLl2ijL$c3fb7fa168b1e5956360c0e0c696e2fdc6270268e7db94d451ae93819be49ad8', '0967890123', 'Crown'),
(33, 'grace', 'grace@example.com', 'pbkdf2:sha256:1000000$cTskvEDFML3yUesV$18042fb921514840572707efde869f1eeae6f70d76bd0a7003810c95243f0577', '0978901234', 'Vip'),
(34, 'heidi', 'heidi@example.com', 'pbkdf2:sha256:1000000$XBfkHqn2q3ayFaAh$e1b9c5d03a86daf17f8bf2412dc6af960e88d1d1a3578cc99c192c1bd3d8ae8a', '0989012345', 'Premium'),
(35, 'ivan', 'ivan@example.com', 'pbkdf2:sha256:1000000$eZ0x6ftrTnq38Y3c$842fd48e84b5e59d349c75dd5d5e58cba9f039f761cb7318cdb0dc23dcb321d4', '0990123456', 'Crown'),
(36, 'judy', 'judy@example.com', 'pbkdf2:sha256:1000000$Wi4AmUjt01E9h3qe$fdccbbf76409bafe81d5506dd6ea30527f67c7a6c14ec2852efe34591706f6b6', '0901234567', 'Vip'),
(37, 'mgmg', 'mgmg1@gmail.com', 'pbkdf2:sha256:1000000$QTrw5F6WKvHbIf7A$cb4f74265d8548d3dd942a8ec24c0b049f764168030a92c575c8eb11b4933f1b', '095454545', 'Crown'),
(38, 'user1', 'user1@example.com', 'pbkdf2:sha256:1000000$MDAHTgI8jhGuTri7$f6db371270004d38a90a89c2284c0d9e59f77eeba25534a11609fd448d6ce680', '0910000001', 'Vip'),
(39, 'user2', 'user2@example.com', 'pbkdf2:sha256:1000000$htDUxp6NIbFOMg7T$46e4ffb90b8fa11b0a5b2090ee624f5beeba12e1e2181e32ca262baba6014d14', '0910000002', 'Premium'),
(40, 'user3', 'user3@example.com', 'pbkdf2:sha256:1000000$TqNzkVCmtjVdwxKi$36736836165d52f11b33ac1e1c546b6561cd5503a93afb67df231aae8ffdedcf', '0910000003', 'Crown'),
(41, 'user4', 'user4@example.com', 'pbkdf2:sha256:1000000$rtMwRTQHyhkdVz30$b7581608d13bc7bedfae74bc9d3f0a3414624e69358f98a733274e3c32824b24', '0910000004', 'Vip'),
(42, 'user5', 'user5@example.com', 'pbkdf2:sha256:1000000$f49nO2RmRP2Xv9kL$30b9a5d78ccdf862fa62a2b8ae62b7dcceb9851fd142e2be4e2f32322265a4ac', '0910000005', 'Premium'),
(43, 'user6', 'user6@example.com', 'pbkdf2:sha256:1000000$r42P9RDnPtwomBGo$3b622370f38bda0651dcbe49b8f197b6cb775aec179d31d857ad6bf7cb9913bd', '0910000006', 'Crown'),
(44, 'user7', 'user7@example.com', 'pbkdf2:sha256:1000000$nXkIplxdLhM9hvfQ$34a96cc83fbca8a12e40f0405d91f14a97056da8ee8a50cb7f5a1efd05a2a5c9', '0910000007', 'Vip'),
(45, 'user8', 'user8@example.com', 'pbkdf2:sha256:1000000$oIc330GySFlF91wD$ae53b0fa1cff44797492b40f12cadcc3e4181f84dee7c9dc81b95bb35da65b15', '0910000008', 'Premium'),
(46, 'user9', 'user9@example.com', 'pbkdf2:sha256:1000000$iTtt6WMbguhXdj9q$7f7cadabcd69af9621f4e1664ffa4d856046f24e9e1c97e25371e43128d50593', '0910000009', 'Crown'),
(47, 'user10', 'user10@example.com', 'pbkdf2:sha256:1000000$m9hCsIzgfRpphT00$6ae82c8c0e24cfd12790959256e21d855e25f0b1a300c615bf260d0b8c8ed447', '0910000010', 'Vip'),
(48, 'user11', 'user11@example.com', 'pbkdf2:sha256:1000000$1MDh8dPvVcxK8qz5$ab442ac83586e3c53936f524b62ae825751fd29916acce41ba4ff1b5ba5a92f1', '0910000011', 'Premium'),
(49, 'user12', 'user12@example.com', 'pbkdf2:sha256:1000000$8xl2SGFIdSxJStFE$67e7530537ee4d8166ce4e7116ed43483298c7b78c83388e00a25ac59475499d', '0910000012', 'Crown'),
(50, 'user13', 'user13@example.com', 'pbkdf2:sha256:1000000$yZzE61uTVJSLIUCR$ace3762bf5e602f9b155af9da7938a7fd1424ea9b0d4638760fb2fcdf3621735', '0910000013', 'Vip'),
(51, 'user14', 'user14@example.com', 'pbkdf2:sha256:1000000$lnOA48fiFpAXZ8iE$a08e98451c9f31f4367510a31d518b8bc5fc3c40b118db869f806936f05ed6cd', '0910000014', 'Premium'),
(52, 'user15', 'user15@example.com', 'pbkdf2:sha256:1000000$TwCXo8QKR8wYgYBC$90076eb81dc127ddd17166c0efe0f8efcec254304f4db394cee86d941c39d481', '0910000015', 'Crown'),
(53, 'user16', 'user16@example.com', 'pbkdf2:sha256:1000000$qTubz9E4LXxC3Jmd$f8388d01f8f106a48b5823213bf3559702f09638a2eeb74cf420a6eeb1df5dc9', '0910000016', 'Vip'),
(54, 'user17', 'user17@example.com', 'pbkdf2:sha256:1000000$T0v0nMW9mWZwJgI1$504e7861c246a745650c1694297adf25aacd7564768061ddb58bd1c4e942eb4d', '0910000017', 'Premium'),
(55, 'user18', 'user18@example.com', 'pbkdf2:sha256:1000000$eDDEoqXURmWnjOaj$43de194da3d02e4f324a634ca03f0ce032ad16f7626ef694791f4e560387b19b', '0910000018', 'Crown'),
(56, 'user19', 'user19@example.com', 'pbkdf2:sha256:1000000$nL9fSggrUQbRH8nT$16967b533fe306304511e129139de60a26cf43429d60bcd38ec126fbf3c8ae83', '0910000019', 'Vip'),
(57, 'user20', 'user20@example.com', 'pbkdf2:sha256:1000000$HIunh0W9AsgUXhXK$0ce16f94fed477f44668d407ecf6de3b36d1e2b79d7bbb211e373d05f06566ed', '0910000020', 'Premium'),
(58, 'user21', 'user21@example.com', 'pbkdf2:sha256:1000000$h6CjH13rotX63yID$7ada94dd3132aa7be3930f475e2e4393792000c6c9ed04d17f652bdfd78513e9', '0910000021', 'Crown'),
(59, 'user22', 'user22@example.com', 'pbkdf2:sha256:1000000$SQi5V3XtEuTdH1AW$416c99e4ae8a608593ef1122dc03d020d38ccc25563d71ca4764cc3a22ecc875', '0910000022', 'Vip'),
(60, 'user23', 'user23@example.com', 'pbkdf2:sha256:1000000$liN03U2VRBUlhCVA$4672fbb63ee35e16fdc3fdacf617a3642c424d6b760fa5bfec3778ca8ec37d47', '0910000023', 'Premium'),
(61, 'user24', 'user24@example.com', 'pbkdf2:sha256:1000000$AwFgcW573hb3G0oo$a22d017bf12688f27772e9ea596d1025915f1861d3af7194b7bf39ecfb3a3164', '0910000024', 'Crown'),
(62, 'user25', 'user25@example.com', 'pbkdf2:sha256:1000000$vrOTIIAZPJnuucqs$d1a5f427fa706e8e273c8e54bff6c8927f408ee7969efc2e3fa25132ee281ab8', '0910000025', 'Vip'),
(63, 'user26', 'user26@example.com', 'pbkdf2:sha256:1000000$RPxOBDJq0s0wV9K8$3dadcf28f126aea37f9121a79da103855852ab7c5bddecd4fb59ffa50a4c07df', '0910000026', 'Premium'),
(64, 'user27', 'user27@example.com', 'pbkdf2:sha256:1000000$SWZE6PVVqWuF9O23$8a0b3967c4a6dbc6a9b42920521de2e8767efd3f0e17f0d48002a4c1679d3e19', '0910000027', 'Crown'),
(65, 'user28', 'user28@example.com', 'pbkdf2:sha256:1000000$sRmNyeUQJm4Qs03N$d470d56c5cb812bf2eac5d00633f134cf7fc7a516aff88b74f6fc77a4ff285d5', '0910000028', 'Vip'),
(66, 'user29', 'user29@example.com', 'pbkdf2:sha256:1000000$sgwcim7Jq3UiGq8h$b40726a9ea51788c13df0664b757acd4f5456fc7c1d88bb9ade53c6e11d40f46', '0910000029', 'Premium'),
(67, 'user30', 'user30@example.com', 'pbkdf2:sha256:1000000$9GdVzULsn1CmyiSv$7ab99573a5f0c10638175ba8fec7152a40dbf73a269127dc970d2b8b2a82d030', '0910000030', 'Crown'),
(68, 'user31', 'user31@example.com', 'pbkdf2:sha256:1000000$HhS19Iyghd7ye9VA$1709ba5bfe58a2fb3b91fb2ed52a78a440cb8bfb4c32121678bb703d45a7d066', '0910000031', 'Vip'),
(69, 'user32', 'user32@example.com', 'pbkdf2:sha256:1000000$9vxetDrj0mMhnIyN$5c24d765cecc06ad2ea8de60f3ac90065a8808a14f0819309e1f0a5432195f58', '0910000032', 'Premium'),
(70, 'user33', 'user33@example.com', 'pbkdf2:sha256:1000000$VX3NiFOoxBU1SeKT$1ee3db92a7a90998819277bdbe5051cbe217ed2807cd9336651befb6f7c11e9f', '0910000033', 'Crown'),
(71, 'user34', 'user34@example.com', 'pbkdf2:sha256:1000000$x1EgutyUCCsAVoQP$9cb283b2c60f6e14b58cb0e8a455d3c9a1741891681320467a1d8a673af6aded', '0910000034', 'Vip'),
(72, 'user35', 'user35@example.com', 'pbkdf2:sha256:1000000$XQtSSZ37GlhIiE2t$5aadafa8215b0d0f7319c701247ea6dd4c714430009dd7daaadecde8945a390e', '0910000035', 'Premium'),
(73, 'user36', 'user36@example.com', 'pbkdf2:sha256:1000000$po8IoMyfkLUP9fzu$7617f9a85a3ec8abc8f4a4a930735b6bf788e798cddc8e6621ca6af82c9a4a16', '0910000036', 'Crown'),
(74, 'user37', 'user37@example.com', 'pbkdf2:sha256:1000000$ULD7EJeZhSY4ToET$432364140b9a79190e3857ceb823ba9ad8cc7defbef0613687c09de92c817096', '0910000037', 'Vip'),
(75, 'user38', 'user38@example.com', 'pbkdf2:sha256:1000000$4R5s77kcRdfiLcd3$099df1aafa817822b0aad2086fb4a7033316ac112a75efa1684e6798784c8a66', '0910000038', 'Premium'),
(76, 'user39', 'user39@example.com', 'pbkdf2:sha256:1000000$a0m7dlT4CDynoQLh$3dcdefda112e150e076c25e74fda1ac78e91a25ba35a241c7ca95475ba247916', '0910000039', 'Crown'),
(77, 'user40', 'user40@example.com', 'pbkdf2:sha256:1000000$HBdrpx4QsRawZ7fN$38d88e2f5a5eef9357a9165efd128dc384a5d591f43b58dce33c3668f0f7fd2a', '0910000040', 'Vip'),
(78, 'user41', 'user41@example.com', 'pbkdf2:sha256:1000000$Cr3Hu8O5PGvIJOAB$3ce7032bd89f735375e1d877e944afd5aa556515bcbb19addc50af933509a2ad', '0910000041', 'Premium'),
(79, 'user42', 'user42@example.com', 'pbkdf2:sha256:1000000$qHKFMVwR80Vjs9kK$af16a74e82ca5e760c6baabb1925f7801c16248fe3a20e806e367ee7bd7ae3c1', '0910000042', 'Crown'),
(80, 'user43', 'user43@example.com', 'pbkdf2:sha256:1000000$mlEYtmTuqEkifnw9$ebc449cf86d049c163f3acd97c4ef4bbeb084f00dbf24c447591b9b98496580f', '0910000043', 'Vip'),
(81, 'user44', 'user44@example.com', 'pbkdf2:sha256:1000000$HLsgjs7bTwTLTke6$88ce26451c597c07c09be310750ba84db69ffccc95b5c0ffee8731fe8f66400a', '0910000044', 'Premium'),
(82, 'user45', 'user45@example.com', 'pbkdf2:sha256:1000000$pAAWR9D6dvjMH1ey$a8da08abb3a5648d974de8e175b19af667817db6eee6f4d88aa8678efa9a24ea', '0910000045', 'Crown'),
(83, 'user46', 'user46@example.com', 'pbkdf2:sha256:1000000$6lITJeIFAT7z2uVT$c8213b561545df9ec96dace39ef955f5bef80a3b98c96a29f00e9ba85967b438', '0910000046', 'Vip'),
(84, 'user47', 'user47@example.com', 'pbkdf2:sha256:1000000$2V1dKCs9wX34HrqG$1e06998d9f28dc565d7cb12d207592a33836f0a220363bbf6591f2651932dcbc', '0910000047', 'Premium'),
(85, 'user48', 'user48@example.com', 'pbkdf2:sha256:1000000$mtLWtPRiAfoUDNhp$4e5d62312dc5da24a9ed8478e4fb68d644eb23ce256de957f9ca9b0d6cad01f1', '0910000048', 'Crown'),
(86, 'user49', 'user49@example.com', 'pbkdf2:sha256:1000000$JQcpwVK2jTElDnCY$f7a9c9391b00026306c070b95a8fb2b777154b8e6d0c20047c94f70f24d57282', '0910000049', 'Vip'),
(87, 'user50', 'user50@example.com', 'pbkdf2:sha256:1000000$0QeuIP2KuaQDtgUL$290fa7f4d3da3f71f86df4bf3a757a6619123fb017b6117e05abb118c43c2c1a', '0910000050', 'Premium'),
(88, 'Frige', 'fridge@gmai.com', 'pbkdf2:sha256:1000000$2JfLjC4cvfpPKsfw$f83ad04d43469d6a904b95096894b1872e137176520b17025552f317df9a9ab9', '0944333', 'Crown'),
(89, 'dd', 'dd@gmail.com', 'pbkdf2:sha256:1000000$EI6392ClpbcupajU$2f898115fa1d0499deafd7be74cc8e6391b80123ea577e0f4380bb16f70d00f1', '0987766666', 'Premium'),
(90, 'f', 'ff@gmail.com', 'pbkdf2:sha256:1000000$1ceVDmBninkTGiqk$8c86db43a8e6ba6e9d075395edcdf13f5c45341129f4c143c62d425b53109f50', '09444444', 'Premium'),
(91, 'pp', 'pp@gmail.com', 'pbkdf2:sha256:1000000$jrLEjBrHbbq5LPOV$3901cdf60596562aa009d32b987ea6da69284d3669bc0a3658ffb5148081eff5', '094944444', 'Premium');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
