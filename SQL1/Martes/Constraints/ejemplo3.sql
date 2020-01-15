#Por tabla.
create table venta(venta_id numeric(10,0) not null, 
	fecha_venta date not null, 
	tipo_venta char(3), 
	constraint venta_pk primary key(venta_id), 
	constraint ve_tipo_venta_chk check(tipo_venta in('MA','EL')) );