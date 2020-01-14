--@Autor(es):       PROTECO
--@Fecha creación:  
--@Descripción:     Script principal

-- Inicializar la variable de ambiente NLS_LANG
-- antes de ejecutar este script para que los
-- caracteres como ñ, acentos se vean bien
-- ejecutar: export NLS_LANG=American_America.UTF8


--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit;

undefine usuario
undefine password

Prompt Proporcione el Password del usuario  SYS
connect sys as sysdba

Prompt Creando un nuevo usuario Tema 9
Prompt Proporcione usuario y password

create user &&usuario identified by &&password quota unlimited on users;    
grant create session, create table, create sequence to &usuario;

connect &usuario/&password

Prompt Creando objetos
@dql-02-ddl.sql

Prompt Carga de datos
@dql-03-carga.sql


Prompt  Configuracion creada con exito.
Prompt  Continuar con los ejercicios del tema.
show user

