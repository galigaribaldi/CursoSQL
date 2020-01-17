CREATE TABLE estudiantej(
    estudiantej_id NUMBER(20) PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL,
    ap_paterno VARCHAR2(40) NOT NULL,
    ap_materno VARCHAR2(40) NOT NULL,
    beca_id NUMBER(20)
);

CREATE TABLE beca(
    beca_id NUMBER(20),
    tipo VARCHAR2(40),
    duracion NUMBER(3),
    monto NUMBER(10)
);
----------------------------------------

----------------------------------------
INSERT INTO estudiantej(estudiantej_id, nombre, ap_paterno, ap_materno, beca_id) VALUES(2001, 'MARIA', 'JIMENEZ', 'SALAZAR', 500);
INSERT INTO estudiantej(estudiantej_id, nombre, ap_paterno, ap_materno) VALUES(2002, 'RODRIGUEZ', 'BENITEZ', 'BENITEZ');
INSERT INTO estudiantej(estudiantej_id, nombre, ap_paterno, ap_materno, beca_id) VALUES(2003, 'ARMANDO', 'ZARATE', 'MARTINEZ', 501);
INSERT INTO estudiantej(estudiantej_id, nombre, ap_paterno, ap_materno) VALUES(2004, 'RODRIGO', 'MUNGUIA', 'SOLANO');
INSERT INTO estudiantej(estudiantej_id, nombre, ap_paterno, ap_materno, beca_id) VALUES(2005, 'JULIO', 'LUNA', 'MEJIA', 502);
----
INSERT INTO beca(beca_id, tipo, duracion, monto) VALUES(500, 'ESCOLARIDAD', 5, 6000);
INSERT INTO beca(beca_id, tipo, duracion, monto) VALUES(501, 'ALIMENTICIA', 2, 3000);
INSERT INTO beca(beca_id, tipo, duracion, monto) VALUES(502, 'VITALICIA', 1, 1000);
INSERT INTO beca(beca_id, tipo, duracion, monto) VALUES(503, 'TEMPROAL', 1, 1500);
---------------------------------------
-------LEFT OUTER JOIN
select * 
    from estudiantej e 
    left outer join  beca b 
    on e.beca_id=b.beca_id; 
--- Mostrar todos los estudiantes y si tienen beca, mostrar los datos de la beca
select *
    from estudiante e, beca b
    where e.beca_id=b.beca_id(+); 

-------RIGHT OUTER JOIN
select * 
    from estudiantej e 
    right outer join beca b 
    on e.beca_id=b.beca_id; 
--- Mostrar todas las becas disponibles, y en caso de que, asociada a un estudiante, mostrar sus datos
select *
    from estudiantej e, beca b
    where e.beca_id(+)=b.beca_id; 