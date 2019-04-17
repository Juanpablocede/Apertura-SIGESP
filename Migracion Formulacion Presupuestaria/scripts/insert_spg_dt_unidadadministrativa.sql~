INSERT INTO spg_dt_unidadadministrativa
SELECT
	codemp,
	substring(codestpro2,16,10),
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	estcla,
	'0'
FROM
	spg_cuentas
GROUP BY 
	codemp,
	substring(codestpro2,16,10),
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	estcla
