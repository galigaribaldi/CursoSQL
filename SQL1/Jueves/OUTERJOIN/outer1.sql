--Ejemplo sencillo 1
-------------Creacion de las tablas-----
CREATE TABLE a(
    n NUMERIC(3)
);

CREATE TABLE b(
    m NUMERIC(3)
);
-------------Fin de la Creacion de las tablas-----

-------------Carga de datos-----------------
INSERT INTO a(n) VALUES(1);
INSERT INTO a(n) VALUES(2);
INSERT INTO a(n) VALUES(3);
INSERT INTO a(n) VALUES(4);
-----------
INSERT INTO b(m) VALUES(3);
INSERT INTO b(m) VALUES(4);
INSERT INTO b(m) VALUES(5);
INSERT INTO b(m) VALUES(6);
----
SELECT 
    a.n
    FROM a
    LEFT JOIN b ON b.m = a.n;