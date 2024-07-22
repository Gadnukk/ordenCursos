	
	/*SYS.ALL_SOURCE*/ 
	
	SELECT * FROM SYS.ALL_SOURCE WHERE TEXT LIKE '%VALORBUSCADO%'
	
		
	/*USER_TAB_COLS*/ 
	
	--Agrupo por la cantidad de columnas que tiene cada table existente
	 SELECT TABLE_NAME,COUNT(COLUMN_NAME) N  FROM USER_TAB_COLS 
		GROUP BY TABLE_NAME ORDER BY  N DESC
		
	EJEMPLO:
	
	CREATE OR REPLACE PROCEDURE raise_emp_salary (column_value NUMBER, 
                             emp_column VARCHAR2, amount NUMBER) IS
   v_column VARCHAR2(30);
   sql_stmt  VARCHAR2(200);
	BEGIN
	-- determine if a valid column name has been given as input
	  SELECT COLUMN_NAME INTO v_column FROM USER_TAB_COLS 
		WHERE TABLE_NAME = 'EMPLOYEES' AND COLUMN_NAME = emp_column;
	  sql_stmt := 'UPDATE employees SET salary = salary + :1 WHERE ' 
				   || v_column || ' = :2';
	  EXECUTE IMMEDIATE sql_stmt USING amount, column_value;
	  IF SQL%ROWCOUNT > 0 THEN
		DBMS_OUTPUT.PUT_LINE('Salaries have been updated for: ' || emp_column 
							|| ' = ' || column_value);
	  END IF;
	  EXCEPTION
	  WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('Invalid Column: ' || emp_column);
	END raise_emp_salary;
	
	
	
	--CASE
	
	set serveroutput on
		DECLARE
		v_location NUMBER;
		v_zona VARCHAR2(30 CHAR);
		BEGIN
		v_location := 1700;
		CASE
		WHEN v_location < 1400 THEN
		v_zona := 'Fuera EE.UU';
		WHEN v_location <= 1700 THEN
		v_zona:='EE.UU';
		WHEN v_location >= 2400 AND v_location <= 2600 THEN
		v_zona:='Reino Uniddo';
		ELSE v_zona:='Otros';
		END CASE;
		DBMS_OUTPUT.PUT_LINE(v_zona);
		END;
