USE optica;

-- 1. Lista el Total de Compras de un Cliente

SELECT
	clientes.nombre AS NombreCliente,
	SUM(detalles_ventas.cantidad * modelos_gafas.precio) AS TotalCompras
FROM
	clientes
JOIN ventas ON
	clientes.id_cliente = ventas.id_cliente
JOIN detalles_ventas ON
	ventas.id_venta = detalles_ventas.id_venta
JOIN modelos_gafas ON
	detalles_ventas.id_modelo_gafa = modelos_gafas.id_modelo_gafa
WHERE
	clientes.id_cliente = 1
GROUP BY
	clientes.nombre;
	
-- 2. Lista las Distintas Gafas que ha Vendido un Empleado Durante un Año

SELECT
	empleados.nombre AS NombreEmpleado,
	modelos_gafas.id_modelo_gafa,
	COUNT(detalles_ventas.id_modelo_gafa) AS CantidadVendida,
	YEAR(ventas.fecha_venta) AS Año
FROM
	empleados
JOIN ventas ON
	empleados.id_empleado = ventas.id_empleado
JOIN detalles_ventas ON
	ventas.id_venta = detalles_ventas.id_venta
JOIN modelos_gafas ON
	detalles_ventas.id_modelo_gafa = modelos_gafas.id_modelo_gafa
WHERE
	empleados.id_empleado = 1
	AND YEAR(ventas.fecha_venta) = 2023
GROUP BY
	modelos_gafas.id_modelo_gafa,
	YEAR(ventas.fecha_venta);

-- 3. Lista los Diferentes Proveedores que han Suministrado Gafas Vendidas con Éxito por la Óptica

SELECT
	DISTINCT
    proveedores.nombre AS NombreProveedor
FROM
	proveedores
JOIN marcas ON
	proveedores.id_proveedor = marcas.id_proveedor
JOIN modelos_gafas ON
	marcas.id_marca = modelos_gafas.id_marca
JOIN detalles_ventas ON
	modelos_gafas.id_modelo_gafa = detalles_ventas.id_modelo_gafa
JOIN ventas ON
	detalles_ventas.id_venta = ventas.id_venta;
