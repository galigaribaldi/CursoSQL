CREATE TABLE R(
    A NUMBER(2),
    B NUMBER(2),
    C NUMBER(3),
    D VARCHAR2(1),
    E VARCHAR2(20)
);

CREATE TABLE S(
    A NUMBER(2),
    B NUMBER(2),
    F NUMBER(3),
    G VARCHAR2(1),
    H VARCHAR2(20)
);

INSERT INTO R(A, B, C, D, E) VALUES(2, 30, 100,'X', 'True');
INSERT INTO R(A, B, C, D, E) VALUES(5, 70, 400,'W', 'FALSE');
INSERT INTO R(A, B, C, D, E) VALUES(6, 80, 500,'M', 'FALSE');

INSERT INTO S(A, B, F, G, H) VALUES(2, 30, 100,'X', 'True');
INSERT INTO S(A, B, F, G, H) VALUES(5, 80, 400,'W', 'FALSE');
INSERT INTO S(A, B, F, G, H) VALUES(6, 89, 500,'M', 'FALSE');

---
select * from r natural join s; 
---USando Using
select * from r join s using(A);