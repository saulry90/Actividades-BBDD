-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2020 a las 12:55:38
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbdd_act10`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `calle` varchar(150) NOT NULL,
  `cp` int(5) DEFAULT NULL,
  `poblacion` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) NOT NULL,
  `user` varchar(100) NOT NULL,
  `contrasena` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`dni`, `nombre`, `apellido1`, `apellido2`, `calle`, `cp`, `poblacion`, `provincia`, `user`, `contrasena`) VALUES
('50908826M', 'Saul', 'Roldan', '', 'Riojanos', 28018, 'MADRID', 'Madrid', 'saulrr', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `dni_cliente` varchar(9) NOT NULL,
  `codigo_producto` int(3) NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `unidades` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`dni_cliente`, `codigo_producto`, `fecha_compra`, `unidades`) VALUES
('50908826M', 1, '2020-10-19 19:42:14', 1),
('50908826M', 19, '2020-10-19 19:42:14', 2),
('50908826M', 1, '2020-10-19 19:43:47', 3),
('50908826M', 10, '2020-10-19 19:43:47', 21),
('50908826M', 1, '2020-10-20 07:48:25', 2),
('50908826M', 2, '2020-10-20 07:48:25', 1),
('50908826M', 1, '2020-10-20 08:15:27', 2),
('50908826M', 2, '2020-10-20 08:15:27', 1),
('50908826M', 1, '2020-10-20 08:17:39', 2),
('50908826M', 2, '2020-10-20 08:17:39', 1),
('50908826M', 1, '2020-10-20 08:22:03', 2),
('50908826M', 2, '2020-10-20 08:22:03', 1),
('50908826M', 1, '2020-10-20 09:12:15', 11),
('50908826M', 1, '2020-10-20 09:31:09', 2),
('50908826M', 1, '2020-10-20 09:45:18', 2),
('50908826M', 1, '2020-10-20 09:45:48', 2),
('50908826M', 2, '2020-10-20 09:46:46', 8),
('50908826M', 8, '2020-10-20 10:11:07', 3),
('50908826M', 2, '2020-10-20 10:14:00', 1),
('50908826M', 2, '2020-10-20 10:14:49', 1),
('50908826M', 16, '2020-10-20 10:15:40', 3),
('50908826M', 16, '2020-10-20 10:16:31', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo` int(3) NOT NULL,
  `nombre_producto` varchar(150) NOT NULL,
  `precio` float(7,2) NOT NULL,
  `codigo_proveedor` int(3) NOT NULL,
  `totalunidades` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `nombre_producto`, `precio`, `codigo_proveedor`, `totalunidades`) VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5, 479),
(2, 'Memoria RAM DDR4 8GB', 108.00, 6, 489),
(3, 'Disco SSD 1 TB', 122.30, 4, 500),
(4, 'GeForce GTX 1050Ti', 149.85, 7, 500),
(5, 'GeForce GTX 1080 Xtreme', 611.55, 6, 500),
(6, 'Monitor 24 LED Full HD', 163.62, 1, 500),
(7, 'Monitor 27 LED Full HD', 199.25, 1, 500),
(8, 'Portátil Yoga 520', 452.79, 2, 497),
(9, 'Portátil Ideapd 320', 359.64, 2, 500),
(10, 'Impresora HP Deskjet 3720', 59.99, 3, 500),
(11, 'Dron', 170.91, 1, 500),
(15, 'Laptop', 1253.88, 6, 500),
(16, 'Pendrive 2GB', 12.00, 2, 494),
(17, 'Portatil HP Omen', 891.00, 4, 500),
(18, 'Portatil HP Omen', 891.00, 4, 500),
(19, 'Movil', 286.74, 7, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codigo` int(3) NOT NULL,
  `nombre_proveedor` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codigo`, `nombre_proveedor`) VALUES
(1, 'ASUS'),
(2, 'LENOVO'),
(3, 'HEWLETT-PACKARD'),
(4, 'SAMSUNG'),
(5, 'SEAGATE'),
(6, 'CRUCIAL'),
(7, 'GIGABYTE'),
(8, 'HUAWEI'),
(9, 'XIAOMI');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `mail` (`user`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`fecha_compra`,`dni_cliente`,`codigo_producto`),
  ADD KEY `dni_cliente` (`dni_cliente`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_proveedor` (`codigo_proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codigo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `codigo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente` (`dni`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedor` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
