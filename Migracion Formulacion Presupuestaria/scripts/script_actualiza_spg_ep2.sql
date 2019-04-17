CREATE OR REPLACE FUNCTION actualiza_spg_ep2(OUT codemp character, OUT codestpro1 character, OUT estcla character, OUT codestpro2 character, OUT denestpro2 character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcodestpro1	ALIAS FOR $2;
  mestcla	ALIAS FOR $3;
  mcodestpro2	ALIAS FOR $4;
  mdenestpro2	ALIAS FOR $5;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	spg_temporal.codemp,
	spg_temporal.codestpro1,
	spg_temporal.estcla,
	spg_temporal.codestpro2,
	spg_temporal.denestpro2
FROM 
	spg_temporal;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodemp,
	  mcodestpro1,
	  mestcla,
	  mcodestpro2,
	  mdenestpro2;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					spg_ep2 
				WHERE 
					spg_ep2.codemp=mcodemp AND 
					spg_ep2.codestpro1=mcodestpro1 AND 
					spg_ep2.estcla=mestcla AND 
					spg_ep2.codestpro2=mcodestpro2),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO spg_ep2 VALUES(mcodemp,mcodestpro1,mestcla,mcodestpro2,mdenestpro2);
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
ALTER FUNCTION actualiza_spg_ep2()
  OWNER TO postgres;
