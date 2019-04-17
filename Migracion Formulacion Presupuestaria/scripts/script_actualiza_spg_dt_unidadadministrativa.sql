CREATE OR REPLACE FUNCTION actualiza_spg_dt_unidadadministrativa(OUT codemp character, OUT coduniadm character, OUT codestpro1 character, OUT codestpro2 character, OUT codestpro3 character, OUT codestpro4 character, OUT codestpro5 character, OUT estcla character, OUT central character)
  RETURNS SETOF record AS
$BODY$

DECLARE
  mcodemp 	ALIAS FOR $1;
  mcoduniadm	ALIAS FOR $2; 
  mcodestpro1	ALIAS FOR $3;
  mcodestpro2	ALIAS FOR $4;
  mcodestpro3	ALIAS FOR $5;
  mcodestpro4	ALIAS FOR $6;
  mcodestpro5	ALIAS FOR $7;
  mestcla	ALIAS FOR $8;
  mcentral	ALIAS FOR $9;
  mcuenta	INTEGER;
  existen_datos BOOLEAN;
  
cu01 CURSOR FOR
SELECT
	spg_cuentas.codemp,
	substring(spg_cuentas.codestpro2,16,10),
	spg_cuentas.codestpro1,
	spg_cuentas.codestpro2,
	spg_cuentas.codestpro3,
	spg_cuentas.codestpro4,
	spg_cuentas.codestpro5,
	spg_cuentas.estcla,
	'0'
FROM
	spg_cuentas
GROUP BY 
	spg_cuentas.codemp,
	substring(spg_cuentas.codestpro2,16,10),
	spg_cuentas.codestpro1,
	spg_cuentas.codestpro2,
	spg_cuentas.codestpro3,
	spg_cuentas.codestpro4,
	spg_cuentas.codestpro5,
	spg_cuentas.estcla;
BEGIN
 existen_datos = FALSE;

OPEN cu01;
<<buscar_datos>>
 LOOP
   BEGIN
     FETCH cu01 INTO
	  mcodemp,
	  mcoduniadm,
	  mcodestpro1,
	  mcodestpro2,
	  mcodestpro3,
	  mcodestpro4,
	  mcodestpro5,
	  mestcla,
	  mcentral;
	  IF NOT FOUND THEN
             EXIT buscar_datos;
          END IF;

	  mcuenta:=0;

	  mcuenta:=COALESCE((	SELECT 
					COUNT(*) 
				FROM 
					spg_dt_unidadadministrativa
				WHERE 
					spg_dt_unidadadministrativa.codemp=mcodemp AND 
					spg_dt_unidadadministrativa.coduniadm=mcoduniadm AND
					spg_dt_unidadadministrativa.codestpro1=mcodestpro1 AND
					spg_dt_unidadadministrativa.codestpro2=mcodestpro2 AND
					spg_dt_unidadadministrativa.codestpro3=mcodestpro3 AND
					spg_dt_unidadadministrativa.codestpro4=mcodestpro4 AND
					spg_dt_unidadadministrativa.codestpro5=mcodestpro5 AND
					spg_dt_unidadadministrativa.estcla=mestcla),0);	  

	  RAISE NOTICE 'valor  %',mcuenta;

	  IF mcuenta=0 THEN
		INSERT INTO spg_dt_unidadadministrativa VALUES(mcodemp,mcoduniadm,mcodestpro1,mcodestpro2,mcodestpro3,mcodestpro4,mcodestpro5,mestcla,mcentral);
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
ALTER FUNCTION actualiza_spg_dt_unidadadministrativa()
  OWNER TO postgres;
