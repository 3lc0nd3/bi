-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-08-2016 a las 03:08:23
-- Versión del servidor: 5.7.13-0ubuntu0.16.04.2
-- Versión de PHP: 7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i1`
--

CREATE TABLE `i1` (
  `id` int(11) NOT NULL,
  `a2008` varchar(255) DEFAULT NULL,
  `a2009` varchar(255) DEFAULT NULL,
  `a2010` varchar(255) DEFAULT NULL,
  `a2011` varchar(255) DEFAULT NULL,
  `a2012` varchar(255) DEFAULT NULL,
  `a2013` varchar(255) DEFAULT NULL,
  `a2014` varchar(255) DEFAULT NULL,
  `a2015` varchar(255) DEFAULT NULL,
  `a2016` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `i1`
--

INSERT INTO `i1` (`id`, `a2008`, `a2009`, `a2010`, `a2011`, `a2012`, `a2013`, `a2014`, `a2015`, `a2016`, `item`, `style`) VALUES
(1, '1', '2', '3', '4', '5', '6', '7', '8', '9', '56', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i2`
--

CREATE TABLE `i2` (
  `id` int(11) NOT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `projection` double DEFAULT NULL,
  `target` double DEFAULT NULL,
  `type_estudent` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i3_calculado`
--

CREATE TABLE `i3_calculado` (
  `id` int(11) NOT NULL,
  `net_operating_result` double DEFAULT NULL,
  `total_expenses` double DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `i3_calculado`
--

INSERT INTO `i3_calculado` (`id`, `net_operating_result`, `total_expenses`, `total_revenue`, `year`) VALUES
(1, 2, 3, 4, 2012),
(2, 3, 4, 5, 2013);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i4`
--

CREATE TABLE `i4` (
  `id` int(11) NOT NULL,
  `a2011` int(11) DEFAULT NULL,
  `a2012` int(11) DEFAULT NULL,
  `a2013` int(11) DEFAULT NULL,
  `capital_expenditure` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i6`
--

CREATE TABLE `i6` (
  `id` int(11) NOT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `total_staff_cost` double DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i7`
--

CREATE TABLE `i7` (
  `id` int(11) NOT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `total_academic_staff_costs` double DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i8`
--

CREATE TABLE `i8` (
  `id` int(11) NOT NULL,
  `current_assets` double DEFAULT NULL,
  `current_liabilities` double DEFAULT NULL,
  `international_revenue` double DEFAULT NULL,
  `net_operating_result` double DEFAULT NULL,
  `sector_international_evenue` double DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `total_staff_costs` double DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i8_calculado`
--

CREATE TABLE `i8_calculado` (
  `id` int(11) NOT NULL,
  `a_year` int(11) DEFAULT NULL,
  `b_operating_margin` double DEFAULT NULL,
  `c_net_operating_result` double DEFAULT NULL,
  `d_total_revenue` double DEFAULT NULL,
  `e_revenue_earned_per_staff_dollar` double DEFAULT NULL,
  `f_total_staff_costs` double DEFAULT NULL,
  `g_international_revenue_of_a_perc_of_total_revenue` double DEFAULT NULL,
  `h_international_revenue` double DEFAULT NULL,
  `i_per_of_market_share_of_international_revenue` double DEFAULT NULL,
  `j_sector_international_evenue` double DEFAULT NULL,
  `k_liquidity_ration` double DEFAULT NULL,
  `l_current_assets` double DEFAULT NULL,
  `m_current_liabilities` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `o4_calculado`
--

CREATE TABLE `o4_calculado` (
  `id` int(11) NOT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `net_operating_result` double DEFAULT NULL,
  `operating_marging` double DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `i1`
--
ALTER TABLE `i1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i2`
--
ALTER TABLE `i2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i3_calculado`
--
ALTER TABLE `i3_calculado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i4`
--
ALTER TABLE `i4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i6`
--
ALTER TABLE `i6`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i7`
--
ALTER TABLE `i7`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i8`
--
ALTER TABLE `i8`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `i8_calculado`
--
ALTER TABLE `i8_calculado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `o4_calculado`
--
ALTER TABLE `o4_calculado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
