-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2020 a las 16:10:39
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbdd_actividad9`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `provincia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coche_nuevo`
--

CREATE TABLE `coche_nuevo` (
  `matricula` varchar(7) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `color` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `fecha_fabricacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coche_usado`
--

CREATE TABLE `coche_usado` (
  `matricula_usado` varchar(7) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `color` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `num_km` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `dni_mec` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` float(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparar`
--

CREATE TABLE `reparar` (
  `matricula` varchar(7) NOT NULL,
  `dni_mecanico` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `coche_nuevo`
--
ALTER TABLE `coche_nuevo`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `coche_usado`
--
ALTER TABLE `coche_usado`
  ADD PRIMARY KEY (`matricula_usado`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`dni_mec`);

--
-- Indices de la tabla `reparar`
--
ALTER TABLE `reparar`
  ADD PRIMARY KEY (`matricula`,`dni_mecanico`),
  ADD KEY `dni_mecanico` (`dni_mecanico`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reparar`
--
ALTER TABLE `reparar`
  ADD CONSTRAINT `reparar_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `coche_usado` (`matricula_usado`),
  ADD CONSTRAINT `reparar_ibfk_2` FOREIGN KEY (`dni_mecanico`) REFERENCES `mecanico` (`dni_mec`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
