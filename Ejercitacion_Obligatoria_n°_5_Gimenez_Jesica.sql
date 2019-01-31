-- Desarrollar consultas SQL para cada uno de los siguientes requerimientos:

-- 1. Listar el costo máximo, el costo mínimo y el costo promedio, según la tabla de servicios.

SELECT MAX(ser.costo) AS 'costo maximo', MIN(ser.costo) AS 'costo minimo', AVG(ser.costo) AS 'costo promedio' FROM servicios AS ser;

-- 2. Listar los nombres de las marcas de autos y la cantidad de autos registrados por cada marca.

SELECT au.marca, COUNT(ser.auto) AS 'cant de autos' FROM autos AS au INNER JOIN servicios AS ser ON au.id=ser.id GROUP BY au.marca; 

-- 3. Listar, según la tabla de clientes, los barrios junto a la cantidad de personas extranjeras (aquellos no nacidos en Argentina) que viven en cada uno.

SELECT cl.barrio, COUNT(cl.nacionalidad != 'Argentina') AS 'cant personas extranjeras' FROM clientes AS cl GROUP BY cl.barrio;

-- 4. Listar los años de fabricación de los autos, junto con la cantidad de autos registrados por cada año de fabricación, pero solo de los autos de 2010 en adelante. Ordenar los datos de mayor a menor cantidad. Mostrar solo los registros cuya cantidad supere 5 autos por año.

SELECT au.anio, COUNT(ser.auto) AS cant_autos FROM autos AS au INNER JOIN servicios AS ser ON au.id=ser.id GROUP BY au.anio HAVING (cant_autos>5 and au.anio>2010) ORDER BY au.anio ASC; 

-- 5. Listar, utilizando subconsultas, el nombre y apellido de los clientes cuyo DNI supere al DNI promedio.

SELECT cl.nombre, cl.apellido FROM clientes AS cl WHERE (SELECT AVG(cl.dni) AS dni_prom FROM clientes AS cl HAVING dni_prom>cl.dni);

SELECT cl.nombre, cl.apellido FROM clientes AS cl  WHERE (SELECT AVG(cl.dni)>cl.dni FROM clientes AS cl);

-- el ultimo punto lo resolvi de estas dos formas porque no sabia cual era la correcta.