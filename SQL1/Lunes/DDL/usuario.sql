whenever sqlerror exit rollback;

prompt Mostrando usuario
show user;
prompt Creando nuevo usuario

CREATE user gali identified BY 12345
    default tablespace SYSTEM 
    quota 100M ON SYSTEM;

---Otorgando permisos
GRANT ALL PRIVILEGES TO gali;
GRANT EXECUTE ANY PROCEDURE TO gali;

---Conectandose por el usuario gali
connect gali / 12345

prompt Mostrando usuario
commit;
--borrar usuario
--- drop user gali cascade;