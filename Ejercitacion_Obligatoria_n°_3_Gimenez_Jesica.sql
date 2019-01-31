/* Desarrollar consultas SQL para cada uno de los siguientes requerimientos:*/

/*1. Listar patente, marca y modelo de todos los autos.*/

SELECT   patente, marca,modelo FROM autos;

/*2. Listar el apellido como Apellido y el móvil como Celular de todos los clientes.*/

SELECT apellido AS Apellido,movil AS Celular FROM clientes;

/*3. Listar todos los datos de los servicios con el agregado de una columna llamada Cuota Plan 12 que muestra el valor de la cuota de un plan de 12 pagos para cada servicio según su costo.*/

SELECT *,TRUNCATE(costo/12,2) AS  cuota_plan_12 FROM servicios ; 

/*4. Listar marca, modelo y año de los autos, ordenados de más antiguos a más modernos.*/

SELECT marca,modelo,anio FROM autos ORDER BY anio asc;

/*5. Listar nombre, apellido y fecha de nacimiento de los 10 clientes más jóvenes.*/

/*SELECT nombre,apellido,fecha_nacimiento FROM clientes ORDER BY fecha_nacimiento desc limit 10;*/

SELECT nombre,apellido,fecha_nacimiento,TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) AS edad
     FROM clientes ORDER BY edad asc limit 10;
     
/*en el punto 5 encontre dos formas de resolverlo ordenandolos por fecha de nacimiento es una y creando una nueva columna y ordenandolos por edad es la otra.


