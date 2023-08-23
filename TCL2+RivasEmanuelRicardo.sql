-- Elimina el procedimiento almacenado si existe previamente
DROP PROCEDURE IF EXISTS InsertProviders;

-- Cambia el delimitador
DELIMITER //

-- Crea el procedimiento almacenado
CREATE PROCEDURE InsertProviders()
BEGIN
    -- Iniciar una transacción
    START TRANSACTION;

    -- Inserta los primeros 4 registros
    INSERT INTO PROVEEDORES (ID_CLIENTE, Nombre, Telefono, Direccion) VALUES
        (1, 'Kualalumpu', 1564813158, 'Heavy 1298'),
        (2, 'Wakiki', 1513254892, 'Pyro 628'),
        (3, 'RazenCat', 1589745682, 'Rivadavia 168'),
        (4, 'Krouven', 1599843576, 'Alcorta 123');

    -- Agrega un savepoint después de la inserción del registro #4
    SAVEPOINT after_insert_4;

    -- Inserta los siguientes 4 registros
    INSERT INTO PROVEEDORES (ID_CLIENTE, Nombre, Telefono, Direccion) VALUES
        (5, 'Rusting', 1549811597, 'Potosi 1919'),
        (6, 'Lawliet', 1582039670, 'Belgrano 1008'),
        (7, 'Draven', 1513058357, 'Reaper 1651'),
        (8, 'Astralis', 1500168846, 'Calendura 1564');

    -- Agrega un savepoint después de la inserción del registro #8
    SAVEPOINT after_insert_8;

    -- Elimina el savepoint de los primeros 4 registros insertados (comentado)
    -- ROLLBACK TO after_insert_4;

    -- Confirmar o deshacer la transacción
    -- Descomenta la sentencia COMMIT o ROLLBACK según tu necesidad
    -- COMMIT;
    -- ROLLBACK;
END;
//

-- Restaura el delimitador
DELIMITER ;