use ema;

INSERT INTO CLIENTES (Nombre_cliente, Telefono, Direccion) VALUES
('Roberto', '1516131639', 'Calle siempreviva 123'),
('Cristiano','1561161616', 'Habiaunavez 168'),
('Ramona','1561641651', 'Desdelejos 987'),
('Emanuel', '1516841681', 'Larrauro 2543'),
('Nadia', '1561848974', 'Eclipsa 6846');

INSERT INTO PROVEEDORES (Nombre, Telefono, Direccion, id_cliente) VALUES
('Distribuidora Nutrique', '46844864', 'Razer 123', 6),
('Distribuidora Royal', '16813128', 'Steelseries 321', 7),
('Piedritas capicua', '19841385', 'Ulalala 186', 8),
('Golosinas michi', '16864684', 'wala 189', 9),
('Camichis confort', '99999999', 'Lalwles 498', 10);

INSERT INTO PRODUCTOS (Nombre, Precio, Descripcion_producto, foto_producto, Peso) VALUES
('Nutrique', '7500', 'para cachorros de 6 meses a 3 anios', 'imagen-generica.jpg', '5kg'),
('Royal Canning' , '6800', 'para ovejeros', 'imagen-generica.jpg', '5kg'),
('Piedritas confort', '500', 'piedritas para gatos', 'imagen-generica.jpg', '2kg'),
('Pescaditos', '800', 'golosinas hechas con pescado', 'imagen-generica.jpg','400gr'),
('Gaules', '4500', 'mini sommier con colchon para gatitos', 'imagen-generica.jpg', '4kg');

INSERT INTO STOCK (Nombre_del_producto, Cantidad, Medida, Stock_minimo, id_producto, id_proveedor) VALUES
('Nutrique', '15', '1.5 metros por 40cm', '5', 2, 6),
('Royal Canning', '29', '1.5 metros por 40cm', '5', 2, 8),
('Piedritas confort', '24', '40x40cm', '10', 4, 7),
('Pescaditos','26', '10x10cm', '15', 5, 10),
('Gaules', '13', '60x45cm', '5', 5, 7);

INSERT INTO EMPLEADOS (Nombre, Apellido, Telefono_empleado, email_empleado) VALUES
('Jorgito', 'Aranda', '1148644684', 'jorgitoaranda@petmarket.com'),
('Manuel','Stroll', '1168414684', 'manuelstroll@petmarket.com'),
('Emanuel', 'Alonso', '1146484849', 'emanuelalonso@petmarket.com'),
('Ricardo', 'Hamilton', '1144444444', 'ricardohamilton@petmarket.com'),
('Nadia', 'Rosberg', '1138171687', 'nadiarosberg@petmarket.com');

alter table STOCK modify column Medida varchar(256);





