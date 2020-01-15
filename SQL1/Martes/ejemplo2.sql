/*Por columna*/
create table quincena( quincena_id number(10,0) constraint quincena_pk primary key, 
	numero_quincena number(2,0) not null, 
	fecha_inicio date not null, 
	fecha_fin date not null ); 

create table nomina( nomina_id number(10,0) constraint nomina_pk primary key, 
	fecha_creacion date not null, 
	quincena_id not null constraint quincena_id_fk references quincena(quincena_id) 
	);