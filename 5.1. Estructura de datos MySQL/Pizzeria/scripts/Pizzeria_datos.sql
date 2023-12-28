USE pizzeria;

INSERT INTO direcciones (calle, numero, codigo_postal, localidad, provincia, telefono) VALUES
('Badia', '123', '00001', 'Barcelona', 'Barcelona', '930000001'),
('Avenida Siempre Viva', '456', '00002', 'Springfield', 'Illinois', '930000002'),
('Diagon Alley', '789', '00003', 'Londres', 'Londres', '930000003'),
('Elm Street', '101', '00004', 'Springwood', 'Ohio', '930000004'),
('Fifth Avenue', '102', '00005', 'Nueva York', 'Nueva York', '930000005'),
('Baker Street', '221B', '00006', 'Londres', 'Londres', '930000006'),
('Rue Morgue', '666', '00007', 'París', 'Ile-de-France', '930000007'),
('Privet Drive', '4', '00008', 'Little Whinging', 'Surrey', '930000008');

INSERT INTO clientes (nombre, apellidos, id_direccion, correo_electronico) VALUES
('John', 'Doe', 1, 'john.doe@example.com'),
('Jane', 'Doe', 2, 'jane.doe@example.com'),
('Jim', 'Beam', 3, 'jim.beam@example.com'),
('Jack', 'Daniels', 4, 'jack.daniels@example.com');



INSERT INTO categoria_productos (nombre_categoria) VALUES
('Pizza'),
('Hamburguesa'),
('Bebida');

INSERT INTO productos (nombre, descripcion, imagen, precio, id_categoria_producto) VALUES
('Pizza Margarita', 'Pizza clásica con tomate, mozzarella y albahaca.', 'margarita.jpg', 8.99, 1),
('Pizza Pepperoni', 'Pizza con pepperoni, queso mozzarella y salsa de tomate.', 'pepperoni.jpg', 9.99, 1),
('Hamburguesa Clásica', 'Hamburguesa con carne de res, lechuga, tomate y queso.', 'clasica.jpg', 7.99, 2),
('Hamburguesa Vegana', 'Hamburguesa vegana con queso de soya y vegetales frescos.', 'vegana.jpg', 8.49, 2),
('Coca Cola', 'Refresco de cola 330ml.', 'coca_cola.jpg', 1.50, 3),
('Agua Mineral', 'Botella de agua mineral 500ml.', 'agua.jpg', 1.00, 3);

INSERT INTO tiendas (id_direccion) VALUES
(5),
(6),
(7),
(8);

INSERT INTO empleados (nombre, apellido, nif, telefono, correo_electronico, puesto, id_tienda) VALUES
('Carlos', 'García', '12345678A', '600000001', 'carlos.garcia@example.com', 'cocinero', 1),
('Ana', 'Martínez', '23456789B', '600000002', 'ana.martinez@example.com', 'repartidor', 1),
('Luis', 'Gómez', '34567890C', '600000003', 'luis.gomez@example.com', 'cocinero', 2),
('Sofía', 'López', '45678901D', '600000004', 'sofia.lopez@example.com', 'repartidor', 2),
('Juan', 'Fernández', '56789012E', '600000005', 'juan.fernandez@example.com', 'cocinero', 3),
('Laura', 'González', '67890123F', '600000006', 'laura.gonzalez@example.com', 'repartidor', 3),
('Sergio', 'Pérez', '78901234G', '600000007', 'sergio.perez@example.com', 'cocinero', 4),
('Clara', 'Sánchez', '89012345H', '600000008', 'clara.sanchez@example.com', 'repartidor', 4);

INSERT INTO pedidos (id_cliente, tipo_entrega, precio_total) VALUES
(1, 'domicilio', 15.99),
(1, 'domicilio', 22.49),
(2, 'tienda', 12.50),
(2, 'domicilio', 5.49),
(3, 'domicilio', 20.00),
(4, 'tienda', 8.75);


-- Insertar detalles de pedidos en detalle_pedidos
INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad) VALUES
(1, 1, 2), -- Pedido 1 contiene 2 unidades del Producto 1
(1, 3, 1), -- Pedido 1 contiene 1 unidad del Producto 3
(2, 2, 1), -- Pedido 2 contiene 1 unidad del Producto 2
(3, 1, 1), -- Pedido 3 contiene 1 unidad del Producto 1
(3, 4, 2), -- Pedido 3 contiene 2 unidades del Producto 4
(3, 5, 2), -- Pedido 3 contiene 2 unidades del Producto 5
(4, 3, 3), -- Pedido 4 contiene 3 unidades del Producto 3
(4, 5, 2), -- Pedido 4 contiene 2 unidades del Producto 5
(4, 6, 2), -- Pedido 4 contiene 2 unidades del Producto 6
(5, 5, 2), -- Pedido 5 contiene 2 unidades del Producto 5
(5, 6, 4), -- Pedido 5 contiene 4 unidades del Producto 6
(6, 5, 2); -- Pedido 6 contiene 2 unidades del Producto 5


INSERT INTO entregas (id_empleado, id_pedido) VALUES
(2, 1),  -- La entrega del Pedido 1 es realizada por el Empleado 2
(4, 2),  -- La entrega del Pedido 2 es realizada por el Empleado 4
(6, 3),  -- La entrega del Pedido 3 es realizada por el Empleado 6
(8, 4);  -- La entrega del Pedido 4 es realizada por el Empleado 8














