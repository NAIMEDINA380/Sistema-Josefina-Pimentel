-- Generado por Tecnopraxis — Diseñador de BD

CREATE TABLE `representantes` (
  `id_representante` INT NOT NULL AUTO_INCREMENT,
  `cédula` VARCHAR(15) NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `télefono` VARCHAR(20),
  PRIMARY KEY (`id_representante`),
  UNIQUE KEY `uq_representantes_cédula` (`cédula`)
);

CREATE TABLE `grados_secciones` (
  `id_grado_sección` INT NOT NULL AUTO_INCREMENT,
  `grado` VARCHAR(20) NOT NULL,
  `sección` VARCHAR(10) NOT NULL,
  `turno` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_grado_sección`)
);

CREATE TABLE `estudiantes` (
  `id_estudiante` INT NOT NULL AUTO_INCREMENT,
  `cédula_escolar` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `fecha_de_nacimiento` DATE NOT NULL,
  `género` VARCHAR(10),
  `id_representante` INT NOT NULL,
  `observaciones_medicas` TEXT,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `uq_estudiantes_cédula_escolar` (`cédula_escolar`)
);

CREATE TABLE `inscripciones` (
  `id_inscripción` INT NOT NULL AUTO_INCREMENT,
  `id_estudiante` INT NOT NULL,
  `id_grado_sección` INT NOT NULL,
  `año_escolar` VARCHAR(10) NOT NULL,
  `fecha_de_inscripción` DATE NOT NULL,
  `estado` VARCHAR(15),
  PRIMARY KEY (`id_inscripción`)
);

ALTER TABLE `inscripciones` ADD CONSTRAINT `fk_rel_30` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `inscripciones` ADD CONSTRAINT `fk_rel_31` FOREIGN KEY (`id_grado_sección`) REFERENCES `grados_secciones` (`id_grado_sección`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `estudiantes` ADD CONSTRAINT `fk_rel_32` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`) ON DELETE CASCADE ON UPDATE CASCADE;