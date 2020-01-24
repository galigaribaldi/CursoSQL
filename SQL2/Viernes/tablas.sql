--@Autors: Cabrera Garibaldi Hernan Galileo
--@Autors: Medel Sánchez Berenice
--@Fecha: 02/Diciembre/2019
-- 
-- TABLE: BIBLIOTECA 
--

CREATE TABLE BIBLIOTECA(
    BIBLIOTECA_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE           VARCHAR2(20)     NOT NULL,
    FOLIO            CHAR(5)          NOT NULL,
    LATITUD          VARCHAR2(40)     NOT NULL,
    LONGITUD         VARCHAR2(40)     NOT NULL,
    DIRECCION_WEB    VARCHAR2(40)     NOT NULL,
    DIRECCION        VARCHAR2(40)     NOT NULL,
    CONSTRAINT BIBLIOTECA_PK PRIMARY KEY (BIBLIOTECA_ID)
)
tablespace entidades_tb
;


-- 
-- TABLE: AREA_CONOCIMIENTO 
--

CREATE TABLE AREA_CONOCIMIENTO(
    area_conocimiento_id    NUMBER(10, 0)    NOT NULL,
    nombre                  VARCHAR2(30)     NOT NULL,
    clave                   VARCHAR2(5)      NOT NULL,
    CONSTRAINT AREA_CONOCIMIENTO_PK PRIMARY KEY (area_conocimiento_id)
)
tablespace entidades_tb
;


-- 
-- TABLE: AREA_CONOCIMIENTO_BIBLIOTECA 
--

CREATE TABLE AREA_CONOCIMIENTO_BIBLIOTECA(
    area_biblioteca_id      number(10,0)     NOT NULL,
    BIBLIOTECA_ID           NUMBER(10, 0)    NOT NULL,
    area_conocimiento_id    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AREA_CONOCIMIENTO_BIBLIOTECA_PK PRIMARY KEY (area_biblioteca_id),
    CONSTRAINT AREA_CON_BIBLIOTECA_FK FOREIGN KEY (BIBLIOTECA_ID)
    REFERENCES BIBLIOTECA(BIBLIOTECA_ID),
    CONSTRAINT AREA_CON_AREA_ID_FK FOREIGN KEY (area_conocimiento_id)
    REFERENCES AREA_CONOCIMIENTO(area_conocimiento_id)
)
tablespace entidades_tb
;




-- 
-- TABLE: AUTOR 
--

CREATE TABLE AUTOR(
    AUTOR_ID            number(10,0)    NOT NULL,
    NOMBRE              VARCHAR2(40)    NOT NULL,
    APELLIDO_PATERNO    VARCHAR2(40)    NOT NULL,
    APELLIDO_MATERNO    VARCHAR2(40)    NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
)
tablespace entidades_tb
;





-- 
-- TABLE: EDITORIAL 
--

CREATE TABLE EDITORIAL(
    EDITORIAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE           VARCHAR2(40)     NOT NULL,
    NOMBRE          VARCHAR2(40)     NOT NULL,
    DESCRIPCION     VARCHAR2(40)     NOT NULL,
    CONSTRAINT EDITORIAL_PK PRIMARY KEY (EDITORIAL_ID)
)
tablespace entidades_tb
;


-- 
-- TABLE: FOTO_USUARIOS 
--

CREATE TABLE FOTO_USUARIOS(
    FOTO_ID    number(10,0) NOT NULL,
    FOTO       blob         NOT NULL,
    CONSTRAINT FOTO_USUARIOS_PK PRIMARY KEY (FOTO_ID)
)
tablespace foto_usuarios_tb
;


-- 
-- TABLE: STATUS_RECURSO 
--

CREATE TABLE STATUS_RECURSO(
    STATUS_RECURSO_ID    NUMBER(1, 0)    NOT NULL,
    CLAVE                VARCHAR2(40)    NOT NULL,
    DESCRIPCION          VARCHAR2(40)    NOT NULL,
    CONSTRAINT STATUS_RECURSO_PK PRIMARY KEY (STATUS_RECURSO_ID)
)
tablespace entidades_tb;


