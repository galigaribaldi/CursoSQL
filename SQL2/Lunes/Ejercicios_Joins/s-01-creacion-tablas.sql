--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      Windows uE
-- Project :      practica7-subastas.dm1
-- Author :       jorge
--
-- Date Created : Monday, January 20, 2020 00:07:37
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: ARTICULO 
--

CREATE TABLE ARTICULO(
    ARTICULO_ID           NUMBER(10, 0)     NOT NULL,
    NOMBRE                VARCHAR2(255)     NOT NULL,
    DESCRIPCION           VARCHAR2(1000),
    CLAVE_ARTICULO        VARCHAR2(13)      NOT NULL,
    PRECIO_INICIAL        NUMBER(10, 2)     NOT NULL,
    STATUS_ARTICULO_ID    NUMBER(10, 0)     NOT NULL,
    FECHA_STATUS          DATE              NOT NULL,
    TIPO_ARTICULO         CHAR(1)           NOT NULL,
    SUBASTA_ID            NUMBER(10, 0),
    CONSTRAINT PK1 PRIMARY KEY (ARTICULO_ID)
)
;



-- 
-- TABLE: ARTICULO_ARQUEOLOGICO 
--

CREATE TABLE ARTICULO_ARQUEOLOGICO(
    ARTICULO_ID      NUMBER(10, 0)    NOT NULL,
    ANIO_HALLAZGO    NUMBER(4, 0)     NOT NULL,
    EPOCA            CHAR(2)          NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (ARTICULO_ID)
)
;



-- 
-- TABLE: ARTICULO_DONADO 
--

CREATE TABLE ARTICULO_DONADO(
    ARTICULO_ID       NUMBER(10, 0)    NOT NULL,
    PAIS_ID           NUMBER(2, 0)     NOT NULL,
    FECHA_DONACION    DATE             NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (ARTICULO_ID)
)
;



-- 
-- TABLE: ARTICULO_FAMOSO 
--

CREATE TABLE ARTICULO_FAMOSO(
    ARTICULO_ID        NUMBER(10, 0)     NOT NULL,
    NOMBRE_COMPLETO    VARCHAR2(100)     NOT NULL,
    BIOGRAFIA          VARCHAR2(1000)    NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (ARTICULO_ID)
)
;



-- 
-- TABLE: CLIENTE 
--

CREATE TABLE CLIENTE(
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(50)     NOT NULL,
    APELLIDO_PATERNO    VARCHAR2(50)     NOT NULL,
    APELLIDO_MATERNO    VARCHAR2(50)     NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    EMAIL               VARCHAR2(255)    NOT NULL,
    OCUPACION           VARCHAR2(100)    NOT NULL,
    CIUDAD              VARCHAR2(50),
    ENTIDAD_ID          NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (CLIENTE_ID)
)
;



-- 
-- TABLE: ENTIDAD 
--

CREATE TABLE ENTIDAD(
    ENTIDAD_ID     NUMBER(2, 0)     NOT NULL,
    CLAVE          VARCHAR2(40)     NOT NULL,
    DESCRIPCION    VARCHAR2(100)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (ENTIDAD_ID)
)
;



-- 
-- TABLE: FACTURA_CLIENTE 
--

CREATE TABLE FACTURA_CLIENTE(
    FACTURA_CLIENTE_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_FACTURA         DATE             NOT NULL,
    TARJETA_CLIENTE_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY (FACTURA_CLIENTE_ID)
)
;



-- 
-- TABLE: HISTORICO_STATUS_ARTICULO 
--

CREATE TABLE HISTORICO_STATUS_ARTICULO(
    HISTORICO_STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                    DATE             NOT NULL,
    STATUS_ARTICULO_ID              NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID                     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (HISTORICO_STATUS_ARTICULO_ID)
)
;



-- 
-- TABLE: PAIS 
--

