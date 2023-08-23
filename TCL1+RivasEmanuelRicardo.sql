-- Elimina el procedimiento almacenado si existe previamente
DROP PROCEDURE IF EXISTS ProcessProducts;

-- Cambia el delimitador
DELIMITER //

-- Crea el procedimiento almacenado
CREATE PROCEDURE ProcessProducts()
BEGIN
    DECLARE is_empty BOOLEAN;

    -- Verificar si la tabla PRODUCTOS está vacía
    SELECT COUNT(*) = 0 INTO is_empty FROM PRODUCTOS;

    -- Iniciar una transacción
    START TRANSACTION;

    -- Se elimina la restricción para borrado de campos que sean FK.
    SET FOREIGN_KEY_CHECKS = 0;

    -- Eliminar registros si no está vacía.
    IF NOT is_empty THEN
        DELETE FROM PRODUCTOS LIMIT 2;
        SELECT "Se eliminaron registros de la tabla PRODUCTOS." AS Message;
    ELSE
        -- Insertar registros si está vacía.
        INSERT INTO PRODUCTOS (nombre, precio, descripcion_producto, foto_producto, Peso) VALUES
            ('Producto 1', 10.99, 'Descripción del Producto 1', 'imagen1.jpg', '100g'),
            ('Producto 2', 19.99, 'Descripción del Producto 2', 'imagen2.jpg', '200g'),
            ('Producto 3', 5.99, 'Descripción del Producto 3', 'imagen3.jpg', '50g');
        SELECT "Se insertaron 3 registros en la tabla PRODUCTOS." AS Message;
    END IF;

    -- Confirmar o deshacer la transacción
    -- Descomenta la sentencia COMMIT o ROLLBACK según necesidad
    -- COMMIT;
    -- ROLLBACK;

    -- Vuelvo a setear la restricción de campos FK.
    SET FOREIGN_KEY_CHECKS = 1;
END;
//

-- Restaura el delimitador
DELIMITER ;