-- 
-- TABLE: RECURSO 
--

CREATE TABLE RECURSO(
    RECURSO_ID              NUMBER(10,0)    NOT NULL,
    NUM_CLASIFICACION              VARCHAR2(18)     NOT NULL,
    TITULO              VARCHAR2(40)     NOT NULL,
    FECHA_ADQUISICION       DATE             NOT NULL,
    TIPO_RECURSO            char(1)      NOT NULL,
    BIBLIOTECA_ID           NUMBER(10, 0)    NOT NULL,
    STATUS_RECURSO_ID       NUMBER(1,0)     NOT NULL,
    area_conocimiento_id    NUMBER(10, 0)    NOT NULL,
    RECURSO_NUEVO           NUMBER(10,0),
    CONSTRAINT RECURSO_PK PRIMARY KEY (RECURSO_ID),
    CONSTRAINT RECURSO_RECURSO_NUEVO_FK 
    FOREIGN KEY (RECURSO_NUEVO)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT RECURSO_BIBLIOTECA_ID_FK 
    FOREIGN KEY (BIBLIOTECA_ID)
    REFERENCES BIBLIOTECA(BIBLIOTECA_ID),
    CONSTRAINT RECURSO_STATUS_ID_FK 
    FOREIGN KEY (STATUS_RECURSO_ID)
    REFERENCES STATUS_RECURSO(STATUS_RECURSO_ID),
    CONSTRAINT RECURSO_AREA_CON_ID_FK 
    FOREIGN KEY (area_conocimiento_id)
    REFERENCES AREA_CONOCIMIENTO(area_conocimiento_id)
)
tablespace recurso_ts,
PARTITION BY HASH(TIPO_RECURSO)
       (PARTITION recurso_p1 TABLESPACE recurso_ts, PARTITION recurso_p2 TABLESPACE recurso_ts,
        PARTITION recurso_p3 TABLESPACE recurso_ts)
;



-- 
-- TABLE: HISTORICO_RECURSO 
--

CREATE TABLE HISTORICO_RECURSO(
    HISTORICO_ID         NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS         DATE             NOT NULL,
    STATUS_RECURSO_ID    NUMBER(1, 0)     NOT NULL,
    RECURSO_ID           NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HISTORICO_RECURSO_PK PRIMARY KEY (HISTORICO_ID),
    CONSTRAINT HISTORICO_REC_STATUS_ID_FK FOREIGN KEY (STATUS_RECURSO_ID)
    REFERENCES STATUS_RECURSO(STATUS_RECURSO_ID),
    CONSTRAINT HISTORICO_REC_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID)
)
tablespace entidades_tb
;


-- 
-- TABLE: PDF_LIBRO 
--

CREATE TABLE PDF_LIBRO(
    LIBRO_PDF_ID    NUMBER(10,0)    NOT NULL,
    FOTO            blob         NOT NULL,
    CONSTRAINT PDF_LIBRO_PK PRIMARY KEY (LIBRO_PDF_ID)
)
tablespace libropdf_tb
;

-- 
-- TABLE: LIBRO 
--

CREATE TABLE LIBRO(
    RECURSO_ID      NUMBER(10, 0)    NOT NULL,
    ISBN            VARCHAR2(40)     NOT NULL,
    EDITORIAL_ID    NUMBER(10, 0)    NOT NULL,
    LIBRO_PDF_ID    number(10,0)     NOT NULL,
    CONSTRAINT LIBRO_PK PRIMARY KEY (RECURSO_ID),
    CONSTRAINT LIBRO_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT LIBRO_EDITORIAL_ID_FK 
    FOREIGN KEY (EDITORIAL_ID)
    REFERENCES EDITORIAL(EDITORIAL_ID),
    CONSTRAINT LIBRO_PDF_FK 
    FOREIGN KEY (LIBRO_PDF_ID)
    REFERENCES PDF_LIBRO(LIBRO_PDF_ID)
)
tablespace entidades_tb
;




