-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2020 a las 00:07:36
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
-- Base de datos: `bbdd_actividad993`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accidente`
--

CREATE TABLE `accidente` (
  `nombre` varchar(30) NOT NULL,
  `pos_x` double NOT NULL,
  `pos_y` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estar`
--

CREATE TABLE `estar` (
  `nombre_pais` varchar(30) NOT NULL,
  `nombre_accid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lago`
--

CREATE TABLE `lago` (
  `extension` float(4,2) NOT NULL,
  `nombre_accidente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `codigo` int(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `nom_pais` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `montania`
--

CREATE TABLE `montania` (
  `altura` float(4,2) NOT NULL,
  `nombre_accidente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `nombre` varchar(30) NOT NULL,
  `extension` float(4,2) NOT NULL,
  `poblacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasar`
--

CREATE TABLE `pasar` (
  `nombre_rio` varchar(30) NOT NULL,
  `cod_localidad` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rio`
--

CREATE TABLE `rio` (
  `longitud` float(4,2) NOT NULL,
  `nombre_accidente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estar`
--
ALTER TABLE `estar`
  ADD PRIMARY KEY (`nombre_pais`,`nombre_accid`),
  ADD KEY `nombre_accid` (`nombre_accid`);

--
-- Indices de la tabla `lago`
--
ALTER TABLE `lago`
  ADD PRIMARY KEY (`nombre_accidente`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `nom_pais` (`nom_pais`);

--
-- Indices de la tabla `montania`
--
ALTER TABLE `montania`
  ADD PRIMARY KEY (`nombre_accidente`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `pasar`
--
ALTER TABLE `pasar`
  ADD PRIMARY KEY (`nombre_rio`,`cod_localidad`),
  ADD KEY `cod_localidad` (`cod_localidad`);

--
-- Indices de la tabla `rio`
--
ALTER TABLE `rio`
  ADD PRIMARY KEY (`nombre_accidente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estar`
--
ALTER TABLE `estar`
  ADD CONSTRAINT `estar_ibfk_1` FOREIGN KEY (`nombre_pais`) REFERENCES `pais` (`nombre`),
  ADD CONSTRAINT `estar_ibfk_2` FOREIGN KEY (`nombre_accid`) REFERENCES `accidente` (`nombre`);

--
-- Filtros para la tabla `lago`
--
ALTER TABLE `lago`
  ADD CONSTRAINT `lago_ibfk_1` FOREIGN KEY (`nombre_accidente`) REFERENCES `accidente` (`nombre`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`nom_pais`) REFERENCES `pais` (`nombre`);

--
-- Filtros para la tabla `montania`
--
ALTER TABLE `montania`
  ADD CONSTRAINT `montania_ibfk_1` FOREIGN KEY (`nombre_accidente`) REFERENCES `accidente` (`nombre`);

--
-- Filtros para la tabla `pasar`
--
ALTER TABLE `pasar`
  ADD CONSTRAINT `pasar_ibfk_1` FOREIGN KEY (`nombre_rio`) REFERENCES `accidente` (`nombre`),
  ADD CONSTRAINT `pasar_ibfk_2` FOREIGN KEY (`cod_localidad`) REFERENCES `localidad` (`codigo`);

--
-- Filtros para la tabla `rio`
--
ALTER TABLE `rio`
  ADD CONSTRAINT `rio_ibfk_1` FOREIGN KEY (`nombre_accidente`) REFERENCES `accidente` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
