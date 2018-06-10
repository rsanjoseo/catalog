-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2018 a las 14:24:53
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4
-- Author: Rafael San José (rafael.sanjose@x-netdigital.com)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `attributes`
--

INSERT INTO `attributes` (`id`, `name`) VALUES
(1, 'Talla'),
(2, 'Color');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`) VALUES
(1, 1, 'XL'),
(2, 1, 'XXL'),
(3, 2, 'Azul'),
(4, 2, 'Negro'),
(5, 2, 'Rojo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Buckle'),
(2, 'Zara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `families`
--

CREATE TABLE `families` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `url` varchar(60) NOT NULL,
  `metatitle` varchar(160) NOT NULL,
  `metadescription` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `families`
--

INSERT INTO `families` (`id`, `parent_id`, `name`, `url`, `metatitle`, `metadescription`) VALUES
(2, 0, 'Mujer', 'mujer', 'Ropa de mujer', 'Tienda de ropa para mujer'),
(3, 0, 'Hombre', 'hombre', 'Ropa de hombre', 'Tienda de ropa para hombre'),
(2000, 2, 'Complementos', 'complementos-mujer', 'Complementos para mujer', 'Tienda de complementos para mujer'),
(2010, 2000, 'Sombreros', 'sombreros-mujer', 'Sombreros para mujer', 'Tienda de sombreros para mujer'),
(3000, 3, 'Pantalones', 'pantalones-hombre', 'Pantalones para hombre', 'Tienda de pantalones para hombre'),
(3010, 3000, 'Vaqueros', 'pantalones-vaqueros-hombre', 'Pantalones vaqueros para hombre', 'Tienda de pantalones vaqueros para homabre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `family_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` tinytext NOT NULL,
  `metatitle` varchar(160) NOT NULL,
  `metadescription` varchar(160) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `family_id`, `brand_id`, `unit_id`, `name`, `description`, `metatitle`, `metadescription`, `url`) VALUES
(1, 2010, 1, 1, 'Pantalón vaquero Buckle para hombre', '<p>Descripción internet</p>', 'Metatítulo', 'Metadescripción', 'pantalon-vaquero-buckle'),
(2, 2010, 1, 1, 'Pantalón vaquero Levis', '<p>Descripción internet</p>', 'Metatítulo', 'Metadescripción', 'pantalon-vaquero-levis'),
(3, 3010, 2, 1, 'Sombrero de mujer Zara', '<p>Descripción internet</p>', 'Metatítulo', 'Metadescripción', 'sombrero-mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_eans`
--

CREATE TABLE `products_eans` (
  `ean` varchar(20) NOT NULL DEFAULT '',
  `variant_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `variant_id` int(10) UNSIGNED NOT NULL,
  `expiration` date NOT NULL DEFAULT '0000-00-00',
  `entry` date NOT NULL DEFAULT '0000-00-00',
  `store_id` int(10) UNSIGNED NOT NULL,
  `gap` varchar(10) NOT NULL DEFAULT 'BEACH',
  `name` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT '0',
  `cost` decimal(19,4) DEFAULT '0.0000',
  `lot` varchar(10) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store`
--

CREATE TABLE `store` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store_gaps`
--

CREATE TABLE `store_gaps` (
  `store_id` int(10) UNSIGNED NOT NULL,
  `gap` varchar(10) NOT NULL DEFAULT 'BEACH'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`) VALUES