-- 
-- TABLE: LIBRO_AUTOR 
--

CREATE TABLE LIBRO_AUTOR(
    LIBRO_AUTOR_ID    NUMBER(10,0)     NOT NULL,
    RECURSO_ID        NUMBER(10,0)    NOT NULL,
    AUTOR_ID          NUMBER(10,0)     NOT NULL,
    CONSTRAINT LIBRO_AUTOR_PK PRIMARY KEY (LIBRO_AUTOR_ID),
    CONSTRAINT LIBRO_AUTOR_RECURSO_ID_FK 
    FOREIGN KEY (RECURSO_ID)
    REFERENCES LIBRO(RECURSO_ID),
    CONSTRAINT LIBRO_AUTOR_AUTOR_ID_FK 
    FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID)
)
tablespace entidades_tb
;



-- 
-- TABLE: MULTA 
--

CREATE TABLE MULTA(
    MULTA_ID    NUMBER(1,0)     NOT NULL,
    CONCEPTO    VARCHAR2(40)     NOT NULL,
    MONTO       NUMBER(3, 0)    NOT NULL,
    CONSTRAINT MULTA_PK PRIMARY KEY (MULTA_ID)
)
tablespace entidades_tb
;



-- 
-- TABLE: PALABRA_CLAVE 
--

CREATE TABLE PALABRA_CLAVE(
    PALABRA_CLAVE_ID    NUMBER(10,0)    NOT NULL,
    PALABRA             VARCHAR2(20)    NOT NULL,
    CONSTRAINT PALABRA_CLAVE_PK PRIMARY KEY (PALABRA_CLAVE_ID)
)
tablespace entidades_tb
;



-- 
-- TABLE: PALABRA_CLAVE_RECURSO 
--

CREATE TABLE PALABRA_CLAVE_RECURSO(
    PALABRA_CLAVE_RECURSO_ID    NUMBER(10,0)     NOT NULL,
    RECURSO_ID                  NUMBER(10,0)    NOT NULL,
    PALABRA_CLAVE_ID            NUMBER(10,0)     NOT NULL,
    CONSTRAINT PALABRA_CLAVE_RECURSO_PK PRIMARY KEY (PALABRA_CLAVE_RECURSO_ID),
    CONSTRAINT PALABRA_CLAVE_RECURSO_ID_FK 
    FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID),
    CONSTRAINT PALABRA_CLAVE_PALABRA_ID_FK 
    FOREIGN KEY (PALABRA_CLAVE_ID)
    REFERENCES PALABRA_CLAVE(PALABRA_CLAVE_ID)
)
tablespace entidades_tb
;





-- 
-- TABLE: USUARIO 
--

CREATE TABLE USUARIO(
    USUARIO_ID              NUMBER(10, 0)     NOT NULL,
    NOMBRE                  VARCHAR2(40)     NOT NULL,
    APELLIDO_PATERNO        VARCHAR2(40)     NOT NULL,
    APELLIDO_MATERNO        VARCHAR2(40)     NOT NULL,
    NUM_MATRICULA           NUMBER(38, 0)    NOT NULL,
    NUM_SEMESTRE            NUMBER(2, 0),
    USERNAME                VARCHAR2(40)     NOT NULL,
    PASSWORD                VARCHAR2(40)     NOT NULL,
    CON_PRESTAMO            NUMBER(1, 0)     NOT NULL,
    CON_PRESTAMO_VENCIDO    NUMBER(1, 0)     NOT NULL,
    FOTO_ID                 NUMBER(10, 0)     NOT NULL,
    CONSTRAINT USUARIO_PK PRIMARY KEY (USUARIO_ID),
    CONSTRAINT USUARIO_FOTO_ID_FK 
    FOREIGN KEY (FOTO_ID)
    REFERENCES FOTO_USUARIOS(FOTO_ID)
)
tablespace entidades_tb
;



