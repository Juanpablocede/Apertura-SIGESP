INSERT INTO spg_ep4
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	denestpro4
FROM
	spg_temporal
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	codestpro3,
	codestpro4,
	denestpro4
