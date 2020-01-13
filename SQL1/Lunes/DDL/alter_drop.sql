create table puesto (
  puesto_id number(3,0) PRIMARY KEY,
  clave varchar2(10),
  nombre varchar2(50)
);

create table empleado (
  empleado_id number(10,0),
  fecha_inicial date,
  rfc varchar2(13)
);

create table empleado2 (
  puesto_id number(10,0) constraint puesto_pk references puesto(puesto_id),
  fecha_inicial date,
  rfc varchar2(13)
);
---Ejemplo: Agregar columnas:---
alter table empleado add (comision number(4,2));
---Ejemplo: Modificar columnas:---
alter table empleado modify (comision number(10,2) default 0.05);
---Ejemplo: Eliminar columnas.---
alter table empleado drop column comision;

--Ejemplo: Renombrar columnas--
alter table empleado rename column fecha_inicial to fecha_contrato;

--Ejemplo: Renombrar una tabla--
alter table empleado rename to trabajador;
--Ejemplo: Renombrar una tabla--
alter table empleado rename to trabajador;
--Ejemplo: Eliminar una tabla--
drop table puesto; -- ¿por qué Oracle marca error?: Por existir dependencias.
--Ejemplo: Eliminar una tabla y sus referencias.--
drop table puesto cascade constraints;
--Ejemplo: Eliminar una tabla sin posibilidad de recuperar posteriormente.--
drop table trabajador purge;