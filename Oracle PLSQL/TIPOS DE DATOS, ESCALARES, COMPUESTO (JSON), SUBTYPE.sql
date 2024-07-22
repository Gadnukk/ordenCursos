	/*TIPOS DE DATOS*/ 

/*ESCALARES*/

VARCHAR
VARCHAR2
STRING
INTEGER
INT 
FLOAT
DECIMAL
DECIMAL
NUMERIC
NUMBER
PLS_INTEGER
BOOLEAN
DATE

/*COMPUESTOS*/

TABLE
VARRAY
RECORD

/*DE REFERENCIA*/

REF CURSOR
REF OBJECT-TYPE

/*LOB*/

BFILE
BLOB
CLOB
NCLOB


			/*ESCALARES*/
			
No tienen componentes internos. Tienen un valor unico.
Se dividen en cuatro familias:

/*Numeros*/
NUMERIC
INTEGER
INT
PLS_INTEGER
DECIMAL
DEC
FLOAT 
REAL 
SMALLINT
SINGTYPE

NUMBER (Precision, escala)

Es el que esta arriba de todo, el superTypo, puede soportar +-0, pero
es mas lento que los otros subtipos numericos, es mas portable pero perdes performance
Presicion es el total del valores permitidos para la variable, la
Escala me dice cuantos decimales va a contener
Se pueden omitir ambos. (Si es la precision entonces toma el maximo)

	NUMBER (5)
	La precision maxima es de 38 digitos.
	NUMBER (5,2)
	La presicion maxima para Escala es de -84 hasta 127

--Subtipos Numericos

	--INTERGER, INT, SMALLINT
	Tiene una restriccion de escala a 0, por lo cual solo va a permitir valores
	enteros no decimales. Estos tipos son mucho mas lentos que NUMBER porque 
	tiene esa restriccion.


	--DEC, DECIMAL Y NUMERIC
	Pueden utilizar valores numericos con punto decimal

	--DOBLE PRECISION Y FLOAT
	Pueden utilizar un maximo de 126 digitos decimales floteantes que se
	redondean a 38 digitos.
	
	--REAL
	Pueden utilizar un maximo de 63 digitos decimales floteantes que se
	redondean a 18 digitos.
	
	--PLS_INTEGER = BINARY_INTEGER
	PLS_INTEGER requieren menor tamaño de almacenamiento 32 bits,
	las operaciones aritmeticas con el tipo PLS_INTEGER son mas 
	rapidas que los tipos NUMBER.
	
	--INTEGER
	Lo mismo que PLS_INTEGER pero con un rango mayor a 32 bits,
	conbiene usarlos cuando superan ese maximo.
	
	--NATURAL Y POSITIVE
	Unicamente numeron positivos y permiten nulos
	
	--NATURALN Y POSITIVEN 
	Unicamente numeron posim tivos y NO permiten nulos.
	
	--SINGTYPE
	Le permite unicamente tomar a la variable estos valores
	1,0,-1 y NULL
	
	
/*Caracteres*/
CHAR 
VARCHAR 
VARCHAR2 
NCHAR
NVARCHAR2
RAW 
ROWID 
LONG

	--CHAR
	Almacenar datos fijos alfanumericos, con una capacidad de 
	32767 bytes
	Si no esta especificado un tamaño maximo por defecto es 1.
	
	CHAR (maximun_size[CHAR|bytes])
	
	CHAR (10) Sino se completan todos los espacios lo llena
	con blanco.
	
	--VARCHAR2
	Tamaño maximo de 32767 bytes variables
	Las variables varchar2 pequeñas estan optimizadas para el 
	rendimiento.
	
	--ROWID
	Se puede almacenar un identificador de columna que permite
	extraer univocamente un registro.
	
	BBBBBBB.RRRR.FFFF
	
	BBBBBBB Indica el bloque dentro de la base
	RRRR Indica la fila dentro del bloque
	FFFF Indica el numero de archivo
	
	

/*Booleanos*/
BOOLEAN 

	--BOOLEAN
	Permiten tres valores , true, false , null
	Solo se permite una variable por operacion logica
	
	

