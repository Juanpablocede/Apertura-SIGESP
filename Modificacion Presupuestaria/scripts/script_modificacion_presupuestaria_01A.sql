
UPDATE spg_cuentas SET
aumento=(spg_cuentas.aumento+spg_temporal.abril+spg_temporal.mayo+spg_temporal.junio)
FROM 
	spg_temporal
WHERE
	spg_temporal.codemp=spg_cuentas.codemp AND
	spg_temporal.codestpro1=spg_cuentas.codestpro1 AND
	spg_temporal.codestpro2=spg_cuentas.codestpro2 AND
	spg_temporal.codestpro3=spg_cuentas.codestpro3 AND
	spg_temporal.codestpro4=spg_cuentas.codestpro4 AND
	spg_temporal.codestpro5=spg_cuentas.codestpro5 AND
	spg_temporal.estcla=spg_cuentas.estcla AND
	spg_temporal.spg_cuenta=spg_cuentas.spg_cuenta 