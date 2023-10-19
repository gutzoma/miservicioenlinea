-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-10-2023 a las 13:03:52
-- Versión del servidor: 10.5.19-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u599955500_perfiles_db`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`u599955500_admin_perfiles`@`127.0.0.1` PROCEDURE `profile_info` (IN `v_id` VARCHAR(150))  select 
pg.url,
pg.paterno,
pg.materno,
pg.nombres,
pg.correo,
pg.telefono,
pg.telefono2,
pg.slogan,
pg.descripcion,
pg.desc_perfil,
pg.acerca_de,
pg.ubicacion,
pg.maps,
pg.img,
pg.tema,
servicios.info
from perfil_general pg
INNER JOIN servicios on pg.perfil_id = servicios.perfil_id
WHERE pg.url = v_id$$

CREATE DEFINER=`u599955500_admin_perfiles`@`127.0.0.1` PROCEDURE `redes_info` (IN `v_id` VARCHAR(150))  select link, red from redes 
where url_id = v_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_general`
--

CREATE TABLE `perfil_general` (
  `perfil_id` int(7) UNSIGNED NOT NULL,
  `url` varchar(150) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `telefono2` varchar(10) NOT NULL,
  `slogan` varchar(250) DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `desc_perfil` text DEFAULT NULL,
  `acerca_de` text DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `maps` text DEFAULT NULL,
  `img` varchar(150) DEFAULT NULL,
  `tema` varchar(50) NOT NULL,
  `activo` smallint(1) NOT NULL,
  `registro` datetime NOT NULL,
  `vigencia` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `perfil_general`
--

INSERT INTO `perfil_general` (`perfil_id`, `url`, `paterno`, `materno`, `nombres`, `correo`, `telefono`, `telefono2`, `slogan`, `descripcion`, `desc_perfil`, `acerca_de`, `ubicacion`, `maps`, `img`, `tema`, `activo`, `registro`, `vigencia`) VALUES
(1, 'evelyn_rodriguez', 'Rodriguez', 'Villedas', 'Evelyn Guadalupe', 'e.rodriguez@rvconsultoriamx.com', '5572276644', '', 'Tus problemas fiscales se terminaron', 'Contador Publico', 'Egresada de la Universidad Mexicana y con amplia\n                                                    experiencia en servicios adminstrativos como contables.', 'Despacho contable con mas de 5 años de trascendencia, ofreciendo nuestros\n                                                servicios de manera rapida y oprtuna.', 'Teoloyucan, Edo. Mex.', 'https://www.google.com.mx/maps/place/55796+Nextlalpan,+M%C3%A9x./@19.7320394,-99.0778437,15z/data=!3m1!4b1!4m6!3m5!1s0x85d18cdaaf740e3b:0xce95e2f91384ea4f!8m2!3d19.73204!4d-99.067544!16s%2Fm%2F064pjhz?entry=ttu', 'evelyn_rodriguez.jpeg', 'theme-color-pink', 1, '2023-10-16 21:36:36', '2023-10-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `red_id` int(7) UNSIGNED NOT NULL,
  `perfil_id` int(7) NOT NULL,
  `url_id` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `red` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `redes`
--

INSERT INTO `redes` (`red_id`, `perfil_id`, `url_id`, `link`, `red`) VALUES
(1, 1, 'evelyn_rodriguez', 'https://www.facebook.com/', 'facebook'),
(2, 1, 'evelyn_rodriguez', 'https://www.instagram.com/', 'instagram'),
(3, 1, 'evelyn_rodriguez', 'https://www.tiktok.com/', 'tiktok');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicio_id` int(7) UNSIGNED NOT NULL,
  `perfil_id` int(7) NOT NULL,
  `info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`servicio_id`, `perfil_id`, `info`) VALUES
(1, 1, '<ul class=\"d-flex nav nav-pills mb-0 text-center profile-tab\" data-toggle=\"slider-tab\" id=\"profile-pills-tab\"\n    role=\"tablist\">\n    <li class=\"nav-item \">\n        <a class=\"nav-link active show link-custom\" data-bs-toggle=\"tab\" href=\"#section-1\" role=\"tab\"\n            aria-selected=\"false\">SAT</a>\n    </li>\n    <li class=\"nav-item\">\n        <a class=\"nav-link link-custom\" data-bs-toggle=\"tab\" href=\"#section-2\" role=\"tab\" aria-selected=\"false\">IMSS</a>\n    </li>\n    <li class=\"nav-item\">\n        <a class=\"nav-link link-custom\" data-bs-toggle=\"tab\" href=\"#section-3\" role=\"tab\"\n            aria-selected=\"false\">NOMINA</a>\n    </li>\n    <li class=\"nav-item\">\n        <a class=\"nav-link link-custom\" data-bs-toggle=\"tab\" href=\"#section-4\" role=\"tab\" aria-selected=\"false\">\n            REPSE</a>\n    </li>\n    <li class=\"nav-item\">\n        <a class=\"nav-link link-custom\" data-bs-toggle=\"tab\" href=\"#section-5\" role=\"tab\"\n            aria-selected=\"false\">OBLIGACIONES</a>\n    </li>\n</ul>\n\n<div class=\"profile-content tab-content\">\n    <div id=\"section-1\" class=\"tab-pane fade active show\">\n        <p><strong>SISTEMA DE ADMINISTRACION TRIBUTARIA&nbsp;</strong></p>\n        <p>DECLARACIONES:<br /> -PROVISIONALES Y DEFINITIVAS<br /> -ANUALES<br /> -INFORMATIVAS</p>\n<p>FACTURA ELECTRONICA</p>\n<p>TRAMITES DEL RFC:<br /> -INSCRIPCION<br /> - CAMBIO DE DOMICILIO <br /> -ACTUALZACION DE ACTIVIDAD<br /> -SUSPENSION DE ACTIVIDADES <br /> -REANUDACION DE ACTIVIDADES</p>\n<p>ADEUDOS FISCALES:<br /> -ACLARACION<br /> -PAGOS<br /> -REDUCCION DE MULTAS</p>\n<p>DEVOLUCIONES</p>\n<p>OTROS:<br /> -CONSTANCIA DE SITUACION FISCAL<br /> -AVISOS<br /> -OPINION DE CUMPLIMIENTO</p>\n    </div>\n</div>\n<div class=\"profile-content tab-content\">\n    <div id=\"section-2\" class=\"tab-pane fade\">\n        <p><strong>IMSS</strong></p>\n        <p>MOVIMIENTOS AFILIATORIOS (REINGRESO, BAJA, MODIFICACION DE SALARIO)\n        </p>\n        <p>ALTAS PATRONALES DE PERSONAS FISICAS Y MORALES&nbsp;</p>\n        <p>RECOPILOACION Y MANEJO DE INFORMACION IMSS E INFONAVIT (CONSTANCIA DE\n            NO ADEUDO)</p>\n    </div>\n</div>\n<div class=\"profile-content tab-content\">\n    <div id=\"section-3\" class=\"tab-pane fade\">\n        <p><strong>NOMINA</strong></p>\n        <p>CALCULO DE FINIQUITOS</p>\n        <p>CALCULO DE AGUINALDO</p>\n        <p>CALCULO DE VACACIONES</p>\n    </div>\n</div>\n<div class=\"profile-content tab-content\">\n    <div id=\"section-4\" class=\"tab-pane fade\">\n        <p><strong>REPSE</strong></p>\n        <p>REGISTRO REPSE</p>\n        <p>DECLARACIONES INFORMATIVAS CUATRIMESTRALES ICSOE</p>\n        <p>DECLARACIONES INFORMATICAS CUATRIMESTRALES SISUB&nbsp;</p>\n    </div>\n</div>\n<div class=\"profile-content tab-content\">\n    <div id=\"section-5\" class=\"tab-pane fade\">\n        <p><strong>OBLIGACIONES DEL ESTADO</strong></p>\n        <p>INSCRIPCION AL REC</p>\n        <p>DECLARACIONES DE IMPUESTO SOBRE NOMINA</p>\n        <p>DECLARACIONES DE IMPUESTO SOBRE BEBIDAS ALCOHOLICAS</p>\n    </div>\n</div>');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `perfil_general`
--
ALTER TABLE `perfil_general`
  ADD PRIMARY KEY (`perfil_id`),
  ADD UNIQUE KEY `perfil_id` (`perfil_id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`red_id`),
  ADD UNIQUE KEY `red_id` (`red_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicio_id`),
  ADD UNIQUE KEY `servicio_id` (`servicio_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `perfil_general`
--
ALTER TABLE `perfil_general`
  MODIFY `perfil_id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `red_id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;