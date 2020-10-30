CREATE TABLE COMPRA(
    dni_cliente VARCHAR(9),
    codigo_producto int(3),
    fecha_compra DATE,
    unidades INT(3),
    PRIMARY KEY(fecha_compra,dni_cliente,codigo_producto),
    FOREIGN KEY(dni_cliente) REFERENCES CLIENTE(dni),
    FOREIGN KEY(codigo_producto) REFERENCES PRODUCTOS(codigo)
);

