/*Desarrollar consultas SQL para cada uno de los siguientes requerimientos:*/

/*1. Listar todos los datos de los clientes extranjeros (aquellos no nacidos en Argentina), ordenados de menor a mayor DNI.*/

SELECT* FROM clientes WHERE NOT nacionalidad='Argentina' ORDER BY dni ASC;

/*2. Listar todos los datos de los autos cuyo color no sea ni blanco, ni negro, ni beige.*/

SELECT* FROM autos WHERE color NOT IN ('blanco','negro','beige');

/*3. Listar todos los datos de los clientes cuyo servidor de mail sea gma1l.*/

SELECT* FROM clientes GROUP BY mail HAVING mail LIKE '%gma1l%';

/*4. Listar patente, fecha y costo de los autos que hayan recibido un servicio con costo menor o igual a 1000 pesos.*/

SELECT patente, fecha, costo FROM autos AS a 
INNER JOIN servicios AS s  ON s.id=a.id WHERE costo <= 1000;

/*5. Listar nombre y apellido de los clientes cuyos autos hayan recibido un servicio con costo superior a 4000 pesos.*/

SELECT nombre, apellido,costo FROM clientes AS c
INNER JOIN autos AS a ON c.id =a.duenio 
INNER JOIN servicios AS s ON s.id =a.id WHERE costo >4000;

