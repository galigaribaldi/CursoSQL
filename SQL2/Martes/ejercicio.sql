------------------------ SQL 2 21/enero/2020 Tema -> Triggers

-- Ejemplo #3 Triggers: Generar un trigger para validar que no se exceda el cupo máximo de un curso cuando se trate de inscribir a un nuevo estudiante
-- Tablas involucradas ESTUDIANTE_INSCRITO y CURSO


CREATE OR REPLACE TRIGGER tg_revisa_cupo
BEFORE
INSERT ON ESTUDIANTE_INSCRITO

--- :OLD y :NEW solo se pueden usar en triggers de tipo FOR EACH ROW
FOR EACH ROW

DECLARE
    -- Variable que almacena el numero de alumnos ya inscritos en el curso
    v_numins NUMBER;
    -- Variable que almacena el cupo maximo del curso que se desea inscribir
    v_cupomax NUMBER;

BEGIN
    -- Contando los alumnos que estan inscritos en el curso con el id de curso que se quiere insertar
    SELECT COUNT(*) INTO v_numins FROM 
    ESTUDIANTE_INSCRITO WHERE CURSO_ID = :new.CURSO_ID;

    -- Obteniendo el cupo maximo en el curso con el id de curso que se quiere insertar mediante una consulta 
    SELECT CUPO_MAXIMO INTO v_cupomax FROM
    CURSO WHERE CURSO_ID = :new.CURSO_ID;

    -- Se válida que no se haya excedido el cupo
    IF v_cupomax - v_numins > 0
    THEN
        -- Si no se excedio, se inserta el nuevo registro
        INSERT INTO ESTUDIANTE_INSCRITO(ESTUDIANTE_INSCRITO_ID,CURSO_ID,ESTUDIANTE_ID,CALIFICACION) VALUES (:new.ESTUDIANTE_INSCRITO_ID,:new.CURSO_ID,:new.ESTUDIANTE_ID,:new.CALIFICACION);
    ELSE
        -- Si se excedio, se lanza un error
        RAISE_APPLICATION_ERROR(-20010,'No es posible inscribir al alumno ya que se ha alcanzado el cupo maximo');
        -- Esta línea ya no es alcanzada por lo que se puede omitir
        dbms_output.put_line('No es posible inscribir al alumno ya que se ha alcanzado el cupo maximo');
    END IF;
END;