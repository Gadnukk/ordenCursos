DECLARE 
v_id  int (5);
v_desc varchar2(50);

BEGIN 

    SELECT COD_PROD INTO v_id 
    FROM ENT_TR_17_PROD 
    WHERE PAR_KEY =  '1ffcf5eb-9186-4d6a-a97a-6487e2dc87ca'
    AND OPC_FIN = '2';
    --AND COD_PROD =  '209';
    
   DBMS_OUTPUT.PUT_LINE('El Id de prooducto es : ' || v_id);
    
    
    EXCEPTION WHEN NO_DATA_FOUND THEN
    
    DBMS_OUTPUT.PUT_LINE('El producto no existe' );

    WHEN OTHERS THEN
    
   DBMS_OUTPUT.PUT_LINE('Se produjo el siguiente error: ' || SQLERRM);

END;

/////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DECLARE v_id_prod number(5);
 v_desc_prod varchar2(20);
CURSOR CUR IS SELECT COD_PROD, KEY_PROD FROM ENT_TR_17_PROD WHERE PAR_KEY =  '1ffcf5eb-9186-4d6a-a97a-6487e2dc87ca'; 
 
BEGIN

 OPEN CUR FOR --Abrir el cursor para iterar en las filas OPEN FOR
 
    SELECT COD_PROD, KEY_PROD
     INTO v_id_prod,v_desc_prod --Primero los campos , luego los INPUT de cada uno
    FROM ENT_TR_17_PROD 
    WHERE PAR_KEY =  '1ffcf5eb-9186-4d6a-a97a-6487e2dc87ca';
    
    
  DBMS_OUTPUT.PUT_LINE ('ID ' || v_id_prod ||' Desc. ' || v_desc_prod);
  
IF   (NOT CUR%ISOPEN) THEN -- Se pregunta por el CUR y el atributo ISOPEN (CUR%ISOPEN)

 SELECT 'El cursor no se abrio correctamente' FROM DUAL;

END IF;
  
 EXCEPTION WHEN OTHERS THEN
 
 DBMS_OUTPUT.PUT_LINE ('Error: ' || SQLERRM);



END;

