USE universidad;

-- 1.1 Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. 
-- 1.2 El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT
	persona.apellido_1 AS Primer_apellido,
	persona.apellido_2 AS Segundo_apellido,
	persona.nombre AS Nombre_alumno
FROM
	persona
WHERE
	tipo = 'alumno'
ORDER BY
	apellido_1,
	apellido_2,
	nombre;



-- 2.1 Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT 
    persona.apellido_1 AS Primer_apellido,
    persona.apellido_2 AS Segundo_apellido,
    persona.nombre AS Nombre_alumno
FROM
    persona
WHERE 
    tipo = 'alumno'
    AND persona.telefono IS NULL;
   
   

-- 3.1 Devuelve el listado de los alumnos que nacieron en 1999. 
SELECT
	persona.nombre AS Nombre_alumno
FROM
	persona
WHERE
	tipo = 'alumno'
	AND YEAR(fecha_nacimiento) = 1999;
   		
   	
   	
-- 4.1 Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT 
	persona.nombre AS Nombre_profesores,
	persona.apellido_1,
	persona.apellido_2,
	persona.nif
FROM
	persona
WHERE
	tipo = 'profesor'
	AND persona.telefono IS NULL 
	AND persona.nif LIKE '%K';

-- 5.1 Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT
	asignatura.nombre AS Nombre_asignaturas	
FROM
	asignatura
WHERE 
	asignatura.cuatrimestre = 1
	AND asignatura.curso = 3
	AND asignatura.id_grado = 7;


-- 6.1 Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. 
-- 6.2 El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. 
-- 6.3 El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT
	persona.apellido_1 AS Primer_apellido,
	persona.apellido_2 AS Segundo_pellido,
	persona.nombre AS Nombre_profesores,
	departamento.nombre AS Nombre_departamento
FROM
	persona
JOIN 
	profesor ON persona.id = profesor.id_profesor 
JOIN 
	departamento ON profesor.id_departamento = departamento.id 
WHERE 
	persona.tipo = 'profesor'
ORDER BY 
	persona.apellido_1 , persona.apellido_2 , persona.nombre ;



-- 7.1 Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT 
	persona.nombre AS Nombre_estudiante,
	asignatura.nombre AS Nombre_asignaturas,
	curso_escolar.anyo_inicio AS Curso_anyo_inicio,
	curso_escolar.anyo_fin AS Curso_anyo_fin
FROM
	persona
JOIN
	alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno 
JOIN 
	asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id 
JOIN 
	curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id 
WHERE 
	persona.nif = '26902806M';


-- 8.1 Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT 
	departamento.nombre AS Nombre_departamento
FROM
	departamento
JOIN
	profesor ON departamento.id = profesor.id_departamento
JOIN 
	asignatura ON profesor.id_profesor = asignatura.id_profesor
JOIN 
	grado ON asignatura.id_grado = grado.id
WHERE 
	grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';


-- 9.1 Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

SELECT DISTINCT 
	persona.nombre AS Nombre_alumno,
	persona.apellido_1 AS Primer_apellido,
	persona.apellido_2 AS Segundo_apellido,
	curso_escolar.anyo_inicio AS Anyo_inicio_curso,
	curso_escolar.anyo_fin AS Anyo_fin_curso	
FROM
	persona
JOIN
	alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno 
JOIN 
	curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id 
WHERE 
	curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019
AND 
	persona.tipo = 'alumno';
	

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1.1 Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. 
-- 1.2 El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. 
-- 1.3 El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. 
-- 1.4 El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT 
	departamento.nombre AS Nombre_departamento,
	persona.apellido_1 AS Primer_apellido,
	persona.apellido_2 AS Segundo_apellido,
	persona.nombre AS Nombre_profesor
FROM
	profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id 
JOIN persona ON profesor.id_profesor = persona.id 
ORDER BY 
	departamento.nombre , persona.apellido_1 , persona.apellido_2 , persona.nombre ;


-- 2.1 Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT 
    persona.nombre AS Nombre_profesor,
    persona.apellido_1 AS Primer_apellido,
    persona.apellido_2 AS Segundo_apellido
FROM
    profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id 
JOIN persona ON profesor.id_profesor = persona.id
WHERE
    departamento.id IS NULL;

   
-- 3.1 Devuelve un listado con los departamentos que no tienen profesores asociados. 
SELECT 
	departamento.nombre AS Nombre_departamento
FROM
	departamento 
LEFT JOIN profesor ON departamento.id = profesor.id_departamento 
WHERE 
	profesor.id_profesor IS NULL ;



-- 4.1 Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT 
	persona.nombre AS Nombre_profesor,
	persona.apellido_1 AS Primer_apellido,
	persona.apellido_2 AS Segundo_apellido
FROM
	profesor
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
JOIN persona ON profesor.id_profesor = persona.id 
WHERE 
	asignatura.id_profesor IS NULL;


-- 5.1 Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT 
	asignatura.nombre AS Nombre_asignatura
FROM
	asignatura
LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor 
WHERE 
	asignatura.id_profesor IS NULL ;
	

