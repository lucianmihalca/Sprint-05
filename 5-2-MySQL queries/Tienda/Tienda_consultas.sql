USE tienda;

-- 1.1 Lista el nombre de todos los productos que hay en la mesa producto.
-- 1.2 Comando: Utilizamos SELECT para seleccionar una única columna, en este caso 'nombre', de la tabla producto.
SELECT nombre FROM producto;


-- 2.1 Lista los nombres y los precios de todos los productos de la mesa producto.
-- 2.2 Comando: Utilizamos SELECT para seleccionar múltiples columnas, en este caso 'nombre' y 'precio', de la tabla producto.
-- 2.3 Explicación: 
--      - Esta consulta se enfoca en recuperar información específica de la tabla 'producto': el nombre y el precio de cada producto.
--      - Usamos SELECT seguido de los nombres de las columnas que queremos mostrar: 'nombre' y 'precio'.
--      - De esta forma, la consulta proporciona una lista clara de todos los productos disponibles, junto con sus precios, facilitando una rápida referencia o comparación.
SELECT 
    nombre, 
    precio 
FROM 
    producto;




-- 3.1 Lista todas las columnas de la tabla producto.
-- 3.2 Comando: Utilizamos el comodín * para seleccionar todas las columnas de la tabla.
-- 3.3 Explicación: 
--      - Esta consulta es simple pero muy útil cuando queremos ver toda la información disponible en la tabla 'producto'.
--      - El comodín '*' se utiliza en SQL para seleccionar todas las columnas de la tabla especificada, en este caso, 'producto'.
--      - Así, la consulta devuelve cada fila de la tabla 'producto' con todos sus campos, proporcionando una visión completa de los datos en esta tabla.
SELECT * FROM producto;



-- 4.1 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- 4.2 Comando: Se incluye una conversión de precio a dólares estadounidenses multiplicando el precio en euros por una tasa hipotética.
-- 4.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre y el precio de cada producto de la tabla 'producto'.
--      - Para calcular el precio en dólares, multiplicamos el precio en euros por una tasa de conversión. Supongamos que la tasa de conversión es 1.1.
--      - Así, cada precio en euros se convierte a dólares multiplicando por 1.1, lo que nos da una estimación del precio en dólares.
--      - El resultado es una lista de productos con su precio en euros y su equivalente aproximado en dólares.
SELECT 
    nombre AS nombre_producto, 
    precio AS precio_euros, 
    precio * 1.1 AS precio_dolares
FROM 
    producto;


	
-- 5.1 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- 5.2 Utiliza los siguientes sobrenombres para las columnas: nombre de producto, euros, dólares.
-- 5.3 Comando: Utilizamos un cálculo de conversión para mostrar el precio en dólares, asumiendo una tasa de 1.1.
-- 5.4 Explicación: 
--      - En esta consulta, seleccionamos el nombre de cada producto de la tabla 'producto'.
--      - Mostramos el precio original en euros y lo convertimos a dólares utilizando una tasa de conversión.
--      - Multiplicamos el precio en euros por 1.1 para obtener el equivalente en dólares.
--      - Asignamos sobrenombres a las columnas para mayor claridad: 'nombre_producto' para el nombre del producto, 'euros' para el precio en euros y 'dólares' para el precio en dólares.
SELECT 
    nombre AS nombre_producto, 
    precio AS euros, 
    precio * 1.1 AS dolares
FROM 
    producto;



-- 6.1 Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a mayúscula.
-- 6.2 Comando: Utilizamos UPPER(column_name) para convertir los nombres de los productos a mayúsculas.
-- 6.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre y el precio de cada producto en la tabla 'producto'.
--      - Aplicamos la función UPPER a la columna del nombre para convertir todos los caracteres del nombre del producto a mayúsculas.
--      - Esto es útil para estandarizar la presentación de los nombres o para ciertas aplicaciones donde los nombres deben mostrarse en mayúsculas.
--      - La consulta resultante muestra una lista de los productos con sus nombres en mayúsculas y sus precios correspondientes.
SELECT 
    UPPER(nombre) AS nombre_producto, 
    precio 
FROM 
    producto;


-- 7.1 Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a minúscula.
-- 7.2 Comando: Utilizamos LOWER(column_name) para convertir los nombres de los productos a minúsculas.
-- 7.3 Explicación: 
--      - Esta consulta selecciona el nombre y precio de cada producto en la tabla 'producto'.
--      - Aplicamos la función LOWER a la columna del nombre para convertir todos los caracteres del nombre del producto a minúsculas.
--      - Esto es útil para estandarizar la presentación de los datos o para preparar los datos para operaciones que requieren consistencia en el caso de los caracteres, como búsquedas o comparaciones.
--      - Así, la consulta muestra una lista de los productos con sus nombres en minúsculas y sus precios correspondientes.
SELECT 
    LOWER(nombre) AS nombre_producto, 
    precio 
