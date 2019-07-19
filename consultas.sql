/*Selección. Unicidad. Alias. Columnas
calculadas*/

/*1. Listar código, nombre, continente y población de todos los países. (Se esperan 4
columnas y 239 registros).*/

SELECT country.Code,country.Name,country.Continent,country.Population FROM world.country;

/*2. Listar solo.el nombre de todos los lenguajes distintos que existan. (Se espera 1
columna y 457 registros).*/

SELECT countrylanguage.Language  FROM world.countrylanguage;

/*3. Listar nombre y población de cada ciudad, con los nombres de las columnas en
castellano. (Se esperan 2 columnas y 4079 registros).*/

SELECT city.name AS Nombre_ciudad, city.population AS Poblacion FROM world.city;

/*4. Listar el nombre, el GNP como 'Producto Bruto Nacional', el GNPOld como
'Producto Bruto Nacional Anterior' y la diferencia entre estos como 'Diferencia',
para todos los países. (Se esperan 4 columnas y 239 registros).*/

SELECT country.name AS Nombre, country.GNP AS producto_bruto_nacional, country.GNPOld AS producto_bruto_nacional_anterior,(country.GNP-country.GNPOld) AS Diferencia
FROM world.country;

/*5. Listar el nombre, la cantidad de habitantes, la superficie y una columna llamada
'Densidad' con el resultado de la densidad poblacional de todos los países. (Se
esperan 4 columnas y 239 registros).*/

SELECT country.name AS Nombre, country.population AS habitantes, country.SurfaceArea AS superficie,(population/surfacearea)
AS Densidad FROM world.country;

/*Límites. Ordenamiento*/
/*6. Listar toda la información de los países, ordenados por población de manera
ascendente. (Se esperan 15 columnas y 239 registros).*/

SELECT* FROM  world.country ORDER BY country.Population  ASC;

/*7. Listar nombre de los lenguajes en orden alfabético. (Se espera 1 columna y 984
registros).*/

SELECT countrylanguage.Language AS nombre FROM world.countrylanguage ORDER BY nombre ASC;

/*8. Listar nombre y cantidad de habitantes de las veinte ciudades menos pobladas.
(Se esperan 2 columnas y 20 registros).*/

SELECT city.name AS Nombre, City.population AS cant_habitantes FROM world.city ORDER BY cant_habitantes ASC LIMIT 20;

/*9. Listar código, nombre y año de independencia de todos los países, ordenados
por antigüedad descendente. (Se esperan 3 columnas y 239 registros).*/

SELECT country.Code as codigo, country.name as nombre, country.IndepYear as 'año de independencia' from world.country order by 'año de independencia' desc;

/*10. Listar nombre y continente de los cien países con mayor expectativa de vida. Si
hubiera países que tengan la misma expectativa de vida, mostrar primero a los
de menor superficie. (Se esperan 2 columnas y 100 registros).*/

SELECT country.name AS nombre, country.Continent AS continente FROM world.country ORDER by country.lifeExpectancy, country.SurfaceArea DESC LIMIT 100 ;


/*Filtrado de registros. Operadores relacionales y lógicos. Operadores IN y BETWEEN.*/

/*11. Listar todos los datos de los países que no cuenten con habitantes. (Se esperan 15 columnas y 7 registros).*/

SELECT*  FROM world.country WHERE country.population=0;

/*12. Listar todos los datos de los países cuya expectativa de vida supere los setenta y cinco años, ordenados bajo este concepto de forma ascendente. (Se esperan 15 columnas y 62 registros).*/

SELECT* FROM world.country WHERE country.LifeExpectancy>75 ORDER BY country.LifeExpectancy ASC;

/*13. Listar todos los datos de los países cuya independencia haya ocurrido a partir de la segunda mitad del siglo XIX y su forma de gobierno sea una monarquía constitucional. (Se esperan 15 columnas y 20 registros).*/

SELECT* FROM world.country WHERE country.IndepYear>1850 AND country.GovernmentForm='ConstitutionalMonarchy';

/*14. Listar todos los datos de los diez países europeos de mayor PBN. (Se esperan 15 columnas y 10 registros).*/

SELECT* FROM world.country WHERE country.Continent='Europe' ORDER BY country.GNP DESC LIMIT 10;

/*15. Listar todos los datos de los países cuyo nombre registrado coincida con su nombre local. (Se esperan 15 columnas y 104 registros).*/

SELECT* FROM world.country WHERE country.name=country.LocalName;

/*16. Listar todos los datos de los países cuya independencia se haya dado a partir de la segunda mitad del siglo XX. (Se esperan 15 columnas y 110 registros).*/

SELECT* FROM world.country WHERE country.IndepYear>1950; 

