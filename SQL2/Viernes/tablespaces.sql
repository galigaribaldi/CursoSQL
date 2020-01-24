--@Autors: Cabrera Garibaldi Hernan Galileo
--@Autors: Medel Sánchez Berenice
--@Fecha: 02/Diciembre/2019
--@Descricpion: Script el cual crea los TableSpaces Necesarios para la base

--Creación de TableSpaces

--TableSpace para libro en PDF
--Se recomienda el uso de adminsitración automatica
prompt Creacion del tableSpace para el PDF del libro
CREATE TABLESPACE libropdf_tb
datafile '/u01/app/oracle/oradata/GAMESBD3/libropdf_tb.dbf' size 100m
extent management local autoallocate
segment space management auto;

--Tablespace para PDF tesis
prompt Creacion del tableSpace para el PDF de la tesis
CREATE TABLESPACE tesispdf_tb
datafile '/u01/app/oracle/oradata/GAMESBD3/tesispdf_tb.dbf' size 100m
extent management local autoallocate
segment space management auto;

--TableSpace para Foto de usuarios
prompt Creacion del tableSpace para el PDF de la foto de usuarios
CREATE TABLESPACE foto_usuarios_tb
datafile '/u01/app/oracle/oradata/GAMESBD3/tesis_tb.dbf' size 400m
extent management local autoallocate
segment space management auto;

-----------Table Spaces Asginados a las tablas que se cree crecerán mas debido a la información que conlleva
prompt Creacion del TableSpace correspondiente a Resgistro
CREATE TABLESPACE recurso_ts
datafile '/u01/app/oracle/oradata/GAMESBD3/registro_tb.dbf' size 400m
extent management local autoallocate
segment space management auto;

--Tablespace correspondiente a los usuarios
prompt Creacion del TableSpace correspondiente a Usuario
CREATE TABLESPACE entidades_tb
datafile '/u01/app/oracle/oradata/GAMESBD3/entidades_tb.dbf' size 400m
extent management local autoallocate
segment space management auto;


--Tablespace correspondiente a los Indices
prompt Creacion del Tablespace correspondiente a Indices
CREATE TABLESPACE indices_ts
datafile '/u01/app/oracle/oradata/GAMESBD3/index_tb.dbf' size 400m
extent management local autoallocate
segment space management auto;