FROM 
    producto;


   
-- 8.1 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
-- 8.2 Comando: Utilizamos SUBSTRING(UPPER(column_name), start, length) para extraer los dos primeros caracteres del nombre de cada fabricante, convirtiéndolos en mayúsculas.
-- 8.3 Explicación: 
--      - Seleccionamos el nombre completo de los fabricantes de la tabla 'fabricante'.
--      - Utilizamos la combinación de las funciones UPPER y SUBSTRING para transformar el nombre del fabricante a mayúsculas y luego extraer los dos primeros caracteres.
--      - UPPER(column_name) convierte todo el nombre a mayúsculas.
--      - SUBSTRING(UPPER(column_name), 1, 2) extrae los dos primeros caracteres (comenzando desde la posición 1) del nombre ya convertido a mayúsculas.
--      - El resultado es una lista de nombres de fabricantes junto con una versión abreviada de dos letras en mayúsculas de cada nombre.
SELECT 
    nombre, 
    SUBSTRING(UPPER(nombre), 1, 2) AS abreviatura
FROM 
    fabricante;



 
-- 9.1 Lista los nombres y los precios de todos los productos de la mesa producto, redondeando el valor del precio.
-- 9.2 Comando: Utilizamos ROUND para redondear el valor del precio a la cifra entera más cercana.
-- 9.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre y el precio de cada producto en la tabla 'producto'.
--      - Aplicamos la función ROUND al precio para redondearlo al número entero más cercano. 
--      - Esto significa que los precios con decimales serán redondeados hacia arriba o hacia abajo al entero más cercano, según la parte decimal.
--      - De esta manera, la consulta muestra una visión simplificada de los precios, facilitando una comparación rápida y general.
SELECT 
    nombre, 
    ROUND(precio) AS precio_redondeado
FROM 
    producto;


   
   
-- 10.1 Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
-- 10.2 Comando: Utilizamos TRUNCATE para cortar el valor del precio a cero cifras decimales, mostrando así el precio como un número entero sin decimales.
-- 10.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre y precio de cada producto en la tabla 'producto'.
--      - Aplicamos la función TRUNCATE (o ROUND, dependiendo del sistema de base de datos) al precio para eliminar las cifras decimales.
--      - Especificamos '0' como el segundo parámetro de TRUNCATE para indicar que queremos cero cifras decimales.
--      - Así, la consulta muestra el precio de cada producto como un número entero, eliminando cualquier parte decimal.
SELECT 
    nombre, 
    TRUNCATE(precio, 0) AS precio_truncado
FROM 
    producto;


   
-- 11.1 Lista el código de los fabricantes que tienen productos en la mesa producto.
-- 11.2 Comando: Utilizamos SELECT para obtener los códigos de fabricantes de la tabla producto. En esta consulta, no se utiliza DISTINCT, por lo que pueden aparecer códigos repetidos si un fabricante tiene más de un producto.
-- 11.3 Explicación: 
--      - La consulta está diseñada para listar todos los códigos de fabricantes presentes en la tabla 'producto'.
--      - Cada producto en la tabla está asociado a un fabricante mediante su código, indicado en 'codigo_fabricante'.
--      - Dado que no se utiliza DISTINCT, si un fabricante tiene varios productos en la tabla, su código aparecerá repetido tantas veces como productos tenga.
--      - Esta consulta es útil para ver todos los códigos de fabricantes asociados con productos, incluyendo la frecuencia de su aparición en la tabla.
SELECT 
    codigo_fabricante
FROM 
    producto;



-- 12.1 Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.
-- 12.2 Comando: Utilizamos SELECT DISTINCT para obtener únicamente los códigos de fabricantes únicos de la tabla producto, eliminando cualquier repetición.
-- 12.3 Explicación: 
--      - En esta consulta, buscamos identificar los códigos de los fabricantes que tienen productos asociados en la tabla 'producto'.
--      - Dado que un fabricante puede tener varios productos, su código podría aparecer repetidamente en la tabla.
--      - Para asegurarnos de que cada código de fabricante se liste solo una vez, utilizamos SELECT DISTINCT. Esto filtra los resultados para incluir solo entradas únicas del código de fabricante.
--      - De esta manera, la consulta devuelve una lista de códigos de fabricantes sin duplicados, representando a aquellos que tienen productos en la tabla.
SELECT DISTINCT
    codigo_fabricante
