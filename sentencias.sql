--Subconsulta Productos cuyo precio sea mayor al del codigo de producto 6
SELECT precio FROM PRODUCTOS WHERE codigo>(SELECT FROM PRODUCTOS WHERE codigo=6);

--Subconsulta Productos cuyo precio sea mayor a alguno cuyo nombre es portatil
SELECT * FROM PRODUCTOS WHERE precio > ANY (SELECT precio FROM PRODUCTOS WHERE nombre_producto LIKE '%Portatil%');

-- Productos cuyos precios estén en el precio de producto mayor a 50
SELECT * FROM PRODUCTOS WHERE precio IN (SELECT precio FROM PRODUCTOS WHERE precio>50)