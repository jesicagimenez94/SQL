-- CREA VISTA 
CREATE VIEW paises_europeos AS
SELECT * FROM country
WHERE Continent = 'Europe';

-- MUESTRA VISTA
SELECT * FROM paises_europeos;


-- Una vista que permite ver todos los continentes junto a la cantidad de países que conforman cada uno:

CREATE VIEW cant_paises_por_continente AS
SELECT country.Continent, COUNT(*) AS 'Cantidad de naciones'
FROM country
GROUP BY country.Continent;

-- Luego, se puede usar haciendo:
SELECT * FROM cant_paises_por_continente;


-- Se crea el procedimiento
DELIMITER $$
CREATE PROCEDURE mostrar_europeos ()
BEGIN
SELECT * FROM paises_europeos; -- A través de una vista
END $$
DELIMITER ;

-- Se prueba el procedimiento
CALL mostrar_europeos();


-- Un procedimiento que permite ver todos los datos de un país determinado según el parámetro de entrada pais.
-- Se crea el procedimiento
DELIMITER $$
CREATE PROCEDURE buscar_pais ( in pais varchar(50) )
BEGIN
SELECT * FROM country WHERE country.Name = pais;
END $$
DELIMITER ;

-- Se prueba el procedimiento
CALL buscar_pais('Argentina');
CALL buscar_pais('Brazil');
CALL buscar_pais('Prusia'); -- Ya no existe Prusia