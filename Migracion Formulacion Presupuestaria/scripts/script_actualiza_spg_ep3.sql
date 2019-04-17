CREATE OR REPLACE FUNCTION actualiza_spg_ep3(OUT codemp character, OUT codestpro1 character, OUT estcla character, OUT codestpro2 character, OUT codestpro3 character, OUT denestpro3 character, OUT codfuefin character, OUT estreradi character, OUT codcencos character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcodestpro1	ALIAS FOR $2;
  mestcla	ALIAS FOR $3;
  mcodestpro2	ALIAS FOR $4;
  mcodestpro3	ALIAS FOR $5;
  mdenestpro3	ALIAS FOR $6;
  mcodfuefin	ALIAS FOR $7;
  mestreradi	ALIAS FOR $8;
  mcodcencos	ALIAS FOR $9;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	spg_temporal.codemp,
	spg_temporal.codestpro1,
	spg_temporal.estcla,
	spg_temporal.codestpro2,
	spg_temporal.codestpro3,
	spg_temporal.denestpro3,
	'--',
	'0',
	'0000'
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
	  mdenestpro3,
	  mcodfuefin,
	  mestreradi,
	  mcodcencos;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					spg_ep3 
				WHERE 
					spg_ep3.codemp=mcodemp AND 
					spg_ep3.codestpro1=mcodestpro1 AND 
					spg_ep3.estcla=mestcla AND 
					spg_ep3.codestpro2=mcodestpro2 AND
					spg_ep3.codestpro3=mcodestpro3),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO spg_ep3 VALUES
		(mcodemp,mcodestpro1,mestcla,mcodestpro2,mcodestpro3,mdenestpro3,mcodfuefin,mestreradi,mcodcencos);
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
ALTER FUNCTION actualiza_spg_ep3()
  OWNER TO postgres;
