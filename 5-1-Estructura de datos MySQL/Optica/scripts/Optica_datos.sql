USE optica;

INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais) VALUES
('Badia', '123', '1', 'A', 'Barcelona', '00001', 'España'),
('Avenida Siempre Viva', '456', '2', 'B', 'Springfield', '00002', 'Estados Unidos'),
('Diagon Alley', '789', '3', 'C', 'Londres', '00003', 'Reino Unido'),
('Elm Street', '101', '4', 'D', 'Springwood', '00004', 'Estados Unidos');


INSERT INTO direcciones (calle, numero, piso, puerta, ciudad, codigo_postal, pais) VALUES
('Gran Vía', '1234', '5', 'E', 'Madrid', '00005', 'España'),
('Paseo de Gracia', '5678', '6', 'F', 'Barcelona', '00006', 'España'),
('Piccadilly Circus', '91011', '7', 'G', 'Londres', '00007', 'Reino Unido'),
('Fifth Avenue', '121314', '8', 'H', 'Nueva York', '00008', 'Estados Unidos');

INSERT INTO proveedores (nombre, id_direccion, telefono, fax, nif) VALUES
('Optical Solutions', 1, '123456789', '987654321', 'B12345678'),
('Visionary Frames', 2, '234567891', '876543219', 'B23456789'),
('Spectacle Suppliers', 3, '345678912', '765432198', 'B34567890'),
('Eyewear Innovations', 4, '456789123', '654321987', 'B45678901');



INSERT INTO marcas (nombre, id_proveedor) VALUES
('Ray-Ban', 1),
('Oakley', 2),
('Gucci', 1),
('Prada', 3);


INSERT INTO clientes (nombre, id_direccion, telefono, correo_electronico, id_cliente_recomendador) VALUES
('Ana Martínez', 5, '555-0101', 'ana.martinez@email.com', NULL),
('Carlos Gómez', 6, '555-0202', 'carlos.gomez@email.com', NULL),
('Luisa Pérez', 7, '555-0303', 'luisa.perez@email.com', 1),
('Elena Nito', 8, '555-0404', 'elena.nito@email.com', 2);

INSERT INTO empleados (nombre) VALUES
('Laura García'),
('Javier Fernández'),
('Sofía Martínez'),
('David López');


INSERT INTO ventas (id_cliente, id_empleado, id_marca) VALUES
(1, 1, 1),  -- Venta del cliente 1, por el empleado 1, de la marca 1
(2, 2, 2),  -- Venta del cliente 2, por el empleado 2, de la marca 2
(3, 3, 3),  -- Venta del cliente 3, por el empleado 3, de la marca 3
(4, 1, 4);  -- Venta del cliente 4, por el empleado 1, de la marca 4


INSERT INTO modelos_gafas (id_marca, precio) VALUES
(1, 150.00),  -- Modelo de la marca con id_marca 1
(2, 200.00),  -- Modelo de la marca con id_marca 2
(3, 175.50),  -- Modelo de la marca con id_marca 3
(4, 250.00);  -- Modelo de la marca con id_marca 4

INSERT INTO detalles_ventas (id_venta, id_modelo_gafa, cantidad) VALUES
(1, 1, 2),  -- Detalles para la venta 1, modelo de gafas 1, cantidad 2
(1, 2, 1),  -- Detalles para la venta 1, modelo de gafas 2, cantidad 1
(2, 3, 3),  -- Detalles para la venta 2, modelo de gafas 3, cantidad 3
(3, 4, 1);  -- Detalles para la venta 3, modelo de gafas 4, cantidad 1










