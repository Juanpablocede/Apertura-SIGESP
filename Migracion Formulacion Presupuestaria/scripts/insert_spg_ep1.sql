INSERT INTO spg_ep1
SELECT
	codemp,
	codestpro1,
	estcla,
	denestpro1,
	0,
	' ',
	'0'
FROM
	spg_temporal
GROUP BY
	codemp,
	codestpro1,
	estcla,
	denestpro1
