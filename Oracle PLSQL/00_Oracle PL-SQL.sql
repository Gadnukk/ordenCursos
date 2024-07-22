--ORACLE PL-SQL

*Estructura en Bloques
*Estructuras de CONTROL
*Soporte para Programacion Orientada a Objetos
*Soporta tipo de datos SQL, reduce la necesidad de convertir los datos al  pasar a otra aplicacion
*Tipos de datos SQL: %TYPE , %ROWTYPE declaracion de variable basado en el tipo de columnas de la tabla


--ESTRUCTURA

*Se compone de 3 parte
 [DECLARE] (Opcional)
 --declarations
 [BEGIN] (Mandatorio)
 --statements
 [EXCEPTION] (Opcional)
 --handlers
 [END] (Mandatorio)


--DECLARE
v_variable DataType; (:= valor; [NOT NULL] :=valor)
v_constant CONSTANT DataType := valor;

*Se asignan valores a una variable de dos formas.
 v_variable := valor
 Select valor into v_variable from table

--Alcance y visibilidad
*Se pueden crear mas DECLARE cuyas variables tendran alcance a sus BEGIN END correspondientes
*Locales al bloque y globales a los subbloques

--Delimitadores
*Simbolos con significado especial en PL-SQL
.
,
;
@ Indicador de acceso remoto. Se utiliza para referenciar a otra table que se encuentra en otro lugar. Contamos con DBLINK
% Indicador de atributo
** Indicador de exponenciacion
<< Comienzo de un rotulo

--Bloque local/anonimo y un procedure


*ANONIMOS (Pueden ser construidos para ser ejecutados en Procesos Batch, ejecutados desde SQLPlus, tambien
pueden ser alojados en aplicacion como FORMS,REPORTS,APEX en las cuales se hacen las ejecuciones)
Orden de ejecucion:
Desde la aplicacion se envía el contenido completo del bloque al motor de BD
El motor compila y luego ejecuta.
Finalmente envia a la aplicacion el resultado de la compilacion, con un mensaje de compilacion
correcta o de error en este ultimo caso no se ejecutara.


*PROCEDURE
Este a diferencia del anonimo, se compila la primera vez que se crea y se almacena en la base de datos.
Se ejecuta mediante llamadas y de corresponder el paso de argumentos.

*FUNCTION


--Comandos y Paquetes

El comando SERVEROUTPUT (habilita a mostrar texto usando el paquete DBMS_OUTPUT con los metodos PUT_LINE o PUT)

SET SERVEROUTPUT ON --No lleva punto y coma

DBMS_OUTPUT --Creado en el SYS 
	--(Metodos)
		-PUT_LINE 
		-PUT (Coloca una cadena a continuacion de la otra)
		-NEWLINE (Genera un salto de linea al DBMS_OUTPUT.PUT anterior)