(1, 'The Buckle, Inc'),
(2, 'Inditex, S.A.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier_products`
--

CREATE TABLE `supplier_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `supplier_ref` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier_rates`
--

CREATE TABLE `supplier_rates` (
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `cost` decimal(19,4) NOT NULL,
  `net_cost` decimal(19,4) NOT NULL,
  `rrp` decimal(19,4) NOT NULL COMMENT 'Recommended Retail Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `tax` float NOT NULL,
  `re` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `tax`, `re`) VALUES
(1, 'Normal', 21, 5.2),
(2, 'Reducido', 10, 1.4),
(3, 'Superreducido', 4, 0.5),
(4, 'Exento', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'ud'),
(2, 'ml'),
(3, 'g'),
(4, 'kg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `format_qty` int(10) UNSIGNED NOT NULL,
  `referencia` varchar(25) NOT NULL,
  `costo` float NOT NULL,
  `precio_minimo` float NOT NULL,
  `pvd` float NOT NULL,
  `pvpr` float NOT NULL,
  `active` tinyint(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `variants`
--

INSERT INTO `variants` (`id`, `product_id`, `name`, `format_qty`, `referencia`, `costo`, `precio_minimo`, `pvd`, `pvpr`, `active`) VALUES
(1, 1, 'Pantalón vaquero Buckle azul para hombre talla XL', 1, '0', 10, 20, 0, 0, 1),
(2, 1, 'Pantalón vaquero Buckle azul para hombre talla XXL', 1, '0', 10, 20, 0, 0, 1),
(3, 1, 'Pantalón vaquero Buckle negro para hombre talla XL', 1, '0', 10, 20, 0, 0, 1),
(4, 1, 'Pantalón vaquero Buckle negro para hombre talla XXL', 1, '0', 10, 20, 0, 0, 1),
(5, 3, 'Sombrero Zara Rojo', 1, '0', 15, 30, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variant_attributes`
--

CREATE TABLE `variant_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `attribute_value_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `variant_attributes`
--

INSERT INTO `variant_attributes` (`id`, `variant_id`, `attribute_value_id`) VALUES
(1, 1, 3),
(2, 1, 1),
(3, 2, 3),
(4, 2, 2),
(5, 3, 3),
(6, 3, 1),
(7, 4, 3),
(8, 4, 2),
(9, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variant_images`
--

CREATE TABLE `variant_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `imageorder` tinyint(2) NOT NULL,
  `image` varchar(250) NOT NULL,
  `alternativetext` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `attribute_id_2` (`attribute_id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `family_id` (`family_id`);

--
-- Indices de la tabla `products_eans`
--
ALTER TABLE `products_eans`
  ADD KEY `variant_id` (`variant_id`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`variant_id`,`expiration`,`entry`,`store_id`,`gap`),
  ADD KEY `store_id` (`store_id`,`gap`);

--
-- Indices de la tabla `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `store_gaps`
--
ALTER TABLE `store_gaps`
  ADD PRIMARY KEY (`store_id`,`gap`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`,`variant_id`),
  ADD KEY `supplier_id_2` (`supplier_id`);

--
-- Indices de la tabla `supplier_rates`
--
ALTER TABLE `supplier_rates`
  ADD PRIMARY KEY (`supplier_id`,`variant_id`,`date_from`),
  ADD KEY `supplier_id` (`supplier_id`,`variant_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indices de la tabla `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `variant_attributes`
--
ALTER TABLE `variant_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_id` (`variant_id`),
  ADD KEY `attribute_value_id` (`attribute_value_id`);

--
-- Indices de la tabla `variant_images`
--
ALTER TABLE `variant_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `families`
--
ALTER TABLE `families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3011;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `variant_attributes`
--
ALTER TABLE `variant_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `products_eans`
--
ALTER TABLE `products_eans`
  ADD CONSTRAINT `products_eans_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `xxx` FOREIGN KEY (`store_id`,`gap`) REFERENCES `store_gaps` (`store_id`, `gap`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `store_gaps`
--
ALTER TABLE `store_gaps`
  ADD CONSTRAINT `store_gaps_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `supplier_products`
--
ALTER TABLE `supplier_products`
  ADD CONSTRAINT `supplier_products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `supplier_rates`
--
ALTER TABLE `supplier_rates`
  ADD CONSTRAINT `supplier_rates_ibfk_1` FOREIGN KEY (`supplier_id`,`variant_id`) REFERENCES `supplier_products` (`supplier_id`, `variant_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_rates_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `variant_attributes`
--
ALTER TABLE `variant_attributes`
  ADD CONSTRAINT `variant_attributes_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`),
  ADD CONSTRAINT `variant_attributes_ibfk_2` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `variant_images`
--
ALTER TABLE `variant_images`
  ADD CONSTRAINT `variant_images_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
