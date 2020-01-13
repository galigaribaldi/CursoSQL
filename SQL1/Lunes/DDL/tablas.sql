---Creacion de tablas sin Primary Key
whenever sqlerror exit rollback;
CREATE TABLE estudiante(
    estudiante_id NUMBER(10),
    edad NUMBER(10),
    correo_electronico VARCHAR2(40),
    carrera VARCHAR2(40),
    promedio NUMBER(3,2),
    estatura NUMBER(2,3)
);
--Creacion de tablas con Primary key
CREATE TABLE estudiante2(
    estudiante_id NUMBER(10) PRIMARY KEY,
    edad NUMBER(10),
    correo_electronico VARCHAR2(40),
    carrera VARCHAR2(40),
    promedio NUMBER(3,2),
    estatura NUMBER(2,3)
);

CREATE TABLE automovil(
    automovil_id NUMBER(5) PRIMARY KEY,
    color VARCHAR2(40),
    num_ruedas NUMBER(10),
    num_puertas NUMBER(10),
    marca VARCHAR2(20),
    año NUMBER(4)
);

-------------------Ejercicio 1---------------
CREATE TABLE usuario(
    usuario_id VARCHAR2(40) PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL,
    apellido_paterno VARCHAR2(40) NOT NULL,
    apellido_materno VARCHAR2(40) NOT NULL,
    num_matricula NUMBER(18,0) NOT NULL,
    num_semestre NUMBER(18,0),
    username VARCHAR2(40) NOT NULL,
    password VARCHAR2(40) NOT NULL,
    con_prestamo CHAR(2) NOT NULL,
    con_prestamo_vencido CHAR(2) NOT NULL
);

--Bilioteca

CREATE TABLE biblioteca(
    biblioteca_id NUMBER(10,0) PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL,
    folio VARCHAR2(40) NOT NULL,
    latitud VARCHAR2(40) NOT NULL,
    longitud VARCHAR2(40) NOT NULL,
    direccion_web VARCHAR2(40) NOT NULL,
    direccion VARCHAR2(40) NOT NULL
);
-------------------------------------------------
-------Ejercicio 2----------
CREATE TABLE computadora(
    computadora_id NUMBER(10) PRIMARY KEY,
    marca VARCHAR2(40) NOT NULL,
    año VARCHAR2(40) NOT NULL,
    modelo VARCHAR2(40) NOT NULL,
    procesador VARCHAR2(40) NOT NULL,
    cantidad_ram VARCHAR2(40) NOT NULL,
    marca_tajeta_grafica VARCHAR2(40) NOT NULL
);
 
CREATE TABLE television(
    television_id NUMBER(10,0) PRIMARY KEY,
    modelo VARCHAR2(40) NOT NULL, 
    año VARCHAR2(40) NOT NULL,
    resolucion VARCHAR2(40) NOT NULL,
    marca VARCHAR2(40) NOT NULL
);
------------------------------------------------
commit;
---- @/home/cursobdproteco/Escritorio/CursoSQL/SQL1/Lunes/DDL/tablas.sql
---- sudo su
---- chmod 777 /home/cursobdproteco
--- describe "nombre_tabla"