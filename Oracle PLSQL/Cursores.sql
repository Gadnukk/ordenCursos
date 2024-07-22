--Cursores

	--Implicitos
	Siempre tiene un INTO
	Devuelven 1 sola fila.
	En caso de error devuelve NO_DATA_FOUND , TOO_MANY_ROWS.
	No se declaran
	
	SELECT INTO 
	
	
	--Explicitos
	
	Devuelven mas de una fila.
	Se deben declarar DECLARE CURSOR 
	Se deben abrir
	Cerrar el cursor
	
	1° DECLARE --DECLARARLO
	DECLARE CURSOR NOMBRE IS INSTRUCCION_SELECT;
	DECLARE CURSOR CUR IS SELECT COD_PROD, KEY_PROD FROM ENT_TR_17_PROD WHERE PAR_KEY =  '1ffcf5eb-9186-4d6a-a97a-6487e2dc87ca'; 
	
	2° OPEN --ABRIRLO
	
	OPEN CUR 
	
	3° FETCH --RECUPERAR , EN ESTE CASO RECORRER LAS FILAS
	
	--TIPO DE RECUPERACION
	
		--/* Procesar cada una de las filas */ --OPEN LOOP FETCH INTO EXIT WHEN NOMBRECUR%NOTFOUND END LOOP
		OPEN nombre_cursor;
			LOOP
			  FETCH nombre_cursor INTO variables;
			  EXIT WHEN nombre_cursor%NOTFOUND;--procesar cada una de las filas
			END LOOP;
			
		--/* Procesamiento de los registros recuperados */
		OPEN nombre_cursor;
			FETCH nombre_cursor INTO lista_variables;
			WHILE nombre_cursor%FOUND
			LOOP
			  FETCH nombre_cursor INTO lista_variables;
		END LOOP;
		CLOSE nombre_cursor;
		
		--/* Procesamiento de los registros recuperados */
		FOR variable IN nombre_cursor LOOP
		END LOOP;


Declaramos el Cursor , lo arbrimos con OPEN y LOOPeamos el FETCH , SALIMOS EXIT CUR&NOTFOUND Y CERRAMOS EL LOOP.

		4° CLOSE Cerrar el CURSOR
		

/*EJEMPLO:*/
		
	DECLARE
	  CURSOR cpaises IS
	  SELECT CO_PAIS, DESCRIPCION, CONTINENTE FROM PAISES;
	  co_pais VARCHAR2(3);
	  descripcion VARCHAR2(50);
	  continente VARCHAR2(25);
	BEGIN
	  OPEN cpaises;
	  FETCH cpaises INTO co_pais,descripcion,continente;
	  DBMS_OUTPUT.PUT_LINE(continente);
	  CLOSE cpaises;
	END;

--ACTUALIZACION MEDIANTE ATRIBUTOS SQL

	--SQL%NOTFOUND  devuelve TRUE cuando la última sentencia SELECT no recuperó ninguna fila
	--SQL%FOUND devuelve TRUE cuando la última sentencia SELECT devuelve alguna fila
	--SQL%ROWCOUNT devuelve el número de filas afectadas por INSERT, DELETE o UPDATE o las filas devueltas por una sentencia SELECT
	--SQL%ISOPEN  siempre devuelve FALSE, porque Oracle cierra automáticamente el cursor implícito cuando termina la ejecución de la sentencia SELECT


BEGIN
  UPDATE ARTICULOS SET cArtDsc = `Pantalla LCD’ WHERE cCodArt = ‘LCD’;
  IF SQL%NOTFOUND THEN -- Otra opción : SQL%ROWCOUNT = 0
    INSERT INTO ARTICULOS (cCodArt,cDesArt)
    VALUES (‘LCD’,’Pantalla LCD’);
  END IF;
END;

--Cuando trabajamos con cursores de actualización debemos tener en cuenta que la sentencia UPDATE genera bloqueos en la base de datos


---LOOP

LOOP

IF CONDICION THEN 
EXIT;
END IF;

END LOOP;

LOOP
SENTENCIA
EXIT WHEN CONDICION
END LOOP;

		--ETIQUETAS LOOP
		Una etiqueta debe aparecer en el principio de la sentencia LOOP
		y debe aparecer al final en la clausula EXIT para identificar
		de que LOOP salir.
		
		EXIT <<ETIQUETA>> WHEN CONDICION;
		
		PJ:
		
		BEGIN
		<<OUTER_LOOP>>
		LOOP
		SENTENCIA
		
			<<INNER_LOOP>>
			
			LOOP 
			SENTENCIA 
			EXIT INNER_LOOP WHEN CONDICION
			EXIT OUTER_LOOP WHEN CONDICION
			END LOOP INNER_LOOP
		END LOOP OUTER_LOOP;
		
		
--WHILE

WHILE CONDICION
	LOOP
	END LOOP;

--FOR

La cantidad de iteraciones es conocida cuando operamos un bloqueos
FOR CONTADOR 
	LOOP
	END LOOP

Tambien s puede usar un select para saber el numero de registros a iterar

FOR CONTADOR IN (SELECT ID_PROD. DESC_PROD FROM ENT_TR_17 WHERE ...)	
	LOOP
	END LOOP
	

--GOTO
Salta una parte del codigo , debe saltar a un bloque ejecutable,
NO PUEDE SALTAR DENTRO DE OTRO IF.

GOTO ETIQUETA

<<ETIQUETA>>

DBMS_OUTPUT.PUT_LINE();



	



