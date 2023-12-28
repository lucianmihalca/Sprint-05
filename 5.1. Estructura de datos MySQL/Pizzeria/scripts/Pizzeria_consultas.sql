USE pizzeria;

-- 1. Consulta: Cantidad de Productos de Tipo “Bebidas” Vendidos en una Determinada Localidad

SELECT 
    COUNT(detalle_pedidos.id_producto) AS CantidadVendida
FROM 
    detalle_pedidos
JOIN 
    productos ON detalle_pedidos.id_producto = productos.id_producto
JOIN 
    categoria_productos ON productos.id_categoria_producto = categoria_productos.id_categoria_producto
JOIN 
    pedidos ON detalle_pedidos.id_pedido = pedidos.id_pedido
JOIN 
    clientes ON pedidos.id_cliente = clientes.id_cliente
JOIN 
    direcciones ON clientes.id_direccion = direcciones.id_direccion
WHERE 
    categoria_productos.nombre_categoria = 'Bebida'
AND 
    direcciones.localidad = 'Londres';



-- 2. Consulta: Cantidad de Pedidos Efectuados por un Determinado Empleado

SELECT 
    COUNT(entregas.id_pedido) AS NumeroPedidos
FROM 
    entregas
WHERE 
    entregas.id_empleado = 4; 


