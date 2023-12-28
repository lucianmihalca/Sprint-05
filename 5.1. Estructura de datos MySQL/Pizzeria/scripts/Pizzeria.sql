CREATE DATABASE IF NOT EXISTS pizzeria;

USE pizzeria;

CREATE TABLE IF NOT EXISTS direcciones (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    id_direccion INT NOT NULL,
    correo_electronico VARCHAR(30) NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direcciones (id_direccion)
);

CREATE TABLE IF NOT EXISTS categoria_productos (
    id_categoria_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    imagen VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria_producto INT NOT NULL,
    FOREIGN KEY (id_categoria_producto) REFERENCES categoria_productos (id_categoria_producto)
);

CREATE TABLE IF NOT EXISTS tiendas (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    id_direccion INT NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direcciones (id_direccion)
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nif VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    puesto ENUM('cocinero','repartidor') NOT NULL,
    id_tienda INT NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tiendas (id_tienda)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_entrega ENUM('domicilio','tienda') NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE IF NOT EXISTS detalle_pedidos (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

CREATE TABLE IF NOT EXISTS entregas (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_pedido INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido)
);