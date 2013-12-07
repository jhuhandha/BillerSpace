/*
SQLyog Trial v11.3 (64 bit)
MySQL - 5.5.24-log : Database - dbbiller
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbbiller` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `dbbiller`;

/*Table structure for table `tbladministracion` */

DROP TABLE IF EXISTS `tbladministracion`;

CREATE TABLE `tbladministracion` (
  `codAdministracion` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `fechaInicial` date NOT NULL,
  `fechaFinal` double NOT NULL,
  `tbltipoinmueble_codTipoInmueble` int(11) NOT NULL,
  PRIMARY KEY (`codAdministracion`),
  KEY `fk_tbladministracion_tbltipoinmueble1_idx` (`tbltipoinmueble_codTipoInmueble`),
  CONSTRAINT `fk_tbladministracion_tbltipoinmueble1` FOREIGN KEY (`tbltipoinmueble_codTipoInmueble`) REFERENCES `tbltipoinmueble` (`codTipoInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbladministracion` */

LOCK TABLES `tbladministracion` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblclasificados` */

DROP TABLE IF EXISTS `tblclasificados`;

CREATE TABLE `tblclasificados` (
  `codClasificados` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPublicacion` date DEFAULT NULL,
  `fechaCierre` date DEFAULT NULL,
  `urlFoto` text COLLATE utf8_bin,
  `titulo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `contenido` text COLLATE utf8_bin,
  `urlAnexo` text COLLATE utf8_bin,
  `estado` bit(1) DEFAULT NULL,
  `estadoaprobacion` bit(1) DEFAULT NULL,
  `TblUsuarioXRolXEspacio_codUsuarioXRolXEspaciocol` int(11) NOT NULL,
  PRIMARY KEY (`codClasificados`),
  KEY `fk_tblclasificados_TblUsuarioXRolXEspacio1_idx` (`TblUsuarioXRolXEspacio_codUsuarioXRolXEspaciocol`),
  CONSTRAINT `fk_tblclasificados_TblUsuarioXRolXEspacio1` FOREIGN KEY (`TblUsuarioXRolXEspacio_codUsuarioXRolXEspaciocol`) REFERENCES `mydb`.`tblusuarioxrolxespacio` (`codUsuarioXRolXEspaciocol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblclasificados` */

LOCK TABLES `tblclasificados` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblconceptomulta` */

DROP TABLE IF EXISTS `tblconceptomulta`;

CREATE TABLE `tblconceptomulta` (
  `codConceptoMulta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codConceptoMulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblconceptomulta` */

LOCK TABLES `tblconceptomulta` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblcontabilidad` */

DROP TABLE IF EXISTS `tblcontabilidad`;

CREATE TABLE `tblcontabilidad` (
  `codContabilidad` int(11) NOT NULL AUTO_INCREMENT,
  `adminVencida` double NOT NULL,
  `interesMoraAcum` double NOT NULL,
  `Honorarios` double NOT NULL,
  `Multas` double NOT NULL,
  `saldoFavor` double NOT NULL,
  `idLocal` int(11) NOT NULL,
  PRIMARY KEY (`codContabilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblcontabilidad` */

LOCK TABLES `tblcontabilidad` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblcontabilidadadmin` */

DROP TABLE IF EXISTS `tblcontabilidadadmin`;

CREATE TABLE `tblcontabilidadadmin` (
  `codContabilidadAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `tbladministracion_codAdministracion` int(11) NOT NULL,
  `tblpagos_codPagos` int(11) NOT NULL,
  PRIMARY KEY (`codContabilidadAdmin`),
  KEY `fk_tblcontabilidadadmin_tbladministracion1_idx` (`tbladministracion_codAdministracion`),
  KEY `fk_tblcontabilidadadmin_tblpagos1_idx` (`tblpagos_codPagos`),
  CONSTRAINT `fk_tblcontabilidadadmin_tbladministracion1` FOREIGN KEY (`tbladministracion_codAdministracion`) REFERENCES `tbladministracion` (`codAdministracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblcontabilidadadmin_tblpagos1` FOREIGN KEY (`tblpagos_codPagos`) REFERENCES `tblpagos` (`codPagos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblcontabilidadadmin` */

LOCK TABLES `tblcontabilidadadmin` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblespacio` */

DROP TABLE IF EXISTS `tblespacio`;

CREATE TABLE `tblespacio` (
  `codEspacio` int(11) NOT NULL AUTO_INCREMENT,
  `tblplan_codPlan` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codEspacio`),
  KEY `fk_tblespacio_tblplan1_idx` (`tblplan_codPlan`),
  CONSTRAINT `fk_tblespacio_tblplan1` FOREIGN KEY (`tblplan_codPlan`) REFERENCES `tblplan` (`codPlan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblespacio` */

LOCK TABLES `tblespacio` WRITE;

insert  into `tblespacio`(`codEspacio`,`tblplan_codPlan`,`descripcion`) values (1,1,'Unidad Residencial AltaMira'),(2,1,'Unidad Residencial Nogales'),(3,1,'Unidad Residencial Jardines de la fe');

UNLOCK TABLES;

/*Table structure for table `tblfactura` */

DROP TABLE IF EXISTS `tblfactura`;

CREATE TABLE `tblfactura` (
  `codFactura` int(11) NOT NULL AUTO_INCREMENT,
  `totalMes` double NOT NULL,
  `fechaFacturada` date NOT NULL,
  `fechaLimite` date NOT NULL,
  `Estado` bit(1) NOT NULL DEFAULT b'0',
  `idLocal` int(11) NOT NULL,
  `estadoEmail` bit(1) DEFAULT NULL,
  `tblcontabilidad_codContabilidad` int(11) NOT NULL,
  PRIMARY KEY (`codFactura`),
  KEY `fk_tblfactura_tblcontabilidad1_idx` (`tblcontabilidad_codContabilidad`),
  CONSTRAINT `fk_tblfactura_tblcontabilidad1` FOREIGN KEY (`tblcontabilidad_codContabilidad`) REFERENCES `tblcontabilidad` (`codContabilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblfactura` */

LOCK TABLES `tblfactura` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblinmueble` */

DROP TABLE IF EXISTS `tblinmueble`;

CREATE TABLE `tblinmueble` (
  `codInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `tbltipoinmueble_codTipoInmueble` int(11) NOT NULL,
  `tblcontabilidad_codContabilidad` int(11) NOT NULL,
  PRIMARY KEY (`codInmueble`),
  KEY `fk_tblinmueble_tbltipoinmueble1_idx` (`tbltipoinmueble_codTipoInmueble`),
  KEY `fk_tblinmueble_tblcontabilidad1_idx` (`tblcontabilidad_codContabilidad`),
  CONSTRAINT `fk_tblinmueble_tbltipoinmueble1` FOREIGN KEY (`tbltipoinmueble_codTipoInmueble`) REFERENCES `tbltipoinmueble` (`codTipoInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblinmueble_tblcontabilidad1` FOREIGN KEY (`tblcontabilidad_codContabilidad`) REFERENCES `tblcontabilidad` (`codContabilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblinmueble` */

LOCK TABLES `tblinmueble` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblinteresmes` */

DROP TABLE IF EXISTS `tblinteresmes`;

CREATE TABLE `tblinteresmes` (
  `codInteresMes` int(11) NOT NULL AUTO_INCREMENT,
  `Interes` double NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` bit(1) DEFAULT b'0',
  `tblcontabilidad_codContabilidad` int(11) NOT NULL,
  PRIMARY KEY (`codInteresMes`),
  KEY `fk_tblinteresmes_tblcontabilidad1_idx` (`tblcontabilidad_codContabilidad`),
  CONSTRAINT `fk_tblinteresmes_tblcontabilidad1` FOREIGN KEY (`tblcontabilidad_codContabilidad`) REFERENCES `tblcontabilidad` (`codContabilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblinteresmes` */

LOCK TABLES `tblinteresmes` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblmodulo` */

DROP TABLE IF EXISTS `tblmodulo`;

CREATE TABLE `tblmodulo` (
  `codModulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblmodulo` */

LOCK TABLES `tblmodulo` WRITE;

insert  into `tblmodulo`(`codModulo`,`descripcion`) values (1,'FanPage'),(2,'Reportes'),(3,'Facturacion');

UNLOCK TABLES;

/*Table structure for table `tblmoduloxplan` */

DROP TABLE IF EXISTS `tblmoduloxplan`;

CREATE TABLE `tblmoduloxplan` (
  `tblplan_codPlan` int(11) NOT NULL,
  `tblmodulo_codModulo` int(11) NOT NULL,
  KEY `fk_tblmoduloxplan_tblplan1_idx` (`tblplan_codPlan`),
  KEY `fk_tblmoduloxplan_tblmodulo1_idx` (`tblmodulo_codModulo`),
  CONSTRAINT `fk_tblmoduloxplan_tblplan1` FOREIGN KEY (`tblplan_codPlan`) REFERENCES `tblplan` (`codPlan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblmoduloxplan_tblmodulo1` FOREIGN KEY (`tblmodulo_codModulo`) REFERENCES `tblmodulo` (`codModulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblmoduloxplan` */

LOCK TABLES `tblmoduloxplan` WRITE;

insert  into `tblmoduloxplan`(`tblplan_codPlan`,`tblmodulo_codModulo`) values (1,1),(1,2),(1,3);

UNLOCK TABLES;

/*Table structure for table `tblmoduloxrol` */

DROP TABLE IF EXISTS `tblmoduloxrol`;

CREATE TABLE `tblmoduloxrol` (
  `tblmodulo_codModulo` int(11) NOT NULL,
  `tblrol_codRol` int(11) NOT NULL,
  KEY `fk_tblmoduloxrol_tblmodulo1_idx` (`tblmodulo_codModulo`),
  KEY `fk_tblmoduloxrol_tblrol1_idx` (`tblrol_codRol`),
  CONSTRAINT `fk_tblmoduloxrol_tblmodulo1` FOREIGN KEY (`tblmodulo_codModulo`) REFERENCES `tblmodulo` (`codModulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblmoduloxrol_tblrol1` FOREIGN KEY (`tblrol_codRol`) REFERENCES `tblrol` (`codRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblmoduloxrol` */

LOCK TABLES `tblmoduloxrol` WRITE;

insert  into `tblmoduloxrol`(`tblmodulo_codModulo`,`tblrol_codRol`) values (1,1),(1,2),(1,3);

UNLOCK TABLES;

/*Table structure for table `tblnumeromultas` */

DROP TABLE IF EXISTS `tblnumeromultas`;

CREATE TABLE `tblnumeromultas` (
  `codNumeroMultas` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tblconceptomulta_codConceptoMulta` int(11) NOT NULL,
  `tblcontabilidad_codContabilidad` int(11) NOT NULL,
  PRIMARY KEY (`codNumeroMultas`),
  KEY `fk_tblnumeromultas_tblconceptomulta1_idx` (`tblconceptomulta_codConceptoMulta`),
  KEY `fk_tblnumeromultas_tblcontabilidad1_idx` (`tblcontabilidad_codContabilidad`),
  CONSTRAINT `fk_tblnumeromultas_tblconceptomulta1` FOREIGN KEY (`tblconceptomulta_codConceptoMulta`) REFERENCES `tblconceptomulta` (`codConceptoMulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblnumeromultas_tblcontabilidad1` FOREIGN KEY (`tblcontabilidad_codContabilidad`) REFERENCES `tblcontabilidad` (`codContabilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblnumeromultas` */

LOCK TABLES `tblnumeromultas` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblpagos` */

DROP TABLE IF EXISTS `tblpagos`;

CREATE TABLE `tblpagos` (
  `codPagos` int(11) NOT NULL,
  `pagoMes` double NOT NULL,
  `pagoTotal` decimal(10,0) NOT NULL,
  `Fecha` date NOT NULL,
  `tblfactura_codFactura` int(11) NOT NULL,
  PRIMARY KEY (`codPagos`),
  KEY `fk_tblpagos_tblfactura1_idx` (`tblfactura_codFactura`),
  CONSTRAINT `fk_tblpagos_tblfactura1` FOREIGN KEY (`tblfactura_codFactura`) REFERENCES `tblfactura` (`codFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblpagos` */

LOCK TABLES `tblpagos` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblplan` */

DROP TABLE IF EXISTS `tblplan`;

CREATE TABLE `tblplan` (
  `codPlan` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codPlan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblplan` */

LOCK TABLES `tblplan` WRITE;

insert  into `tblplan`(`codPlan`,`descripcion`) values (1,'Plus'),(2,'Busines'),(3,'Premiun');

UNLOCK TABLES;

/*Table structure for table `tblrol` */

DROP TABLE IF EXISTS `tblrol`;

CREATE TABLE `tblrol` (
  `codRol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblrol` */

LOCK TABLES `tblrol` WRITE;

insert  into `tblrol`(`codRol`,`descripcion`) values (1,'Administrador'),(2,'Propietario'),(3,'Inquilino');

UNLOCK TABLES;

/*Table structure for table `tbltipoinmueble` */

DROP TABLE IF EXISTS `tbltipoinmueble`;

CREATE TABLE `tbltipoinmueble` (
  `codTipoInmueble` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codTipoInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbltipoinmueble` */

LOCK TABLES `tbltipoinmueble` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblusuario` */

DROP TABLE IF EXISTS `tblusuario`;

CREATE TABLE `tblusuario` (
  `documento` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `nombres` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=654322 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblusuario` */

LOCK TABLES `tblusuario` WRITE;

insert  into `tblusuario`(`documento`,`apellidos`,`nombres`,`email`,`telefono`) values (123456,'Cupitra','Luis Miguel','Q3.14tra@gmail.com','123456'),(654123,'Ramires','Juan David','Juandavid@gmail.com','123456'),(654321,'Galeano','Yohan Andres','Yohan@gmail.com','123456');

UNLOCK TABLES;

/*Table structure for table `tblusuariosxespacioxinmueble` */

DROP TABLE IF EXISTS `tblusuariosxespacioxinmueble`;

CREATE TABLE `tblusuariosxespacioxinmueble` (
  `TblUsuarioXRolXEspacio_codUsuarioXRolXEspaciocol` int(11) NOT NULL,
  `tblinmueble_codInmueble` int(11) NOT NULL,
  KEY `fk_table1_TblUsuarioXRolXEspacio1_idx` (`TblUsuarioXRolXEspacio_codUsuarioXRolXEspaciocol`),
  KEY `fk_tblusuariosxespacioxinmueble_tblinmueble1_idx` (`tblinmueble_codInmueble`),
  CONSTRAINT `fk_table1_TblUsuarioXRolXEspacio1` FOREIGN KEY (`TblUsuarioXRolXEspacio_codUsuarioXRolXEspaciocol`) REFERENCES `mydb`.`tblusuarioxrolxespacio` (`codUsuarioXRolXEspaciocol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblusuariosxespacioxinmueble_tblinmueble1` FOREIGN KEY (`tblinmueble_codInmueble`) REFERENCES `tblinmueble` (`codInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblusuariosxespacioxinmueble` */

LOCK TABLES `tblusuariosxespacioxinmueble` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblusuarioxrolxespacio` */

DROP TABLE IF EXISTS `tblusuarioxrolxespacio`;

CREATE TABLE `tblusuarioxrolxespacio` (
  `codUsuarioXRolXEspaciocol` int(11) NOT NULL AUTO_INCREMENT,
  `tblrol_codRol` int(11) NOT NULL,
  `tblespacio_codEspacio` int(11) NOT NULL,
  `TblUsuario_documento` int(11) NOT NULL,
  PRIMARY KEY (`codUsuarioXRolXEspaciocol`),
  KEY `fk_tblusuarioxrolxespacio_tblrol1_idx` (`tblrol_codRol`),
  KEY `fk_tblusuarioxrolxespacio_tblespacio1_idx` (`tblespacio_codEspacio`),
  KEY `fk_tblusuarioxrolxespacio_TblUsuario1_idx` (`TblUsuario_documento`),
  CONSTRAINT `fk_tblusuarioxrolxespacio_tblrol1` FOREIGN KEY (`tblrol_codRol`) REFERENCES `tblrol` (`codRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblusuarioxrolxespacio_tblespacio1` FOREIGN KEY (`tblespacio_codEspacio`) REFERENCES `tblespacio` (`codEspacio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblusuarioxrolxespacio_TblUsuario1` FOREIGN KEY (`TblUsuario_documento`) REFERENCES `tblusuario` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tblusuarioxrolxespacio` */

LOCK TABLES `tblusuarioxrolxespacio` WRITE;

insert  into `tblusuarioxrolxespacio`(`codUsuarioXRolXEspaciocol`,`tblrol_codRol`,`tblespacio_codEspacio`,`TblUsuario_documento`) values (1,1,1,654123),(2,2,2,123456),(3,3,2,654321);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
