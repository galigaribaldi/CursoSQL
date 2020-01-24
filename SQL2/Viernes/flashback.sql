--Uso de flashback drop y la papelera de reciclaje.
--Al proceso de recuperación de una tabla de la papelera de reciclaje se le conoce como flashback drop.
--En realidad, la papelera de reciclaje es una tabla del diccionario de datos que contiene información de los objetos eliminados.
-- Por lo anterior, los objetos eliminados siguen ocupando espacio.
-- Cualquier usuario puede visualizar a los objetos eliminados en su papelera de reciclaje.
create table test(
    id number(9)
    );
drop table test;

select object_name,original_name,operation,type,ts_name,
 createtime,droptime,space
from recyclebin;

-- Si se desea habilitar o desabilitar
alter session set recyclebin = on;
alter system set recyclebin = on scope = spfile;
-- Mostrando datos de la papelera. Los siguientes ejemplos permiten explorar la papelera:
select object_name, original_name from dba_recyclebin
where owner = 'hr';
select * from "BIN$YRMKLZAVMHFGNAGAIMENRA==$0";

-- Purgando la papelera. Las siguientes instrucciones pueden ser empleadas para vaciar la papelera
-- Elimina una tabla de la papelera
purge table "BIN$jsleilx392mk2=293$0";
purge table int_admin_emp;
-- Elimina a los objetos encontrados en la papelera que pertenecen al tablespace example.
purge tablespace example;
-- Elimina a los objetos encontrados en la papelera que pertenecen al tablespace example y al
purge tablespace example user oe;

-- Cualquier usuario puede vaciar su papelera empleando:
purge recyclebin;

-- Restaurando tablas de la papelera: 
-- Se emplea la sentencia flashback table .. to before drop
-- Es posible emplear el nombre del objeto en la papelera, o el nombre original.
-- La cláusula rename to permite asignarle un nuevo nombre al recuperarla.
flashback table my_original_table to before drop rename to int2_admin_emp;
flashback table "BIN$yrMKlZaVMhfgNAgAIMenRA==$0" to before drop;