CREATE TABLE PAIS(
    PAIS_ID        NUMBER(2, 0)     NOT NULL,
    CLAVE          VARCHAR2(40)     NOT NULL,
    DESCRIPCION    VARCHAR2(100)    NOT NULL,
    CONSTRAINT PK5_1 PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: STATUS_ARTICULO 
--

CREATE TABLE STATUS_ARTICULO(
    STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE                 VARCHAR2(50)     NOT NULL,
    DESCRIPCION           VARCHAR2(100)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (STATUS_ARTICULO_ID)
)
;



-- 
-- TABLE: SUBASTA 
--

CREATE TABLE SUBASTA(
    SUBASTA_ID      NUMBER(10, 0)    NOT NULL,
    NOMBRE          VARCHAR2(100)    NOT NULL,
    FECHA_INICIO    DATE             NOT NULL,
    FECHA_FIN       DATE             NOT NULL,
    LUGAR           VARCHAR2(100)    NOT NULL,
    CUPO            NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (SUBASTA_ID)
)
;



-- 
-- TABLE: SUBASTA_VENTA 
--

CREATE TABLE SUBASTA_VENTA(
    PRECIO_VENTA          NUMBER(11, 2)    NOT NULL,
    SUBASTA_VENTA_ID      NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID           NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID            NUMBER(10, 0)    NOT NULL,
    FACTURA_CLIENTE_ID    NUMBER(10, 0),
    CONSTRAINT PK17 PRIMARY KEY (SUBASTA_VENTA_ID)
)
;



-- 
-- TABLE: TARJETA_CLIENTE 
--

CREATE TABLE TARJETA_CLIENTE(
    TARJETA_CLIENTE_ID    NUMBER(10, 0)    NOT NULL,
    NUMERO_TARJETA        VARCHAR2(16)     NOT NULL,
    MES_VIGENCIA          VARCHAR2(2)      NOT NULL,
    ANIO_VIGENCIA         VARCHAR2(2)      NOT NULL,
    TIPO_TARJETA          VARCHAR2(30)     NOT NULL,
    CLIENTE_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (TARJETA_CLIENTE_ID)
)
;



-- 
-- INDEX: CLAVE_ARTICULO_UINDEX 
--

CREATE UNIQUE INDEX CLAVE_ARTICULO_UINDEX ON ARTICULO(CLAVE_ARTICULO)
;
-- 
-- TABLE: ARTICULO 
--

ALTER TABLE ARTICULO ADD CONSTRAINT RefSTATUS_ARTICULO7 
    FOREIGN KEY (STATUS_ARTICULO_ID)
    REFERENCES STATUS_ARTICULO(STATUS_ARTICULO_ID)
;

ALTER TABLE ARTICULO ADD CONSTRAINT RefSUBASTA26 
    FOREIGN KEY (SUBASTA_ID)
    REFERENCES SUBASTA(SUBASTA_ID)
;


-- 
-- TABLE: ARTICULO_ARQUEOLOGICO 
--

ALTER TABLE ARTICULO_ARQUEOLOGICO ADD CONSTRAINT RefARTICULO2 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- TABLE: ARTICULO_DONADO 
--

ALTER TABLE ARTICULO_DONADO ADD CONSTRAINT RefARTICULO3 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_DONADO ADD CONSTRAINT RefPAIS6 
    FOREIGN KEY (PAIS_ID)
    REFERENCES PAIS(PAIS_ID)
;


-- 
-- TABLE: ARTICULO_FAMOSO 
--

ALTER TABLE ARTICULO_FAMOSO ADD CONSTRAINT RefARTICULO1 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- TABLE: CLIENTE 
--

ALTER TABLE CLIENTE ADD CONSTRAINT RefENTIDAD12 
    FOREIGN KEY (ENTIDAD_ID)
    REFERENCES ENTIDAD(ENTIDAD_ID)
;


-- 
-- TABLE: FACTURA_CLIENTE 
--

ALTER TABLE FACTURA_CLIENTE ADD CONSTRAINT RefTARJETA_CLIENTE24 
    FOREIGN KEY (TARJETA_CLIENTE_ID)
    REFERENCES TARJETA_CLIENTE(TARJETA_CLIENTE_ID)
;


-- 
-- TABLE: HISTORICO_STATUS_ARTICULO 
--

ALTER TABLE HISTORICO_STATUS_ARTICULO ADD CONSTRAINT RefSTATUS_ARTICULO8 
    FOREIGN KEY (STATUS_ARTICULO_ID)
    REFERENCES STATUS_ARTICULO(STATUS_ARTICULO_ID)
;

ALTER TABLE HISTORICO_STATUS_ARTICULO ADD CONSTRAINT RefARTICULO9 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- TABLE: SUBASTA_VENTA 
--

ALTER TABLE SUBASTA_VENTA ADD CONSTRAINT RefARTICULO21 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE SUBASTA_VENTA ADD CONSTRAINT RefCLIENTE22 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
;

ALTER TABLE SUBASTA_VENTA ADD CONSTRAINT RefFACTURA_CLIENTE25 
    FOREIGN KEY (FACTURA_CLIENTE_ID)
    REFERENCES FACTURA_CLIENTE(FACTURA_CLIENTE_ID)
;


-- 
-- TABLE: TARJETA_CLIENTE 
--

ALTER TABLE TARJETA_CLIENTE ADD CONSTRAINT RefCLIENTE14 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID)
;