FROM 
    producto;


   
-- 13.1 Lista los nombres de los fabricantes ordenados de forma ascendente.
-- 13.2 Comando: Utilizamos ORDER BY para ordenar los resultados por el nombre de forma ascendente. ASC es el orden por defecto y se especifica para mayor claridad.
-- 13.3 Explicación: 
--      - Esta consulta tiene como objetivo recuperar los nombres de los fabricantes de la tabla 'fabricante', presentándolos en un orden específico.
--      - Utilizamos la cláusula ORDER BY seguida del nombre de la columna 'nombre' y la palabra clave ASC para ordenar los resultados de forma ascendente (de la A a la Z).
--      - Aunque ASC es el orden predeterminado en SQL, lo especificamos aquí para dejar claro el propósito de la consulta.
--      - Como resultado, la consulta devuelve una lista ordenada de los nombres de los fabricantes, comenzando por aquellos que comienzan con letras más cercanas a la A.
SELECT 
    nombre 
FROM 
    fabricante 
ORDER BY 
    nombre ASC;



-- 14.1 Lista los nombres de los fabricantes ordenados de forma descendente.
-- 14.2 Comando: Utilizamos ORDER BY para ordenar los resultados por el nombre de forma descendente.
-- 14.3 Explicación: 
--      - En esta consulta, nuestro objetivo es recuperar los nombres de los fabricantes de la tabla 'fabricante'.
--      - Queremos que estos nombres se presenten en un orden específico, es decir, en orden descendente (de la Z a la A).
--      - Utilizamos la cláusula ORDER BY seguida del nombre de la columna 'nombre' y la palabra clave DESC para especificar este orden descendente.
--      - De esta forma, la consulta muestra los nombres de los fabricantes empezando por aquellos que tienen letras más cercanas a la Z y terminando con los que están más cerca de la A.
SELECT 
    nombre 
FROM 
    fabricante 
ORDER BY 
    nombre DESC;



-- 15.1 Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
-- 15.2 Comando: Utilizamos ORDER BY para ordenar los resultados primero por el nombre de forma ascendente y luego por el precio de forma descendente.
-- 15.3 Explicación: 
--      - En esta consulta, queremos organizar los productos basándonos en dos criterios: nombre y precio.
--      - Utilizamos ORDER BY para ordenar los resultados. Primero, por el nombre del producto en orden ascendente (A-Z). 
--      - Luego, dentro de cada grupo de nombres de productos idénticos, los ordenamos por precio en orden descendente (de mayor a menor).
--      - Esto nos permite ver los productos organizados alfabéticamente, y para los productos con el mismo nombre, ordenados del más caro al más barato.
SELECT 
    nombre, 
    precio 
FROM 
    producto 
ORDER BY 
    nombre ASC, 
    precio DESC;



-- 16.1 Devuelve una lista con las 5 primeras filas de la mesa fabricante.
-- 16.2 Comando: Utilizamos la cláusula LIMIT para restringir el conjunto de resultados a un número específico de filas.
-- 16.3 Explicación: 
--      - En esta consulta, queremos recuperar solo un subconjunto específico de registros de la tabla 'fabricante'.
--      - Utilizamos la cláusula LIMIT para limitar el número de filas devueltas por la consulta.
--      - Aquí, LIMIT 5 indica que la consulta debe devolver solo las primeras cinco filas de la tabla 'fabricante'.
--      - Esto es útil para obtener una muestra de datos o para manejar grandes volúmenes de datos en porciones manejables.
SELECT 
    *
FROM 
    fabricante
LIMIT 5;



-- 17.1 Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa fabricante. La cuarta fila también debe incluirse en la respuesta.
-- 17.2 Comando: Utilizamos LIMIT con OFFSET para seleccionar 2 filas empezando desde la cuarta fila de la tabla.
-- 17.3 Explicación: 
--      - En SQL, OFFSET se utiliza para especificar desde qué punto de la lista de resultados se deben empezar a devolver filas.
--      - Aquí, OFFSET 3 significa que las primeras tres filas serán omitidas, comenzando la selección desde la cuarta fila.
--      - LIMIT 2 indica que después de aplicar el OFFSET, se seleccionarán solo las siguientes dos filas.
--      - Combinando LIMIT con OFFSET, esta consulta devuelve exactamente dos filas: la cuarta y la quinta fila de la tabla 'fabricante'.
SELECT 
    *
