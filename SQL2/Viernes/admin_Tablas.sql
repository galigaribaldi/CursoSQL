create table empleado(
 empleado_id number(10,0) constraint empleado_pk primary key,
 curp varchar2(18) not null constraint empleado_curp_uk unique,
 foto blob null
)
segment creation deferred
partition by range (empleado_id) (
 partition empleado_p1 values less than (1000),
 partition empleado_p2 values less than (maxvalue)
);
---No se encontraron registros para la tabla
select table_name, segment_created
from user_tables
where table_name='EMPLEADO';

---Ver particuones
SELECT table_name, segment_created, partition_name
FROM user_tab_partitions
where table_name='EMPLEADO';
----Insertando REgistros
insert into empleado values(1,'C1',empty_blob());
insert into empleado values(2000,'C2',empty_blob());
----Realizando nuevas consutlas
select segment_name,partition_name,segment_type,segment_subtype,
 tablespace_name,extents,blocks
from user_segments;

--Creación de una tabla con columnas virtuales, invisibles, cifrado, almacenada en un tablespace
--diferente al default, y con un espacio inicial de almacenamiento:
create table admin_emp (
    empno number(5) primary key,
    ename varchar2(15) not null,
    ssn number(9) encrypt using 'aes256',
    job varchar2(10),
    mgr number(5),
    hiredate date default (sysdate),
    photo blob,
    sal number(7,2),
    hrly_rate number(7,2) generated always as (sal/2080),
    comm number(7,2),
    deptno number(3) not null
    constraint admin_dept_fkey references hr.departments
    (department_id),
    comments varchar2(32767),
    status varchar2(10) invisible)
    tablespace admin_tbs
    storage ( initial 50k);