-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2023 at 09:19 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marisol`
--

-- --------------------------------------------------------

--
-- Table structure for table `detallepedido`
--

CREATE TABLE `detallepedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detallepedido`
--

INSERT INTO `detallepedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 1, 7, 1, 5.00, 5.00),
(2, 1, 8, 3, 3.00, 9.00),
(3, 1, 9, 1, 6.50, 6.50),
(4, 1, 12, 1, 4.00, 4.00),
(5, 2, 11, 1, 21.50, 21.50),
(6, 3, 15, 1, 3.50, 3.50),
(7, 3, 16, 1, 15.90, 15.90),
(8, 4, 9, 1, 6.50, 6.50),
(9, 4, 10, 4, 5.00, 20.00),
(10, 5, 14, 1, 20.50, 20.50),
(11, 5, 13, 1, 11.40, 11.40),
(12, 6, 1, 1, 7.90, 7.90),
(13, 6, 2, 2, 16.90, 33.80),
(14, 6, 11, 2, 21.50, 43.00),
(15, 6, 16, 1, 15.90, 15.90),
(16, 7, 1, 3, 7.90, 23.70),
(17, 7, 2, 1, 16.90, 16.90),
(18, 7, 11, 1, 21.50, 21.50),
(19, 8, 3, 1, 6.50, 6.50),
(20, 8, 4, 1, 6.50, 6.50),
(21, 9, 15, 1, 3.50, 3.50),
(22, 9, 16, 1, 15.90, 15.90),
(23, 9, 7, 1, 5.00, 5.00),
(24, 10, 6, 1, 34.50, 34.50),
(25, 10, 9, 2, 6.50, 13.00),
(26, 11, 16, 10, 15.90, 159.00),
(27, 12, 12, 3, 4.00, 12.00),
(28, 13, 20, 1, 12.50, 12.50),
(29, 13, 22, 2, 9.60, 19.20),
(30, 14, 1, 3, 7.90, 23.70),
(31, 14, 2, 2, 16.90, 33.80),
(32, 14, 3, 1, 6.50, 6.50),
(33, 15, 11, 1, 21.50, 21.50),
(34, 15, 12, 3, 4.00, 12.00);

-- --------------------------------------------------------

--
-- Table structure for table `documentotipo`
--

CREATE TABLE `documentotipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documentotipo`
--

INSERT INTO `documentotipo` (`id`, `nombre`) VALUES
(1, 'DNI'),
(2, 'PASAPORTE');

-- --------------------------------------------------------

--
-- Table structure for table `metodoenvio`
--

CREATE TABLE `metodoenvio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metodoenvio`
--

