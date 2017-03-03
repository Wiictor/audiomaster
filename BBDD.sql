-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2017 a las 08:35:20
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `audiomaster`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencia_tiene_ubicacion`
--

CREATE TABLE `agencia_tiene_ubicacion` (
  `id` int(11) NOT NULL,
  `agencia_id` int(11) NOT NULL,
  `ubicacion_id` int(11) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `agencia_tiene_ubicacion`
--

INSERT INTO `agencia_tiene_ubicacion` (`id`, `agencia_id`, `ubicacion_id`, `precio`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 8),
(3, 1, 3, 35),
(4, 1, 4, 75),
(5, 2, 1, 6),
(6, 2, 2, 9),
(7, 2, 3, 32),
(8, 2, 4, 68),
(9, 3, 1, 6),
(10, 3, 2, 10),
(11, 3, 3, 37),
(12, 3, 4, 77),
(13, 4, 1, 8),
(14, 4, 2, 12),
(15, 4, 3, 42),
(16, 4, 4, 75),
(17, 5, 1, 4),
(18, 5, 2, 7),
(19, 5, 3, 45),
(20, 5, 4, 85),
(21, 6, 1, 10),
(22, 6, 2, 15),
(23, 6, 3, 40),
(24, 6, 4, 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencia_transporte`
--

CREATE TABLE `agencia_transporte` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `agencia_transporte`
--

