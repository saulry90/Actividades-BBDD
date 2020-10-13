CREATE DATABASE bbdd_actividad973;

CREATE TABLE DESEMPLEADO(
    nif_desempleado VARCHAR(9) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    tlfno int(12) NOT NULL,
    edad int(3) NOT NULL,
    PRIMARY KEY(nif_desempleado)
);

CREATE TABLE TRABAJADOR(
    nif_trabajador VARCHAR(9) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    tlfno int(12) NOT NULL,
    edad int(3) NOT NULL,
    cif VARCHAR(9) NOT NULL,
    nombre_empresa VARCHAR(30) NOT NULL,
    tlfno_empresa int(12) NOT NULL,
    direccion_empresa VARCHAR(30) NOT NULL,
    PRIMARY KEY(nif_trabajador)
);

CREATE TABLE PROFESOR(
    dni_profesor VARCHAR(9) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    tlfno int(12) NOT NULL,
    PRIMARY KEY(dni_profesor)
);

CREATE TABLE CURSO(
    codigo_curso int(5) AUTO_INCREMENT,
    programa VARCHAR(100) NOT NULL,
    horas int(5) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    dni_preofe VARCHAR(9) NOT NULL,
    PRIMARY KEY(codigo_curso),
    FOREIGN KEY(dni_preofe) REFERENCES PROFESOR(dni_profesor)
);

CREATE TABLE REALIZA(
    numero_curso int(5) AUTO_INCREMENT,
    nota int(5) NOT NULL,
    fecha_inicial DATE NOT NULL,
    fecha_final DATE NOT NULL,
    cod_curso int(5),
    dni_alumno VARCHAR(9) NOT NULL,
    PRIMARY KEY(numero_curso,cod_curso,dni_alumno),
    FOREIGN KEY(cod_curso) REFERENCES CURSO(codigo_curso),
    FOREIGN KEY(dni_alumno) REFERENCES TRABAJADOR(nif_trabajador),
    FOREIGN KEY(dni_alumno) REFERENCES DESEMPLEADO(nif_desempleado)
);