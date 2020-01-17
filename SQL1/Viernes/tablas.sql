create table puesto(
    puesto_id number(10,0) not null,
    clave_puesto varchar2(10) not null,
    funcion_principal varchar2(255) not null,
    sueldo_tabulador number(8, 2) not null,
    constraint puesto_pk primary key (puesto_id)
);

create table conyuge(
    conyuge_id number(10, 0) not null,
    nombre varchar2(40) not null,
    apellido_paterno varchar2(40) not null,
    apellido_materno varchar2(40),
    constraint conyuge_pk primary key (conyuge_id)
);

create table empleado(
    empleado_id number(10, 0) not null,
    nombre varchar2(40) not null,
    apellido_paterno varchar2(40) not null,
    apellido_materno varchar2(40),
    fecha_nacimiento date not null,
    conyuge_empleado_id number(10, 0),
    jefe_inmediato number(10, 0),
    conyuge_id number(10, 0),
    puesto_id number(10, 0) not null,
    constraint empleado_pk primary key (empleado_id),
    constraint jefe_inmemdiado_fk foreign key (jefe_inmediato)
    references empleado(empleado_id),
    constraint conyuge_emp_fk foreign key (conyuge_empleado_id)
    references empleado(empleado_id),
    constraint conyuge_fk foreign key (conyuge_id)
    references conyuge(conyuge_id),
    constraint puesto_fk foreign key (puesto_id)
    references puesto(puesto_id)
);

insert into puesto
(puesto_id,clave_puesto,funcion_principal,sueldo_tabulador)
values (1,'dg','direccion de sistemas',80000);

insert into empleado (empleado_id,nombre,apellido_paterno,
apellido_materno,fecha_nacimiento, puesto_id)
values (1,'juan','martinez','lopez',
to_date('1980/01/10 10:40:00','yyyy/mm/dd hh24:mi:ss'),1);