-- crear base de datos practica fechas
CREATE DATABASE practica_fechas

-- crear tablas alumnos y datos
CREATE TABLE alumnos
(id_alumno int not null, nombre varchar(30), apellido varchar(30),primary key(id_alumno));
CREATE TABLE datos
(id_datos int not null, fecha date, hora time, primary key(id_datos));


-- inserto datos en mi base

insert into alumnos(id_alumno,nombre,apellido)VALUES(1,'alan','gonzalez'),(2,'jesica','gimenez'),(3,'braian','seube');
insert into datos(id_datos,fecha,hora)VALUES(1,'2019-01-20','03:02:00'),(2,'2017-04-21','09:45:02'),(3,'2015-12-11','23:00:45');

-- mostrar nombre,apellido,fecha y hora de los alumnos registrados antes del 20/01/2018.

SELECT a.nombre,a.apellido,d.fecha,d.hora FROM alumnos as a, datos as d
WHERE a.id_alumno=d.id_datos 
AND d.fecha<20180102;

-- mostrar nombre, apellido, hora de los alumnos registrados antes de las 23:00:45;
SELECT a.nombre,a.apellido,d.hora FROM alumnos as a, datos as d
WHERE a.id_alumno=d.id_datos
AND d.hora<230045;



