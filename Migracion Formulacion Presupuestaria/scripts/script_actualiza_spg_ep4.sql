CREATE OR REPLACE FUNCTION actualiza_spg_ep4(OUT codemp character, OUT codestpro1 character, OUT estcla character, OUT codestpro2 character, OUT codestpro3 character, OUT codestpro4 character, OUT denestpro4 character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcodestpro1	ALIAS FOR $2;
  mestcla	ALIAS FOR $3;
  mcodestpro2	ALIAS FOR $4;
  mcodestpro3	ALIAS FOR $5;
  mcodestpro4	ALIAS FOR $6;
  mdenestpro4	ALIAS FOR $7;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	spg_temporal.codemp,
	spg_temporal.codestpro1,
	spg_temporal.estcla,
	spg_temporal.codestpro2,
	spg_temporal.codestpro3,
	spg_temporal.codestpro4,
	spg_temporal.denestpro4
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
	  mcodestpro3,
	  mcodestpro4,
	  mdenestpro4;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					spg_ep4
				WHERE 
					spg_ep4.codemp=mcodemp AND 
					spg_ep4.codestpro1=mcodestpro1 AND 
					spg_ep4.estcla=mestcla AND 
					spg_ep4.codestpro2=mcodestpro2 AND
					spg_ep4.codestpro3=mcodestpro3 AND
					spg_ep4.codestpro4=mcodestpro4),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO spg_ep4 VALUES
		(mcodemp,mcodestpro1,mestcla,mcodestpro2,mcodestpro3,mcodestpro4,mdenestpro4);
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
ALTER FUNCTION actualiza_spg_ep4()
  OWNER TO postgres;
