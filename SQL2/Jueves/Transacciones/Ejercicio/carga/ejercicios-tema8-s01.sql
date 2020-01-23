
--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit;

undefine usuario
undefine password

Prompt Proporcione el Password del usuario  SYS
connect sys as sysdba

Prompt Creando un nuevo usuario
Prompt Proporcione usuario y password

create user &&usuario identified by &&password quota unlimited on users;    
grant create session, create table, create sequence to &usuario;

connect &usuario/&password

create sequence seq_dvd
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

create sequence seq_cliente
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

create table cliente_import(
    cliente_id          number(10, 0)    not null,
    nombre              varchar2(40)     not null,
    ap_paterno          varchar2(40)     not null,
    ap_materno          varchar2(40),
    email               varchar2(40)     not null,
    fecha_nacimiento    date             not null,
    constraint cliente_import_pk primary key (cliente_id)
);

create table dvd(
    dvd_id             number(10, 0)    not null,
    titulo             varchar2(40)     not null,
    precio             number(6, 2)     not null,
    tipo               char(1)          not null,
    fecha_recepcion    date             not null,
    fecha_registro     date default sysdate,
    constraint dvd_pk primary key (dvd_id)
);

create table musical(
    dvd_id     number(10, 0)    not null,
    artista    varchar2(40)     not null,
    constraint musical_pk primary key (dvd_id), 
    constraint musical_dvd_fk foreign key (dvd_id)
    references dvd(dvd_id)
);

create table pelicula(
    dvd_id      number(10, 0)    not null,
    sinopsis    varchar2(40)     not null,
    constraint pelicula_pk primary key (dvd_id), 
    constraint pelicula_dvd_fk foreign key (dvd_id)
    references dvd(dvd_id)
);


INSERT INTO cliente_import (cliente_id,nombre, ap_paterno, ap_materno, email, fecha_nacimiento) VALUES (seq_cliente.nextval,'DONOVAN', 'CASTANEDA', null, 'Donov.CASTAN3606@live.com', to_date('1942-06-22', 'YYYY-MM-DD'));
INSERT INTO cliente_import (cliente_id,nombre, ap_paterno, ap_materno, email, fecha_nacimiento) VALUES (seq_cliente.nextval,'JANIYAH', 'MCCRAY', 'MCCRAY', 'Jan.MCC9414@live.com', to_date('1914-07-10', 'YYYY-MM-DD'));
INSERT INTO cliente_import (cliente_id,nombre, ap_paterno, ap_materno, email, fecha_nacimiento) VALUES (seq_cliente.nextval,'issac', 'BLEVINS', 'BLEVINS', 'Is.BLEVIN2632@gmail.com', to_date('2011-05-16', 'YYYY-MM-DD'));
INSERT INTO cliente_import (cliente_id,nombre, ap_paterno, ap_materno, email, fecha_nacimiento) VALUES (seq_cliente.nextval,'THEODORE', 'ANTHONY', 'ANTHONY', 'Theodor.ANTHON6698@mail2web.com', to_date('1965-07-31', 'YYYY-MM-DD'));
INSERT INTO cliente_import (cliente_id,nombre, ap_paterno, ap_materno, email, fecha_nacimiento) VALUES (seq_cliente.nextval,'ayden', 'PAYNE', 'PAYNE', 'Ayd.PAYNE3872@gmail.com', to_date('2011-08-21', 'YYYY-MM-DD'));

commit;

Prompt  Configuracion creada con exito.
Prompt  Continuar con los ejercicios del tema.
show user