FROM 
    fabricante
LIMIT 2 OFFSET 3;


-- 18.1 Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
-- 18.2 Comando: SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 18.3 Explicación: 
--      - Ordenamos los productos por precio en orden ascendente. 
--      - LIMIT 1 selecciona el producto más barato.
--      - Los alias 'nombre_producto' y 'precio_producto' clarifican que estos campos provienen de la tabla 'producto'.
SELECT 
    producto.nombre AS nombre_producto, 
    producto.precio AS precio_producto 
FROM 
    producto 
ORDER BY 
    producto.precio ASC 
LIMIT 1;



-- 19.1 Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
-- 19.2 Comando: SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 19.3 Explicación: 
--      - Esta consulta está diseñada para encontrar el producto más caro en la base de datos.
--      - Empleamos ORDER BY precio DESC para ordenar todos los productos por su precio, de mayor a menor. 
--      - Con el precio más alto al principio de la lista, LIMIT 1 se utiliza para seleccionar solamente el primer registro, es decir, el producto con el precio más alto.
--      - De esta forma, la consulta devuelve el nombre y precio del producto más caro sin necesidad de usar funciones de agregación como MAX.
SELECT 
    producto.nombre AS nombre_producto, 
    producto.precio AS precio_producto
FROM 
    producto 
ORDER BY 
    producto.precio DESC 
LIMIT 1;




-- 20.1 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
-- 20.2 Comando: SELECT con WHERE.
-- 20.3 Explicación: 
--      - En esta consulta, nos enfocamos en seleccionar el 'nombre' de los productos de la tabla 'producto'.
--      - Utilizamos la cláusula WHERE para filtrar los productos basándonos en el 'codigo_fabricante'. 
--      - Especificamos 'codigo_fabricante = 2' en la cláusula WHERE, lo que limita los resultados a aquellos productos asociados con el fabricante cuyo código es 2.
--      - Así, la consulta proporciona una lista de todos los productos asociados con este fabricante específico, mostrando solo sus nombres.
SELECT 
    producto.nombre AS nombre_producto
FROM
    producto
WHERE 
    codigo_fabricante = 2;


      

-- 21.1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
-- 21.2 Comando: SELECT con JOIN.
-- 21.3 Explicación: 
--      - Esta consulta está diseñada para proporcionar una lista detallada de todos los productos y sus fabricantes correspondientes.
--      - Utilizamos un JOIN para conectar las tablas 'producto' y 'fabricante'. La unión se realiza a través de la columna 'codigo_fabricante' en 'producto' que se relaciona con la columna 'codigo' en 'fabricante'.
--      - Este JOIN nos permite acceder a la información de ambas tablas en una sola consulta. Así, podemos seleccionar el nombre y precio de cada producto de 'producto', junto con el nombre de su fabricante correspondiente en 'fabricante'.
--      - De este modo, obtenemos una lista completa que incluye el nombre y precio de cada producto, además del nombre del fabricante, cubriendo todos los productos en la base de datos.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;




-- 22.1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
-- 22.2 Comando: SELECT con JOIN y ORDER BY.
-- 22.3 Explicación: 
--      - Esta consulta está diseñada para proporcionar un panorama completo de los productos y sus fabricantes. Seleccionamos el nombre y precio de los productos de la tabla 'producto', así como el nombre de los fabricantes de la tabla 'fabricante'.
--      - Usamos JOIN para conectar estas dos tablas mediante 'codigo_fabricante', permitiendo así el acceso a la información combinada de productos y fabricantes.
--      - El objetivo es generar una lista que incluya el nombre y precio de cada producto, junto con el nombre de su fabricante.
--      - Finalmente, aplicamos ORDER BY en el nombre del fabricante de manera ascendente (alfabéticamente) para ordenar la lista, facilitando su consulta y análisis.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY 
    fabricante.nombre ASC;




-- 23.1 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
-- 23.2 Comando: SELECT con JOIN.
-- 23.3 Explicación: 
--      - Esta consulta está diseñada para proporcionar una visión completa de los productos y sus fabricantes. Seleccionamos tanto los detalles del producto (código y nombre) como la información del fabricante (código y nombre).
--      - Realizamos un JOIN entre las tablas 'producto' y 'fabricante' usando 'codigo_fabricante' en 'producto' y 'codigo' en 'fabricante'. Este JOIN nos permite combinar la información de ambos, relacionando cada producto con su fabricante correspondiente.
--      - De este modo, la consulta genera una lista que incluye el código y nombre de cada producto, junto con el código y nombre de su fabricante, abarcando todos los productos en la base de datos.
SELECT
    producto.codigo AS codigo_producto,
    producto.nombre AS nombre_producto,
    fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo;


