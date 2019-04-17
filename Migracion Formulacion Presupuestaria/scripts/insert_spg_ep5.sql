INSERT INTO spg_ep5
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	denestpro5,
	'--',
	SUBSTRING( codestpro2,22,4)
FROM
	spg_temporal
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	denestpro5
