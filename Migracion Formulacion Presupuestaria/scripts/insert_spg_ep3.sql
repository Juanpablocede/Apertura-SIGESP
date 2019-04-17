INSERT INTO spg_ep3
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	denestpro3,
	'--',
	'0',
	'0000'
FROM
	spg_temporal
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	denestpro3
