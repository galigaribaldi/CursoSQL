## Ejercicios

- Genere una consulta que muestre el número de días que le quedan al año.

  

- Genere una consulta que muestre la fecha actual con el siguiente formato: *Hoy es viernes  10 de noviembre del 2017*. Referencias de [formato](https://docs.oracle.com/database/121/SQLRF/sql_elements004.htm#SQLRF00210).

  

- Mostrar la programación de horarios existente (dia_semana, hora_inicio, hora_fin) para los días lunes (1) y miércoles (3).

  - **Se obtienen 8 registros**

    

- Mostrar toda la información del plan de estudios vigente. El plan de estudios vigente es aquel cuya fecha fin de vigencia no ha sido especificada.

  - **Se obtiene 1 registro**

    

- Genere una consulta SQL que calcule la edad en años del profesor FELIPE LIMA RODRIGUEZ. La cadena "Edad Profesor" se debe mostrar tal cual, en minúsculas y mayúsculas.

  - **Se obtiene 67 años**

    

- Se requiere un listado de todos los apellidos paternos existentes de los profesores para verificar el tamaño de espacio requerido para su credencial. Generar un reporte que muestre únicamente los apellidos paternos de los profesores eliminando duplicados.

  - **Se obtienen 22 registros**

    

- Mostrar el nombre, RFC y fecha de nacimiento de todos aquellos profesores que hayan nacido en los siguientes rangos:

  ​	a. Entre los años 1950 y 1955

  ​	b. Entre los años 1960 y 1965

  Observar que pasa con el registro que tiene id = 25

  - **Se obtienen 10 registros**

    

- Cada semestre, la universidad realiza un sorteo para obtener a los profesores que aplicarán encuestas. En está ocasión, todas las condiciones que debe cumplir un profesor para que sea seleccionado son:

  ​	a. El profesor nació posterior al año 1970

  ​	b. El nombre del profesor deber ser JUAN, o LUISA o LENIN

  ​	c. El apellido paterno debe iniciar en R.

  Empleando alguno de los operadores del álgebra relacional, determine nombre, apellidos y edad en años de los profesores que deben aplicar encuestas.
  -  **Se obtiene 1 registro**

    

- Suponga que la universidad desea cancelar a todos aquellos cursos que tengan un cupo máximo de 30 estudiantes excepto aquellos cursos que tengan clave 001. Empleando operadores del álgebra relacional, generar una sentencia SQL que obtenga el identificador del curso y la clave de los cursos que se eliminarán.

  - **Se obtienen 11 registros**

    

- Para el próximo semestre, la universidad tiene planeado reducir el número de cursos para las asignaturas que cumplan con las siguientes reglas: La asignatura debe pertenecer a los planes de estudios con id 1 o 2, aunque, si existen materias con 9 o más créditos, estas no se considera. Emplear alguno de los operadores relacionales determine el id de la asignatura, el nombre, su plan de estudios y el número de créditos.

  - **Se obtienen 9 registros**

    