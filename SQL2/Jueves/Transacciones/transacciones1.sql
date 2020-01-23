CREATE TABLE trabajo(
    trabajo_id CHAR(4) PRIMARY KEY,
    titulo VARCHAR2(35),
    minSal NUMBER(9,2),
    maxSal NUMBER(9,2)
);

INSERT INTO trabajo(trabajo_id, titulo, minSal, maxSal) VALUES('PRES', 'PRESIDENTE', 20000, 400000)
INSERT INTO trabajo(trabajo_id, titulo, minSal, maxSal) VALUES('PRES', 'VICE PRESIDENTE', 15000, 300000)
INSERT INTO trabajo(trabajo_id, titulo, minSal, maxSal) VALUES('PRES', 'ASISTENTE', 300, 6000)
INSERT INTO trabajo(trabajo_id, titulo, minSal, maxSal) VALUES('PRES', 'ADMIN FINANC', 82000, 16000)

--confirmar los datos y mostrarlos
COMMIT;
select * from trabajo;

--Iniciar la transaccion
SET TRANSACTION NAME 'transaccion_1';

---Modifique el atributo IDTRAB con clave PRES y en
---el campo de título cambie a el valor Gerente y
---muestre la actualización realizada
UPDATE trabajo
    SET titulo='Gerente'
    WHERE idTrab='PRES';
SELECT * FROM trabajo;
---  Cree una marca (SAVEPOINT) con el nombre de UPDATE_1
SAVEPOINT update_1;

--Ahora inserte un nuevo valor en la tabla TRABAJO y muestre los datos
INSERT INTO trabajo VALUES('ABD', 'Administrador de Bases de Datos', 20000, 50000);
SELECT * FROM trabajo;

--Elimine el registro de título ‘Asistente’
DELETE FROM trabajo WHERE idTrab='AST';

-- Cree una marca con el nombre DELETE_1
SAVEPOINT delete_1;

---Cargar nuevos datos
INSERT INTO trabajo(trabajo_id, titulo, minSal, maxSal) VALUES('CPUB', 'CONT PUBLICO', 42000, 90000);
INSERT INTO trabajo(trabajo_id, titulo, minSal, maxSal) VALUES('REP', 'REP. VENTAS', 60000, 1200000);

--  Cree una marca con el nombre INSERT_1 y muestre los datos.
SAVEPOINT insert_1;
SELECT * FROM trabajo;

--Modifique el salario mínimo del Contador Público en 6000 y muestre el cambio.
UPDATE trabajo SET minSal=6000
    WHERE titulo='Contador Publico';

SELECT * FROM trabajo;

-- Realice un ROLLBACK al punto INSERT_1 y muestre los datos
ROLLBACK TO insert_1;
SELECT * FROM trabajo;

--Realice un ROLLBACK al punto DELETE_1, muestre los datos y explique lo que sucedió
ROLLBACK TO delete_1;
SELECT * FROM trabajo;

---Realice un ROLLBACK y observe el
--resultado, ¿qué fue lo que paso? Explique
ROLLBACK;