

Prompt Ejercicios triggers
Prompt proporcionar password del usuario sys
connect sys as sysdba

Prompt Creando un nuevo usuario Tema 10
Prompt Proporcione usuario y password

create user &&usuario identified by &&password quota unlimited on users;    
grant create session, create table, create sequence to &usuario;

Prompt nuevos privilegios para crear procedimientos, triggers
grant create trigger, create procedure to &&usuario;

connect &usuario/&password

Prompt Creando objetos
@s-02-ejercicios-tema10-ddl.sql

Prompt cargando datos
@s-03-ejercicios-tema10-carga.sql

Prompt Listo!

