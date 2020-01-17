--------------------Creacion de las tablas
whenever sqlerror exit rollback;

CREATE TABLE cliente(
    cliente_id NUMBER(8) PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL,
    ap_paterno VARCHAR2(30) NOT NULL,
    ap_materno VARCHAR2(30) NOT NULL
);

CREATE TABLE tarjeta_credito(
    cliente_id NOT NULL CONSTRAINT cliente_id_fk REFERENCES cliente(cliente_id),
    tarjeta_credito_id NUMBER(8) PRIMARY KEY,
    numero NUMBER(30) NOT NULL,
    tipo VARCHAR2(30) NOT NULL
);
-------------- Fin de la Creacion de las tablas

-------Carga de datos----------
INSERT INTO cliente(cliente_id, nombre, ap_paterno, ap_materno) VALUES (1001,'Jimena', 'Morales', 'Rosales');
INSERT INTO cliente(cliente_id, nombre, ap_paterno, ap_materno) VALUES (1002,'Hugo', 'Alcazar', 'Benitez');
INSERT INTO cliente(cliente_id, nombre, ap_paterno, ap_materno) VALUES (1003,'Fernando', 'Fernando', 'Perez');
INSERT INTO cliente(cliente_id, nombre, ap_paterno, ap_materno) VALUES (1004,'Jorge', 'Jorge', 'Solano');
INSERT INTO cliente(cliente_id, nombre, ap_paterno, ap_materno) VALUES (1005,'Gerardo', 'Gerardo', 'Mejia');

INSERT INTO tarjeta_credito(cliente_id, tarjeta_credito_id, numero, tipo) VALUES (1002, 3500, 9876543234567890, 'VISA');
INSERT INTO tarjeta_credito(cliente_id, tarjeta_credito_id, numero, tipo) VALUES (1003, 3501, 9876543234567890, 'MASTER');
INSERT INTO tarjeta_credito(cliente_id, tarjeta_credito_id, numero, tipo) VALUES (1004, 3502, 9876543234567890, 'AMERICAN');
------Fin de la carga de datos

---USo de Joins
select  c.cliente_id, c.nombre,c.ap_paterno,c.ap_materno,
    t.tarjeta_credito_id,t.numero,t.tipo
    from cliente c
    join tarjeta_credito t
    on c.cliente_id=t.cliente_id; 

SELECT a.nombre, s.clave, s.status_articulo_id
FROM articulo a
JOIN status_articulo s 
ON a.status_articulo_id = s.status_articulo_id
JOIN articulo_famoso f
ON a.status_articulo_id = f.articulo_id
where nombre_completo = 'William Harvey';

------------------------
SELECT articulo_id, nombre, clave_articulo
FROM articulo
JOIN status_articulo sa USING(status_articulo_id)
NATURAL JOIN articulo_donado
JOIN pais p USING(pais_id)
WHERE p.descripcion = 'BELGICA'
and sa.clave = 'ENTREGADO';
