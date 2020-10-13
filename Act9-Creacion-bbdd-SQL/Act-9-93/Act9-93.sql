CREATE DATABASE bbdd_actividad993;

CREATE TABLE ACCIDENTE(
    nombre VARCHAR(30) NOT NULL PRIMARY KEY,
    pos_x REAL NOT NULL,
    pos_y REAL NOT NULL
);

CREATE TABLE MONTANIA(
    altura FLOAT(4,2) NOT NULL,
    nombre_accidente VARCHAR(30) NOT NULL PRIMARY KEY,
    FOREIGN KEY(nombre_accidente) REFERENCES ACCIDENTE(nombre)
);

CREATE TABLE LAGO(
    extension FLOAT(4,2) NOT NULL,
    nombre_accidente VARCHAR(30) NOT NULL PRIMARY KEY,
    FOREIGN KEY(nombre_accidente) REFERENCES ACCIDENTE(nombre)
);

CREATE TABLE RIO(
    longitud FLOAT(4,2) NOT NULL,
    nombre_accidente VARCHAR(30) NOT NULL PRIMARY KEY,
    FOREIGN KEY(nombre_accidente) REFERENCES ACCIDENTE(nombre)
);

CREATE TABLE PAIS(
    nombre VARCHAR(30) NOT NULL PRIMARY KEY,
    extension FLOAT(4,2) NOT NULL,
    poblacion int(10) NOT NULL
);

CREATE TABLE ESTAR(
    nombre_pais VARCHAR(30) NOT NULL,
    nombre_accid VARCHAR(30) NOT NULL,
    PRIMARY KEY(nombre_pais,nombre_accid),
    FOREIGN KEY(nombre_pais) REFERENCES PAIS(nombre),
    FOREIGN KEY(nombre_accid) REFERENCES ACCIDENTE(nombre)
);

CREATE TABLE LOCALIDAD(
    codigo int(6) NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    nom_pais VARCHAR(30) NOT NULL,
    FOREIGN KEY(nom_pais) REFERENCES PAIS(nombre)
);

CREATE TABLE PASAR(
    nombre_rio VARCHAR(30) NOT NULL,
    cod_localidad int(6) NOT NULL,
    PRIMARY KEY(nombre_rio,cod_localidad),
    FOREIGN KEY(nombre_rio) REFERENCES ACCIDENTE(nombre),
    FOREIGN KEY(cod_localidad) REFERENCES LOCALIDAD(codigo)
);