-- 
-- TABLE: PRESTAMO 
--

CREATE TABLE PRESTAMO(
    PRESTAMO_ID        NUMBER(10,0)    NOT NULL,
    NUMERO_PRESTAMO    NUMBER(10,0)    NOT NULL,
    USUARIO_ID         NUMBER(10,0)     NOT NULL,
    FECHA_PRESTAMO     DATE             NOT NULL,
    FECHA_ENTREGA      DATE             NOT NULL,
    MULTA_ID           NUMBER(1,0),
    CONSTRAINT PRESTAMO_PK PRIMARY KEY (PRESTAMO_ID),
    CONSTRAINT PRESTAMO_USUARIO_ID_FK 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID),
    CONSTRAINT PRESTAMO_MULTA_ID_FK 
    FOREIGN KEY (MULTA_ID)
    REFERENCES MULTA(MULTA_ID)
)
tablespace entidades_tb
;


-- 
-- TABLE: RECURSO_PRESTAMO 
--

CREATE TABLE RECURSO_PRESTAMO(
    PRESTAMO_ID    NUMBER(10, 0)    NOT NULL,
    RECURSO_ID     NUMBER(10, 0)    NOT NULL,
    RECURSO_PRESTAMO_ID NUMBER(10, 0) NOT NULL,
    CONSTRAINT RECURSO_PRESTAMO_PK PRIMARY KEY(RECURSO_PRESTAMO_ID),
    CONSTRAINT RECURSO_PRESTAMO_ID_FK 
    FOREIGN KEY (PRESTAMO_ID)
    REFERENCES PRESTAMO(PRESTAMO_ID),
    CONSTRAINT RECURSO_PRESTAMO_RECURSO_ID_FK 
    FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID)
)
tablespace entidades_tb
;



-- 
-- TABLE: REVISTA 
--

CREATE TABLE REVISTA(
    RECURSO_ID           NUMBER(10, 0)    NOT NULL,
    SINOPSIS             VARCHAR2(40)     NOT NULL,
    PUBLICACION          TIMESTAMP(6)     NOT NULL,
    EMPRESA_EDITORIAL    VARCHAR2(10)     NOT NULL,
    NUM_EMISION          NUMBER(38, 0)    NOT NULL,
    CONSTRAINT REVISTA_PK PRIMARY KEY (RECURSO_ID),
    CONSTRAINT REVISTA_RECURSO_ID_FK 
    FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID)
)
tablespace entidades_tb
;

-- 
-- TABLE: TESIS_PDF 
--

CREATE TABLE TESIS_PDF(
    TESIS_PDF_ID    NUMBER(10, 0)    NOT NULL,
    PDF             blob          NOT NULL,
    CONSTRAINT TESIS_PDF_PK PRIMARY KEY (TESIS_PDF_ID)
)
tablespace tesispdf_tb
;


-- 
-- TABLE: TESIS 
--

CREATE TABLE TESIS(
    RECURSO_ID            NUMBER(10, 0)    NOT NULL,
    NOMBRE_TESISTA        VARCHAR2(40)     NOT NULL,
    CARRERA               VARCHAR2(40)     NOT NULL,
    NOMBRE_UNIVERSIDAD    VARCHAR2(40)     NOT NULL,
    FECHA                 DATE             NOT NULL,
    TESIS_PDF_ID          NUMBER(10, 0),
    CONSTRAINT TESIS_PK PRIMARY KEY (RECURSO_ID),
    CONSTRAINT TESIS_PDF_ID_FK FOREIGN KEY (TESIS_PDF_ID)
    REFERENCES TESIS_PDF(TESIS_PDF_ID),
    CONSTRAINT TESIS_RECURSO_ID_FK FOREIGN KEY (RECURSO_ID)
    REFERENCES RECURSO(RECURSO_ID)
)
tablespace entidades_tb;