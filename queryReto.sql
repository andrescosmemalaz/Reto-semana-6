-- MySQL Workbench Synchronization
-- Generated: 2020-01-18 11:53
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: User

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `tienda`.`cliente` (
  `idCliente` INT(11) NOT NULL,
  `nombreCliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tienda`.`producto` (
  `idProducto` INT(11) NOT NULL,
  `nombreProducto` VARCHAR(45) NULL DEFAULT NULL,
  `precioProducto` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tienda`.`detalle` (
  `idFactura` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idFactura`, `idProducto`),
  INDEX `fk_detalle_factura1_idx` (`idFactura` ASC) VISIBLE,
  INDEX `fk_detalle_producto1_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_factura1`
    FOREIGN KEY (`idFactura`)
    REFERENCES `tienda`.`factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `tienda`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tienda`.`factura` (
  `idFactura` INT(11) NOT NULL,
  `fechaFactura` VARCHAR(45) NULL DEFAULT NULL,
  `idCliente` INT(11) NOT NULL,
  `igv` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_factura_cliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_factura_cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `tienda`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
