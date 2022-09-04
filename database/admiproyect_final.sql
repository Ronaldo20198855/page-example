-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3310
-- Tiempo de generación: 10-08-2022 a las 17:35:00
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admiproyect_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `cedula_ cliente` int(11) NOT NULL,
  `pais_residencia` varchar(30) NOT NULL,
  `pais_procedencia` varchar(30) NOT NULL,
  `correo_cliente` varchar(60) NOT NULL,
  `telefono_cliente` int(11) NOT NULL,
  `estado_cliente` varchar(30) NOT NULL,
  `codigo_postal` varchar(25) NOT NULL,
  `ID_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `numCard` int(16) NOT NULL,
  `nameCard` varchar(45) NOT NULL,
  `cvv` int(3) NOT NULL,
  `vencimiento` date NOT NULL,
  `numId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `numCard`, `nameCard`, `cvv`, `vencimiento`, `numId`) VALUES
(1, 2147483647, 'ramon recio', 998, '2025-10-08', 28),
(2, 2147483647, 'Juan Rosario', 412, '2024-06-12', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `ID_registro` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `tipo_de_solicitud,` varchar(30) NOT NULL,
  `fecha_de_solicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('R6kiEhsS6DwyVCmUQmCha-YYUlK9GI8N', 1660173490, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":3},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `ID_solicitud` int(11) NOT NULL,
  `tipo_de_solicitud` varchar(30) NOT NULL,
  `prueba_solicitada` varchar(30) NOT NULL,
  `fecha_de_solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_de_solicitud` varchar(15) NOT NULL DEFAULT 'En proceso',
  `ID_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`ID_solicitud`, `tipo_de_solicitud`, `prueba_solicitada`, `fecha_de_solicitud`, `estado_de_solicitud`, `ID_usuario`) VALUES
(27, 'sistema-competo', 'manuales', '2022-08-08 03:29:41', 'Negado', 3),
(28, 'sistema-competo', 'manuales', '2022-08-08 04:23:40', 'Aceptado', 4),
(29, '1-3', 'automatizadas&manuales', '2022-08-09 16:35:54', 'Aceptado', 4),
(30, '1-3', 'automatizadas&manuales', '2022-08-09 23:10:30', 'Aceptado', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `contraseña` varchar(60) NOT NULL,
  `nivel_de_acceso` varchar(30) DEFAULT 'user',
  `nombre` varchar(36) NOT NULL,
  `correo` varchar(36) NOT NULL,
  `direccion` varchar(36) NOT NULL,
  `telefono` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_usuario`, `nombre_usuario`, `contraseña`, `nivel_de_acceso`, `nombre`, `correo`, `direccion`, `telefono`) VALUES
(1, 'Ronaldo', '74123', 'user', 'Ronaldo Lantigua M.', 'ronaldo@gmail.com', 'c/ social club #3', 2147483647),
(3, 'John', '$2a$10$AI2JIE80hymRnsE8f2zzz./S3Qt.gpHhkDfK0NqYoGb/SRVrRw2fm', 'admin', 'John Perez', 'jon@gmail.com', 'c/ club de leones # 4', 2147483647),
(4, 'Tronco', '$2a$10$Zcc9LuzK.zb51RO5hvGPIOtEVhcnPmuItpDuAbzb8tFBPqbPfTbam', 'user', 'Ramon Troncoso', 'ramon@gmail.com', 'c/ dsfdsffds', 44644855),
(5, 'aldo', '$2a$10$HSpGs.F2y6UHLL7RojgXFuOwzHZdd1GKuyn5lmbMdzBSI4lLrIG7G', 'user', 'Aldo Lorenzo', 'lorenzo@gmail.com', 'sdfsdfsdasf', 2147483647),
(6, 'aldo', '$2a$10$ThKcp73tYupwEW7uvX0RgOWp/i2Jr3vZo8SzmGnnbOOh2.zOF.P0q', 'user', 'Aldo Lorenzo', 'lorenzo@gmail.com', 'sdfsdfsdasf', 2147483647),
(7, 'algas', '$2a$10$QV4HBXiYces0XTH9u9JxJu1gq39gUTtTBfmEUxWFr2iOBxNWwuw66', 'user', 'olga ramos', 'algas@gmail.com', 'sdfsdsdaf', 874648),
(8, 'algas', '$2a$10$YF1liTP1b7AAcwF9IxCUieF50dQFyu3t1fmnZD7l5LUXUkfIUik8i', 'user', 'olga ramos', 'algas@gmail.com', 'sdfsdsdaf', 874648),
(9, 'juan', '$2a$10$LswNVRdwzFMuGlFuQszg5e4lQjbFfprJjmerwenmmCUdU7G2lrIIK', 'user', 'Juan lorenzo', 'juan@gmail.com', 'c/ simon arozco edf 4 dpa. 4a', 2147483647);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `ID_usuario_idx` (`ID_usuario`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numId` (`numId`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`ID_registro`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`ID_solicitud`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `ID_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `ID_usuario` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `numId` FOREIGN KEY (`numId`) REFERENCES `solicitudes` (`ID_solicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
