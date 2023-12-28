CREATE DATABASE IF NOT EXISTS optica;
USE optica;
SHOW DATABASES;

CREATE TABLE direcciones(
	id_direccion INT AUTO_INCREMENT PRIMARY KEY,
	calle VARCHAR(50) NOT NULL,
	numero VARCHAR(10) NOT NULL,
	piso VARCHAR(10) NOT NULL,
	puerta VARCHAR(10) NOT NULL,
	ciudad VARCHAR(50) NOT NULL,
	codigo_postal VARCHAR(10) NOT NULL,
	pais VARCHAR(50) NOT NULL
);

CREATE TABLE proveedores(
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50)NOT NULL,
	id_direccion INT NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	fax VARCHAR(20) NOT NULL,
	nif VARCHAR(20)NOT NULL,
	FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE marcas(
	id_marca INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	id_proveedor INT NOT NULL,
	FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_direccion INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_cliente_recomendador INT NULL,
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion),
    FOREIGN KEY (id_cliente_recomendador) REFERENCES clientes(id_cliente)
);

CREATE TABLE empleados(
	id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)NOT NULL
);

CREATE TABLE ventas(
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_marca INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

CREATE TABLE modelos_gafas(
	id_modelo_gafa INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
    
);


CREATE TABLE detalles_ventas(
	id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
	id_venta INT NOT NULL,
	id_modelo_gafa INT NOT NULL,
	cantidad INT NOT NULL,
	FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_modelo_gafa) REFERENCES modelos_gafas(id_modelo_gafa)
);

DESCRIBE direcciones;
DESCRIBE proveedores;
DESCRIBE marcas;
DESCRIBE clientes;
DESCRIBE empleados;
DESCRIBE ventas;
DESCRIBE modelos_gafas;
DESCRIBE detalles_ventas;