-- 24.1 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
-- 24.2 Comando: SELECT con JOIN, ORDER BY y LIMIT.
-- 24.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre y precio de los productos de la tabla 'producto', así como el nombre del fabricante de la tabla 'fabricante'.
--      - Utilizamos un JOIN para unir las tablas 'producto' y 'fabricante' mediante 'codigo_fabricante', lo que nos permite acceder a la información de ambos en una sola consulta.
--      - Para encontrar el producto más barato, aplicamos ORDER BY en el precio de manera ascendente (ASC). Esto coloca los productos con precios más bajos al principio de la lista.
--      - LIMIT 1 se usa para seleccionar únicamente el primer registro de esta lista ordenada, es decir, el producto con el precio más bajo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY 
    producto.precio ASC 
LIMIT 1;


-- 25.1 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
-- 25.2 Comando: SELECT con JOIN, ORDER BY y LIMIT.
-- 25.3 Explicación: 
--      - Esta consulta comienza seleccionando el nombre y precio de los productos de la tabla 'producto', así como el nombre de los fabricantes de la tabla 'fabricante'.
--      - Utilizamos un JOIN para conectar 'producto' y 'fabricante' usando 'codigo_fabricante', permitiendo acceder a la información completa de cada producto y su fabricante correspondiente.
--      - Para encontrar el producto más caro, aplicamos ORDER BY en el precio de manera descendente (DESC). Esto coloca los productos con precios más altos al principio de la lista.
--      - Finalmente, LIMIT 1 se utiliza para obtener solo el primer registro de esta lista ordenada, que es el producto más caro.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY 
    producto.precio DESC 
LIMIT 1;


-- 26.1 Devuelve una lista de todos los productos del fabricante Lenovo.
-- 26.2 Comando: SELECT con JOIN y WHERE.
-- 26.3 Explicación: 
--      - En esta consulta, nos enfocamos en seleccionar los detalles de los productos de la tabla 'producto', así como el nombre del fabricante de la tabla 'fabricante'.
--      - Realizamos un JOIN entre 'producto' y 'fabricante' usando 'codigo_fabricante', lo que nos permite acceder a la información de ambas tablas en una sola consulta.
--      - Utilizamos la cláusula WHERE para filtrar y mostrar solo aquellos productos cuyo fabricante es 'Lenovo'. Esto se logra especificando 'fabricante.nombre = 'Lenovo'' en la condición del WHERE.
--      - Como resultado, la consulta proporciona una lista completa de todos los productos fabricados por Lenovo, incluyendo nombre y detalles del producto.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Lenovo';


   
-- 27.1 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
-- 27.2 Comando: SELECT con JOIN, WHERE y ORDER BY.
-- 27.3 Explicación: 
--      - La consulta comienza seleccionando el nombre y precio de los productos de la tabla 'producto', así como el nombre del fabricante de la tabla 'fabricante'.
--      - Mediante un JOIN entre 'producto' y 'fabricante' usando 'codigo_fabricante', accedemos a la información de ambas tablas en una sola consulta.
--      - Usamos la cláusula WHERE para filtrar y mostrar solo aquellos productos del fabricante 'Crucial' cuyo precio sea mayor a 200€.
--      - Finalmente, aplicamos ORDER BY para ordenar los resultados por el precio de los productos, lo que facilita la identificación de los productos más caros de Crucial.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Crucial' AND producto.precio > 200
ORDER BY 
    producto.precio;


   
-- 28.1 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
-- 28.2 Comando: SELECT con JOIN y WHERE utilizando OR.
-- 28.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre del producto de la tabla 'producto' y el nombre del fabricante de la tabla 'fabricante'.
--      - Realizamos un JOIN entre 'producto' y 'fabricante' usando 'codigo_fabricante', lo que nos permite acceder a la información de ambas tablas.
--      - Para filtrar los productos específicamente de Asus, Hewlett-Packard y Seagate, usamos la cláusula WHERE con varios operadores OR. Cada OR comprueba si el nombre del fabricante coincide con uno de estos tres.
--      - De este modo, la consulta lista todos los productos pertenecientes a cualquiera de estos fabricantes, mostrando su nombre y el del fabricante.
SELECT
    producto.nombre AS nombre_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Asus' OR 
    fabricante.nombre = 'Hewlett-Packard' OR 
    fabricante.nombre = 'Seagate';



