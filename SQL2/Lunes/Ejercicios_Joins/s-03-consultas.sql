--Ejercicio 2.1 (Se obtienen 3 registros)

create table consulta_1 as
    select a.NOMBRE, CLAVE_ARTICULO, sa.CLAVE
        from ARTICULO a, ARTICULO_FAMOSO af,STATUS_ARTICULO sa
            where a.ARTICULO_ID = af.ARTICULO_ID
            and a.STATUS_ARTICULO_ID = sa.STATUS_ARTICULO_ID 
            and af.NOMBRE_COMPLETO = 'William Harvey';

select * from consulta_1;

--Ejercicio 2.2 (2 registros)
create table consulta_2 as
    select ARTICULO_ID,NOMBRE,CLAVE_ARTICULO 
        from ARTICULO a
        join STATUS_ARTICULO s using(STATUS_ARTICULO_ID)
        join ARTICULO_DONADO d using(ARTICULO_ID)
        join pais p using(PAIS_ID)
            WHERE s.CLAVE = 'ENTREGADO' 
            and p.DESCRIPCION = 'BELGICA';

select * from consulta_2;

--Ejercicio 2,5 SI CORRE (Se Obtienen 10 registros)
create table consulta_5 as
    select a.ARTICULO_ID,a.NOMBRE, a.CLAVE_ARTICULO,a.TIPO_ARTICULO,ar.ANIO_HALLAZGO,a.PRECIO_INICIAL,sv.PRECIO_VENTA
        from ARTICULO a 
        join ARTICULO_ARQUEOLOGICO ar ON a.ARTICULO_ID =ar.ARTICULO_ID
            left join SUBASTA_VENTA sv ON a.ARTICULO_ID =sv.ARTICULO_ID
    where a.PRECIO_INICIAL >= 800000;

select * from consulta_5;

--Ejercicio 2.7  SI CORRE (Se obtienen 6 registros)
create table consulta_7 as
    select a.ARTICULO_ID,a.NOMBRE,a.CLAVE_ARTICULO,a.PRECIO_INICIAL,s.STATUS_ARTICULO_ID
        from ARTICULO a 
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
        where a.PRECIO_INICIAL >= 900000
    minus
    select a.ARTICULO_ID,a.NOMBRE,a.CLAVE_ARTICULO,a.PRECIO_INICIAL,s.STATUS_ARTICULO_ID
        from ARTICULO a 
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
        where s.CLAVE = 'EN SUBASTA' and a.PRECIO_INICIAL >= 900000
    minus
    select a.ARTICULO_ID,a.NOMBRE,a.CLAVE_ARTICULO,a.PRECIO_INICIAL,s.STATUS_ARTICULO_ID
        from ARTICULO a 
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
        where s.CLAVE = 'ENTREGADO' and a.PRECIO_INICIAL >= 900000
    minus
    select a.ARTICULO_ID,a.NOMBRE,a.CLAVE_ARTICULO,a.PRECIO_INICIAL,s.STATUS_ARTICULO_ID
        from ARTICULO a 
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
        where s.CLAVE = 'VENDIDO' and a.PRECIO_INICIAL >= 900000;

select * from consulta_7;

--Ejercicio 2.8 -- SI CORRE (7 Registros)
create table consulta_8 as
    select a.ARTICULO_ID,a.CLAVE_ARTICULO,a.NOMBRE,s.STATUS_ARTICULO_ID,ANIO_HALLAZGO,
        (to_char(sysdate, 'YYYY')-ar.ANIO_HALLAZGO) as "ANTIGUEDAD"
        from ARTICULO a 
        join ARTICULO_ARQUEOLOGICO ar ON a.ARTICULO_ID = ar.ARTICULO_ID
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
        where ANIO_HALLAZGO < 1865 and s.CLAVE='REGISTRADO';

select * from consulta_8;

--Ejercicio 2.8 -- SI CORRE
create table consulta_8 as
    select a.ARTICULO_ID,a.CLAVE_ARTICULO,a.NOMBRE,s.STATUS_ARTICULO_ID,ANIO_HALLAZGO,
        (to_char(sysdate, 'YYYY')-ar.ANIO_HALLAZGO) as "ANTIGUEDAD"
        from ARTICULO a 
        join ARTICULO_ARQUEOLOGICO ar ON a.ARTICULO_ID = ar.ARTICULO_ID
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
    where ANIO_HALLAZGO < 1865 and s.CLAVE='REGISTRADO';

select * from consulta_8;


--Ejercicio 2.9 SI CORRE
create table consulta_9 as
    select a.NOMBRE, a.TIPO_ARTICULO
        from ARTICULO a
        join STATUS_ARTICULO s ON a.STATUS_ARTICULO_ID = s.STATUS_ARTICULO_ID
        where s.CLAVE='EN SUBASTA' 
            and (a.DESCRIPCION like '%Colonial%'
            or a.NOMBRE like '%Colonial%');

select * from consulta_9;