/*17. Listar todos los datos de los países situados en Europa, Asia o Sudamérica. (Se esperan 15 columnas y 111 registros).*/

SELECT* FROM world.country WHERE country.Continent IN ('Europe','Asia','South America');

/*18. Listar todos los datos de todos los países, excepto los africanos. (Se esperan 15 columnas y 181 registros).*/

SELECT* FROM world.country WHERE NOT country.Continent='Africa';

/*19. Listar todos los datos de las ciudades argentinas fuera de la provincia de Buenos Aires. (Se esperan 5 columnas y 26 registros).*/

 SELECT* FROM world.city WHERE city.name!='Buenos Aires' AND district!='Buenos Aires' AND city.countrycode IN (SELECT country.code FROM world.country WHERE country.name ='Argentina');

/*20. Listar todos los datos de las ciudades de entre 125 mil y 130 mil habitantes. (Se esperan 5 columnas y 138 registros).*/

SELECT* FROM world.city WHERE city.population BETWEEN 125000 AND 130000;

/*Manejo de valores nulos. Operador LIKE. Comodines.*/
/*21. Listar todos los datos de los países donde no se cuente con datos acerca de su independencia. (Se esperan 15 columnas y 47 registros).*/

SELECT*  FROM world.country WHERE country.indepyear is null;

/*22. Listar todos los datos de los países donde no se tengan datos acerca del PBN anterior ni de la expectativa de vida. (Se esperan 15 columnas y 17 registros).*/

SELECT* FROM world.country WHERE country.GNPOld  IS NULL AND country.LifeExpectancy IS NULL ;

/*23. Listar todos los datos de los países cuyo nombre comience y termine con ‘A’. (Se esperan 15 columnas y 13 registros).*/

SELECT* FROM world.country WHERE country.name LIKE 'A%A';

/*24. Listar todos los datos de los países cuyo nombre sea compuesto (más de una palabra). (Se esperan 15 columnas y 66 registros).*/

SELECT* FROM world.country WHERE country.name LIKE '% %';

/*25. Listar todos los datos de las ciudades cuyo nombre o distrito contengan un '-'. (Se esperan 5 columnas y 372 registros).*/

SELECT * FROM world.city WHERE city.name LIKE '%-%' or city.district LIKE '%-%';


-- Unión de tablas
-- 26. Listar los nombres de los países sudamericanos junto a los nombres (alias 'Capital') de sus capitales. (Se esperan 2 columnas y 14 registros).

SELECT co.name AS pais, ci.name AS Capital  FROM world.country AS co INNER JOIN world.city AS ci ON ci.ID=co.capital WHERE co.continent='South America';

-- 27. Listar el código de país, junto a los nombres de las ciudades y su cantidad de habitantes, de aquellos cuya expectativa de vida sea mayor a 80. (Se esperan 3 columnas y 253 registros).
 
 SELECT co.code AS 'codigo de pais', ci.name AS 'nombre ciudad', co.Population AS 'poblacion'  FROM world.country AS co INNER JOIN world.city AS ci ON co.code=ci.countryCode WHERE co.lifeExpectancy>80;
 
-- 28. Listar las capitales de los países cuya forma de gobierno sea una República Federal. (Se esperan 2 columnas y 15 registros).

SELECT ci.name,co.governmentform FROM world.city AS ci INNER JOIN world.country AS co ON ci.ID=co.capital WHERE co.governmentform ='Federal Republic' ;

-- 29. Listar los lenguajes oficiales, junto al nombre de sus respectivos países, donde la cantidad de habitantes de dicho país esté entre uno y tres millones. (Se esperan 2 columnas y 14 registros).

SELECT cl.language, co.name FROM world.countrylanguage AS cl INNER JOIN world.country AS co ON cl.countrycode=co.code WHERE co.population  BETWEEN 1000000 and 3000000 ;

-- 30. Listar los códigos, los nombres locales y la región a la que pertenecen aquellos países donde se hable español. (Se esperan 3 columnas y 28 registros).

SELECT co.code, co.localname, co.region FROM world.country AS co LEFT JOIN world.countrylanguage AS cl ON cl.countrycode=co.code WHERE cl.language='spanish';

-- 31. Listar los nombres y las capitales de los países en cuya capital se concentre más de la mitad de su población total. (Se esperan 2 columnas y 14 registros).

SELECT co.name AS nombre, ci.name AS capital FROM world.country AS co INNER JOIN world.city AS ci ON co.code=ci.countrycode WHERE ci.population>(co.population/2) ;

-- 32. Listar los nombres y la superficie de los países africanos cuya capital coincida con el nombre del distrito a la que pertenece. (Se esperan 2 columnas y 32 registros).

