CREATE DATABASE bbdd_actividad9;

CREATE TABLE CLIENTE(
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    direccion VARCHAR(100) NOT NULL,
    provincia VARCHAR(30) NOT NULL
);

CREATE TABLE COCHE_NUEVO(
    matricula VARCHAR(7) PRIMARY KEY,
    modelo VARCHAR(30) NOT NULL,
    color VARCHAR(20) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    fecha_fabricacion DATE NOT NULL
);

CREATE TABLE COCHE_USADO(
    matricula VARCHAR(7) PRIMARY KEY,
    modelo VARCHAR(30) NOT NULL,
    color VARCHAR(20) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    num_km INT(7)
);

CREATE TABLE REPARAR(
    matricula VARCHAR(7),
    dni_mecanico VARCHAR(9),
    PRIMARY KEY(matricula,dni_mecanico),
    FOREIGN KEY(matricula) REFERENCES COCHE_USADO(matricula),
    FOREIGN KEY(dni_mecanico) REFERENCES MECANICO(dni_mec)
);

CREATE TABLE MECANICO(
   dni_mec VARCHAR(9) PRIMARY KEY,
   nombre VARCHAR(30) NOT NULL,
   apellido1 VARCHAR(30) NOT NULL,
   apellido2 VARCHAR(30),
   fecha_contratacion DATE NOT NULL,
   salario FLOAT(6,2) NOT NULL
);