-- 6.1 Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT 
	departamento.nombre AS Nombre_dpartamento
FROM
	departamento 
LEFT JOIN profesor ON departamento.id = profesor.id_departamento 
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor 
WHERE 
	asignatura.id IS NULL;
	

-- Consultas resumen:

-- 1.1 Devuelve el número total de alumnos que existen.
SELECT 
	COUNT(*) AS Numero_alumnos
FROM
	persona
WHERE 
	persona.tipo = 'alumno';


-- 2.1 Calcula cuántos alumnos nacieron en 1999.
SELECT 
    COUNT(*) AS Alumnos_nacidos_1999
FROM
    persona
WHERE 
    YEAR(fecha_nacimiento) = 1999
    AND tipo = 'alumno';
   

-- 3.1 Calcula cuántos profesores/as hay en cada departamento. 
-- 3.2 El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. 
-- 3.3 El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y deberá estar ordenado de mayor a menor por el número de profesores/as.

SELECT 
	departamento.nombre AS Nombre_departamento,
	COUNT(profesor.id_profesor) AS Numero_profesores
FROM
	departamento
JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_profesor)DESC; 
	
	
-- 4.1 Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. 
-- 4.2 Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también deben aparecer en el listado.	
SELECT 
	departamento.nombre AS Nombre_departamento,
	COUNT(profesor.id_profesor) AS Numero_profesores
FROM
	departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre ;


-- 5.1 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
-- 5.2 Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. 
-- 5.3 El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

SELECT 
	grado.nombre AS Nombre_grado,
	COUNT(asignatura.id) AS Numero_asignaturas
FROM
	grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado 
GROUP BY grado.nombre 
ORDER BY COUNT(asignatura.id) DESC ; 
	
	
-- 6.1 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT 
	grado.nombre AS Nombre_grado,
	COUNT(asignatura.id) AS Numero_asignatura
FROM
	grado
JOIN
	asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre 
HAVING COUNT(asignatura.id) > 40;
	
-- 7.1 Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. 
-- 7.2 El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.	
SELECT 
    grado.nombre AS Nombre_grado,
    asignatura.tipo AS Tipo_asignatura,
    SUM(asignatura.creditos) AS Suma_creditos
FROM
    grado
JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre, asignatura.tipo;

-- 8.1 Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
-- 8.2 El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT 
    curso_escolar.anyo_inicio AS Inicio_curso,
    COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) AS Numero_alumnos
FROM
    curso_escolar 
JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
GROUP BY curso_escolar.anyo_inicio
ORDER BY curso_escolar.anyo_inicio;


-- 9.1 Devuelve un listado con el número de asignaturas que imparte cada profesor/a. 
-- 9.2 El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. 
-- 9.3 El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
-- 9.4 El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT 
	persona.id AS ID_profesor,
	persona.nombre AS Nombre_profesor,
	persona.apellido_1 AS Primer_apellido,
	persona.apellido_2 AS Segundo_apellido,
	COUNT(asignatura.id) AS Numero_asignaturas
FROM
	profesor
LEFT JOIN
	asignatura ON profesor.id_profesor = asignatura.id_profesor 
JOIN 
	persona ON profesor.id_profesor = persona.id 
GROUP BY persona.id, persona.nombre, persona.apellido_1, persona.apellido_2
ORDER BY COUNT(asignatura.id) DESC ; 
	

-- 10.1 Devuelve todos los datos del alumno/a más joven.
SELECT 
    persona.id AS ID_alumno,
    persona.nif AS NIE_alumno,
    persona.nombre AS Nombre_alumno,
    persona.apellido_1 AS Primer_apellido,
    persona.apellido_2 AS Segundo_apellido,
    persona.ciudad AS Ciudad_alumno,
    persona.telefono AS Telefono_alumno,
    persona.fecha_nacimiento AS Fecha_nacimiento,
    persona.sexo AS Sexo_persona
FROM
    persona 
WHERE 
    persona.fecha_nacimiento = (
        SELECT MAX(fecha_nacimiento) 
        FROM persona 
        WHERE tipo = 'alumno'
    )
    AND tipo = 'alumno';

/*
Version 2
 WHERE 
    tipo = 'alumno' 
ORDER BY 
    persona.fecha_nacimiento DESC  -- Ordenar del más reciente al más antiguo
LIMIT 1;  
*/
   
   
-- 11.1 Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT 
    persona.nombre AS Nombre_profesor,
    persona.apellido_1 AS Primer_apellido,
    persona.apellido_2 AS Segundo_apellido,
    departamento.nombre AS Nombre_departamento,
    asignatura.nombre AS Asignatura_valor
FROM
    profesor 
JOIN
    persona ON profesor.id_profesor = persona.id 
JOIN 
    departamento ON profesor.id_departamento = departamento.id 
LEFT JOIN 
    asignatura ON profesor.id_profesor = asignatura.id_profesor 
WHERE 
    persona.tipo = 'profesor'
GROUP BY 
    persona.nombre, persona.apellido_1, persona.apellido_2, departamento.nombre, asignatura.nombre
HAVING 
    COUNT(asignatura.id) = 0;







