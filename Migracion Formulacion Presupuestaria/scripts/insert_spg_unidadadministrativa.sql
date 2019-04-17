INSERT INTO spg_unidadadministrativa
SELECT
	codemp,
	substring(codestpro2,16,10),
	'',
	denestpro2,
	1,
	'00001'
FROM
	spg_ep2
GROUP BY
	codemp,
	codestpro2,
	denestpro2
