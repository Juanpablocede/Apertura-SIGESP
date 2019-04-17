INSERT INTO spg_ep2
SELECT
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	denestpro2
FROM
	spg_temporal
GROUP BY
	codemp,
	codestpro1,
	estcla,
	codestpro2,
	denestpro2

