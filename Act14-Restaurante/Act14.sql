CREATE DATABASE bbdd_act14restaurante;

CREATE TABLE USER_ADMIN(
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    direccion VARCHAR(40) NOT NULL,
    tlfno int(12) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    useradmin VARCHAR(30) NOT NULL PRIMARY KEY,
    pasword VARCHAR(15) NOT NULL
);

CREATE TABLE USER_CLIENTE(
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    direccion VARCHAR(40) NOT NULL,
    tlfno int(12) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    usercliente VARCHAR(30) NOT NULL PRIMARY KEY,
    pasword VARCHAR(15) NOT NULL,
    puntos int(5)
);

CREATE TABLE PLATO(
    nombre_plato VARCHAR(120) NOT NULL PRIMARY KEY,
    precio float(7,2) NOT NULL,
    tipo VARCHAR(10) NOT NULL
);

CREATE TABLE PEDIDO(
    codigo_pedido int(7) AUTO_INCREMENT,
    precio float(7,2) NOT NULL,
    fecha date,
    usercliente VARCHAR(30),
    nombre_plato VARCHAR(120),
    PRIMARY KEY(codigo_pedido,usercliente,nombre_plato),
    FOREIGN KEY(usercliente) REFERENCES USER_CLIENTE(usercliente),
    FOREIGN KEY(nombre_plato) REFERENCES PLATO(nombre_plato)
);

INSERT INTO PLATO (nombre_plato,precio,tipo) VALUES ('Macarrones','6','Primero');
INSERT INTO PLATO (nombre_plato,precio,tipo) VALUES ('Tabla de quesos','14','Entrante');



SELECT nombre_plato FROM plato WHERE nombre_plato = 'Tabla de quesos';

INSERT INTO user_admin (nombre,apellido1,apellido2,direccion,tlfno,provincia,useradmin,pasword) VALUES ('$nombre','$apellido1','$apellido2','$direccion','$telefono','$provincia','$user','$passwordc');

UPDATE plato SET nombre_plato=$nplato,tipo=$tiplato,precio=$prplato WHERE nombre_plato=$nombre_plato;


Select Top 1 IDCELULAR, COUNT(IDCELULAR) AS VENTAS
from Venta
Group by IdCelular
Order by count(2) desc


SELECT nombre_plato,sum(cantidad) AS suma FROM pedido Group by nombre_plato Order by suma DESC