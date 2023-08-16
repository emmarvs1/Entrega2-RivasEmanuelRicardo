CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');


DELIMITER $$
CREATE FUNCTION mi_funcion (texto varchar(256))
RETURNS varchar(256) DETERMINISTIC
BEGIN
	declare mensaje_final VARCHAR(256);
	SET mensaje_final = CONCAT(texto, ' Ema');
	return mensaje_final;
END$$

select count(id_proveedor) from PROVEEDORES;

DELIMITER $$
CREATE FUNCTION nombre_proveedor (id_proveedor int)
RETURNS varchar(256) DETERMINISTIC
BEGIN
    declare nombre_proveedor_6 VARCHAR(256);
    SET nombre_proveedor_6 = (SELECT Nombre FROM PROVEEDORES where ID_PROVEEDOR = id_proveedor limit 1);
	return nombre_proveedor_6;
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION suma (num1 int, num2 int)
RETURNS int DETERMINISTIC
BEGIN
    declare resultado int;
    SET resultado = num1 + num2;
	return resultado;
END$$

DELIMITER ;

select p.ID_PROVEEDOR, p.ID_CLIENTE, p.Nombre, c.nombre_cliente from PROVEEDORES as p join CLIENTES as c on p.ID_CLIENTE = c.ID_CLIENTE;

select mi_funcion('Hola');
select nombre_proveedor(6);

select Nombre from PROVEEDORES where ID_PROVEEDOR = 6;
 select Nombre into @nombre_proveedor_6 from PROVEEDORES where ID_PROVEEDOR = id_proveedor;
 
 SELECT Nombre FROM PROVEEDORES where 6 = id_proveedor;
 
 select suma(25, 653);