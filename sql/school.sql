-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2022 a las 16:33:51
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `school`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `profesor` int(11) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`, `profesor`, `curso`) VALUES
(1, 'Matemáticas', 1, 1),
(2, 'Español', 2, 1),
(3, 'Ingles básico', 3, 1),
(4, 'Matemáticas', 1, 2),
(5, 'Español', 2, 2),
(6, 'Ingles avanzado', 3, 2),
(7, 'Matemáticas', 1, 3),
(8, 'Pre Icfes', 1, 3),
(9, 'Matemáticas', 1, 4),
(10, 'Pre Icfes', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura_estudiantes`
--

CREATE TABLE `asignatura_estudiantes` (
  `id` int(11) NOT NULL,
  `asignatura_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura_estudiantes`
--

INSERT INTO `asignatura_estudiantes` (`id`, `asignatura_id`, `estudiante_id`) VALUES
(5, 1, 1),
(6, 1, 2),
(7, 1, 3),
(8, 2, 1),
(9, 2, 2),
(10, 2, 3),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 4, 4),
(15, 4, 5),
(16, 4, 6),
(17, 5, 4),
(18, 5, 5),
(19, 5, 6),
(20, 6, 4),
(21, 6, 5),
(22, 6, 6),
(23, 7, 7),
(24, 7, 8),
(25, 8, 7),
(26, 8, 8),
(27, 9, 9),
(28, 9, 10),
(29, 9, 11),
(30, 9, 12),
(31, 10, 9),
(32, 10, 10),
(33, 10, 11),
(34, 10, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegio`
--

CREATE TABLE `colegio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `grado` int(11) DEFAULT NULL,
  `salon` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `grado`, `salon`) VALUES
(1, 10, 'A'),
(2, 10, 'B'),
(3, 11, 'A'),
(4, 11, 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `nombre`) VALUES
(1, 'Afrodita'),
(2, 'Apolo'),
(3, 'Ares'),
(4, 'Artemisa'),
(5, 'Atenea'),
(6, 'Dionisio'),
(7, 'Hefesto'),
(8, 'Hera'),
(9, 'Hermes'),
(10, 'Hades'),
(11, 'Poseidón'),
(12, 'Zeus'),
(13, 'Afrodita'),
(14, 'Apolo'),
(15, 'Ares'),
(16, 'Artemisa'),
(17, 'Atenea'),
(18, 'Dionisio'),
(19, 'Hefesto'),
(20, 'Hera'),
(21, 'Hermes'),
(22, 'Hades'),
(23, 'Poseidón'),
(24, 'Zeus');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombre`) VALUES
(1, 'Némesis'),
(2, 'Príapo'),
(3, 'Iris');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesor_idx` (`profesor`),
  ADD KEY `curso_fk_idx` (`curso`);

--
-- Indices de la tabla `asignatura_estudiantes`
--
ALTER TABLE `asignatura_estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estudiante_idx` (`estudiante_id`),
  ADD KEY `fk_asignatura_idx` (`asignatura_id`);

--
-- Indices de la tabla `colegio`
--
ALTER TABLE `colegio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `asignatura_estudiantes`
--
ALTER TABLE `asignatura_estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `colegio`
--
ALTER TABLE `colegio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `curso_fk` FOREIGN KEY (`curso`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesor_fk` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `asignatura_estudiantes`
--
ALTER TABLE `asignatura_estudiantes`
  ADD CONSTRAINT `fk_asignatura` FOREIGN KEY (`asignatura_id`) REFERENCES `asignatura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estudiante` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