/*Date*/
DATE 
TIMESTAMP
TIMESTAMP WITH TIMEZONE 
TIMESTAMP WITH LOCALTIMEZONE
INTERVAL YEAR TO MONTH 
INTERVAL DAY TO SECOND



			/*SUB TYPE*/
Se declara dentro de las variables

DECLARE			
SUBTYPE Nombre_SubType IS datatype (constrain) (null)	

ej:

DECLARE 
SUBTYPE Minerales IS VARCHAR (10);
SUBTYPE UnoADies IS NUMERIC RANGE 1..10;
SUBTYPE DescProd IS ENT_TR_17.DESC_PROD%TYPE
v_Cobre Mineral;
v_Player UnoADies;



			/*COMPUESTOS*/

Un tipo compuesto contiene una omas variables escalares.
ARRAY , TABLE


			/*DE REFERENCIA*/
La variable de referencia apunta a cualquier posicion de memoria.
			
			
			/*LOB*/

JSON

A partir de Oracle 12 , estan las variables LOB, BLOB, CLOB para almacenar
grandes cantidad de datos.

Tipos de datos Convergentes JSON . SODA -- Herramiente de visualizacion 

--JSON_OBJECT(*)

SELECT JSON_OBJECT(*) FROM ENT_TR_17
WHERE ID_PROD = '10'

{"EMPLOYEE_ID":140,"FIRST_NAME":"Joshua","LAST_NAME":"Patel","EMAIL":"JPATEL","PHONE_N
UMBER":"650.121.1834","HIRE_DATE":"2006-04-06T00:00:00","JOB_ID":"ST_CLERK","SALARY":2
500,"COMMISSION_PCT":null,"MANAGER_ID":123,"DEPARTMENT_ID":50}

--JSON_OBJECT ('NAME' VALUES first_name, d.*)

SELECT JSON_OBJECT('NAME' VALUE first_name, d.*)
 FROM employees e, departments d
 WHERE e.department_id = d.department_id AND e.employee_id =140


,"items":
{
 "results" : [
 {
 "columns" : [
 {
 "name" : "JSON_OBJECT('NAME'VALUEFIRST_NAME,D.*)",
 "type" : ""
 }
 ],
 "items" : [
 {
 "json_object('name'valuefirst_name,d.*)" :
"{\"NAME\":\"Joshua\",\"DEPARTMENT_ID\":50,\"DEPARTMENT_NAME\":\"Shipping\",\"MANAGER_ID\":121,\"LOCATION_ID\":1500
}"
 }
 ]
 }
 ]

--JSON_OBJECT (KEY )

SELECT JSON_OBJECT (
 KEY 'deptno' VALUE d.department_id,
 KEY 'deptname' VALUE d.department_name
 ) "Department Objects"
 FROM departments d
 ORDER BY d.department_id;
Department Objects
----------------------------------------
{"deptno":10,"deptname":"Administration"}
{"deptno":20,"deptname":"Marketing"}
{"deptno":30,"deptname":"Purchasing"}
{"deptno":40,"deptname":"Human Resources"}
{"deptno":50,"deptname":"Shipping"}

--JSON_ARRAYAGG(JSON_OBJECT(*))

SELECT JSON_ARRAYAGG(JSON_OBJECT(*))
 FROM departments
 
{
 "results" : [
 {
 "columns" : [
 {
 "name" : "JSON_ARRAYAGG(JSON_OBJECT(*))",
 "type" : ""
 }
 ],
 "items" : [
 {
"json_arrayagg(json_object(*))":
"[{\"DEPARTMENT_ID\":10,\"DEPARTMENT_NAME\":\"Administration\",\"MANAGER_ID\":200,\"LOCATION_ID\":1700},{\"D
EPARTMENT_ID\":20,\"DEPARTMENT_NAME\":\"Marketing\",\"MANAGER_ID\":201,\"LOCATION_ID\":1800},{\"DEPARTMENT_I
D\":30,\"DEPARTMENT_NAME\":\"Purchasing\",





















