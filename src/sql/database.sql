-- Generado por Tecnopraxis — Diseñador de BD

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uq_usuario` (`usuario`)
);

CREATE TABLE IF NOT EXISTS `personal` (
  `id_personal` INT NOT NULL AUTO_INCREMENT,
  `cedula` VARCHAR(15) NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `sueldo_base` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_personal`),
  UNIQUE KEY `uq_personal_cedula` (`cedula`)
);

CREATE TABLE IF NOT EXISTS `nominas` (
  `id_nomina` INT NOT NULL AUTO_INCREMENT,
  `id_personal` INT NOT NULL,
  `fecha_pago` DATE NOT NULL,
  `asignaciones` DECIMAL(10,2) DEFAULT 0,
  `deducciones` DECIMAL(10,2) DEFAULT 0,
  `total_neto` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_nomina`),
  CONSTRAINT `fk_nomina_personal` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `representantes` (
  `id_representante` INT NOT NULL AUTO_INCREMENT,
  `cedula` VARCHAR(15) NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(20),
  PRIMARY KEY (`id_representante`),
  UNIQUE KEY `uq_representantes_cedula` (`cedula`)
);

CREATE TABLE IF NOT EXISTS `grados_secciones` (
  `id_grado_seccion` INT NOT NULL AUTO_INCREMENT,
  `grado` VARCHAR(20) NOT NULL,
  `seccion` VARCHAR(10) NOT NULL,
  `turno` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_grado_seccion`)
);

CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` INT NOT NULL AUTO_INCREMENT,
  `cedula_escolar` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `genero` VARCHAR(10),
  `id_representante` INT NOT NULL,
  `observaciones_medicas` TEXT,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `uq_estudiantes_cedula_escolar` (`cedula_escolar`),
  CONSTRAINT `fk_estudiante_representante` FOREIGN KEY (`id_representante`) REFERENCES `representantes` (`id_representante`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `inscripciones` (
  `id_inscripcion` INT NOT NULL AUTO_INCREMENT,
  `id_estudiante` INT NOT NULL,
  `id_grado_seccion` INT NOT NULL,
  `año_escolar` VARCHAR(10) NOT NULL,
  `fecha_inscripcion` DATE NOT NULL,
  `estado` VARCHAR(15),
  PRIMARY KEY (`id_inscripcion`),
  CONSTRAINT `fk_inscripcion_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE,
  CONSTRAINT `fk_inscripcion_grado` FOREIGN KEY (`id_grado_seccion`) REFERENCES `grados_secciones` (`id_grado_seccion`) ON DELETE CASCADE
);

INSERT INTO `usuarios` (`usuario`, `password`, `rol`) VALUES ('NAYMEDINA12', 'Nayson123*', 'administrador');