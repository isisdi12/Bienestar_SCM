CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodega` (
  `pkidBodega` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `StockMaximo` int(11) DEFAULT NULL,
  `StockMinimo` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pkidBodega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `pkIdEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pkIdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaproveedordetalle`
--

DROP TABLE IF EXISTS `facturaproveedordetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaproveedordetalle` (
  `pkidDetalleFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fkidEncabezadoFactura` int(11) DEFAULT NULL,
  `fkidProducto` int(11) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `precioUnitario` double DEFAULT NULL,
  `subTotal` double DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pkidDetalleFactura`),
  KEY `fk_facturaProveedorDetalle_facturaProveedorEncabezado1_idx` (`fkidEncabezadoFactura`),
  KEY `fk_facturaProveedorDetalle_producto1_idx` (`fkidProducto`),
  CONSTRAINT `fk_facturaProveedorDetalle_facturaProveedorEncabezado1` FOREIGN KEY (`fkidEncabezadoFactura`) REFERENCES `facturaproveedorencabezado` (`pkidEncabezadoFacturaP`),
  CONSTRAINT `fk_facturaProveedorDetalle_producto1` FOREIGN KEY (`fkidProducto`) REFERENCES `producto` (`pkidProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaproveedordetalle`
--

LOCK TABLES `facturaproveedordetalle` WRITE;
/*!40000 ALTER TABLE `facturaproveedordetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaproveedordetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaproveedorencabezado`
--

DROP TABLE IF EXISTS `facturaproveedorencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaproveedorencabezado` (
  `pkidEncabezadoFacturaP` int(11) NOT NULL AUTO_INCREMENT,
  `fkIdOrdenCompra` int(11) DEFAULT NULL,
  `fkidEmpleado` int(11) DEFAULT NULL,
  `serieFactura` varchar(45) DEFAULT NULL,
  `numeroFactura` varchar(45) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `totalImpuesto` double DEFAULT NULL,
  PRIMARY KEY (`pkidEncabezadoFacturaP`),
  KEY `fk_facturaProveedorEncabezado_ordenCompraEncabezado1_idx` (`fkIdOrdenCompra`),
  KEY `fk_facturaProveedorEncabezado_empleado1_idx` (`fkidEmpleado`),
  CONSTRAINT `fk_facturaProveedorEncabezado_empleado1` FOREIGN KEY (`fkidEmpleado`) REFERENCES `empleado` (`pkIdEmpleado`),
  CONSTRAINT `fk_facturaProveedorEncabezado_ordenCompraEncabezado1` FOREIGN KEY (`fkIdOrdenCompra`) REFERENCES `ordencompraencabezado` (`idEncabezadoOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaproveedorencabezado`
--

LOCK TABLES `facturaproveedorencabezado` WRITE;
/*!40000 ALTER TABLE `facturaproveedorencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaproveedorencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestodetallefactura`
--

DROP TABLE IF EXISTS `impuestodetallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impuestodetallefactura` (
  `pkidImpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `fkidFacturaEncabezado` int(11) DEFAULT NULL,
  `fkIdImpuestos` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`pkidImpuesto`),
  KEY `fk_impuestoDetalleFactura_facturaProveedorEncabezado1_idx` (`fkidFacturaEncabezado`),
  KEY `fk_impuestoDetalleFactura_impuestos1_idx` (`fkIdImpuestos`),
  CONSTRAINT `fk_impuestoDetalleFactura_facturaProveedorEncabezado1` FOREIGN KEY (`fkidFacturaEncabezado`) REFERENCES `facturaproveedorencabezado` (`pkidEncabezadoFacturaP`),
  CONSTRAINT `fk_impuestoDetalleFactura_impuestos1` FOREIGN KEY (`fkIdImpuestos`) REFERENCES `impuestos` (`pkidImpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestodetallefactura`
--

LOCK TABLES `impuestodetallefactura` WRITE;
/*!40000 ALTER TABLE `impuestodetallefactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `impuestodetallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impuestos` (
  `pkidImpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pkidImpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_detalle`
--

DROP TABLE IF EXISTS `movimiento_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_detalle` (
  `idMovimiento` int(11) NOT NULL,
  `Linea` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idTipoMovimiento` int(11) NOT NULL,
  PRIMARY KEY (`idMovimiento`,`Linea`,`idProducto`,`idTipoMovimiento`),
  KEY `fk_movimiento_detalle_tipos_movimiento1_idx` (`idTipoMovimiento`),
  KEY `fk_movimiento_detalle_producto1_idx` (`idProducto`),
  CONSTRAINT `fk_movimiento_detalle_movimiento_encabezado1` FOREIGN KEY (`idMovimiento`) REFERENCES `movimiento_encabezado` (`idMovimiento`),
  CONSTRAINT `fk_movimiento_detalle_producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`pkidProducto`),
  CONSTRAINT `fk_movimiento_detalle_tipos_movimiento1` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipos_movimiento` (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_detalle`
--

LOCK TABLES `movimiento_detalle` WRITE;
/*!40000 ALTER TABLE `movimiento_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_encabezado`
--

DROP TABLE IF EXISTS `movimiento_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_encabezado` (
  `idMovimiento` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`idMovimiento`,`idEmpleado`),
  KEY `fk_movimiento_encabezado_empleado1_idx` (`idEmpleado`),
  CONSTRAINT `fk_movimiento_encabezado_empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`pkIdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_encabezado`
--

LOCK TABLES `movimiento_encabezado` WRITE;
/*!40000 ALTER TABLE `movimiento_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompraencabezado`
--

DROP TABLE IF EXISTS `ordencompraencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompraencabezado` (
  `idEncabezadoOrden` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idEncabezadoOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompraencabezado`
--

LOCK TABLES `ordencompraencabezado` WRITE;
/*!40000 ALTER TABLE `ordencompraencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordencompraencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `pkidProveedor` int(11) NOT NULL,
  `pkidProducto` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` decimal(3,0) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Presentacion` varchar(45) DEFAULT NULL,
  `Costo` int(11) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  `pktipo_producto` int(11) NOT NULL,
  PRIMARY KEY (`pkidProducto`,`pkidProveedor`),
  KEY `fk_Producto_Tipo Producto1_idx` (`pktipo_producto`),
  KEY `fk_Producto_Proveedor1_idx` (`pkidProveedor`),
  CONSTRAINT `fk_Producto_Proveedor1` FOREIGN KEY (`pkidProveedor`) REFERENCES `proveedor` (`pkidProveedor`),
  CONSTRAINT `fk_Producto_Tipo Producto1` FOREIGN KEY (`pktipo_producto`) REFERENCES `tipo producto` (`pktipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoenbodega`
--

DROP TABLE IF EXISTS `productoenbodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productoenbodega` (
  `Bodega_idBodega` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `Existencias` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Bodega_idBodega`,`Producto_idProducto`),
  KEY `fk_ProductoenBodega_Bodega1_idx` (`Bodega_idBodega`),
  KEY `fk_ProductoenBodega_Producto1_idx` (`Producto_idProducto`),
  CONSTRAINT `fk_ProductoenBodega_Bodega1` FOREIGN KEY (`Bodega_idBodega`) REFERENCES `bodega` (`pkidBodega`),
  CONSTRAINT `fk_ProductoenBodega_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`pkidProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoenbodega`
--

LOCK TABLES `productoenbodega` WRITE;
/*!40000 ALTER TABLE `productoenbodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoenbodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `pkidProveedor` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Nit` int(11) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`pkidProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo producto`
--

DROP TABLE IF EXISTS `tipo producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo producto` (
  `pktipo_producto` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`pktipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo producto`
--

LOCK TABLES `tipo producto` WRITE;
/*!40000 ALTER TABLE `tipo producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_movimiento`
--

DROP TABLE IF EXISTS `tipos_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_movimiento` (
  `idTipoMovimiento` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_movimiento`
--

LOCK TABLES `tipos_movimiento` WRITE;
/*!40000 ALTER TABLE `tipos_movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_movimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11 19:37:52
