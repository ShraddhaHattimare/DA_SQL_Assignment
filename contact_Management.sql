-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema contact_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema contact_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contact_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `contact_management` ;

-- -----------------------------------------------------
-- Table `contact_management`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_management`.`company` (
  `CompanyID` INT NOT NULL,
  `CompanyName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(20) NULL DEFAULT NULL,
  `zip` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contact_management`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_management`.`contact` (
  `ContactID` INT NOT NULL,
  `CompanyID` INT NULL DEFAULT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  `IsMain` TINYINT(1) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `CompanyID` (`CompanyID` ASC) VISIBLE,
  CONSTRAINT `contact_ibfk_1`
    FOREIGN KEY (`CompanyID`)
    REFERENCES `contact_management`.`company` (`CompanyID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contact_management`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_management`.`employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `HireDate` DATE NULL DEFAULT NULL,
  `JobTitle` VARCHAR(25) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(21) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contact_management`.`contactemployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_management`.`contactemployee` (
  `ContactEmployeeID` INT NOT NULL,
  `ContactID` INT NULL DEFAULT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  `ContactDate` DATE NULL DEFAULT NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactEmployeeID`),
  INDEX `ContactID` (`ContactID` ASC) VISIBLE,
  INDEX `EmployeeID` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `contactemployee_ibfk_1`
    FOREIGN KEY (`ContactID`)
    REFERENCES `contact_management`.`contact` (`ContactID`),
  CONSTRAINT `contactemployee_ibfk_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `contact_management`.`employee` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
