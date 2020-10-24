-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-10-2020 a las 22:31:21
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `controldegastos`
--
CREATE DATABASE IF NOT EXISTS `controldegastos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `controldegastos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `categoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL,
  `ingresoEgresoID` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`categoriaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE IF NOT EXISTS `cuentas` (
  `cuentaID` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCuenta` text NOT NULL,
  `moneda` text NOT NULL,
  `saldo` double NOT NULL,
  PRIMARY KEY (`cuentaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

DROP TABLE IF EXISTS `egresos`;
CREATE TABLE IF NOT EXISTS `egresos` (
  `egresoID` int(11) NOT NULL AUTO_INCREMENT,
  `cuentaID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `valor` double NOT NULL,
  `categoriaID` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `imagenURL` text NOT NULL,
  `tipoMoneda` text NOT NULL,
  `tipoCambio` double NOT NULL,
  `valorEnMonedaDeCuenta` double NOT NULL,
  `fechaIngresoUsuario` text NOT NULL,
  `fechaIngresoSistema` text NOT NULL,
  PRIMARY KEY (`egresoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `grupoID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL,
  PRIMARY KEY (`grupoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE IF NOT EXISTS `ingresos` (
  `ingresoID` int(11) NOT NULL AUTO_INCREMENT,
  `cuentaID` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `valor` double NOT NULL,
  `categoriaID` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `imagenURL` text NOT NULL,
  `tipoMoneda` text NOT NULL,
  `tipoCambio` double NOT NULL,
  `valorEnMonedaDeCuenta` double NOT NULL,
  `fechaIngresoUsuario` text NOT NULL,
  `fechaIngresoSistema` text NOT NULL,
  PRIMARY KEY (`ingresoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logdemodificaciones`
--

DROP TABLE IF EXISTS `logdemodificaciones`;
CREATE TABLE IF NOT EXISTS `logdemodificaciones` (
  `modificacionID` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTablaModificada` text NOT NULL,
  `IDTablaQueSeModifica` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL,
  `valorViejo` text NOT NULL,
  `valorNuevo` int(11) NOT NULL,
  `fechaSistema` text NOT NULL,
  `descripcionModificacion` int(11) NOT NULL,
  PRIMARY KEY (`modificacionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `permisoID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) NOT NULL,
  `cuentaID` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`permisoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `email`) VALUES
(5, 'Jorge', 'tec.diazjorge@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
