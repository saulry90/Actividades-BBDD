CREATE DATABASE bbdd_act10;

CREATE TABLE PROVEEDOR(
    codigo int(3) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE PRODUCTOS(
    codigo int(3) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio FLOAT(7,2) NOT NULL,
    codigo_proveedor int(3) NOT NULL,
    FOREIGN KEY(codigo_proveedor) REFERENCES PROVEEDOR(codigo)
);


-- INSERCIONES

INSERT INTO PROVEEDOR (nombre) VALUES ('ASUS');
INSERT INTO PROVEEDOR (nombre) VALUES ('LENOVO');
INSERT INTO PROVEEDOR (nombre) VALUES ('HEWLETT-PACKARD');
INSERT INTO PROVEEDOR (nombre) VALUES ('SAMSUNG');
INSERT INTO PROVEEDOR (nombre) VALUES ('SEAGATE');
INSERT INTO PROVEEDOR (nombre) VALUES ('CRUCIAL');
INSERT INTO PROVEEDOR (nombre) VALUES ('GIGABYTE');
INSERT INTO PROVEEDOR (nombre) VALUES ('HUAWEI');
INSERT INTO PROVEEDOR (nombre) VALUES ('XIAOMI');

INSERT INTO PRODUCTOS (nombre,precio,codigo_proveedor) VALUES ("Disco duro SATA3 1TB",86.99,5),("Memoria RAM DDR4 8GB",120,6),("Disco SSD 1 TB",150.99,4),("GeForce GTX 1050Ti",185,7),("GeForce GTX 1080 Xtreme",755,6),("Monitor 24 LED Full HD",202,1),("Monitor 27 LED Full HD",245.99,1),("Portátil Yoga 520",559,2),("Portátil Ideapd 320",444,2),("Impresora HP Deskjet 3720",59.99,3),("Impresora HP Laserjet Pro M26nw",180,3);
-- 



-- *A tener en cuenta: he cambiado tabla en base datos nombre de  (nombre_producto y nombre_proveedor)

-- Inserciones desde formulario
INSERT INTO PROVEEDOR (nombre_proveedor) VALUES ('$nproveedor');
INSERT INTO PRODUCTOS (nombre_producto,precio,codigo_proveedor) VALUES ('$nproducto','$precioProducto','$codProveedor');

-- Modificaciones desde formulario
UPDATE PRODUCTOS SET precio=$precioProducto WHERE codigo=$codProducto;
UPDATE PRODUCTOS SET nombre_producto=$nproducto WHERE codigo=$codProducto;
UPDATE PRODUCTOS SET codigo_proveedor=$codProveedor WHERE codigo=$codProducto;

-- Eliminaciones desde formulario
DELETE FROM PRODUCTOS WHERE codigo=$codProducto;











-- CONSULTAS
SELECT * FROM PRODUCTOS;
SELECT nombre_producto,precio FROM PRODUCTOS;
SELECT * FROM PRODUCTOS WHERE codigo_proveedor = $claveProveedor;
SELECT * FROM PRODUCTOS WHERE nombre_producto LIKE = %$tipoProveedor%; --% indica que me da igual lo que haya delante y lo que haya detrás, me muestra todo
SELECT * FROM PRODUCTOS WHERE precio >= $precioProducto;
SELECT * FROM PRODUCTOS WHERE precio BETWEEN $precioProd1 AND $precioProd2;
SELECT * FROM PRODUCTOS WHERE codigo_proveedor = (SELECT codigo FROM PROVEEDOR WHERE nombre_proveedor = '$nombreProveedor');
SELECT * FROM PRODUCTOS,PROVEEDOR WHERE PRODUCTOS.codigo_proveedor=PROVEEDOR.codigo;
SELECT * FROM PRODUCTOS WHERE codigo_proveedor = $codProveedor ORDER BY nombre_producto;
SELECT * FROM PRODUCTOS WHERE codigo_proveedor = (SELECT codigo_proveedor FROM PROVEEDOR WHERE nombre_proveedor = $nproveedor) ORDER BY precio DESC;
