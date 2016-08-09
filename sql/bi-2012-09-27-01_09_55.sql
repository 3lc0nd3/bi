-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2012 at 01:09 AM
-- Server version: 5.5.22
-- PHP Version: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bi`
--

-- --------------------------------------------------------

--
-- Table structure for table `i1`
--

CREATE TABLE IF NOT EXISTS `i1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(500) NOT NULL,
  `style` varchar(500) NOT NULL,
  `2008` varchar(100) NOT NULL,
  `2009` varchar(100) NOT NULL,
  `2010` varchar(100) NOT NULL,
  `2011` varchar(100) NOT NULL,
  `2012` varchar(100) NOT NULL,
  `2013` varchar(100) NOT NULL,
  `2014` varchar(100) NOT NULL,
  `2015` varchar(100) NOT NULL,
  `2016` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

--
-- Dumping data for table `i1`
--

INSERT INTO `i1` (`id`, `item`, `style`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`, `2015`, `2016`) VALUES
(2, 'Revenues', 'color:darkblue;font-weight:bold;', '', '', '', '', '', '', '', '', ''),
(3, 'Commonwealth Grants - DEEWR', '', '56521500', '69842408', '111206380', '106195819', '65507346', '58295485', '48928948', '46841550', '48502052'),
(4, 'Commonwealth Grants Scheme (CGS)', 'font-weight:bold;', '127737800', '132664701', '147982152', '152843351', '175003797', '190561912', '208370556', '216288637', '224507605'),
(5, 'DEEWR Operating Grants', 'background-color:lightgray;', '', '', '', '', '0', '0', '0', '', ''),
(6, 'Indigenous Support Fund', 'background-color:lightgray;', '', '468000', '549000', '549000', '596000', '674000', '699612', '726197', '753793'),
(7, 'Higher Education Participation & Partnership Program', 'background-color:lightgray;', '', '468139', '953175', '4536200', '5050000', '5050000', '0', 'NA', 'NA'),
(8, 'Workplace Reform Programme', 'background-color:lightgray;', '', '1669558', '', '0', '0', '0', '0', '0', '0'),
(9, 'Workplace Productivity Programme', 'background-color:lightgray;', '', '433628', '', '0', '0', '0', '0', '0', '0'),
(10, 'Additional Support for Students with Disabilities', 'background-color:lightgray;', '', '', '', '573300', '575000', '596850', '0', '', ''),
(11, 'Disabiltiy Performance Fund', 'background-color:lightgray;', '', '', '', '35000', '40000', '41520', '0', '', ''),
(12, 'Learning & Teaching Performance Fund', 'background-color:lightgray;', '', '2484997', '', '0', '0', '0', '0', '0', '0'),
(13, 'Facilitation Funding ', 'background-color:lightgray;', '', '', '', '3300000', '3425400', '3555565', '3690677', '3830922', '3976497'),
(14, 'Reward Funding', 'background-color:lightgray;', '', '', '', '0', '900000', '934200', '969700', '1006548', '1044797'),
(15, 'Transitional Cost Program', 'background-color:lightgray;', '', '1007263', '357714', '439800', '456512', '0', '0', '0', '0'),
(16, 'Practical Component of Teacher Education Program', 'background-color:lightgray;', '', '149744', '418367', '0', '0', '0', '0', '', ''),
(17, 'Capital Development Pool', 'background-color:lightgray;', '', '1021000', '3525344', '1159082', '0', '0', '0', '', ''),
(18, 'EIF Grant - La Trobe University Rural Health School', 'background-color:lightgray;', '', '5300000', '', '24700000', '2100000', '0', '0', 'NA', 'NA'),
(19, 'EIF Grant - La Trobe Institute for Mocular Science', 'background-color:lightgray;', '', '0', '', '24200000', '5500000', '0', '0', 'NA', 'NA'),
(20, 'Superannuation Programme', 'background-color:lightgray;', '', '5271172', '5399860', '5452000', '5000000', '5190000', '0', '', ''),
(21, 'Indigenous Access Scholarships', 'background-color:lightgray;', '', '74988', '72301', '26266', '51852', '51852', '51852', '51852', 'NA'),
(22, 'Australian Postgraduate Awards', 'background-color:lightgray;', '', '2374658', '3036493', '3560185', '3590442', '3621582', '3652722', '', ''),
(23, 'International Postgraduate Research Scholarships', 'background-color:lightgray;', '', '339282', '336092', '352392', '352392', '352392', '352392', '352392', '352392'),
(24, 'Commonwealth Education Costs Scholarships', 'background-color:lightgray;', '', '1373754', '1137260', '1124390', '629750', '238160', '61830', '4580', '0'),
(25, 'Commonwealth Accommodation Scholarships', 'background-color:lightgray;', '', '2370995', '2091759', '1873220', '1154160', '556470', '82440', '6870', '0'),
(26, 'Indigenous Accomodation Costs Scholarships', 'background-color:lightgray;', '', '', '', '18320', '18320', '18320', '16030', '16000', '0'),
(27, 'Indeginous Education Costs Scholarships', 'background-color:lightgray;', '', '', '', '27480', '25190', '25190', '22900', '22900', '0'),
(28, 'CGS Regional Loading', 'background-color:lightgray;', '', '1034276', '1055995', '1072900', '3678379', '3818157', '3963247', '4113851', '4270177'),
(29, 'CGS Enabling Loading', 'background-color:lightgray;', '', '3349', '15936', '28400', '29479', '30599', '31762', '32969', '34222'),
(30, 'Science and Maths Transitional Loading', 'background-color:lightgray;', '', '3103750', '6087464', '8846851', '9611830', '10412285', '11326565', '11756975', '12203740'),
(31, 'DEEWR Research Grants', 'background-color:lightgray;', '', '', '', '', '0', '0', '0', '', ''),
(32, 'Joint Research Engagement ', 'background-color:lightgray;', '', '5611366', '5887091', '6085826', '6317087', '6557137', '6806308', '7064948', '7333416'),
(33, 'Research Training Scheme', 'background-color:lightgray;', '', '11649530', '11411626', '11014496', '11433047', '11867503', '12318468', '12786570', '13272459'),
(34, 'Research Infrastructure Block Grants', 'background-color:lightgray;', '', '2510969', '2611597', '2805756', '2912375', '3023045', '3137921', '3257162', '3380934'),
(35, 'Sustainable Research Excellence', 'background-color:lightgray;', '', '0', '', '1559856', '1619131', '1680657', '1744522', '1810814', '1879625'),
(36, 'Implementation Assistance Programme', 'background-color:lightgray;', '', '126231', '63662', '0', '0', '0', '0', '', ''),
(37, 'Commercialised Training Scheme', 'background-color:lightgray;', '', '105084', '97768', '0', '0', '0', '0', '0', '0'),
(38, 'Australian Scheme for Higher Education Repositories', 'background-color:lightgray;', '', '233019', '1119288', '0', '0', '0', '0', '0', '0'),
(39, 'Other Commonwealth Grants', 'background-color:lightgray;', '', '20657656', '64978589', '2855099', '441000', '0', '0', 'NA', 'NA'),
(40, 'Student Contributions', 'font-weight:bold;', '94490000', '97514297', '107898571', '112835362', '123153119', '134509305', '147075355', '152664219', '158465459'),
(41, 'HECS HELP (Including Savings)', 'background-color:gold;', '', '85392358', '94961062', '99973678', '0', '0', '0', '', ''),
(42, 'HECS upfront student payments', 'background-color:lightgray;', '', '12121939', '12937509', '12861684', '0', '0', '0', '0', '0'),
(43, 'State Government Grants', '', '5762700', '8483146', '5673379', '4855900', '3798000', '3801000', '3352275', '3353581', '3354920'),
(44, 'State Government Grants', 'background-color:lightgray;', '', '8483146', '5673379', '4855900', '3798000', '3801000', '3352275', '3353581', '3354920'),
(45, 'Research Revenue', 'font-weight:bold;', '40928091', '40771625', '34567413', '37731000', '47297049', '48655778', '49872172', '51118977', '52396951'),
(46, 'Competitive Commonwealth Research Grant', 'background-color:lightgray;', '', '4587520', '-2494140', '4821000', '5857167', '6012972', '6163297', '6317379', '6475314'),
(47, 'Competitive Commonwealth Scheme - ARC', 'background-color:lightgray;', '', '4962478', '6403070', '7325500', '6499135', '6689897', '6857144', '7028573', '7204287'),
(48, 'Competitive Commonwealth Scheme - NHMRC', 'background-color:lightgray;', '', '7859137', '6754208', '8057800', '9727816', '9981279', '10230811', '10486581', '10748745'),
(49, 'Competitive Non-Commonwealth Research', 'background-color:lightgray;', '', '367964', '55051', '330600', '474578', '489831', '502077', '514629', '527494'),
(50, 'Other Public Sector Research Funding - Local', 'background-color:lightgray;', '', '300697', '244110', '845100', '740455', '769991', '789240', '808972', '829196'),
(51, 'Other Public Sector Research Funding - State', 'background-color:lightgray;', '', '3470861', '3681934', '-919300', '4299321', '4459924', '4571422', '4685707', '4802850'),
(52, 'Other Public Sector Research Funding - C''wealth', 'background-color:lightgray;', '', '7791882', '7830885', '4597100', '6368687', '6592328', '6757137', '6926065', '7099217'),
(53, 'International Competitive Research Grants', 'background-color:lightgray;', '', '1810654', '1039956', '1451600', '1548055', '1589503', '1629240', '1669971', '1711720'),
(54, 'International Non-Competitive Research', 'background-color:lightgray;', '', '750070', '505735', '460000', '995483', '1020152', '1045656', '1071797', '1098592'),
(55, 'Cooperative Research Centres', 'background-color:lightgray;', '', '2553025', '2868362', '3514700', '3155671', '3233704', '3314546', '3397410', '3482345'),
(56, 'ARC LIEF Grants/ARC Research Network Scheme', 'background-color:lightgray;', '', '577000', '67000', '-250000', '697826', '709922', '727670', '745862', '764509'),
(57, 'LIEF Industry Contributions', 'background-color:lightgray;', '', '876367', '124000', '97400', '1059882', '1078254', '1105210', '1132841', '1161162'),
(58, 'Industry & Other', 'background-color:lightgray;', '', '4567864', '7346331', '7214700', '5523646', '5671403', '5813188', '5958518', '6107481'),
(59, 'Research Donations and Bequests', 'background-color:lightgray;', '', '296106', '140911', '184800', '349326', '356618', '365534', '374672', '384039'),
(60, 'Student Fees', '', '', '', '', '', '', '', '', '', ''),
(61, 'Continuing Education', '', '13254300', '14225634', '8851962', '1332000', '1434304', '1436487', '1472399', '1509209', '1546939'),
(62, 'Overseas Students - Off-shore', '', '2008100', '4499402', '3273658', '3688000', '4000000', '4333676', '4813857', '4934204', '5057559'),
(63, 'Overseas Students - On-shore', '', '64953800', '81462051', '95950726', '97783000', '95575981', '103548833', '115022281', '117897838', '120845284'),
(64, 'Domestic Postgraduate Students', '', '9852300', '9837018', '11320713', '12814000', '14968070', '17022670', '19713659', '21093615', '22570168'),
(65, 'Domestic Undergraduate Students(Including Savings)', 'font-weight:bold;', '2211500', '1448039', '944381', '755000', '341235', '282832', '243997', '261076', '279352'),
(66, 'Other Course Fees (incl non-awards) (Including Savings)', 'font-weight:bold;', '3856100', '4564087', '4484944', '570000', '495669', '455627', '481532', '515239', '551306'),
(67, 'Total Student Fees', 'font-weight:bold;', '96136100', '116036231', '124826385', '116942000', '116815259', '127080125', '141747725', '146211181', '150850608'),
(68, 'Other Fees and Charges', 'font-weight:bold;', '8376000', '8500092', '8556595', '9016498', '8326781', '8402431', '8674044', '8885620', '9102485'),
(69, 'Parking Fees', 'background-color:lightgray;', '', '1949129', '2169173', '2341101', '2406006', '2466214', '2527869', '2591066', '2655843'),
(70, 'Child Care and Related', 'background-color:lightgray;', '', '1700116', '1898359', '2640608', '2766495', '2673089', '2806743', '2876912', '2948835'),
(71, 'Guild Fees', 'background-color:lightgray;', '', '415173', '404169', '200004', '211000', '211000', '211000', '211000', '211000'),
(72, 'Other ', 'background-color:lightgray;', '', '4435674', '4084894', '3834785', '2943280', '3052128', '3128431', '3206642', '3286808'),
(73, 'Investment Revenue', 'font-weight:bold;', '-194000', '7278897', '8032619', '8007000', '7078900', '6274800', '5620000', '5420000', '6000000'),
(74, 'Investment Income', 'background-color:lightgray;', '', '7278897', '8032619', '8007000', '7078900', '6274800', '5620000', '5420000', '6000000'),
(75, 'Commercial Revenue', 'font-weight:bold;', '37500500', '38790512', '43143470', '42465069', '40915248', '42118190', '44186025', '45290675', '46422942'),
(76, 'Sales', 'background-color:lightgray;', '', '11865919', '16228079', '15039900', '14053158', '14449604', '14810844', '15181115', '15560643'),
(77, 'Accommodation', 'background-color:lightgray;', '', '19748795', '19629744', '20794300', '21401317', '21937978', '23501307', '24088840', '24691061'),
(78, 'Consultancies & Fee for Service (Including Savings)', 'background-color:gold;', '', '7175798', '7285647', '6630869', '5460773', '5730608', '5873873', '6020720', '6171238'),
(79, 'Other Grants and Donations', 'font-weight:bold;', '2594700', '1915606', '2057094', '2970000', '3568150', '4651261', '4767542', '4886731', '5008899'),
(80, 'Donations and Bequests - Non Research', 'background-color:lightgray;', '', '834345', '1003512', '1875100', '2166850', '3220661', '3301177', '3383707', '3468299'),
(81, 'Scholarships and Prizes', 'background-color:lightgray;', '', '875867', '683736', '1058100', '1349300', '1376500', '1410913', '1446185', '1482340'),
(82, 'Other Non Research Grants', 'background-color:lightgray;', '', '205394', '369846', '36800', '52000', '54100', '55453', '56839', '58260'),
(83, 'Other Revenue', '', '10449500', '11447122', '19116467', '12857058', '13930962', '14911612', '16842771', '19069304', '21359479'),
(84, 'Other Revenue', 'background-color:lightgray;', '', '11447122', '11153467', '12857058', '13930962', '14911612', '16842771', '19069304', '21359479'),
(85, 'Deferred Benefits Superannuation', 'background-color:lightgray;', '', '', '7963000', '', '0', '0', '0', '', ''),
(86, 'Total Revenue', 'background-color:lightskyblue;color:darkblue;font-weight:bold;', '480302891', '533244635', '613060525', '606719057', '605394611', '639261898', '679437413', '700030474', '725971400'),
(87, '', '', '', '', '', '', '0', '0', '0', '', ''),
(88, 'Expenses', 'font-weight:bold;', '', '', '', '', '0', '0', '0', '', ''),
(89, ' Academic', '', '153412500', '146506608', '163121506', '171520800', '186884103', '197162729', '208006679', '219447047', '231516634'),
(90, 'Academic', 'background-color:lightgray;', '', '130797656', '142068229', '156668300', '171970448', '181428822', '191407408', '201934815', '213041230'),
(91, 'Casual - Academic  ', 'background-color:lightgray;', '', '15708952', '21053277', '14852500', '14913656', '15733907', '16599271', '17512231', '18475404'),
(92, ' General', '', '140219000', '135623959', '145704943', '144041100', '160610541', '169444120', '178763547', '188595542', '198968297'),
(93, 'General', 'background-color:lightgray;', '', '119540988', '129160972', '134702100', '151123086', '159434856', '168203773', '177454980', '187215004'),
(94, 'Casual - General', 'background-color:lightgray;', '', '16082971', '16543971', '9339000', '9487455', '10009265', '10559774', '11140562', '11753293'),
(95, ' Other', '', '-675500', '9207516', '11550026', '3821900', '5316204', '5608595', '5917068', '6242507', '6585845'),
(96, 'Other salary related', 'background-color:lightgray;', '', '12209715', '1334677', '1739900', '333204', '351530', '370864', '391262', '412781'),
(97, 'Pensions', 'background-color:lightgray;', '', '5526132', '4825546', '1962000', '4983000', '5257065', '5546204', '5851245', '6173063'),
(98, 'Leave adjustments', 'background-color:lightgray;', '', '-8528331', '5389803', '120000', '0', '0', '0', '0', '0'),
(99, 'Total Employee Benefits & On Costs', 'font-weight:bold;', '292956000', '291338083', '320376474', '319383800', '352810848', '372215445', '392687294', '414285096', '437070776'),
(100, 'Infrastructure Related', '', '48374000', '53526125', '58935626', '62949300', '66226058', '67864815', '69561436', '71300472', '73082984'),
(101, 'Occupancy Costs', 'background-color:lightgray;', '', '21479272', '27222796', '26970100', '28924690', '29637040', '30377966', '31137416', '31915851'),
(102, 'Repairs and Maintenance', 'background-color:lightgray;', '', '11979863', '12023249', '16163600', '17562217', '18001329', '18451362', '18912646', '19385462'),
(103, 'Telecommunications', 'background-color:lightgray;', '', '1149303', '1717262', '1654100', '1624198', '1664384', '1705994', '1748644', '1792360'),
(104, 'Computer related', 'background-color:lightgray;', '', '11279765', '11093390', '13276800', '12616889', '12930543', '13253807', '13585152', '13924781'),
(105, 'Equipment Related', 'background-color:lightgray;', '', '7637923', '6878930', '4884700', '5498064', '5631519', '5772307', '5916615', '6064530'),
(106, 'Depreciation', '', '25048000', '26534648', '26489789', '32013800', '34802353', '39834207', '41613575', '44527325', '44856024'),
(107, 'Depreciation', 'background-color:lightgray;', '', '26534648', '26489789', '32013800', '34802353', '39834207', '41613575', '44527325', '44856024'),
(108, 'Professional Fees', '', '21624000', '21858630', '19829382', '18179500', '17648706', '17187987', '17617687', '18058129', '18509582'),
(109, 'Professional Fees', 'background-color:lightgray;', '15438100', '5931040', '5192644', '3426400', '3266874', '3122887', '3200959', '3280983', '3363007'),
(110, 'Consulting', 'background-color:lightgray;', '', '6014085', '7014346', '8523900', '8295221', '7977280', '8176712', '8381130', '8590659'),
(111, 'Agency Commission Fees', 'background-color:lightgray;', '6185900', '', '', '0', '0', '0', '0', '0', '0'),
(112, 'Other fees', 'background-color:lightgray;', '', '9913505', '7622392', '6229200', '6086611', '6087820', '6240016', '6396016', '6555916'),
(113, 'Student Related', '', '2311800', '3164564', '3134209', '4509400', '3650051', '3684191', '3776296', '3870704', '3967471'),
(114, 'Other Student Activities', 'background-color:lightgray;', '', '3164564', '3134209', '4509400', '3650051', '3684191', '3776296', '3870704', '3967471'),
(115, ' Scholarships and stipends', '', '11366000', '20945109', '24195480', '24565800', '24476919', '23959247', '24439844', '23957577', '23575880'),
(116, 'Scholarships and stipends', 'background-color:lightgray;', '', '20945109', '24195480', '24565800', '24476919', '23959247', '24439844', '23957577', '23575880'),
(117, ' Teaching practice and clinical placement', '', '1111276', '2156350', '5132032', '5890300', '7308708', '7763300', '7957383', '8156317', '8360225'),
(118, 'Teaching practice and clinical placement', 'background-color:lightgray;', '', '2156350', '5132032', '5890300', '7308708', '7763300', '7957383', '8156317', '8360225'),
(119, 'General Operating', '', '29011800', '32478146', '35413742', '36656800', '38546526', '38335977', '39294376', '40276736', '41283654'),
(120, 'Materials and Lab supplies', 'background-color:lightgray;', '', '5727954', '6569882', '7188900', '8711225', '9009920', '9235168', '9466047', '9702698'),
(121, 'Subscriptions and Contributions', 'background-color:lightgray;', '', '8352152', '8894632', '9147200', '8593469', '8608358', '8823567', '9044156', '9270260'),
(122, 'Motor Vehicles', 'background-color:lightgray;', '', '441284', '524283', '699800', '534928', '564655', '578771', '593240', '608071'),
(123, 'Advertising and Promotions', 'background-color:lightgray;', '', '5371390', '6429038', '5619500', '6633541', '5638771', '5779741', '5924234', '6072340'),
(124, 'Postage', 'background-color:lightgray;', '', '1133806', '1240503', '1318900', '1238045', '1241974', '1273024', '1304849', '1337471'),
(125, 'Books and Periodicals', 'background-color:lightgray;', '', '5251224', '6423837', '6266700', '6148698', '6533164', '6696494', '6863906', '7035504'),
(126, 'Printing', 'background-color:lightgray;', '', '4870351', '4852661', '4555400', '3831631', '3883926', '3981025', '4080550', '4182564'),
(127, 'Insurance', 'background-color:lightgray;', '', '1329985', '478906', '1860400', '2854990', '2855207', '2926588', '2999752', '3074746'),
(128, 'Staff Related', '', '13069600', '12860101', '13778298', '13933400', '14817381', '14980701', '15355218', '15739098', '16132576'),
(129, 'Travel ', 'background-color:lightgray;', '', '4647313', '5032087', '4404100', '5102414', '5116280', '5244187', '5375292', '5509674'),
(130, 'Accommodation', 'background-color:lightgray;', '', '4704569', '4742392', '3854300', '3904043', '3880952', '3977976', '4077425', '4179361'),
(131, 'Entertainment', 'background-color:lightgray;', '', '899318', '918657', '1079600', '1005171', '1006028', '1031179', '1056958', '1083382'),
(132, 'Staff Development and Training', 'background-color:lightgray;', '', '2608902', '3085163', '4595400', '4805754', '4977441', '5101877', '5229424', '5360159'),
(133, 'Financing Costs', '', '1752500', '3496112', '3212736', '2889900', '2878836', '2884019', '2956120', '3030023', '3105773'),
(134, 'Financing Costs', 'background-color:lightgray;', '', '3496112', '3212736', '2889900', '2878836', '2884019', '2956120', '3030023', '3105773'),
(135, 'Cost of Goods Sold', '', '8514500', '4396393', '4508126', '3761300', '3245835', '3871128', '3967907', '4067104', '4168782'),
(136, 'Cost of Goods sold', 'background-color:lightgray;', '', '4396393', '4508126', '3761300', '3245835', '3871128', '3967907', '4067104', '4168782'),
(137, 'Other Expenses', '', '6359500', '7507998', '13973499', '14068900', '27445228', '29418357', '38514501', '47465822', '56757294'),
(138, 'Other Expenses', 'background-color:lightgray;', '', '7507998', '6216063', '14068900', '27445228', '29418357', '38514501', '47465822', '56757294'),
(139, 'Deferred Benefits Superannuation', 'background-color:lightgray;', '', '', '7757437', '', '0', '0', '0', '', ''),
(140, 'Profit/Loss on Disposal of Assets', '', '801900', '-5737', '-8979956', '567600', '-183504', '-188091', '-192793', '-197613', '-202554'),
(141, 'Profit/Loss on Disposal of Assets', 'background-color:lightgray;', '', '-5737', '-8979956', '567600', '-183504', '-188091', '-192793', '-197613', '-202554'),
(142, 'Total Expenses', 'background-color:lightskyblue;color:darkblue;font-weight:bold;', '462300876', '480256523', '519999438', '539369800', '593673944', '621811284', '657548843', '694536789', '730668467'),
(143, '', '', '', '', '', '', '', '', '', '', ''),
(144, 'Net Operating Result', 'background-color:lightskyblue;color:darkblue;font-weight:bold;', '18002015', '52988112', '93061087', '67349257', '11720666', '17450614', '21888570', '5493685', '-4697067'),
(145, '', '', '', '', '', '', '', '', '', '', ''),
(146, 'Abnormal Items Adjustment', 'font-weight:bold;', '', '', '', '', '', '', '', '', ''),
(147, 'Less: Capital Development Grants/WPP', '', '17491000', '-27307000', '-65356000', '-50020000', '-7600000', '', '', '', ''),
(148, 'Add: Cost of Redundancies', '', '17153300', '1960000', '3684647', '0', '', '', '', '', ''),
(149, 'Less: Costs Associated with Argus', '', '0', '0', '-9553000', '0', '', '', '', '', ''),
(150, 'Add: Debt Redemption', '', '5004000', '5004000', '5004000', '5004000', '5004000', '5004000', '2502000', '', ''),
(151, 'Less: Write-down of student system', '', '0', '0', '', '', '', '', '', '', ''),
(152, 'Less: Additional Commonwealth Grants', '', '0', '0', '', '', '', '', '', '', ''),
(153, 'Underlying Net Operating Result ', 'background-color:lightskyblue;color:darkblue;font-weight:bold;', '22668315', '32645112', '26840734', '22333257', '9124666', '22454614', '24390570', '5493685', '-4697067'),
(154, '', '', '', '', '', '', '', '', '', '', ''),
(155, 'Underlying Operating Margin', 'background-color:lightskyblue;color:darkblue;font-weight:bold;', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `i2`
--

CREATE TABLE IF NOT EXISTS `i2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `type_estudent` varchar(300) NOT NULL,
  `faculty` varchar(300) NOT NULL,
  `target` double NOT NULL,
  `projection` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `i2`
--

INSERT INTO `i2` (`id`, `year`, `type_estudent`, `faculty`, `target`, `projection`) VALUES
(2, 2012, 'Commonwealth Supported ', 'Faculty of Education', 11061292.0779919, 11345765.9799198),
(3, 2012, 'Commonwealth Supported ', 'Faculty of Health Sciences', 36639853.0651859, 37166465.013557),
(4, 2012, 'Commonwealth Supported ', 'Faculty of Humanities & Social Sciences', 26198401.3054798, 23131663.4573924),
(5, 2012, 'Commonwealth Supported ', 'Faculty of Law and Management', 29031061.2905293, 31619698.3125086),
(6, 2012, 'Commonwealth Supported ', 'Faculty of Science, Technology & Engineering', 20614275.5202251, 19450138.8137616),
(7, 2013, 'Commonwealth Supported ', 'Faculty of Education', 12076111.4512649, 12554461.2234221),
(8, 2013, 'Commonwealth Supported ', 'Faculty of Health Sciences', 38564918.2119516, 39028381.4814929),
(9, 2013, 'Commonwealth Supported ', 'Faculty of Humanities & Social Sciences', 29433314.060813, 26124471.5197029),
(10, 2013, 'Commonwealth Supported ', 'Faculty of Law and Management', 31414052.9003884, 35004133.3904759),
(11, 2013, 'Commonwealth Supported ', 'Faculty of Science, Technology & Engineering', 22188577.8127863, 21354427.9498188),
(12, 2014, 'Commonwealth Supported ', 'Faculty of Education', 13531388.8260301, 11812110.2234221),
(13, 2014, 'Commonwealth Supported ', 'Faculty of Health Sciences', 42654933.089915, 35768930.013557),
(14, 2014, 'Commonwealth Supported ', 'Faculty of Humanities & Social Sciences', 29283937.6136883, 28675432.457392),
(15, 2014, 'Commonwealth Supported ', 'Faculty of Law and Management', 38213430.7627549, 41098781.4814929),
(16, 2014, 'Commonwealth Supported ', 'Faculty of Science, Technology & Engineering', 22931385.673888, 23590897.9498188),
(17, 2015, 'Commonwealth Supported ', 'Faculty of Education', 12675110.223422, 13411190.223426),
(18, 2015, 'Commonwealth Supported ', 'Faculty of Health Sciences', 37608950.013557, 38341230.7628954),
(19, 2015, 'Commonwealth Supported ', 'Faculty of Humanities & Social Sciences', 27009532.455562, 27205309.457392),
(20, 2015, 'Commonwealth Supported ', 'Faculty of Law and Management', 40897614.814929, 40678781.4814929),
(21, 2015, 'Commonwealth Supported ', 'Faculty of Science, Technology & Engineering', 23770897.99888, 20563880.78789),
(22, 2016, 'Commonwealth Supported ', 'Faculty of Education', 13015660.2234221, 14567801.223),
(23, 2016, 'Commonwealth Supported ', 'Faculty of Health Sciences', 43089704.814929, 46076650.4814929),
(24, 2016, 'Commonwealth Supported ', 'Faculty of Humanities & Social Sciences', 29896324.5562, 30789890.5562),
(25, 2016, 'Commonwealth Supported ', 'Faculty of Law and Management', 42151714.814929, 39886787.48149),
(26, 2016, 'Commonwealth Supported ', 'Faculty of Science, Technology & Engineering', 23664789.99888, 23556789.99888),
(27, 2012, 'International Fees Onshore', 'Faculty of Education', 4256680.55446707, 4155523.24503297),
(28, 2012, 'International Fees Onshore', 'Faculty of Health Sciences', 12086616.5236418, 10470043.3012154),
(29, 2012, 'International Fees Onshore', 'Faculty of Humanities & Social Sciences', 7383976.90727337, 6899827.31890505),
(30, 2012, 'International Fees Onshore', 'Faculty of Law and Management', 63963750.9761937, 56278907.1360107),
(31, 2012, 'International Fees Onshore', 'Faculty of Science, Technology & Engineering', 11615376.1813055, 17769160.6391878),
(32, 2012, 'International Fees Onshore', 'Research Division', 33297.8470917334, 2519.463618873),
(33, 2013, 'International Fees Onshore', 'Faculty of Education', 4246283.41678306, 4259643.97251671),
(34, 2013, 'International Fees Onshore', 'Faculty of Health Sciences', 12648188.3442403, 11164687.4161076),
(35, 2013, 'International Fees Onshore', 'Faculty of Humanities & Social Sciences', 8970207.86469254, 8533529.90328032),
(36, 2013, 'International Fees Onshore', 'Faculty of Law and Management', 67672609.9109651, 59406623.9181723),
(37, 2013, 'International Fees Onshore', 'Faculty of Science, Technology & Engineering', 11835464.1612952, 20180833.8368192),
(38, 2013, 'International Fees Onshore', 'Research Division', 37866.8777886989, 3514.0014367423),
(39, 2014, 'International Fees Onshore', 'Faculty of Education', 4416226.64337715, 4200023.24503297),
(40, 2014, 'International Fees Onshore', 'Faculty of Health Sciences', 12005875.5898895, 11988687.4161076),
(41, 2014, 'International Fees Onshore', 'Faculty of Humanities & Social Sciences', 10469095.2906817, 10000000),
(42, 2014, 'International Fees Onshore', 'Faculty of Law and Management', 64191029.8610341, 63000000),
(43, 2014, 'International Fees Onshore', 'Faculty of Science, Technology & Engineering', 23935496.3223559, 23000000),
(44, 2014, 'International Fees Onshore', 'Research Division', 4557.3529268053, 5112),
(45, 2015, 'International Fees Onshore', 'Faculty of Education', 4857849.30771486, 5040027.89403956),
(46, 2015, 'International Fees Onshore', 'Faculty of Health Sciences', 13206463.1488785, 14386424.8993291),
(47, 2015, 'International Fees Onshore', 'Faculty of Humanities & Social Sciences', 11516004.8197499, 12000000),
(48, 2015, 'International Fees Onshore', 'Faculty of Law and Management', 70610132.8471375, 75600000),
(49, 2015, 'International Fees Onshore', 'Faculty of Science, Technology & Engineering', 26329045.9545914, 27600000),
(50, 2015, 'International Fees Onshore', 'Research Division', 5013.0882194858, 6134.4),
(51, 2016, 'International Fees Onshore', 'Faculty of Education', 5343634.23848635, 6048033.47284748),
(52, 2016, 'International Fees Onshore', 'Faculty of Health Sciences', 14527109.4637663, 17263709.8791949),
(53, 2016, 'International Fees Onshore', 'Faculty of Humanities & Social Sciences', 12667605.3017248, 14400000),
(54, 2016, 'International Fees Onshore', 'Faculty of Law and Management', 77671146.1318512, 90720000),
(55, 2016, 'International Fees Onshore', 'Faculty of Science, Technology & Engineering', 28961950.5500506, 33120000),
(56, 2015, 'International Fees Onshore', 'Research Division', 5514.3970414344, 7361.28),
(57, 2012, 'MS', 'Faculty of Education', 21454.0088715125, 2952.0698729445),
(58, 2012, 'MS', 'Faculty of Health Sciences', 43330.5741685899, 129197.897753617),
(59, 2012, 'MS', 'Faculty of Humanities & Social Sciences', 408200.06827439, 253297.643634478),
(60, 2012, 'MS', 'Faculty of Law and Management', 31619.8598145779, 21590.4638152942),
(61, 2012, 'MS', 'Faculty of Science, Technology & Engineering', 41288.5644101911, 27131.2736997961),
(62, 2013, 'MS', 'Faculty of Education', 22523.3033150882, 3129.1940653211),
(63, 2013, 'MS', 'Faculty of Health Sciences', 45485.1754601557, 136949.771618834),
(64, 2013, 'MS', 'Faculty of Humanities & Social Sciences', 420707.136230042, 263902.673311288),
(65, 2013, 'MS', 'Faculty of Law and Management', 33194.8646299068, 22885.8916442118),
(66, 2013, 'MS', 'Faculty of Science, Technology & Engineering', 43286.9113697361, 28759.1501217839),
(67, 2014, 'MS', 'Faculty of Education', 3316.9457092404, 3542.4838475334),
(68, 2014, 'MS', 'Faculty of Health Sciences', 145166.757915964, 155037.47730434),
(69, 2014, 'MS', 'Faculty of Humanities & Social Sciences', 278304.546687379, 303957.172361374),
(70, 2014, 'MS', 'Faculty of Law and Management', 24259.0451428645, 25908.556578353),
(71, 2014, 'MS', 'Faculty of Science, Technology & Engineering', 30484.6991290909, 32557.5284397554),
(72, 2015, 'MS', 'Faculty of Education', 21454.0088715125, 4250.98061704),
(73, 2015, 'MS', 'Faculty of Health Sciences', 43330.5741685899, 186044.972765208),
(74, 2015, 'MS', 'Faculty of Humanities & Social Sciences', 408200.06827439, 364748.606833649),
(75, 2015, 'MS', 'Faculty of Law and Management', 31619.8598145779, 31090.2678940236),
(76, 2015, 'MS', 'Faculty of Science, Technology & Engineering', 41288.5644101911, 39069.0341277064),
(77, 2016, 'MS', 'Faculty of Education', 22523.3033150882, 5101.1767404481),
(78, 2016, 'MS', 'Faculty of Health Sciences', 45485.1754601557, 223253.967318249),
(79, 2016, 'MS', 'Faculty of Humanities & Social Sciences', 420707.136230042, 437698.328200378),
(80, 2016, 'MS', 'Faculty of Law and Management', 33194.8646299068, 37308.3214728283),
(81, 2016, 'MS', 'Faculty of Science, Technology & Engineering', 43286.9113697361, 46882.8409532477),
(82, 2012, 'PG', 'Faculty of Education', 3294800.72628989, 1898782.01056386),
(83, 2012, 'PG', 'Faculty of Health Sciences', 7954783.38363737, 8699792.43327566),
(84, 2012, 'PG', 'Faculty of Humanities & Social Sciences', 1879458.10105833, 1456737.97696122),
(85, 2012, 'PG', 'Faculty of Law and Management', 2801662.11743683, 2368348.84101632),
(86, 2012, 'PG', 'Faculty of Science, Technology & Engineering', 642272.746614655, 544408.645749108),
(87, 2013, 'PG', 'Faculty of Education', 3545192.07109965, 1994259.09099077),
(88, 2013, 'PG', 'Faculty of Health Sciences', 9151673.46438184, 10108005.4435661),
(89, 2013, 'PG', 'Faculty of Humanities & Social Sciences', 2333457.66352344, 1831882.55473248),
(90, 2013, 'PG', 'Faculty of Law and Management', 2942241.74521543, 2491478.17074089),
(91, 2013, 'PG', 'Faculty of Science, Technology & Engineering', 745568.60186972, 597044.588817038),
(92, 2014, 'PG', 'Faculty of Education', 2149666.38218754, 2364633.02040629),
(93, 2014, 'PG', 'Faculty of Health Sciences', 12088448.2308644, 13297293.0539509),
(94, 2014, 'PG', 'Faculty of Humanities & Social Sciences', 2120092.64331653, 2332101.90764818),
(95, 2014, 'PG', 'Faculty of Law and Management', 2695013.7102725, 2964515.08129975),
(96, 2014, 'PG', 'Faculty of Science, Technology & Engineering', 660438.138118576, 726481.951930433),
(97, 2015, 'PG', 'Faculty of Education', 3294800.72628989, 2837559.62448755),
(98, 2015, 'PG', 'Faculty of Health Sciences', 7954783.38363737, 15956751.6647411),
(99, 2015, 'PG', 'Faculty of Humanities & Social Sciences', 1879458.10105833, 2798522.28917781),
(100, 2015, 'PG', 'Faculty of Law and Management', 2801662.11743683, 3557418.0975597),
(101, 2015, 'PG', 'Faculty of Science, Technology & Engineering', 642272.746614655, 871778.34231652),
(102, 2016, 'PG', 'Faculty of Education', 3545192.07109965, 4254230.48531958),
(103, 2016, 'PG', 'Faculty of Health Sciences', 9151673.46438184, 10982008.1572582),
(104, 2016, 'PG', 'Faculty of Humanities & Social Sciences', 2333457.66352344, 2800149.19622813),
(105, 2016, 'PG', 'Faculty of Law and Management', 2942241.74521543, 3530690.09425851),
(106, 2016, 'PG', 'Faculty of Science, Technology & Engineering', 745568.60186972, 894682.322243664),
(107, 2012, 'UG', 'Faculty of Education', 9283.4538529153, 43682.5941820446),
(108, 2012, 'UG', 'Faculty of Health Sciences', 3705.6736083693, 28173.5739544211),
(109, 2012, 'UG', 'Faculty of Humanities & Social Sciences', 50306.5609818166, 33931.901036703),
(110, 2012, 'UG', 'Faculty of Law and Management', 386534.521742875, 220013.413390762),
(111, 2012, 'UG', 'Faculty of Science, Technology & Engineering', 266.6601194232, 15433.1672870573),
(112, 2013, 'UG', 'Faculty of Education', 15.5336191022, 30875.2355612833),
(113, 2013, 'UG', 'Faculty of Health Sciences', 0, 19146.0806491562),
(114, 2013, 'UG', 'Faculty of Humanities & Social Sciences', 706.6227716379, 33444.6484215398),
(115, 2013, 'UG', 'Faculty of Law and Management', 88952.4589152721, 185713.529530809),
(116, 2013, 'UG', 'Faculty of Science, Technology & Engineering', 7.0693591013, 13652.9360921145),
(117, 2014, 'UG', 'Faculty of Education', 22887.1090412833, 37050.28267354),
(118, 2014, 'UG', 'Faculty of Health Sciences', 13011.2141546908, 22975.2967789874),
(119, 2014, 'UG', 'Faculty of Humanities & Social Sciences', 33088.3368780206, 40133.5781058478),
(120, 2014, 'UG', 'Faculty of Law and Management', 161877.623719805, 222856.235436971),
(121, 2014, 'UG', 'Faculty of Science, Technology & Engineering', 13132.2430768047, 16383.5233105373),
(122, 2015, 'UG', 'Faculty of Education', 25175.8199454116, 44460.339208248),
(123, 2015, 'UG', 'Faculty of Health Sciences', 14312.3355701599, 27570.3561347849),
(124, 2015, 'UG', 'Faculty of Humanities & Social Sciences', 36397.1705658227, 48160.2937270174),
(125, 2015, 'UG', 'Faculty of Law and Management', 178065.386091786, 267427.482524365),
(126, 2015, 'UG', 'Faculty of Science, Technology & Engineering', 14445.4673844851, 19660.2279726448),
(127, 2016, 'UG', 'Faculty of Education', 27693.4019399528, 53352.4070498976),
(128, 2016, 'UG', 'Faculty of Health Sciences', 15743.5691271759, 33084.4273617419),
(129, 2016, 'UG', 'Faculty of Humanities & Social Sciences', 40036.887622405, 57792.3524724209),
(130, 2016, 'UG', 'Faculty of Law and Management', 195871.924700964, 320912.979029238),
(131, 2016, 'UG', 'Faculty of Science, Technology & Engineering', 15890.0141229337, 23592.2735671738);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `email`, `password`, `tipo`) VALUES
(1, 'Axel', 'axel@mail.com', '123', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
