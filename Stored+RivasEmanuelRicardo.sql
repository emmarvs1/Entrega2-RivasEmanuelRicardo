DELIMITER //
CREATE PROCEDURE EliminarProductoConVerificacion(IN idProducto INT)
BEGIN
    DECLARE productoExistente INT;

    SELECT COUNT(*) INTO productoExistente
    FROM PRODUCTOS
    WHERE ID_PRODUCTO = idProducto;

    IF productoExistente > 0 THEN
        DELETE FROM PRODUCTOS
        WHERE ID_PRODUCTO = idProducto;
    ELSE
        SELECT 'El producto no existe';
    END IF;
END;
//
DELIMITER ;