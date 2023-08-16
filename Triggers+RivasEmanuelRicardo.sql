USE mercado_script;

DELIMITER $$

CREATE TRIGGER clientes_AFTER_INSERT
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO logs (event_name, event_user)
    VALUES ('Nuevo cliente generado', SESSION_USER());
END $$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER before_insert_clientes_log BEFORE INSERT ON CLIENTES
FOR EACH ROW
BEGIN
    INSERT INTO clientes_log (cliente_id, tipo_operacion, usuario, fecha, hora)
    VALUES (NEW.ID_CLIENTE, 'INSERT', USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_update_direccion
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    IF OLD.direccion != NEW.direccion THEN
        INSERT INTO direccion_historial (cliente_id, antigua_direccion, nueva_direccion, fecha_cambio)
        VALUES (NEW.ID_CLIENTE, OLD.direccion, NEW.direccion, NOW());
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER before_insert_update_precio
BEFORE INSERT ON PRODUCTOS
FOR EACH ROW
BEGIN
    IF NEW.precio <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio debe ser un valor positivo';
    END IF;
END $$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_update_precio_audit
AFTER UPDATE ON PRODUCTOS
FOR EACH ROW
BEGIN
    IF OLD.precio != NEW.precio THEN
        INSERT INTO precio_auditoria (producto_id, antiguo_precio, nuevo_precio, fecha_cambio)
        VALUES (NEW.ID_PRODUCTO, OLD.precio, NEW.precio, NOW());
    END IF;
END $$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_insert_asignar_foto
BEFORE INSERT ON PRODUCTOS
FOR EACH ROW
BEGIN
    IF NEW.foto_producto = '' OR NEW.foto_producto IS NULL THEN
        SET NEW.foto_producto = 'imagen-generica.jpg';
    END IF;
END $$
DELIMITER ;