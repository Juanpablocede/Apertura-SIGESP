CREATE OR REPLACE FUNCTION actualiza_spg_ep1(OUT codemp character, OUT codestpro1 character, OUT estcla character, OUT denestpro1 character, OUT estint smallint, OUT sc_cuenta character, OUT estcencos character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcodestpro1	ALIAS FOR $2;
  mestcla	ALIAS FOR $3;
  mdenestpro1	ALIAS FOR $4;
  mestint	ALIAS FOR $5;
  msc_cuenta	ALIAS FOR $6;
  mestcencos	ALIAS FOR $7;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR 

SELECT 
	spg_temporal.codemp,
	spg_temporal.codestpro1,
	spg_temporal.estcla,
	spg_temporal.denestpro1,
	0,
	' ',
	'0'
FROM 
	spg_temporal
GROUP BY
	spg_temporal.codemp,
	spg_temporal.codestpro1,
	spg_temporal.estcla,
	spg_temporal.denestpro1;
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
	  mdenestpro1,
	  mestint,
	  msc_cuenta,
	  mestcencos;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					spg_ep1
				WHERE 
					spg_ep1.codemp=mcodemp AND 
					spg_ep1.codestpro1=mcodestpro1 AND 
					spg_ep1.estcla=mestcla),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO spg_ep1 VALUES(mcodemp,mcodestpro1,mestcla,mdenestpro1,mestint,msc_cuenta,mestcencos);
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
ALTER FUNCTION actualiza_spg_ep1()
  OWNER TO postgres;
