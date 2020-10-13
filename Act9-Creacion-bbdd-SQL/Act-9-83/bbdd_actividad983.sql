-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2020 a las 23:26:48
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
-- Base de datos: `bbdd_actividad983`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `nombre` varchar(30) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `codigo_autor` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd`
--

CREATE TABLE `cd` (
  `nombre` varchar(30) NOT NULL,
  `anio` int(4) NOT NULL,
  `resumen` varchar(200) NOT NULL,
  `num_canciones` int(3) NOT NULL,
  `isbn` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crear`
--

CREATE TABLE `crear` (
  `cod_autor` int(5) NOT NULL,
  `isbn_articulo` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `codigo_ejemplar` int(5) NOT NULL,
  `deteriorado` bit(1) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `isbn_ejemplar` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `nombre` varchar(30) NOT NULL,
  `anio` int(4) NOT NULL,
  `resumen` varchar(200) NOT NULL,
  `num_paginas` int(4) NOT NULL,
  `isbn` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `nombre` varchar(30) NOT NULL,
  `anio` int(4) NOT NULL,
  `resumen` varchar(200) NOT NULL,
  `duracion` int(3) NOT NULL,
  `isbn` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestar`
--

CREATE TABLE `prestar` (
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `fecha_tope` date NOT NULL,
  `cod_socio` int(5) NOT NULL,
  `cod_ejemplar` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `dni` varchar(9) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `tlfno` int(12) NOT NULL,
  `codigo_socio` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`codigo_autor`);

--
-- Indices de la tabla `cd`
--
ALTER TABLE `cd`
  ADD PRIMARY KEY (`isbn`);

--
-- Indices de la tabla `crear`
--
ALTER TABLE `crear`
  ADD PRIMARY KEY (`cod_autor`,`isbn_articulo`),
  ADD KEY `isbn_articulo` (`isbn_articulo`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`codigo_ejemplar`),
  ADD KEY `isbn_ejemplar` (`isbn_ejemplar`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`isbn`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`isbn`);

--
-- Indices de la tabla `prestar`
--
ALTER TABLE `prestar`
  ADD PRIMARY KEY (`cod_socio`,`cod_ejemplar`),
  ADD KEY `cod_ejemplar` (`cod_ejemplar`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`codigo_socio`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `codigo_autor` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crear`
--
ALTER TABLE `crear`
  MODIFY `cod_autor` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  MODIFY `codigo_ejemplar` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `codigo_socio` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `crear`
--
ALTER TABLE `crear`
  ADD CONSTRAINT `crear_ibfk_1` FOREIGN KEY (`isbn_articulo`) REFERENCES `cd` (`isbn`),
  ADD CONSTRAINT `crear_ibfk_2` FOREIGN KEY (`isbn_articulo`) REFERENCES `pelicula` (`isbn`),
  ADD CONSTRAINT `crear_ibfk_3` FOREIGN KEY (`isbn_articulo`) REFERENCES `libro` (`isbn`),
  ADD CONSTRAINT `crear_ibfk_4` FOREIGN KEY (`cod_autor`) REFERENCES `autor` (`codigo_autor`);

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`isbn_ejemplar`) REFERENCES `cd` (`isbn`),
  ADD CONSTRAINT `ejemplar_ibfk_2` FOREIGN KEY (`isbn_ejemplar`) REFERENCES `pelicula` (`isbn`),
  ADD CONSTRAINT `ejemplar_ibfk_3` FOREIGN KEY (`isbn_ejemplar`) REFERENCES `libro` (`isbn`);

--
-- Filtros para la tabla `prestar`
--
ALTER TABLE `prestar`
  ADD CONSTRAINT `prestar_ibfk_1` FOREIGN KEY (`cod_socio`) REFERENCES `socio` (`codigo_socio`),
  ADD CONSTRAINT `prestar_ibfk_2` FOREIGN KEY (`cod_ejemplar`) REFERENCES `ejemplar` (`codigo_ejemplar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
