--Media de todos los precios de la tabla productos
--SELECT AVG(precio) FROM PRODUCTOS;

--Media de los precios de un proveedor en concreto de la tabla productos
--SELECT AVG(precio) FROM PRODUCTOS WHERE codigo_proveedor = (SELECT codigo FROM PROVEEDOR WHERE nombre_proveedor = 'ASUS');

--1 Media de los precios de un proveedor en concreto creando un alias
--SELECT ROUND(AVG(precio),2) media,codigo_proveedor FROM PRODUCTOS WHERE codigo_proveedor = (SELECT codigo FROM PROVEEDOR WHERE nombre_proveedor = $nombreProveedor);
SELECT ROUND(AVG(precio),2) AS media,codigo_proveedor FROM PRODUCTOS WHERE codigo_proveedor = $claveProveedor;

--2 Media de los precios de CADA provedor (para hacer alias da igual AS o sin el)
SELECT ROUND(AVG(precio),2) media,codigo_proveedor FROM PRODUCTOS GROUP BY codigo_proveedor;

--3 Fabricantes con precios de productos cuya media mayor o igual a 200€
SELECT nombre_proveedor FROM PRODUCTOS,PROVEEDOR WHERE PROVEEDOR.codigo = PRODUCTOS.codigo_proveedor GROUP BY nombre_proveedor HAVING AVG(precio)>200;

--4 Producto Con el precio mas bajo
SELECT nombre_producto FROM PRODUCTOS WHERE precio = (SELECT MIN(precio) FROM PRODUCTOS);

--5 aplicar 10% descuento si su precio es mayor a 120
UPDATE PRODUCTOS SET precio=precio*0.9 WHERE precio>120;


--6 Añadir la columna totalunidades en la tabla Producto
ALTER TABLE PRODUCTOS ADD COLUMN totalunidades INT(4) NOT NULL;






--7 Añadir una tabla cliente que tenga los siguientes campos: dni, nombre, apellido1,apellido2, calle, codigo postal, población, provincia, mail,contraseña
CREATE TABLE CLIENTE(
    dni VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(9),
    calle VARCHAR(150) NOT NULL,
    cp INT(5),
    poblacion VARCHAR(50),
    provincia VARCHAR(50) NOT NULL,
    mail VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(20) NOT NULL
);


--Un cliente puede comprar varios productos y un producto puede ser comprado por varios clientes. Queremos saber la fecha de compra y las unidades que compra.
CREATE TABLE COMPRA(
    dni_cliente VARCHAR(9),
    codigo_producto int(3),
    fecha_compra DATE,
    unidades INT(3),
    PRIMARY KEY(fecha_compra,dni_cliente,codigo_producto),
    FOREIGN KEY(dni_cliente) REFERENCES CLIENTE(dni),
    FOREIGN KEY(codigo_producto) REFERENCES PRODUCTOS(codigo)
);
