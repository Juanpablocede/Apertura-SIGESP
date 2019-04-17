INSERT INTO spg_dtmp_cmp
SELECT 
	codemp,
	'SPGCRA',
	'000000000000002',
	'2014-02-05',
	codestpro1,
	codestpro2,
	codestpro3,
	codestpro4,
	codestpro5,
	estcla,
	spg_cuenta,
	'SPGCRA',
	'000000000000002',
	'AU',
	'--',
	'APROBACION DE CREDITO ADICIONAL PARA EL PROYECTO DE PRODUCCION Y ESTABLECIMIENTO DE PLANTACIONES',
	(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre),
	1
FROM
	spg_temporal