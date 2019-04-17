UPDATE spg_cuentas SET
sc_cuenta=
	(SELECT 
		SUBSTRING(spg_cuentas01.sc_cuenta,1,9) 
	FROM 
		spg_cuentas AS spg_cuentas01 
	WHERE spg_cuentas01.spg_cuenta=spg_cuentas.spg_cuenta LIMIT 1)||
	SUBSTRING(spg_cuentas.codestpro2,22,4)||'000001' 
WHERE
	spg_cuentas.sc_cuenta='0'