-- 29.1 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.
-- 29.2 Comando: SELECT con JOIN y WHERE utilizando IN.
-- 29.3 Explicación: 
--      - La consulta se enfoca en seleccionar el nombre del producto de la tabla 'producto' y el nombre del fabricante de la tabla 'fabricante'.
--      - Realizamos un JOIN entre estas tablas usando 'codigo_fabricante' para acceder a la información de ambas.
--      - En la cláusula WHERE, empleamos el operador IN para especificar un grupo de fabricantes: 'Asus', 'Hewlett-Packard' y 'Seagate'. Esto simplifica la selección de productos pertenecientes a cualquiera de estos fabricantes.
--      - El resultado es una lista de productos de estos tres fabricantes, mostrando el nombre de cada producto y su respectivo fabricante.
SELECT
    producto.nombre AS nombre_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');



-- 30.1 Devuelve una lista con el nombre y precio de todos los productos de los fabricantes cuyo nombre termina por la vocal e.
-- 30.2 Comando: SELECT con JOIN y WHERE utilizando LIKE.
-- 30.3 Explicación: 
--      - En esta consulta, seleccionamos el nombre y el precio de los productos de la tabla 'producto', así como el nombre de los fabricantes de la tabla 'fabricante'.
--      - Utilizamos un JOIN para conectar estas dos tablas mediante 'codigo_fabricante', lo que permite acceder a la información de ambos en una sola consulta.
--      - La cláusula WHERE con la condición LIKE '%e' se emplea para filtrar los resultados. Esta condición especifica que estamos interesados en los fabricantes cuyos nombres terminan en la letra 'e'.
--      - Como resultado, la consulta lista todos los productos cuyos fabricantes tienen un nombre que termina con 'e', mostrando el nombre y el precio de cada producto.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre LIKE '%e';



-- 31.1 Devuelve una lista con el nombre y el precio de todos los productos cuyo nombre de fabricante contiene el carácter w en su nombre.
-- 31.2 Comando: SELECT con JOIN y WHERE utilizando LIKE.
-- 31.3 Explicación: 
--      - La consulta se enfoca en seleccionar el nombre y precio de los productos de la tabla 'producto', así como el nombre del fabricante de la tabla 'fabricante'.
--      - Utilizamos un JOIN para conectar 'producto' y 'fabricante' a través de 'codigo_fabricante'. Esto permite acceder a la información de ambas tablas en una sola consulta.
--      - La cláusula WHERE emplea la condición LIKE '%w%' para filtrar los resultados. Esta condición busca fabricantes cuyos nombres contengan el carácter 'w' en cualquier parte.
--      - De este modo, la consulta lista todos los productos cuyos fabricantes tienen 'w' en su nombre, incluyendo su nombre y precio.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre LIKE '%w%';



-- 32.1 Devuelve una lista con el nombre del producto, el precio y el nombre del fabricante, de todos los productos con un precio mayor o igual a 180 €. 
--      Ordenar el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
-- 32.2 Comando: SELECT con JOIN, WHERE y ORDER BY.
-- 32.3 Explicación: 
--      - La consulta comienza seleccionando el nombre y precio de los productos de la tabla 'producto', así como el nombre de los fabricantes de la tabla 'fabricante'.
--      - Utilizamos un JOIN para conectar estas tablas basándonos en 'codigo_fabricante', lo que nos permite acceder a la información de ambas en una sola consulta.
--      - La cláusula WHERE se utiliza para filtrar y mostrar solo aquellos productos cuyo precio es igual o superior a 180 €.
--      - Finalmente, aplicamos un ORDER BY para ordenar los resultados: primero por precio de manera descendente (los más caros primero) y luego por nombre de producto de manera ascendente (alfabéticamente).
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN 
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    producto.precio >= 180
ORDER BY 
    producto.precio DESC, producto.nombre ASC;



-- 33.1 Devuelve una lista con el código y el nombre del fabricante, solo de aquellos fabricantes que tienen productos asociados en la base de datos.
-- 33.2 Comando: SELECT con JOIN.
-- 33.3 Explicación: 
--      - Esta consulta está diseñada para listar solo los fabricantes que tienen productos asociados en la base de datos.
--      - Utilizamos un JOIN entre 'fabricante' y 'producto', conectando las tablas a través de 'codigo_fabricante'. Este JOIN nos permite acceder a los datos de ambas tablas.
--      - Solo los fabricantes que tienen al menos un producto en la tabla 'producto' aparecerán en los resultados, debido a la naturaleza del JOIN que omite los fabricantes sin productos.
--      - Finalmente, seleccionamos el código y el nombre de estos fabricantes.
SELECT DISTINCT
    fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM
    fabricante