SELECT co.name, co.surfaceArea FROM world.country AS co LEFT JOIN world.city AS ci ON ci.ID=co.capital WHERE co.continent='Africa' and ci.district=ci.name ;

-- 33. Listar los nombres, las capitales y el año de independencia (sin nulos) de los 20 países más antiguos. (Se esperan 3 columnas y 20 registros).

SELECT co.name AS Pais , ci.name AS capital, co.indepyear  FROM world.country AS co INNER JOIN world.city AS ci ON ci.ID=co.capital WHERE co.indepyear IS NOT NULL ORDER BY co.indepyear  ASC limit 20 ; 

-- 34. Listar las ciudades junto a sus idiomas oficiales, donde no se hable español, inglés, portugués, italiano, francés o alemán de manera oficial. (Se esperan 2 columnas y 2694 registros).

SELECT ci.name, cl.Language FROM world.city AS ci INNER JOIN world.countrylanguage AS cl ON ci.countrycode=cl.countrycode WHERE cl.Language NOT IN('spanish', 'english', 'french', 'german','italian','portuguese');

-- 35. Listar nombre, población y país de las diez ciudades europeas de habla inglesa más pobladas. (Se esperan 3 columnas y 10 registros).

SELECT ci.name, ci.population, co.name FROM world.city AS ci INNER JOIN world.country AS co ON co.code=ci.countrycode 
INNER JOIN world.countrylanguage AS cl ON co.code=cl.countrycode WHERE co.continent='Europe' and cl.language='english' ORDER BY  co.population DESC LIMIT 10;

-- Funciones de agregación. Agrupamiento.

-- 36. Mostrar según la tabla de países, la cantidad total de población, la población máxima, la población mínima, el promedio de población y con cuántos registros de población se cuenta. (Se esperan 5 columnas y 1 registro).

SELECT SUM(country.population) AS 'total poblacion', MAX(country.population) AS 'poblacion maxima', MIN(country.population) AS 'poblacion minima', AVG(country.population) AS 'poblacion promedio', COUNT(country.population) AS 'cant reg poblacion' FROM world.country;

-- 37. Mostrar según la tabla de países, la cantidad total de población, la población máxima, la población mínima y el promedio de población, por cada continente. (Se esperan 5 columnas y 7 registros).

SELECT country.continent, SUM(country.population) AS 'total poblacion', MAX(country.population) AS 'poblacion maxima', MIN(country.population) AS 'poblacion minima', AVG(country.population) AS 'poblacion promedio' FROM world.country GROUP BY country.continent;

-- 38. Agrupar a todos los países según el continente al que pertenecen. Mostrar los continentes junto a la cantidad de naciones que pertenecen a cada uno. (Se esperan 2 columnas y 7 registros).

SELECT country.continent AS continente, COUNT(country.name) AS 'cant de naciones' FROM world.country GROUP BY continente;

-- 39. Agrupar a todas las ciudades según el país al que pertenecen. Mostrar los códigos de países junto a la sumatoria total de habitantes de cada uno. (Se esperan 2 columnas y 232 registros).

SELECT co.code AS 'cod pais', SUM(co.population) AS 'Habitantes' FROM world.country AS co INNER JOIN world.city AS ci ON co.code=ci.countrycode GROUP BY co.name;

-- 40. Agrupar a todos los lenguajes según su nombre. Mostrar los nombres de los lenguajes junto al porcentaje de habla mínimo registrado para cada uno. (Se esperan 2 columnas y 457 registros).

SELECT countrylanguage.language AS lenguaje, MIN(countrylanguage.percentage) AS porcentaje_minimo FROM world.countrylanguage GROUP BY countrylanguage.language;

-- 41. Mostrar las distintas formas de gobierno posibles de los países europeos junto a su correspondiente promedio de población que vive bajo estas circunstancias. (Se esperan 2 columnas y 10 registros).

SELECT AVG(country.population) AS 'promedio poblacion',country.governmentform AS 'forma de gobierno' FROM world.country WHERE country.continent='Europe' GROUP BY country.governmentform;

-- 42. Mostrar las diez regiones de mayor expectativa de vida promedio. (Se esperan 2 columnas y 10 registros).

SELECT country.region AS region, AVG(country.lifeexpectancy) AS prom_expectativa FROM world.country GROUP BY region ORDER BY prom_expectativa desc LIMIT 10 ;

-- 43. Mostrar los nombres de los diez distritos de mayor cantidad de ciudades con cantidad de habitantes mayor al medio coperan 2 columnas y 24 registros).
-- 45. Mostrar los lenguajes existentes junto a la cantidad de países que lo hablan de manera oficial. (Se esperan 2 columnas y 102 registros).

