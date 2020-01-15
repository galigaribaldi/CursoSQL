/*Tipo: por columna*/
create table concepto_pago (concepto_id numeric(10, 0) constraint concepto_pago_pk primary key, 
	tipo_concepto char(1) not null constraint cp_tipo_concepto_chk check ( tipo_concepto in ('A', 'B', 'C')), /*No se puede agregar otro constraint en el mismo campo*/
	clave varchar2(3) not null constraint cp_clave_uk unique, descripcion varchar2(255), 
	importe numeric(8, 2) not null constraint cp_importe_chk check ( importe < 100000) /*El importe no debe ser mayor a 100000*/
);

