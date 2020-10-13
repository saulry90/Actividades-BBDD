-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2020 a las 00:49:50
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
-- Base de datos: `bbdd_actividad9103`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `nombre` varchar(30) NOT NULL,
  `numero` int(5) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenar`
--

CREATE TABLE `almacenar` (
  `cantidad` int(3) NOT NULL,
  `cod_estanteria` int(5) NOT NULL,
  `cod_ingrediente` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocinero`
--

CREATE TABLE `cocinero` (
  `dni_empleado` varchar(9) NOT NULL,
  `anios_servicio` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `num_ss` int(11) NOT NULL,
  `telefono_movil` int(12) NOT NULL,
  `telefono_fijo` int(12) DEFAULT NULL,
  `dni` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estantealmacen`
--

CREATE TABLE `estantealmacen` (
  `nombre_almacen` varchar(30) NOT NULL,
  `cod_estanteria` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estanteria`
--

CREATE TABLE `estanteria` (
  `codigo` int(5) NOT NULL,
  `tamanio` float(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `codigo` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredienteplato`
--

CREATE TABLE `ingredienteplato` (
  `cantidad` int(3) NOT NULL,
  `cod_ingrediente` int(5) NOT NULL,
  `nombre_plato` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pinche`
--

CREATE TABLE `pinche` (
  `fecha_nacimiento` date NOT NULL,
  `dni_empleadop` varchar(9) NOT NULL,
  `dni_cocinero` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `nombre` varchar(30) NOT NULL,
  `precio` float(4,2) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `dni_cocinero` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `almacenar`
--
ALTER TABLE `almacenar`
  ADD PRIMARY KEY (`cod_estanteria`,`cod_ingrediente`),
  ADD KEY `cod_ingrediente` (`cod_ingrediente`);

--
-- Indices de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD PRIMARY KEY (`dni_empleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `estantealmacen`
--
ALTER TABLE `estantealmacen`
  ADD PRIMARY KEY (`nombre_almacen`,`cod_estanteria`),
  ADD KEY `cod_estanteria` (`cod_estanteria`);

--
-- Indices de la tabla `estanteria`
--
ALTER TABLE `estanteria`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ingredienteplato`
--
ALTER TABLE `ingredienteplato`
  ADD PRIMARY KEY (`cod_ingrediente`,`nombre_plato`),
  ADD KEY `nombre_plato` (`nombre_plato`);

--
-- Indices de la tabla `pinche`
--
ALTER TABLE `pinche`
  ADD PRIMARY KEY (`dni_empleadop`),
  ADD KEY `dni_cocinero` (`dni_cocinero`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `dni_cocinero` (`dni_cocinero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenar`
--
ALTER TABLE `almacenar`
  ADD CONSTRAINT `almacenar_ibfk_1` FOREIGN KEY (`cod_estanteria`) REFERENCES `estanteria` (`codigo`),
  ADD CONSTRAINT `almacenar_ibfk_2` FOREIGN KEY (`cod_ingrediente`) REFERENCES `ingrediente` (`codigo`);

--
-- Filtros para la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD CONSTRAINT `cocinero_ibfk_1` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni`);

--
-- Filtros para la tabla `estantealmacen`
--
ALTER TABLE `estantealmacen`
  ADD CONSTRAINT `estantealmacen_ibfk_1` FOREIGN KEY (`nombre_almacen`) REFERENCES `almacen` (`nombre`),
  ADD CONSTRAINT `estantealmacen_ibfk_2` FOREIGN KEY (`cod_estanteria`) REFERENCES `estanteria` (`codigo`);

--
-- Filtros para la tabla `ingredienteplato`
--
ALTER TABLE `ingredienteplato`
  ADD CONSTRAINT `ingredienteplato_ibfk_1` FOREIGN KEY (`cod_ingrediente`) REFERENCES `ingrediente` (`codigo`),
  ADD CONSTRAINT `ingredienteplato_ibfk_2` FOREIGN KEY (`nombre_plato`) REFERENCES `plato` (`nombre`);

--
-- Filtros para la tabla `pinche`
--
ALTER TABLE `pinche`
  ADD CONSTRAINT `pinche_ibfk_1` FOREIGN KEY (`dni_cocinero`) REFERENCES `cocinero` (`dni_empleado`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`dni_cocinero`) REFERENCES `cocinero` (`dni_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