SELECT cl.language, COUNT(co.name) AS 'cant paises' FROM world.country AS co INNER JOIN world.countrylanguage AS cl ON cl.countrycode=co.code GROUP BY cl.language;

-- Filtrado de grupos.
-- 46. Mostrar listados los años de independencia (sin nulos) junto a la cantidad de países que la hayan conseguido en ese año. Se desea visualizar aquellos años donde más de un país se haya independizado. (Se esperan 2 columnas y 39 registros).

SELECT country.indepyear, COUNT(country.name) AS cant_paises FROM world.country WHERE  (country.indepyear) is not null GROUP BY  country.indepyear HAVING cant_paises>1;

-- 47. Listar los países junto a la cantidad de idiomas diferentes hablados, pero solo aquellos donde se hablen entre tres y cinco idiomas diferentes. (Se esperan 2 columnas y 80 registros).

SELECT co.name AS paises, COUNT(cl.language) AS cantidad_idiomas FROM world.country AS co INNER JOIN world.countrylanguage AS cl ON co.code=cl.countrycode
GROUP BY paises HAVING cantidad_idiomas BETWEEN 3 AND 5;

-- 48. Mostrar los distritos, junto al nombre del país al que pertenecen, cuya población total (también listada) no supere los diez mil habitantes. (Se esperan 3 columnas y 35 registros).

SELECT co.name AS pais, ci.district AS distrito, SUM(ci.Population) AS poblacion FROM world.country AS co INNER JOIN world.city AS ci ON co.code=ci.countrycode
 GROUP BY distrito having poblacion<10000;

-- 49. Mostrar las regiones junto a su densidad poblacional promedio, donde ésta supere a la mitad de la densidad poblacional máxima. (Se esperan 2 columnas y 3 registros).

SELECT country.Region, AVG(country.population/country.surfaceArea) AS densidad_poblacional_prom FROM world.country GROUP BY Region HAVING densidad_poblacional_prom > MAX(country.population/country.surfaceArea)/2;

-- 50. Mostrar los lenguajes oficiales junto a su porcentaje promedio de habla, cuyo promedio no supere un dígito entero. (Se esperan 2 columnas y 7 registros).

SELECT cl.Language, AVG(cl.Percentage) AS porcentaje_prom FROM world.countrylanguage AS cl GROUP BY cl.language HAVING porcentaje_prom between 1 AND 9;

-- 51. Insertar un nuevo cliente con los siguientes datos:
-- '12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01', 'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay'

INSERT INTO inupde.clientes(dni, nombre, apellido,  genero,fecha_nacimiento, mail,movil, domicilio, barrio,nacionalidad) VALUES( '12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01', 'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay');

/*Insertar los siguientes clientes en una sola consulta:
DNI
Nombre
Apellido
Género
Fecha de nacimiento
Mail
Móvil
Dirección
Barrio
Nacido en

17278290
Florencia
Santos
MUJER
1963-07-12
flor.santos@ma1l.com
1148434346
Piran 3015
Villa Urquiza
Argentina
16839283
Luisa Nina
Escudero
MUJER
1962-03-22
lulu62@hushma1l.com
1175940343
Superi 348 1º A
Colegiales
Colombia
19164274
Carlos Alberto
Medina
HOMBRE
1966-04-26
medinacarlosalberto@z0h0.com
1123423451
Mexico 2121
Balvanera
Argentina*/

INSERT INTO inupde.clientes(dni ,nombre, apellido, genero, Fecha_nacimiento, mail, movil, domicilio, barrio, nacionalidad)
VALUES('17278290', 'Florencia','Santos','MUJER', '1963-07-12', 'flor.santos@ma1l.com','1148434346', 'Piran 3015','Villa Urquiza','Argentina'),
('16839283','Luisa Nina','Escudero','MUJER','1962-03-22','lulu62@hushma1l.com','1175940343','Superi 348 1º A','Colegiales','Colombia'),
('19164274','Carlos Alberto','Medina','HOMBRE','1966-04-26','medinacarlosalberto@z0h0.com','1123423451','Mexico 2121','Balvanera','Argentina');

-- 53. Insertar una cliente llamada María Sol González, con DNI 36.427.254, nacida en Argentina el 15 de agosto de 1992. 
-- Domiciliada en Gurruchaga 243, Villa Crespo. Su móvil es 1136782013 y su mail es ma.gon54@gma1l.com.

INSERT INTO clientes(dni, nombre, apellido, fecha_nacimiento, mail, movil, domicilio, barrio, nacionalidad)
VALUES('36.427.254','María Sol',' González','1992-08-15','ma.gon54@gma1l.com','1136782013','Gurruchaga 243','Villa Crespo','Argentina ');
