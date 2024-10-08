-- MySQL Script generated by MySQL Workbench
-- Tue Sep 17 21:19:15 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Faculdade
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Faculdade
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Faculdade` DEFAULT CHARACTER SET utf8 ;
USE `Faculdade` ;

-- -----------------------------------------------------
-- Table `Faculdade`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`departamento` (
  `codigo` INT NOT NULL,
  `detalhes` VARCHAR(250) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`curso` (
  `codigo` INT NOT NULL,
  `departamento_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `departamento_codigo`),
  INDEX `fk_curso_departamento1_idx` (`departamento_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_departamento1`
    FOREIGN KEY (`departamento_codigo`)
    REFERENCES `Faculdade`.`departamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`orientador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`orientador` (
  `matricula` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `departamento_codigo` INT NOT NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`matricula`, `departamento_codigo`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_orientador_departamento1_idx` (`departamento_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_orientador_departamento1`
    FOREIGN KEY (`departamento_codigo`)
    REFERENCES `Faculdade`.`departamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`aluno` (
  `matricula` INT NOT NULL,
  `curso_codigo` INT NOT NULL,
  `curso_departamento_codigo` INT NOT NULL,
  `obrigatorias_concluidas` TINYINT NULL,
  `nenhuma_optativa` TINYINT NULL,
  `orientador_matricula` INT NOT NULL,
  `tipo_aluno` ENUM('grad', 'posgrad') NULL,
  PRIMARY KEY (`matricula`, `curso_codigo`, `curso_departamento_codigo`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_aluno_curso1_idx` (`curso_codigo` ASC, `curso_departamento_codigo` ASC) VISIBLE,
  INDEX `fk_aluno_orientador1_idx` (`orientador_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_curso1`
    FOREIGN KEY (`curso_codigo` , `curso_departamento_codigo`)
    REFERENCES `Faculdade`.`curso` (`codigo` , `departamento_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_orientador1`
    FOREIGN KEY (`orientador_matricula`)
    REFERENCES `Faculdade`.`orientador` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`disciplinas` (
  `codigo` INT NOT NULL,
  `orientador_matricula` INT NOT NULL,
  `creditos` INT NULL,
  `nome` VARCHAR(45) NULL,
  `departamento_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `orientador_matricula`, `departamento_codigo`),
  INDEX `fk_disciplinas_orientador1_idx` (`orientador_matricula` ASC) VISIBLE,
  INDEX `fk_disciplinas_departamento1_idx` (`departamento_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_disciplinas_orientador1`
    FOREIGN KEY (`orientador_matricula`)
    REFERENCES `Faculdade`.`orientador` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplinas_departamento1`
    FOREIGN KEY (`departamento_codigo`)
    REFERENCES `Faculdade`.`departamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`matriculadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`matriculadas` (
  `aluno_matricula` INT NOT NULL,
  `disciplinas_Id` INT NOT NULL,
  `frequencia` INT NULL,
  `nome` VARCHAR(45) NULL,
  `media_final` INT NULL,
  PRIMARY KEY (`aluno_matricula`, `disciplinas_Id`),
  INDEX `fk_aluno_has_disciplinas_disciplinas1_idx` (`disciplinas_Id` ASC) VISIBLE,
  INDEX `fk_aluno_has_disciplinas_aluno1_idx` (`aluno_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_has_disciplinas_aluno1`
    FOREIGN KEY (`aluno_matricula`)
    REFERENCES `Faculdade`.`aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_disciplinas_disciplinas1`
    FOREIGN KEY (`disciplinas_Id`)
    REFERENCES `Faculdade`.`disciplinas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`concluidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`concluidas` (
  `aluno_matricula` INT NOT NULL,
  `disciplinas_Id` INT NOT NULL,
  `frequencia` INT NULL,
  `nome` VARCHAR(45) NULL,
  `media_final` INT NULL,
  PRIMARY KEY (`aluno_matricula`, `disciplinas_Id`),
  INDEX `fk_aluno_has_disciplinas1_disciplinas1_idx` (`disciplinas_Id` ASC) VISIBLE,
  INDEX `fk_aluno_has_disciplinas1_aluno1_idx` (`aluno_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_has_disciplinas1_aluno1`
    FOREIGN KEY (`aluno_matricula`)
    REFERENCES `Faculdade`.`aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_disciplinas1_disciplinas1`
    FOREIGN KEY (`disciplinas_Id`)
    REFERENCES `Faculdade`.`disciplinas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`curso_obrigatorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`curso_obrigatorias` (
  `curso_codigo` INT NOT NULL,
  `curso_departamento_codigo` INT NOT NULL,
  `disciplinas_codigo` INT NOT NULL,
  PRIMARY KEY (`curso_codigo`, `curso_departamento_codigo`, `disciplinas_codigo`),
  INDEX `fk_curso_has_disciplinas_disciplinas1_idx` (`disciplinas_codigo` ASC) VISIBLE,
  INDEX `fk_curso_has_disciplinas_curso1_idx` (`curso_codigo` ASC, `curso_departamento_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_has_disciplinas_curso1`
    FOREIGN KEY (`curso_codigo` , `curso_departamento_codigo`)
    REFERENCES `Faculdade`.`curso` (`codigo` , `departamento_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_has_disciplinas_disciplinas1`
    FOREIGN KEY (`disciplinas_codigo`)
    REFERENCES `Faculdade`.`disciplinas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`curso_optativas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`curso_optativas` (
  `curso_codigo` INT NOT NULL,
  `curso_departamento_codigo` INT NOT NULL,
  `disciplinas_codigo` INT NOT NULL,
  PRIMARY KEY (`curso_codigo`, `curso_departamento_codigo`, `disciplinas_codigo`),
  INDEX `fk_curso_has_disciplinas_disciplinas2_idx` (`disciplinas_codigo` ASC) VISIBLE,
  INDEX `fk_curso_has_disciplinas_curso2_idx` (`curso_codigo` ASC, `curso_departamento_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_curso_has_disciplinas_curso2`
    FOREIGN KEY (`curso_codigo` , `curso_departamento_codigo`)
    REFERENCES `Faculdade`.`curso` (`codigo` , `departamento_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_has_disciplinas_disciplinas2`
    FOREIGN KEY (`disciplinas_codigo`)
    REFERENCES `Faculdade`.`disciplinas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`prerequesito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`prerequesito` (
  `disciplinas_codigo` INT NOT NULL,
  `prerequesito_codigo` INT NOT NULL,
  PRIMARY KEY (`disciplinas_codigo`, `prerequesito_codigo`),
  INDEX `fk_disciplinas_has_disciplinas_disciplinas2_idx` (`prerequesito_codigo` ASC) VISIBLE,
  INDEX `fk_disciplinas_has_disciplinas_disciplinas1_idx` (`disciplinas_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_disciplinas_has_disciplinas_disciplinas1`
    FOREIGN KEY (`disciplinas_codigo`)
    REFERENCES `Faculdade`.`disciplinas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplinas_has_disciplinas_disciplinas2`
    FOREIGN KEY (`prerequesito_codigo`)
    REFERENCES `Faculdade`.`disciplinas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