JOIN 
    producto ON fabricante.codigo = producto.codigo_fabricante;


-- 34.1 Devuelve una lista de todos los fabricantes que existen en la base de datos, junto con los productos que cada uno tiene. La lista también debe mostrar aquellos fabricantes que no tienen productos asociados.
-- 34.2 Comando: SELECT con LEFT JOIN.
-- 34.3 Explicación: 
--      - Utilizamos un LEFT JOIN para conectar la tabla 'fabricante' con la tabla 'producto'. Esta unión especial incluye todos los registros de 'fabricante', independientemente de si tienen correspondencias en 'producto'.
--      - En los casos donde un fabricante no tiene productos asociados, los campos correspondientes de 'producto' se llenan con NULL, lo que nos permite identificar estos fabricantes.
--      - Como resultado, la consulta genera una lista completa que incluye todos los fabricantes, mostrando sus productos asociados si los tienen, o marcando como NULL en caso contrario.
SELECT
    fabricante.nombre AS nombre_fabricante,
    producto.nombre AS nombre_producto
FROM
    fabricante
LEFT JOIN 
    producto ON fabricante.codigo = producto.codigo_fabricante;


-- 35.1 Devuelve una lista donde solo aparecen aquellos fabricantes que no tienen producto asociado.
-- 35.2 Comando: SELECT con LEFT JOIN y WHERE.
-- 35.3 Explicación: 
--      - Usamos LEFT JOIN para conectar la tabla 'fabricante' con la tabla 'producto'. A diferencia del INNER JOIN, el LEFT JOIN incluye todos los registros de la tabla 'fabricante', incluso si no tienen una correspondencia en la tabla 'producto'.
--      - En la cláusula WHERE, filtramos los resultados para encontrar solo aquellos fabricantes que no tienen productos asociados. Esto se hace comprobando si el campo 'producto.nombre' es NULL.
--      - Cuando un fabricante no tiene productos asociados, el LEFT JOIN rellena los campos relacionados de la tabla 'producto' con NULL, lo que nos permite identificar estos fabricantes.
SELECT
    fabricante.nombre AS nombre_fabricante
FROM
    fabricante
LEFT JOIN 
    producto ON fabricante.codigo = producto.codigo_fabricante
WHERE 
    producto.nombre IS NULL;


-- 36.1 Devuelve todos los productos del fabricante Lenovo. (Sin usar INNER JOIN).
-- 36.2 Comando: SELECT con JOIN.
-- 36.3 Explicación: 
--      - Utilizamos un JOIN para conectar las tablas 'producto' y 'fabricante'. Aunque no especificamos "INNER", un JOIN simple es equivalente a un INNER JOIN.
--      - La unión se hace a través de la columna 'codigo_fabricante', que relaciona ambos.
--      - En la cláusula WHERE, filtramos los resultados para mostrar solo los productos de Lenovo, especificando 'fabricante.nombre = 'Lenovo''.
--      - Esto resulta en una lista de todos los productos asociados con el fabricante Lenovo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    fabricante.nombre = 'Lenovo';

   
-- 37.1 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin uso INNER JOIN).
-- 37.2 Comando: SELECT con JOIN y subconsulta.
-- 37.3 Explicación: 
--      - Comenzamos utilizando una subconsulta para determinar el precio más alto de los productos de Lenovo, empleando la función de agregación MAX para encontrar este valor máximo.
--      - 'SELECT MAX(producto.precio) ... WHERE fabricante.nombre = 'Lenovo'' nos da el precio más alto entre los productos de Lenovo.
--      - En la consulta principal, comparamos este precio máximo con los precios de todos los productos en la base de datos.
--      - Realizamos un JOIN entre 'producto' y 'fabricante' y aplicamos un filtro en la cláusula WHERE para seleccionar solo aquellos productos cuyo precio es igual al precio máximo obtenido.
--      - Así, la consulta lista todos los productos, independientemente del fabricante, que tienen el precio más alto encontrado en Lenovo.
SELECT
	producto.codigo AS codigo_producto,
	producto.nombre AS nombre_producto,
	producto.precio AS precio_producto,
	producto.codigo_fabricante,
	fabricante.nombre AS nombre_fabricante
FROM
	producto
JOIN
    fabricante ON
	producto.codigo_fabricante = fabricante.codigo