INSERT INTO `agencia_transporte` (`id`, `nombre`) VALUES
(1, 'DHL'),
(2, 'FEDEX'),
(3, 'MRW'),
(4, 'NACEX'),
(5, 'SEUR'),
(6, 'UPS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `cantidad`, `cliente_id`, `producto_id`) VALUES
(1, 1, 1, 3),
(2, 2, 2, 5),
(3, 2, 3, 9),
(4, 2, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Guitarras'),
(2, 'Bajos'),
(3, 'Teclados'),
(4, 'Baterías'),
(5, 'DJ'),
(6, 'Auriculares'),
(7, 'PA'),
(8, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `f_ultima_sesion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `usuario`, `contrasena`, `nombre`, `apellidos`, `email`, `f_ultima_sesion`) VALUES
(1, 'pepe', 'pepe123', 'José', 'Ruiz Muñoz', 'pepe@gmail.com', '2017-02-16'),
(2, 'elena', 'elena123', 'Elena Nito', 'Del Bosque', 'elena@outlook.com', '2017-02-12'),
(3, 'domingo', 'domingo123', 'Domingo', 'Díaz Festivo', 'domingo@gmail.com', '2017-02-15'),
(4, 'ramona', 'ramona123', 'Ramona', 'Ponte Alegre', 'ramona@outlook.com', '2017-02-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `cif` varchar(8) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `direccion`, `telefono`, `cif`, `email`) VALUES
(1, 'Fender', 'Calle Maravilla S/N', '956352418', 'A5286354', 'fender@correofalso.com'),
(2, 'Behringer', 'Plaza San Agustín', '925471035', 'C9852413', 'behringer@hotmail.com'),
(3, 'Sennheiser', 'Boulevard San Callao', '968521472', 'B5201476', 'sennheiser@correo.com'),
(4, 'Chapman', 'Calle Ríos', '985230247', 'D8574102', 'chapman@correodementira.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `cod_fact` varchar(45) DEFAULT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `empresa_transporte_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `cliente_id`, `empresa_id`, `cod_fact`, `tipo_pago_id`, `empresa_transporte_id`) VALUES
(1, '2017-02-13', 1, 1, '1478529630', 1, 1),
(2, '2017-02-02', 1, 2, '9875641235', 2, 2),
(3, '2017-02-13', 2, 4, '4750239581', 3, 3),
(4, '2017-02-15', 2, 3, '2035298421', 1, 4),
(5, '2017-02-10', 3, 4, '2574125893', 2, 5),
(6, '2017-02-11', 3, 1, '8547236041', 2, 6),
(7, '2017-02-07', 4, 3, '2103528497', 3, 1),
(8, '2017-02-16', 4, 4, '2514850351', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE `factura_detalle` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,0) DEFAULT NULL,
  `tipo_iva` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura_detalle`
--

INSERT INTO `factura_detalle` (`id`, `producto_id`, `factura_id`, `cantidad`, `precio_unitario`, `tipo_iva`, `descuento`) VALUES
(1, 1, 1, 3, '133', 21, 0),
(2, 2, 1, 2, '298', 21, 0),
(3, 3, 2, 2, '495', 21, 0),
(4, 3, 2, 2, '495', 21, 0),
(5, 4, 3, 2, '545', 21, 0),
(6, 5, 3, 2, '75', 21, 0),
(7, 6, 4, 1, '225', 21, 0),
(8, 7, 4, 3, '11', 21, 0),
(9, 9, 5, 2, '54', 21, 0),
(10, 8, 6, 2, '225', 21, 0),
(11, 4, 7, 1, '545', 21, 0),
(12, 1, 8, 1, '133', 21, 0),
(13, 5, 8, 1, '75', 21, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `url` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `url`) VALUES
(1, 'images\\fender\\Squier_Bullet_Strat_HSS_RW_BSB\\1.jpg'),
(2, 'images\\fender\\Squier_Bullet_Strat_HSS_RW_BSB\\2.jpg'),
(3, 'images\\alesis\\DM_Lite_Kit\\1.jpg'),
(4, 'images\\alesis\\DM_Lite_Kit\\2.jpg'),
(5, 'images\\cort\\MBC-1_BK\\1.jpg'),
(6, 'images\\cort\\MBC-1_BK\\2.jpg'),
(7, 'images\\akai\\Advance_61\\1.jpg'),
(8, 'images\\akai\\Advance_61\\2.jpg'),
(9, 'images\\behringer\\MS_16\\1.jpg'),
(10, 'images\\behringer\\MS_16\\2.jpg'),
(11, 'images\\ibanez\\TMB_100_BK\\1.jpg'),
(12, 'images\\ibanez\\TMB_100_BK\\2.jpg'),
(13, 'images\\korg\\MA-1BLBK\\1.jpg'),
(14, 'images\\korg\\MA-1BLBK\\2.jpg'),
(15, 'images\\pioneer\\DDJ-SB2\\1.jpg'),
(16, 'images\\pioneer\\DDJ-SB2\\2.jpg'),
(17, 'images\\sony\\MDRV55R\\1.jpg'),
(18, 'images\\sony\\MDRV55R\\2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_tiene_producto`
--

CREATE TABLE `imagen_tiene_producto` (
  `imagen_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagen_tiene_producto`
--

INSERT INTO `imagen_tiene_producto` (`imagen_id`, `producto_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 8),
(16, 8),
(17, 9),
(18, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `fecha_anadido` date DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `marca` varchar(80) DEFAULT NULL,
  `modelo` varchar(120) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `descripcion`, `precio`, `fecha_anadido`, `categoria_id`, `marca`, `modelo`, `stock_actual`) VALUES
(1, 'Fender (llamado CBS Musical Instruments), adquirió en los años 50 en Estados Unidos una marca que fabricaba cuerdas, poniéndole precisamente, el nombre Squier. El nombre se mantuvo desconocido durante muchos años.\r\n\r\nA comienzos de los 80, ciertos problemas hicieron ver a Fender la necesidad de tener una segunda marca. Había muchas marcas que vendían a bajo precio, en EE.UU. no se podía producir a precios tan bajos, y compañías como Tokai Guitars estaba opacando en ventas de Fender en Europa.', '133', '2017-02-16', 1, 'Fender', 'Squier Bullet Strat HSS RW BSB', 30),
(2, 'Una innovadora batería electrónica de iniciación, compuesta de Pads de 7,5" (caja / 3x Toms) con iluminación LED en azul, pads de plato (1x Hi-Hat - 2x Ride-Crash) que vienen completamente montados en un Rack portátil plegable, un módulo con 200 sonidos thomann integrados, un controlador de Hi-Hat y bombo, un sistema único de aprendizaje basado en el control visual con iluminación de los Pads al tocar y una salida jack de 6,3mm', '298', '2017-02-13', 4, 'Alesis', 'DM Lite Kit', 20),
(3, 'Tiene un cuerpo de tilo, mástil de arce atornillado, diapasón de palisandro, 22 trastes, ancho de la cejilla de 43mm, escala de 648mm, una pastilla humbucker Manson, pastilla de thomann bobina simple Manson e interruptor de palanca de 3 posiciones y botón ''Kill''.', '495', '2017-02-15', 1, 'Cort', 'MBC-1 BK', 22),
(4, 'Para la interpretación avanzada de instrumentos virtuales, dispone de unas teclas semicontrapesadas sensibles a la velocidad con aftertouch y pantalla de 10,9cm (4,3") de alta resolución integrada a todo color, con botones de interfaz dedicados. La pantalla proporciona un feedback 1:1 en tiempo real de los parámetros del plugin. Incluye software de reproducción de instrumentos virtuales con la gestión pre-set de instrumentos virtuales, creación de mapeo de control y multipatch.', '545', '2017-02-09', 3, 'Akai', 'Advance 61', 18),
(5, 'Dispone de un sistema compacto de altavoces estéreo especialmente indicado para estudios caseros, altavoces potentes de graves de 4" y tweeters de alta resolución, controles de volumen, bajos y agudos para mayor flexibilidad, entradas RCA estéreo para tarjetas de sonido, teclados, etc y una entrada jack de 6,3 mm adicional para micrófono.', '75', '2017-02-02', 7, 'Behringer', 'MS 16', 35),
(6, 'De color negro, con construcción de cuerpo sólido y construcción del mástil atornillado, tiene 4 cuerdas y 20 trastes, medida de escala larga, con una longitud de escala de 86,36 cm, cuerpo caoba y el mástil de arce.', '225', '2017-02-13', 2, 'Ibanez', 'Talman TMB100-BK', 27),
(7, 'El MA-1 es un metrónomo compacto que cubre todas las bases con una amplia gama de tempo y una rica variedad de ritmos y patrones rítmicos.\r\nTambién muestra el ritmo de una forma innovadora que hace que la práctica sea más fácil.', '11', '2017-01-26', 8, 'Korg', 'MA-1BLBK', 32),
(8, 'Cuatro almohadillas de goma le permiten Trigger, Auto de Hot Cue, Loop, Loop y Manual Sampler - mientras que un más cuatro dan acceso inmediato a las funciones PLAY, cue, sincronización y cambio. Gran Jog wheels. Este controlador compacto viene con grandes ruedas Jog, proporcionando un rendimiento dinámico con gran respuesta de arañazos y precisión. Por último, tiene un auténtico y dinámico DJ Play.', '226', '2017-02-03', 5, 'PIONEER', 'DDJ-SB2', 12),
(9, 'Tiene unos auriculares plegables con unidad de diafragma de 40 mm, imán de neodimio y cable de 1,2 m, con un diseño plegable para que los lleves a todas partes, con una calidad de sonido nítida y dinámica gracias al diafragma de neodimio, y un sonido de fondo minimizado gracias a los auriculares cerrados.', '54', '2017-01-23', 6, 'Sony', 'MDRV55R', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `metodo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id`, `metodo`) VALUES
(1, 'PayPal'),
(2, 'Tarjeta de crédito'),
(3, 'Cuenta bancaria'),
(4, 'Transferencia electrónica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `ubicacion` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `ubicacion`) VALUES
(4, 'América'),
(2, 'Baleares/Canarias'),
(3, 'Europa'),
(1, 'Península');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agencia_tiene_ubicacion`
--
ALTER TABLE `agencia_tiene_ubicacion`
  ADD PRIMARY KEY (`id`,`agencia_id`,`ubicacion_id`),
  ADD KEY `agencia_id_fk` (`agencia_id`),
  ADD KEY `ubicacion_id_fk` (`ubicacion_id`);

--
-- Indices de la tabla `agencia_transporte`
--
ALTER TABLE `agencia_transporte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carrito_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_carrito_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_factura_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_factura_empresa1_idx` (`empresa_id`),
  ADD KEY `fk_factura_tipo_pago1_idx` (`tipo_pago_id`),
  ADD KEY `empresa_transporte_id` (`empresa_transporte_id`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_has_factura_factura1_idx` (`factura_id`),
  ADD KEY `fk_producto_has_factura_producto1_idx` (`producto_id`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagen_tiene_producto`
--
ALTER TABLE `imagen_tiene_producto`
  ADD PRIMARY KEY (`imagen_id`,`producto_id`),
  ADD KEY `fk_imagen_has_producto_producto1_idx` (`producto_id`),
  ADD KEY `fk_imagen_has_producto_imagen1_idx` (`imagen_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria1_idx` (`categoria_id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ubicacion` (`ubicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agencia_tiene_ubicacion`
--
ALTER TABLE `agencia_tiene_ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `agencia_transporte`
--
ALTER TABLE `agencia_transporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencia_tiene_ubicacion`
--
ALTER TABLE `agencia_tiene_ubicacion`
  ADD CONSTRAINT `agencia_id_fk` FOREIGN KEY (`agencia_id`) REFERENCES `agencia_transporte` (`id`),
  ADD CONSTRAINT `ubicacion_id_fk` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carrito_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`empresa_transporte_id`) REFERENCES `agencia_transporte` (`id`),
  ADD CONSTRAINT `fk_factura_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD CONSTRAINT `fk_producto_has_factura_factura1` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_factura_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagen_tiene_producto`
--
ALTER TABLE `imagen_tiene_producto`
  ADD CONSTRAINT `fk_imagen_has_producto_imagen1` FOREIGN KEY (`imagen_id`) REFERENCES `imagen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_imagen_has_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
