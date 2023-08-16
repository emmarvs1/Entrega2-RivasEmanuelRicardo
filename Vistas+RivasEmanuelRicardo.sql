use mercado_script;


CREATE VIEW productos_precio_alto AS
SELECT ID_PRODUCTO, nombre, precio, descripcion_producto
FROM PRODUCTOS
WHERE precio > 100; -- Puedes ajustar el valor según tus necesidades

CREATE VIEW productos_peso_ligero AS
SELECT ID_PRODUCTO, nombre, Peso
FROM PRODUCTOS
WHERE Peso <= '1 kg'; -- Puedes ajustar el valor según tus necesidades

CREATE VIEW facturas_con_descuento AS
SELECT ID_FACTURA, Precio, Descuento, Total
FROM FACTURAS
WHERE Descuento > 0;

CREATE VIEW facturas_costo_envio_alto AS
SELECT ID_FACTURA, Precio, Costo_envio, Total
FROM FACTURAS
WHERE Costo_envio > 10; -- Puedes ajustar el valor según tus necesidades

CREATE VIEW detalle_ingredientes_producto AS
SELECT
    I.ID_INGREDIENTES,
    I.ID_PRODUCTO,
    P.nombre AS Nombre_Producto,
    I.Cantidad
FROM
    INGREDIENTES I
JOIN
    PRODUCTOS P ON I.ID_PRODUCTO = P.ID_PRODUCTO;