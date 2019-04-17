CREATE OR REPLACE FUNCTION actualiza_sigesp_cencosto(OUT codemp character, OUT codcencos character, OUT denominacion character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcodcencos	ALIAS FOR $2; 
  mdenominacion	ALIAS FOR $3;
  mcuenta	INTEGER; 
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	spg_ep2.codemp,
	substring(spg_ep2.codestpro2,22,4),
	spg_ep2.denestpro2
FROM 
	spg_ep2
GROUP BY
	spg_ep2.codemp,
	substring(spg_ep2.codestpro2,22,4),
	spg_ep2.denestpro2;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodemp,
	  mcodcencos,
	  mdenominacion;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					sigesp_cencosto
				WHERE 
					sigesp_cencosto.codemp=mcodemp AND 
					sigesp_cencosto.codcencos=mcodcencos),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO sigesp_cencosto VALUES(mcodemp,mcodcencos,mdenominacion);
	  END IF;


     RETURN NEXT;
   END;
 END LOOP;
 CLOSE cu01;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION actualiza_sigesp_cencosto()
  OWNER TO postgres;
