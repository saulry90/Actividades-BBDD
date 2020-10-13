CREATE DATABASE bbdd_actividad953;

CREATE TABLE SEDE(
    codigo_sede int(5) AUTO_INCREMENT,
    presupuesto FLOAT(6,2) NOT NULL,
    num_complejos int(4) NOT NULL,
    PRIMARY KEY(codigo_sede)
);

CREATE TABLE UNIDEPORTIVO(
    codigo_complejo int(5) AUTO_INCREMENT,
    area FLOAT(7,2) NOT NULL,
    jefe VARCHAR(20) NOT NULL,
    localizacion VARCHAR(30) NOT NULL,
    info VARCHAR(200) NOT NULL,
    cod_sede int(5) NOT NULL,
    PRIMARY KEY(codigo_complejo),
    FOREIGN KEY(cod_sede) REFERENCES SEDE(codigo_sede)
);

CREATE TABLE POLIDEPORTIVO(
    codigo_complejo int(5) AUTO_INCREMENT,
    area FLOAT(7,2) NOT NULL,
    jefe VARCHAR(20) NOT NULL,
    localizacion VARCHAR(30) NOT NULL,
    info VARCHAR(200) NOT NULL,
    cod_sede int(5) NOT NULL,
    PRIMARY KEY(codigo_complejo),
    FOREIGN KEY(cod_sede) REFERENCES SEDE(codigo_sede)
);

CREATE TABLE COMISARIO(
    nif_comisario VARCHAR(9) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    tlfno int(12) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    PRIMARY KEY(nif_comisario)
);

CREATE TABLE EVENTO(
    codigo_evento int(7) AUTO_INCREMENT,
    equipamento VARCHAR(200) NOT NULL,
    num_comisarios int(3) NOT NULL,
    num_participantes int(5) NOT NULL,
    duracion int(4) NOT NULL,
    fecha DATE NOT NULL,
    nif_comis VARCHAR(9) NOT NULL, 
    PRIMARY KEY(codigo_evento),
    FOREIGN KEY(nif_comis) REFERENCES COMISARIO(nif_comisario)
);


CREATE TABLE PARTICIPAN(
    cod_evento int(7) AUTO_INCREMENT,
    nif_comis VARCHAR(9) NOT NULL, 
    PRIMARY KEY(cod_evento,nif_comis),
    FOREIGN KEY(cod_evento) REFERENCES EVENTO(codigo_evento),
    FOREIGN KEY(nif_comis) REFERENCES COMISARIO(nif_comisario)
);