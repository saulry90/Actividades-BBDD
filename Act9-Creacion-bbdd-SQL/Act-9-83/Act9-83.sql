CREATE DATABASE bbdd_actividad983;

CREATE TABLE LIBRO(
    nombre VARCHAR(30) NOT NULL,
    anio int(4) NOT NULL,
    resumen VARCHAR(200) NOT NULL,
    num_paginas int(4) NOT NULL,
    isbn int(13) NOT NULL,
    PRIMARY KEY(isbn)
);

CREATE TABLE CD(
    nombre VARCHAR(30) NOT NULL,
    anio int(4) NOT NULL,
    resumen VARCHAR(200) NOT NULL,
    num_canciones int(3) NOT NULL,
    isbn int(13) NOT NULL,
    PRIMARY KEY(isbn)
);

CREATE TABLE PELICULA(
    nombre VARCHAR(30) NOT NULL,
    anio int(4) NOT NULL,
    resumen VARCHAR(200) NOT NULL,
    duracion int(3) NOT NULL,
    isbn int(13) NOT NULL,
    PRIMARY KEY(isbn)
);

CREATE TABLE AUTOR(
    nombre VARCHAR(30) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    codigo_autor int(5) AUTO_INCREMENT,
    PRIMARY KEY(codigo_autor)
);

CREATE TABLE CREAR(
    cod_autor int(5) AUTO_INCREMENT,
    isbn_articulo int(13) NOT NULL,
    PRIMARY KEY(cod_autor,isbn_articulo),
    FOREIGN KEY(isbn_articulo) REFERENCES CD(isbn),
    FOREIGN KEY(isbn_articulo) REFERENCES PELICULA(isbn),
    FOREIGN KEY(isbn_articulo) REFERENCES LIBRO(isbn),
    FOREIGN KEY(cod_autor) REFERENCES AUTOR(codigo_autor)
);

CREATE TABLE EJEMPLAR(
    codigo_ejemplar int(5) AUTO_INCREMENT,
    deteriorado bit NOT NULL,
    comentario VARCHAR(200) NOT NULL,
    isbn_ejemplar int(13) NOT NULL,
    PRIMARY KEY(codigo_ejemplar),
    FOREIGN KEY(isbn_ejemplar) REFERENCES CD(isbn),
    FOREIGN KEY(isbn_ejemplar) REFERENCES PELICULA(isbn),
    FOREIGN KEY(isbn_ejemplar) REFERENCES LIBRO(isbn)
);

CREATE TABLE SOCIO(
    dni VARCHAR(9) UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    tlfno int(12) NOT NULL,
    codigo_socio int(5) AUTO_INCREMENT,
    PRIMARY KEY(codigo_socio)
);

CREATE TABLE PRESTAR(
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    fecha_tope DATE NOT NULL,
    cod_socio int(5) NOT NULL,
    cod_ejemplar int(5) NOT NULL,
    PRIMARY KEY(cod_socio,cod_ejemplar),
    FOREIGN KEY(cod_socio) REFERENCES SOCIO(codigo_socio),
    FOREIGN KEY(cod_ejemplar) REFERENCES EJEMPLAR(codigo_ejemplar)
);