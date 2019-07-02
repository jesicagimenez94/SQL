CREATE TABLE documentos
(cod_documento INT NOT null, descripcion varchar(40), PRIMARY KEY(cod_documento));

CREATE TABLE oficinas
(cod_oficina INT NOT null, cod_director INT NOT null, descripcion varchar(40), PRIMARY KEY(cod_oficina,cod_director));

CREATE TABLE empleados
(cod_empleado int not null, apellido varchar(30), nombre varchar(15), fecha_nacimiento date, num_doc int(10), cod_jefe int not null, cod_oficina int not null, cod_documento int not null, PRIMARY KEY(cod_empleado,cod_jefe,cod_oficina,cod_documento), FOREIGN KEY(cod_oficina)REFERENCES oficinas(cod_oficina),FOREIGN KEY(cod_documento)REFERENCES documentos(cod_documento));

CREATE TABLE datos_contratos
(cod_empleado int not null,fecha_contrato date,cuota float,ventas int, PRIMARY KEY(cod_empleado),FOREIGN KEY(cod_empleado)REFERENCES empleados(cod_empleado));

CREATE TABLE fabricantes
(cod_fabricante int not null, razon_social varchar(10), PRIMARY KEY(cod_fabricante));

CREATE table listas
(cod_lista int not null, ganancias float, descripcion varchar(100),PRIMARY KEY(cod_lista));

CREATE TABLE productos
(cod_producto int not null, descripcion varchar(100), precio float,cant_stock int,punto_reposicion varchar(10),cod_fabricante int not null, PRIMARY KEY(cod_producto,cod_fabricante),FOREIGN KEY(cod_fabricante)REFERENCES fabricantes(cod_fabricante));

CREATE TABLE precios
(cod_producto int not null, cod_lista int not null,precio float, PRIMARY KEY(cod_producto,cod_lista), FOREIGN KEY(cod_producto)REFERENCES productos(cod_producto), FOREIGN KEY(cod_lista)REFERENCES listas(cod_lista));

CREATE TABLE clientes
(cod_cliente int not null,cod_lista int not null,razon_social varchar(10), PRIMARY KEY(cod_cliente,cod_lista), FOREIGN KEY(cod_lista)REFERENCES listas(cod_lista));

CREATE TABLE pedidos
(cod_pedido int not null, fecha_pedido date, cod_empleado int not null, cod_cliente int not null, PRIMARY KEY(cod_pedido,cod_empleado,cod_cliente), FOREIGN KEY(cod_empleado)REFERENCES empleados(cod_empleado), FOREIGN KEY (cod_cliente)REFERENCES clientes(cod_cliente));

CREATE TABLE detalle_pedidos
(cod_pedido int not null,numero_linea int, cod_producto int not null, cantidad int, PRIMARY KEY(cod_pedido,cod_producto),FOREIGN KEY (cod_producto)REFERENCES productos(cod_producto),FOREIGN KEY (cod_pedido)REFERENCES pedidos(cod_pedido));



---------------------------------------------------------------------------------------------------------------------


-- 1
SELECT oficinas.descripcion FROM trabajopractico.oficinas;

-- 2
SELECT productos.descripcion, productos.precio, (productos.precio*1.21) as IVA FROM trabajopractico.productos;

-- 3
SELECT empleados.apellido, empleados.nombre, empleados.fecha_nacimiento,TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) AS edad FROM trabajopractico.empleados;

-- 4
SELECT empleados.nombre FROM trabajopractico.empleados WHERE empleados.cod_jefe IS NOT NULL;

-- 5
SELECT empleados.nombre FROM trabajopractico.empleados
WHERE empleados.nombre ="Maria" ORDER BY empleados.apellido;

-- 6
SELECT clientes.cod_cliente FROM clientes
WHERE clientes.razon_social LIKE 'l%' ORDER BY clientes.cod_cliente;

-- 7
SELECT * FROM trabajopractico.pedidos WHERE pedidos.fecha_pedido LIKE '__03__' ORDER BY pedidos.fecha_pedido;

-- 8
SELECT oficinas.cod_oficina FROM trabajopractico.oficinas WHERE oficinas.cod_director is null;

-- 9
SELECT productos.cod_producto FROM trabajopractico.productos ORDER BY productos.precio ASC;

-- 10
SELECT datos_contratos.cod_empleado FROM trabajopractico.datos_contratos
ORDER BY datos_contratos.cuota DESC LIMIT 4;
