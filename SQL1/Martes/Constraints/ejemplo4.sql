create table orden_venta( orden_id numeric(10,1) not null, 
	venta_id numeric(10,0) not null, 
	constraint orden_venta_pk primary key(orden_id), 
	constraint venta_ov_venta_id_fk foreign key(venta_id) references venta(venta_id) );