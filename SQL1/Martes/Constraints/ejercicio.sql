/*Ejercicio profesor asignatura*/

create table profesor (
profesor_id number(10,0) not null,
rfc varchar2(20),
constraint profesor_pk primary key  (profesor_id),
constraint rfc_uk unique (rfc)
);

create table asignatura(
asignatura_id number (10,0) not null,
clave number (10,0) not null,
constraint asignatura_pk primary key (asignatura_id),
constraint clave_uk unique (clave)
);

create table profe_asig(
profesor_id number (10,0) not null,
asignatura_id number(10,0) not null,
constraint profe_asig_pk primary key (profesor_id, asignatura_id), /*Esto no lo podríamos hacer en column constraint*/
constraint profe_asig_profesor_id_fk foreign key (profesor_id) references profesor(profesor_id),
constraint profe_asig_asignatura_id_fk foreign key (asignatura_id) references asignatura(asignatura_id)
);
















);






