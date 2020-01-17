select n, m
    from a
    full outer join b on b.m=a.n;

---Ejemplos

------------------------
CREATE   TABLE  fruits (
    fruit_id  NUMERIC(10)   PRIMARY KEY ,
    fruit_name  VARCHAR (255)  NOT NULL ,
    basket_id  NUMERIC(10) 
);
---
CREATE   TABLE  baskets (
    basket_id  NUMERIC(10) PRIMARY KEY ,
    basket_name  VARCHAR2(255) NOT NULL 
);
-------------------------

INSERT INTO  baskets (basket_id, basket_name) VALUES (1,  'A' );
INSERT INTO  baskets (basket_id, basket_name) VALUES (2,  'B' );
INSERT INTO  baskets (basket_id, basket_name) VALUES (3,  'C' );
INSERT INTO  fruits (fruit_id, fruit_name, basket_id) VALUES(1,  'Apple' , 1);
INSERT INTO  fruits (fruit_id, fruit_name, basket_id) VALUES(2,  'Orange' , 1);
INSERT INTO  fruits (fruit_id, fruit_name, basket_id) VALUES(3,  'Banana' , 2);
INSERT INTO  fruits (fruit_id, fruit_name, basket_id) VALUES(4,  'Strawberry' ,  NULL );

---la siguiente consulta devuelve cada fruta que está en una cesta y cada cesta que tiene una fruta, pero también devuelve cada fruta que no está en ninguna cesta y cada cesta que no tiene ninguna fruta.
--
SELECT basket_name, fruit_name
    FROM fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.basket_id;
--Por ejemplo, para encontrar la cesta vacía, que no almacena ninguna fruta, utilice la siguiente declaración:
SELECT basket_name, fruit_name
    FROM fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.basket_id
WHERE fruit_name  IS   NULL ;
----Del mismo modo, si desea ver qué fruta no está en ninguna canasta, utilice la siguiente declaración:
SELECT basket_name, fruit_name
FROM fruits
FULL OUTER JOIN baskets ON baskets.basket_id = fruits.basket_id
WHERE basket_name  IS   NULL ;
