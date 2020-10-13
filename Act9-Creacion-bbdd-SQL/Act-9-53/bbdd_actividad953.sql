-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2020 a las 22:07:00
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
-- Base de datos: `bbdd_actividad953`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisario`
--

CREATE TABLE `comisario` (
  `nif_comisario` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tlfno` int(12) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `codigo_evento` int(7) NOT NULL,
  `equipamento` varchar(200) NOT NULL,
  `num_comisarios` int(3) NOT NULL,
  `num_participantes` int(5) NOT NULL,
  `duracion` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `nif_comis` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participan`
--

CREATE TABLE `participan` (
  `cod_evento` int(7) NOT NULL,
  `nif_comis` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polideportivo`
--

CREATE TABLE `polideportivo` (
  `codigo_complejo` int(5) NOT NULL,
  `area` float(7,2) NOT NULL,
  `jefe` varchar(20) NOT NULL,
  `localizacion` varchar(30) NOT NULL,
  `info` varchar(200) NOT NULL,
  `cod_sede` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `codigo_sede` int(5) NOT NULL,
  `presupuesto` float(6,2) NOT NULL,
  `num_complejos` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unideportivo`
--

CREATE TABLE `unideportivo` (
  `codigo_complejo` int(5) NOT NULL,
  `area` float(7,2) NOT NULL,
  `jefe` varchar(20) NOT NULL,
  `localizacion` varchar(30) NOT NULL,
  `info` varchar(200) NOT NULL,
  `cod_sede` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comisario`
--
ALTER TABLE `comisario`
  ADD PRIMARY KEY (`nif_comisario`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`codigo_evento`),
  ADD KEY `nif_comis` (`nif_comis`);

--
-- Indices de la tabla `participan`
--
ALTER TABLE `participan`
  ADD PRIMARY KEY (`cod_evento`,`nif_comis`),
  ADD KEY `nif_comis` (`nif_comis`);

--
-- Indices de la tabla `polideportivo`
--
ALTER TABLE `polideportivo`
  ADD PRIMARY KEY (`codigo_complejo`),
  ADD KEY `cod_sede` (`cod_sede`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`codigo_sede`);

--
-- Indices de la tabla `unideportivo`
--
ALTER TABLE `unideportivo`
  ADD PRIMARY KEY (`codigo_complejo`),
  ADD KEY `cod_sede` (`cod_sede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `codigo_evento` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `participan`
--
ALTER TABLE `participan`
  MODIFY `cod_evento` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `polideportivo`
--
ALTER TABLE `polideportivo`
  MODIFY `codigo_complejo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `codigo_sede` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unideportivo`
--
ALTER TABLE `unideportivo`
  MODIFY `codigo_complejo` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`nif_comis`) REFERENCES `comisario` (`nif_comisario`);

--
-- Filtros para la tabla `participan`
--
ALTER TABLE `participan`
  ADD CONSTRAINT `participan_ibfk_1` FOREIGN KEY (`cod_evento`) REFERENCES `evento` (`codigo_evento`),
  ADD CONSTRAINT `participan_ibfk_2` FOREIGN KEY (`nif_comis`) REFERENCES `comisario` (`nif_comisario`);

--
-- Filtros para la tabla `polideportivo`
--
ALTER TABLE `polideportivo`
  ADD CONSTRAINT `polideportivo_ibfk_1` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`codigo_sede`);

--
-- Filtros para la tabla `unideportivo`
--
ALTER TABLE `unideportivo`
  ADD CONSTRAINT `unideportivo_ibfk_1` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`codigo_sede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
