CREATE DATABASE bbdd_actividad9103;

CREATE TABLE INGREDIENTE(
    codigo int(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE ESTANTERIA(
    codigo int(5) NOT NULL PRIMARY KEY,
    tamanio FLOAT(4,2) NOT NULL
);

CREATE TABLE ALMACENAR(
    cantidad int(3) NOT NULL,
    cod_estanteria int(5) NOT NULL,
    cod_ingrediente int(5) NOT NULL,
    PRIMARY KEY(cod_estanteria,cod_ingrediente),
    FOREIGN KEY(cod_estanteria) REFERENCES ESTANTERIA(codigo),
    FOREIGN KEY(cod_ingrediente) REFERENCES INGREDIENTE(codigo)
);

CREATE TABLE ALMACEN(
    nombre VARCHAR(30) NOT NULL PRIMARY KEY,
    numero int(5) NOT NULL,
    descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE ESTANTEALMACEN(
    nombre_almacen VARCHAR(30) NOT NULL,
    cod_estanteria int(5) NOT NULL,
    PRIMARY KEY(nombre_almacen,cod_estanteria),
    FOREIGN KEY(nombre_almacen) REFERENCES ALMACEN(nombre),
    FOREIGN KEY(cod_estanteria) REFERENCES ESTANTERIA(codigo)
);

CREATE TABLE EMPLEADO(
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    num_ss int(11) NOT NULL,
    telefono_movil int(12) NOT NULL,
    telefono_fijo int(12),
    dni VARCHAR(9) NOT NULL PRIMARY KEY
);

CREATE TABLE COCINERO(
    dni_empleado VARCHAR(9) NOT NULL PRIMARY KEY,
    anios_servicio int(2),
    FOREIGN KEY(dni_empleado) REFERENCES EMPLEADO(dni)
);

CREATE TABLE PINCHE(
    fecha_nacimiento DATE NOT NULL,
    dni_empleadop VARCHAR(9) NOT NULL PRIMARY KEY,
    dni_cocinero VARCHAR(9) NOT NULL,
    FOREIGN KEY(dni_cocinero) REFERENCES COCINERO(dni_empleado)
);


CREATE TABLE PLATO(
    nombre VARCHAR(30) NOT NULL PRIMARY KEY,
    precio FLOAT(4,2) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    dni_cocinero VARCHAR(9) NOT NULL,
    FOREIGN KEY(dni_cocinero) REFERENCES COCINERO(dni_empleado)
);

CREATE TABLE INGREDIENTEPLATO(
    cantidad int(3) NOT NULL,
    cod_ingrediente int(5) NOT NULL,
    nombre_plato VARCHAR(30) NOT NULL,
    PRIMARY KEY(cod_ingrediente,nombre_plato),
    FOREIGN KEY(cod_ingrediente) REFERENCES INGREDIENTE(codigo),
    FOREIGN KEY(nombre_plato) REFERENCES PLATO(nombre)
);