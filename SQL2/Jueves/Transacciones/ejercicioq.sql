CREATE TABLE prod(
    prod_id NUMBER(10) PRIMARY KEY,
    cantidad NUMBER(10) not null
);

INSERT INTO prod(prod_id, cantidad) VALUES(1001,100);
INSERT INTO prod(prod_id, cantidad) VALUES(1002,500);
INSERT INTO prod(prod_id, cantidad) VALUES(1003,700);

CREATE TABLE concierto(
    num_asiento NUMBER(2),
    ocupado NUMBER(2),
    nombre VARCHAR2(20)
);
INSERT INTO concierto VALUES(1,0, null);
INSERT INTO concierto VALUES(2,0, null);
INSERT INTO concierto VALUES(3,0, null);