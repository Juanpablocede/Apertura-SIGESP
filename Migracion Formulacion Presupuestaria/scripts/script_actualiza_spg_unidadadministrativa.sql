CREATE OR REPLACE FUNCTION actualiza_spg_unidadadministrativa(OUT codemp character, OUT coduniadm character, OUT coduac character, OUT denominacion character, OUT estemireq smallint, OUT coduniadmsig character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcoduniadm	ALIAS FOR $2; 
  mcoduac	ALIAS FOR $3;
  mdenominacion	ALIAS FOR $4;
  mestemireq	ALIAS FOR $5;
  mcoduniadmsig	ALIAS FOR $6;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR
SELECT 
	spg_ep2.codemp,
	substring(spg_ep2.codestpro2,16,10),
	'',
	spg_ep2.denestpro2,
	1,
	'00001'
FROM 
	spg_ep2
GROUP BY
	spg_ep2.codemp,
	substring(spg_ep2.codestpro2,16,10),
	spg_ep2.denestpro2;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodemp,
	  mcoduniadm,
	  mcoduac,
	  mdenominacion,
	  mestemireq,
	  mcoduniadmsig	;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					spg_unidadadministrativa
				WHERE 
					spg_unidadadministrativa.codemp=mcodemp AND 
					spg_unidadadministrativa.coduniadm=mcoduniadm),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO spg_unidadadministrativa VALUES(mcodemp,mcoduniadm,mcoduac,mdenominacion,mestemireq,mcoduniadmsig);
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
ALTER FUNCTION actualiza_spg_unidadadministrativa()
  OWNER TO postgres;
