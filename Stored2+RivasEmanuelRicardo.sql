DELIMITER //
CREATE PROCEDURE InsertarCliente(
    IN nombre VARCHAR(30),
    IN telefono VARCHAR(10),
    IN direccion VARCHAR(50)
)
BEGIN
    INSERT INTO CLIENTES (nombre_cliente, telefono, direccion)
    VALUES (nombre, telefono, direccion);
END;
//
DELIMITER ;