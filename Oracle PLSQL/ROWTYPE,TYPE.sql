/*Atributos*/

	--/*TYPE*/
	El atibuto TYPE toma el tamaño y el tipo del campo al cual se le esta asignando, por lo tanto
	la variable va a tener el tipo y tamaño del campo. NO TOMAN RESTRUCCIONES

		ejemplo:
		
		DECLARE 
			V_VAR ENT_TR_17.RESULTADOS%TYPE;
		
	--/*ROWTYPE*/
	El atributo ROWTYPE toma todos los tamaños y tipos de datos de una fila.
    Reflejan el cambio de tamaño, eliminacion de campos.	NO TOMAN RESTRUCCIONES.
	
		ejemplo:
		
		DECLARE 
			V_VARROW ENT_TR_17%ROWTYPE;
			
			DBMS_OUTPUT.PUT_LINE ('El resultado del Proceso fue' || V_VARROW.RESULTADOS 
								 || 'Cat ' || V_VARROW.CAT || 'Mot. ' || V_VARROW.MOT)