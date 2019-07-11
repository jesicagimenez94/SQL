-- ejercicios SQL

-- crear la base de datos tienda cuyas entidades sean fabricantes(codigo, nombre) y articulos(codigo,nombre,precio,fabricante).

CREATE DATABASE tienda;

CREATE TABLE fabricantes
(codigo int not null, nombre varchar(100),primary key(codigo));
CREATE TABLE articulos
(codigo int not null, nombre varchar(100),precio int, fabricante int,primary key(codigo),foreign key(fabricante)references fabricantes(codigo));
