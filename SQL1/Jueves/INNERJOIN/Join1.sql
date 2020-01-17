--Ejemplo sencillo 1
-------------Creacion de las tablas-----
CREATE TABLE a(
    n NUMERIC(3)
);

CREATE TABLE b(
    m NUMERIC(3)
);

CREATE TABLE c(
    o NUMERIC(3)
);
-------------Fin de la Creacion de las tablas-----

-------------Carga de datos-----------------
INSERT INTO a(n) VALUES(1);
INSERT INTO a(n) VALUES(2);
INSERT INTO a(n) VALUES(3);
INSERT INTO a(n) VALUES(4);
INSERT INTO a(n) VALUES(5);
-----------
INSERT INTO b(m) VALUES(3);
INSERT INTO b(m) VALUES(4);
INSERT INTO b(m) VALUES(5);
INSERT INTO b(m) VALUES(6);
INSERT INTO b(m) VALUES(7);
----------
INSERT INTO c(o) VALUES(3);
INSERT INTO c(o) VALUES(1);
INSERT INTO a(o) VALUES(22);
INSERT INTO a(o) VALUES(4);
-------------Fin de la Carga de datos-----------------
----------JOINS---------
SELECT A.n
    FROM A
    INNER JOIN B ON B.m = A.n;
-------------------------
SELECT A.n
    FROM A
    INNER JOIN B ON B.m = A.n
    INNER JOIN C ON C.o = A.n;    

