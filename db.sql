
-- Crear base de datos ssi con usuario propietario 'mamian' y codificacíon UTF-8

/*CREATE DATABASE "ssi"
    WITH OWNER "mamian"
    ENCODING 'UTF8';*/

DROP TABLE IF EXISTS persona;

CREATE TABLE persona (
	id_persona serial primary key,
	nombres varchar (50) not null,
	apellidos varchar (50) not null,
	tipo_documento varchar (50) not null,
	numero_documento int not null,
	rol varchar (20) not null,
	estado varchar(8) not null,
	password varchar(100) not null,

	UNIQUE (tipo_documento, numero_documento),

	CONSTRAINT check_tipos
		CHECK (tipo_documento IN('CC-Cédula de ciudadanía', 'CE-Cédula de Extranjería', 'TI-Tarjeta de identidad', 'PA-Pasaporte')),

	CONSTRAINT check_roles
		CHECK (rol IN('Estudiante', 'Profesor', 'Secretaría')),

	CONSTRAINT check_numero_documento 
		CHECK (numero_documento > 0)
);




DROP TABLE IF EXISTS asignatura;

CREATE TABLE asignatura (
	id_asignatura serial primary key,
	nombre_asignatura varchar (50) not null,
	codigo_asignatura varchar (50) not null,
	precio_asignatura integer not null,

	CONSTRAINT check_precio_asignatura
		CHECK (precio_asignatura >= 0),

	UNIQUE (codigo_asignatura)
);

DROP TABLE IF EXISTS matricula;

CREATE TABLE matricula (
	id_matricula serial primary key,
	id_profesor integer not null,
	id_estudiante integer not null,
	id_asignatura integer not null,
	grupo_asignatura varchar(10) not null,
	periodo_academico varchar (20) not null,
	nota integer,

	CONSTRAINT check_nota 
		CHECK (nota >= 0),

	CONSTRAINT fk_profesor 
		FOREIGN KEY (id_profesor) REFERENCES persona (id_persona) ON DELETE CASCADE,

	CONSTRAINT fk_estudiante
		FOREIGN KEY (id_estudiante) REFERENCES persona (id_persona) ON DELETE CASCADE,

	CONSTRAINT fk_asignatura
		FOREIGN KEY (id_asignatura) REFERENCES asignatura (id_asignatura) ON DELETE CASCADE
);