INSERT INTO `metodoenvio` (`id`, `nombre`) VALUES
(1, 'RECOJO EN TIENDA'),
(2, 'ENTREGA A DOMICILIO');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `metodoenvio_id` int(11) NOT NULL,
  `direccion_entrega` varchar(255) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `hora_entrega` time NOT NULL,
  `responsable_dni` varchar(255) NOT NULL,
  `responsable_nombre` varchar(255) NOT NULL,
  `recibo_tipo` varchar(255) NOT NULL,
  `ruc` varchar(255) DEFAULT NULL,
  `numero_tarjeta_pago` varchar(255) NOT NULL,
  `subtotal_pago` decimal(10,2) NOT NULL,
  `envio_pago` decimal(10,2) NOT NULL,
  `igv_pago` decimal(10,2) NOT NULL,
  `total_pago` decimal(10,2) NOT NULL,
  `codigo_recojo` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id`, `fecha_pedido`, `usuario_id`, `metodoenvio_id`, `direccion_entrega`, `fecha_entrega`, `hora_entrega`, `responsable_dni`, `responsable_nombre`, `recibo_tipo`, `ruc`, `numero_tarjeta_pago`, `subtotal_pago`, `envio_pago`, `igv_pago`, `total_pago`, `codigo_recojo`, `estado`) VALUES
(1, '2023-10-07 14:42:14', 1, 2, 'La planicie Mz O Lote 5, Punta Hermosa', '2023-10-08', '14:00:00', '48527293', 'Alvaro Fernandez', '', NULL, '1234567891234567', 0.00, 0.00, 0.00, 29.50, 'f10070e94b', 'ENTREGADO'),
(2, '2023-10-07 17:13:39', 5, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-08', '12:00:00', '14725836', 'Ian Chicmana', '', NULL, '1234567894561234', 0.00, 0.00, 0.00, 21.50, '1fe500e97b', 'ENTREGADO'),
(3, '2023-10-07 18:15:54', 5, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-09', '17:00:00', '14725836', 'Ian Chicmana', '', NULL, '1234567894561236', 0.00, 0.00, 0.00, 19.40, '5bb0cfdd86', 'ENTREGADO'),
(4, '2023-10-07 18:48:11', 1, 2, 'La planicie Mz O Lote 5, Punta Hermosa', '2023-10-07', '15:00:00', '48527293', 'Alvaro Fernandez', '', NULL, '12345678912345', 0.00, 0.00, 0.00, 31.50, 'e530a95689', 'ENTREGADO'),
(5, '2023-10-07 19:01:30', 6, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-10', '16:00:00', '96385214', 'Jim Prado', '', NULL, '12345678904321', 0.00, 0.00, 0.00, 31.90, 'e0dd5c01fc', 'ENTREGADO'),
(6, '2023-10-07 22:59:58', 5, 2, 'Calle Begonias 123', '2023-10-09', '21:00:00', '33322211', 'Pedro Suarez', '', NULL, '7418529632587412', 0.00, 0.00, 0.00, 105.60, '49409d069d', 'ENTREGADO'),
(7, '2023-10-08 23:10:59', 1, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-09', '19:00:00', '48527293', 'Alvaro Fernandez', '', NULL, '1234567894561235', 0.00, 0.00, 0.00, 62.10, 'e13c4c9f2f', 'ENTREGADO'),
(8, '2023-10-09 12:01:40', 1, 2, 'La planicie Mz O Lote 5, Punta Hermosa', '2023-10-09', '12:00:00', '06883249', 'Carmen', '', NULL, '4632567744555599', 10.66, 5.00, 2.34, 18.00, '1169519652', 'ENTREGADO'),
(9, '2023-10-09 12:10:57', 1, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-10', '12:00:00', '48527293', 'Alvaro Fernandez', '', NULL, '3216549871234568', 20.01, 0.00, 4.39, 24.40, 'e0b2bfbb03', 'LISTO PARA RECOGER'),
(10, '2023-10-09 13:42:09', 1, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-09', '14:00:00', '48527293', 'Alvaro Fernandez', 'BOLETA', NULL, '4563258741254569', 38.95, 0.00, 8.55, 47.50, 'fbf4a00ba0', 'LISTO PARA RECOGER'),
(11, '2023-10-09 13:46:10', 1, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-10', '10:00:00', '77436951', 'Ivan', 'FACTURA', '20654987541', '4567896541236547', 130.38, 0.00, 28.62, 159.00, 'fc4195b604', 'LISTO PARA RECOGER'),
(12, '2023-10-10 19:15:41', 5, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-11', '11:00:00', '14725836', 'Ian Chicmana', 'BOLETA', NULL, '7412569856452365', 9.84, 0.00, 2.16, 12.00, '768c76de7d', 'LISTO PARA RECOGER'),
(13, '2023-10-11 00:11:58', 1, 2, 'La planicie Mz O Lote 5, Punta Hermosa', '2023-10-11', '13:00:00', '48527293', 'Alvaro Fernandez', 'FACTURA', '20789641351', '4425669855332657', 25.99, 5.00, 5.71, 36.70, 'b124f32dd8', 'LISTO PARA RECOGER'),
(14, '2023-10-11 13:21:24', 9, 2, 'Calle Don Angello 345', '2023-10-11', '14:00:00', '85265478', 'Cecilia Gamarra', 'FACTURA', '20639654741', '6654458779852354', 52.48, 5.00, 11.52, 69.00, '3841d5bbb6', 'EN PROCESO'),
(15, '2023-10-11 13:55:56', 12, 1, 'bodega Marisol, Calle García Rada 341', '2023-10-11', '14:00:00', '78965324', 'Matias Ponce', 'BOLETA', NULL, '7412589632564578', 27.47, 0.00, 6.03, 33.50, '62fdf26070', 'LISTO PARA RECOGER');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `categoria`, `imagen`, `descripcion`, `proveedor`, `precio`, `stock`) VALUES
(1, 'Carne de Ternera', 'CARNES, AVES Y PESCADOS', 'bisteck.png', 'Bisteck de Tapa x Kg', 'San Fernando', 7.90, 12),
(2, 'Guiso de Cerdo x Kg', 'CARNES, AVES Y PESCADOS', 'guiso_cerdo.png', 'Esto es un chanchito', 'San Fernando', 16.90, 13),
(3, 'Arandano congelado 500 gr.', 'CONGELADOS', 'arandano_congelado.jpg', 'Arandanos congelados sin azucares', 'Feat', 6.50, 14),
(4, 'Champiñones 500gr.', 'CONGELADOS', 'champiñones_congelados.jpg', 'Champiñones congelados sin sal', 'Feat', 6.50, 15),
(5, 'Crema de Leche', 'LACTEOS', 'crema_leche.png', 'Esto es una crema', 'Gloria', 8.90, 15),
(6, 'Queso Fresco', 'LACTEOS', 'queso_fresco.png', 'Queso fresco de 150 gramos', 'Bonle', 34.50, 15),
(7, 'Manzana Golden x Kg.', 'FRUTAS Y VERDURAS', 'manzana_golden.jpg', 'Manzana golden verde', 'Pronasel', 5.00, 15),
(8, 'Platano seda 5Und.', 'FRUTAS Y VERDURAS', 'platano_seda.jpg', 'Platano seda 5 unidades', 'Pronasel', 3.00, 15),
(9, 'Pan francés', 'PANADERIA Y PASTELERIA', 'pan_frances.jpg', 'Pan frances grande recien horneado', 'Repaspan', 6.50, 15),
(10, 'Flan 150gr.', 'PANADERIA Y PASTELERIA', 'flan.jpg', 'Rebanada de flan de vainilla de 150 gramos', 'Repaspan', 5.00, 15),
(11, 'Sixpack pilsen 355ml.', 'BEBIDAS', 'cerveza_pilsen.jpg', 'Cerveza pilsen en lata Sixpack 355ml', 'Pilsen', 21.50, 14),
(12, 'Gaseosa Incakola 500ml.', 'BEBIDAS', 'incakola.jpg', 'Gaseosa Incakola sabor original en botella 500ml', 'Inca kola', 4.00, 12),
(13, 'Jabon Protex Pack x3', 'CUIDADO PERSONAL', 'jabon.png', 'Pack x3 Jabón Antibacterial Nutri Protect Barra 110 gramos', 'Protex', 11.40, 15),
(14, 'Gel Antibacterial 1L', 'CUIDADO PERSONAL', 'gel.png', 'Gel Antibacterial Instan clean Sin Fragancia', 'Instan clean', 20.50, 15),
(15, 'Jabon Bolivar 190 gr.', 'LIMPIEZA', 'jabon_bolivar.png', 'Jab[on en Barra BOLÍVAR Floral Paquete 190g', 'Bolivar', 3.50, 15),
(16, 'Escoba VIRUTEX', 'LIMPIEZA', 'escoba.png', 'Escoba VIRUTEX La Poderosa', 'Virutex', 15.90, 45),
(20, 'Filete de Bonito', 'CARNES, AVES Y PESCADOS', '20231010223740_pescado_bonito.png', 'Pescado Fresco', 'Callao Pesquero', 12.50, 10),
(22, 'Torta Selva Negra', 'PANADERIA Y PASTELERIA', '20231010235047_torta_selva_negra.jpg', 'Torta de chocolate con Fresa', 'Dolce Nina', 9.60, 15);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario_tipo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `documento_tipo` int(11) DEFAULT NULL,
  `documento_numero` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario_tipo`, `nombre`, `apellido`, `correo`, `password`, `documento_tipo`, `documento_numero`, `telefono`) VALUES
