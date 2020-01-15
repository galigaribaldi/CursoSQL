create table direccion( direccion_id number(10,0) not null constraint direccion_pk primary key, 
	calle varchar(100) not null ); 

create table cliente( cliente_id number(10,0) not null constraint cliente_pk primary key, 
	nombre varchar(100) not null, 
	direccion_id not null constraint direccion_id_fk references direccion(direccion_id) on delete cascade );

/*Al intentar eliminar un registro de la tabla direccion (tabla padre), se eliminan también sus registros referenciados en cliente (tabla hija).*/
insert into direccion (direccion_id,calle) values(1,'avenida central'); 

insert into cliente (cliente_id,nombre,direccion_id) values(1,'juan',1); 

delete from direccion where direccion_id=1;