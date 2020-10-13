-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2020 a las 22:52:38
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
-- Base de datos: `bbdd_actividad973`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `codigo_curso` int(5) NOT NULL,
  `programa` varchar(100) NOT NULL,
  `horas` int(5) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `dni_preofe` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desempleado`
--

CREATE TABLE `desempleado` (
  `nif_desempleado` varchar(9) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tlfno` int(12) NOT NULL,
  `edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `dni_profesor` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `tlfno` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `numero_curso` int(5) NOT NULL,
  `nota` int(5) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `cod_curso` int(5) NOT NULL,
  `dni_alumno` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `nif_trabajador` varchar(9) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tlfno` int(12) NOT NULL,
  `edad` int(3) NOT NULL,
  `cif` varchar(9) NOT NULL,
  `nombre_empresa` varchar(30) NOT NULL,
  `tlfno_empresa` int(12) NOT NULL,
  `direccion_empresa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`codigo_curso`),
  ADD KEY `dni_preofe` (`dni_preofe`);

--
-- Indices de la tabla `desempleado`
--
ALTER TABLE `desempleado`
  ADD PRIMARY KEY (`nif_desempleado`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`dni_profesor`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`numero_curso`,`cod_curso`,`dni_alumno`),
  ADD KEY `cod_curso` (`cod_curso`),
  ADD KEY `dni_alumno` (`dni_alumno`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`nif_trabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `codigo_curso` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `realiza`
--
ALTER TABLE `realiza`
  MODIFY `numero_curso` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`dni_preofe`) REFERENCES `profesor` (`dni_profesor`);

--
-- Filtros para la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`codigo_curso`),
  ADD CONSTRAINT `realiza_ibfk_2` FOREIGN KEY (`dni_alumno`) REFERENCES `trabajador` (`nif_trabajador`),
  ADD CONSTRAINT `realiza_ibfk_3` FOREIGN KEY (`dni_alumno`) REFERENCES `desempleado` (`nif_desempleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