(1, 'CLIENTE', 'Alvaro', 'Fernandez', 'afernandez@gmail.com', '173447602773428053556316684567667297915', 1, '48527293', '943802609'),
(2, 'ADMINISTRADOR', 'Admin', 'Admin', 'admin@gmail.com', '44047210810420107506624974438055026627', NULL, '12345678', '999999991'),
(3, 'CLIENTE', 'Juan', 'Zapata', 'juan@gmail.com', '326260511379103132140818804997939496758', NULL, '41653745', '321654987'),
(4, 'CLIENTE', 'Janitza', 'Caballero', 'janitza@gmail.com', '306387474783060387382343745935520905632', NULL, '65498732', '980661432'),
(5, 'CLIENTE', 'Ian', 'Chicmana', 'ian@gmail.com', '48316165893442913050172005982394327687', 1, '14725836', '999888777'),
(6, 'CLIENTE', 'Jim', 'Prado', 'jim@gmail.com', '184008528852772597018332091953643476493', 1, '96385214', '77755533'),
(8, 'ADMINISTRADOR', 'Ariana', 'Pacheco', 'admin2@gmail.com', '266190094122377546008837683662080882953', NULL, '78945632', '999999992'),
(9, 'CLIENTE', 'Cecilia', 'Gamarra', 'cecilia@gmail.com', '246148109640039340173324517457803500669', 1, '85265478', '444666333'),
(11, 'CLIENTE', 'Roberto', 'Ferrero', 'roberto@gmail.com', '317608407176323046579636469535811144010', 1, '45543265', '965328741'),
(12, 'CLIENTE', 'Matias', 'Ponce', 'matias@gmail.com', '8024932947622324921782410406797061870', 1, '78965324', '999456782');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indexes for table `documentotipo`
--
ALTER TABLE `documentotipo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metodoenvio`
--
ALTER TABLE `metodoenvio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `metodoenvio_id` (`metodoenvio_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documento_tipo_foreign` (`documento_tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`metodoenvio_id`) REFERENCES `metodoenvio` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `documento_tipo_foreign` FOREIGN KEY (`documento_tipo`) REFERENCES `documentotipo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
