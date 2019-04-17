DELETE FROM sigesp_cencosto;
INSERT INTO sigesp_cencosto
SELECT
	codemp,
	substring(codestpro2,22,4),
	denestpro2
FROM
	spg_ep2
GROUP BY
	codemp,
	substring(codestpro2,22,4),
	denestpro2