WHERE
	producto.precio = (
	SELECT
		MAX(producto.precio)
	FROM
		producto
	JOIN fabricante ON
		producto.codigo_fabricante = fabricante.codigo
	WHERE
		fabricante.nombre = 'Lenovo'
    );

-- 38.1 Enumere el nombre del producto más caro del fabricante Lenovo.
-- 38.2 Comando: SELECT con JOIN y subconsulta.
-- 38.3 Explicación: 
--      - La consulta comienza con una subconsulta que utiliza la función MAX para encontrar el precio más alto de los productos de Lenovo. MAX es una función de agregación que determina el valor máximo en un conjunto de datos.
--      - La subconsulta 'SELECT MAX(producto.precio) ... WHERE fabricante.nombre = 'Lenovo'' calcula este precio máximo.
--      - Luego, la consulta principal busca en la tabla 'producto' para encontrar el producto que tiene este precio más alto.
--      - Usamos un JOIN entre 'producto' y 'fabricante' para asegurarnos de que estamos evaluando solo los productos de Lenovo.
--      - Finalmente, la consulta selecciona el nombre y el precio del producto que cumple con el criterio de ser el más caro de Lenovo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    producto.precio = (
        SELECT MAX(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Lenovo'
    );

   		
-- 39.1 Enumere el nombre de producto más barato del fabricante Hewlett-Packard.
-- 39.2 Comando: SELECT con JOIN y subconsulta.
-- 39.3 Explicación: 
--      - Primero, necesitamos identificar el precio más bajo de los productos de Hewlett-Packard. Para esto, usamos la función MIN en la subconsulta. MIN es una función de agregación que encuentra el valor mínimo en un conjunto de datos.
--      - La subconsulta 'SELECT MIN(producto.precio) ... WHERE fabricante.nombre = 'Hewlett-Packard'' calcula el precio más bajo de los productos de este fabricante.
--      - Luego, en la consulta principal, comparamos este precio mínimo con los precios de los productos de Hewlett-Packard.
--      - Seleccionamos el nombre del producto que tiene este precio mínimo usando 'producto.precio = (Subconsulta MIN)'.
--      - El JOIN entre 'producto' y 'fabricante' nos permite filtrar por los productos de Hewlett-Packard.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN 
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    producto.precio = (
        SELECT MIN(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Hewlett-Packard'
    );


-- 40.1 Devuelve todos los productos en la base de datos que tienen un precio más alto o igual al producto más caro del fabricante Lenovo.
-- 40.2 Comando: SELECT con JOIN y subconsulta.
-- 40.3 Explicación: 
--      - Primero, con la subconsulta 'SELECT MAX(producto.precio)...', buscamos el precio más alto de los productos de Lenovo. 
-- 		- Esto se logra con la función MAX, que encuentra el valor máximo en un conjunto de datos, en este caso, el precio de los productos.
--      - Luego, en la consulta principal, comparamos este precio máximo con los precios de todos los productos en la base de datos. 
--      - Usamos la cláusula WHERE para filtrar y mostrar solo aquellos productos cuyo precio es igual o mayor al precio máximo encontrado.
--      - Así, la consulta final lista todos los productos, de cualquier fabricante, que tienen un precio igual o superior al más caro de Lenovo.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE 
    producto.precio >= (
        SELECT MAX(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Lenovo'
    );

   
-- 41.1 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
-- 41.2 Comando: SELECT con JOIN y subconsulta utilizando AVG.
-- 41.3 Explicación: 
--      - Usamos la función AVG en una subconsulta para calcular el precio medio de los productos de Asus. AVG es una función de agregación que devuelve el valor promedio en un conjunto de datos.
--      - La subconsulta 'SELECT AVG(producto.precio) ... WHERE fabricante.nombre = 'Asus'' calcula este precio medio para los productos de Asus.
--      - Luego, la consulta principal compara el precio de cada producto de Asus con este valor medio. 
--      - Seleccionamos aquellos productos cuyo precio es superior al promedio mediante 'producto.precio > (Subconsulta AVG)'.
--      - La unión (JOIN) entre 'producto' y 'fabricante' nos permite filtrar y comparar solo los productos de Asus.
SELECT
    producto.nombre AS nombre_producto,
    producto.precio AS precio_producto,
    fabricante.nombre AS nombre_fabricante
FROM
    producto
JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    fabricante.nombre = 'Asus' AND producto.precio > (
        SELECT AVG(producto.precio)
        FROM producto
        JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE fabricante.nombre = 'Asus'
    );



   

   
   
   
   
   

   
   
