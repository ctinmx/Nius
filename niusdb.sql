-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-07-2013 a las 22:02:19
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `nius`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

CREATE TABLE IF NOT EXISTS `tbl_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id`, `categoria`) VALUES
(1, 'Musica'),
(2, 'Deportes'),
(3, 'Tecnologia'),
(4, 'Espectaculos'),
(5, 'Videojuegos'),
(6, 'Noticias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias_has_tbl_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_categorias_has_tbl_usuario` (
  `categoria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`categoria_id`,`usuario_id`),
  KEY `fk_tbl_categorias_has_tbl_usuario_tbl_usuario1_idx` (`usuario_id`),
  KEY `fk_tbl_categorias_has_tbl_usuario_tbl_categorias1_idx` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_categorias_has_tbl_usuario`
--

INSERT INTO `tbl_categorias_has_tbl_usuario` (`categoria_id`, `usuario_id`) VALUES
(3, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_links_rss`
--

CREATE TABLE IF NOT EXISTS `tbl_links_rss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`categoria_id`),
  KEY `fk_tbl_catalogo_rss_tbl_categorias1_idx` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tbl_links_rss`
--

INSERT INTO `tbl_links_rss` (`id`, `categoria_id`, `descripcion`, `url`) VALUES
(1, 2, 'ESPN Feed', 'http://buscar.espn.go.com/rss/'),
(2, 2, 'EsMas Deportes', 'http://rss.televisa.com/deportes/index.xml'),
(3, 3, 'Gizmodo En Español', 'http://es.gizmodo.com/rss'),
(4, 5, '20 Minutos Videojuegos', 'http://blogs.20minutos.es/videojuegos/feed/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rss`
--

CREATE TABLE IF NOT EXISTS `tbl_rss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogo_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `summary` varchar(3000) NOT NULL,
  `pubdate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`catalogo_id`,`categoria_id`),
  KEY `fk_tbl_rss_tbl_catalogo_rss1_idx` (`catalogo_id`,`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tbl_rss`
--

INSERT INTO `tbl_rss` (`id`, `catalogo_id`, `categoria_id`, `title`, `link`, `description`, `summary`, `pubdate`) VALUES
(1, 3, 3, 'Estos increíbles insectos hechos con relojes parecen vivos', 'http://es.gizmodo.com/estos-increibles-insectos-hechos-con-relojes-parecen-vi-627361057', 'Cabezas hechas con minúsculos engranajes, patitas de palancas, y cuerpos de cristal que son pequeñas bombillas. Justin Gershenson-Gates es un artista fascinado con la estética de lo mecánico que ha creado estas minúsculas esculturas a partir de piezas de relojes viejos.\r\n\r\nCon una estética un poco steampunk y un aspecto que casi parecen vivos, cada uno de estos insectos mecánicos apenas mide unos pocos centímetros de altura. Gershenson-Gates vende estas y otras fantásticas creaciones en Etsy. Si queréis admirar el resto de imágenes de su obra podéis hacerlo en su página personal o en DeviantArt. [A mechanical Mind vía Laughing Squid]', 'Cabezas hechas con minúsculos engranajes, patitas de palancas, y cuerpos de cristal que son pequeñas bombillas. Justin Gershenson-Gates es un artista fascinado con la estética de lo mecánico que ha creado estas minúsculas esculturas a partir de piezas de relojes viejos.  Con una estética un poco steampunk y un aspecto que casi parecen vivos, cada uno de estos insectos mecánicos apenas mide unos pocos centímetros de altura. Gershenson-Gates vende estas y otras fantásticas creaciones en Etsy. Si queréis admirar el resto de imágenes de su obra podéis hacerlo en su página personal o en DeviantArt. [A mechanical Mind vía Laughing Squid]', 'Sun, 30 Jun 2013 19:45:00 GMT'),
(2, 4, 5, 'Microsoft, Xbox One, terremoto, marcha atrás y vuelta a la competencia', 'http://blogs.20minutos.es/videojuegos/2013/06/24/microsoft-xbox-one-marcha-atras-terremoto-y-vuelta-a-la-competencia/', 'Parece ser que Microsoft está empeñada en hacer que el post-E3 sea tan interesante o más que el macroevento en sí mismo. La semana pasada fuimos testigos de un hecho histórico: una rectificación de la compañía, la marcha atrás en gran parte de las políticas que iban a definir su estrategia de cara a la nueva generación.\r\n\r\nNo es la primera vez que una empresa del sector cede a las presiones de los usuarios —Capcom justificó la apariencia del nuevo Dante, Cole conservó su aspecto en InFamous 2, la propia Microsoft bajó el precio de la Xbox original…—, pero nunca se había tomado una decisión tan radical y significativa. Tras el cambio de rumbo incentivado por las innumerables y duras críticas de usuarios y profesionales de la industria, Xbox One no necesitará conectarse a Internet cada día, no incluirá ningún sistema para controlar la segunda mano y los préstamos y no contará con protección regional.\r\n\r\n\r\n\r\n¡Qué alegría!, ¡qué alborozo! Aunque hay quien argumenta que habría sido más honroso tirar hacia adelante con la decisión tomada, por muy radical que ésta fuese, lo cierto es que la inmensa mayoría nos alegramos por el cambio de rumbo. De no haberse producido, intuyo que estaríamos a punto de meternos de lleno en una nueva etapa cercana al monopolio dentro del sector, con Sony marcando el rumbo casi de forma unilateral.\r\n\r\nLa generación que despedimos ha sido sumamente interesante y se lo debemos en gran parte a la dura competencia entre first parties. Nintendo disparó el mercado casual con Wii mientras PlayStation 3 y Xbox 360 se enzarzaban en una dura pugna de corte más tradicional, pero dando cada vez más relevancia al desarrollo indie y las posibilidades online.\r\n\r\n\r\n\r\nAhora, con una Wii U que no acaba de despegar, el lanzamiento de una Xbox One con las características anunciadas dejaría a PlayStation 4 con una ventaja competitiva brutal y eso no es bueno. No quiero decir que me parezca mal que Sony venda más sino que no hay nada tan beneficioso para el consumidor como la competencia. ¿Microsoft escucha a los usuarios?, ¿todo es fruto del temor a las bajas ventas?, ¿han pesado mucho las presiones de los accionistas? Puede verse como un acto de sensatez o uno de cobardía, pero eso da igual, al final lo que importa es que todos salimos ganando por una situación de rivalidad que beneficia al mercado.\r\n\r\nLos efectos del cambio no tardaron en hacerse notar —las reservas en Amazon Reino Unido se dispararon al instante—, pero no hay que engañarse, no todo es positivo. Microsoft también ha renunciado al préstamo de los videojuegos descargados, una función muy interesante que estoy convencido de que en un futuro cuajará pero que de momento queda aparcada.\r\n\r\n\r\n\r\nPuede que este cambio no moleste a muchos jugadores y que, por tanto, Microsoft no se vea muy perjudicada por la decisión. Sin embargo, me temo que los cien euros más que costará Xbox One respecto a PS4 (justificados en gran parte por la inclusión de Kinect) y la mala imagen que ha generado todo este revuelo del DRM, sí podrían afectar de forma muy negativa a las ventas de la consola. Esperemos que la compañía sea capaz de compensarlo a base de juegos. De momento, el catálogo pinta bien.', ' Parece ser que Microsoft está empeñada en hacer que el post-E3 sea tan interesante o más que el macroevento en sí mismo. La semana pasada fuimos testigos de un hecho histórico: una rectificación de la compañía, la marcha atrás en gran parte de las políticas que iban a definir su estrategia de cara a la', 'Thu, 13 Jun 2013 17:37:18 +0000'),
(3, 3, 3, 'Estos increíbles insectos hechos con relojes parecen vivos', 'http://es.gizmodo.com/estos-increibles-insectos-hechos-con-relojes-parecen-vi-627361057', 'Cabezas hechas con minúsculos engranajes, patitas de palancas, y cuerpos de cristal que son pequeñas bombillas. Justin Gershenson-Gates es un artista fascinado con la estética de lo mecánico que ha creado estas minúsculas esculturas a partir de piezas de relojes viejos.\r\n\r\nCon una estética un poco steampunk y un aspecto que casi parecen vivos, cada uno de estos insectos mecánicos apenas mide unos pocos centímetros de altura. Gershenson-Gates vende estas y otras fantásticas creaciones en Etsy. Si queréis admirar el resto de imágenes de su obra podéis hacerlo en su página personal o en DeviantArt. [A mechanical Mind vía Laughing Squid]', 'Cabezas hechas con minúsculos engranajes, patitas de palancas, y cuerpos de cristal que son pequeñas bombillas. Justin Gershenson-Gates es un artista fascinado con la estética de lo mecánico que ha creado estas minúsculas esculturas a partir de piezas de relojes viejos.  Con una estética un poco steampunk y un aspecto que casi parecen vivos, cada uno de estos insectos mecánicos apenas mide unos pocos centímetros de altura. Gershenson-Gates vende estas y otras fantásticas creaciones en Etsy. Si queréis admirar el resto de imágenes de su obra podéis hacerlo en su página personal o en DeviantArt. [A mechanical Mind vía Laughing Squid]', 'Sun, 30 Jun 2013 19:45:00 GMT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rss_has_tbl_rss_images`
--

CREATE TABLE IF NOT EXISTS `tbl_rss_has_tbl_rss_images` (
  `rss_id` int(11) NOT NULL,
  `imagen_id` int(11) NOT NULL,
  PRIMARY KEY (`rss_id`,`imagen_id`),
  KEY `fk_tbl_rss_has_tbl_rss_images_tbl_rss_images1_idx` (`imagen_id`),
  KEY `fk_tbl_rss_has_tbl_rss_images_tbl_rss_idx` (`rss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_rss_has_tbl_rss_images`
--

INSERT INTO `tbl_rss_has_tbl_rss_images` (`rss_id`, `imagen_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rss_images`
--

CREATE TABLE IF NOT EXISTS `tbl_rss_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rss` int(11) NOT NULL,
  `imagen_url` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tbl_rss_images`
--

INSERT INTO `tbl_rss_images` (`id`, `id_rss`, `imagen_url`) VALUES
(1, 2, 'http://blogs.20minutos.es/videojuegos/files/2013/06/xbox-one-e3-tdm.jpg'),
(2, 1, 'http://img.gawkerassets.com/img/18sg3iqhg5ooxjpg/k-bigpic.jpg'),
(3, 3, 'http://placehold.it/250&text=No+imagen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rss_video`
--

CREATE TABLE IF NOT EXISTS `tbl_rss_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_url` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rss_video_has_tbl_rss`
--

CREATE TABLE IF NOT EXISTS `tbl_rss_video_has_tbl_rss` (
  `rss_video_id` int(11) NOT NULL,
  `rss_id` int(11) NOT NULL,
  PRIMARY KEY (`rss_video_id`,`rss_id`),
  KEY `fk_tbl_rss_video_has_tbl_rss_tbl_rss1_idx` (`rss_id`),
  KEY `fk_tbl_rss_video_has_tbl_rss_tbl_rss_video1_idx` (`rss_video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `aPaterno` varchar(45) NOT NULL,
  `aMaterno` varchar(45) NOT NULL,
  `eMail` varchar(45) NOT NULL,
  `FbId` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id`, `nombre`, `aPaterno`, `aMaterno`, `eMail`, `FbId`) VALUES
(1, 'Cristobal', 'Torres', 'Melgoza', 'delebrindel@gmail.com', 'delebrindel');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_categorias_has_tbl_usuario`
--
ALTER TABLE `tbl_categorias_has_tbl_usuario`
  ADD CONSTRAINT `fk_tbl_categorias_has_tbl_usuario_tbl_categorias1` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_categorias_has_tbl_usuario_tbl_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `tbl_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_links_rss`
--
ALTER TABLE `tbl_links_rss`
  ADD CONSTRAINT `fk_tbl_catalogo_rss_tbl_categorias1` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_rss`
--
ALTER TABLE `tbl_rss`
  ADD CONSTRAINT `fk_tbl_rss_tbl_catalogo_rss1` FOREIGN KEY (`catalogo_id`, `categoria_id`) REFERENCES `tbl_links_rss` (`id`, `categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_rss_has_tbl_rss_images`
--
ALTER TABLE `tbl_rss_has_tbl_rss_images`
  ADD CONSTRAINT `fk_tbl_rss_has_tbl_rss_images_tbl_rss` FOREIGN KEY (`rss_id`) REFERENCES `tbl_rss` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_rss_has_tbl_rss_images_tbl_rss_images1` FOREIGN KEY (`imagen_id`) REFERENCES `tbl_rss_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_rss_video_has_tbl_rss`
--
ALTER TABLE `tbl_rss_video_has_tbl_rss`
  ADD CONSTRAINT `fk_tbl_rss_video_has_tbl_rss_tbl_rss1` FOREIGN KEY (`rss_id`) REFERENCES `tbl_rss` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_rss_video_has_tbl_rss_tbl_rss_video1` FOREIGN KEY (`rss_video_id`) REFERENCES `tbl_rss_video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
