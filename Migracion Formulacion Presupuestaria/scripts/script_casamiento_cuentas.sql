--Actualiza sc_cuenta de la partida 401
UPDATE spg_cuentas SET
sc_cuenta='611'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='401';

--Actualiza sc_cuenta de la partida 402
UPDATE spg_cuentas SET
sc_cuenta='1130501028000100001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='402' AND
	(codestpro1='0000000000000000000000001' OR
	 codestpro1='0000000000000000000000002' OR
	 codestpro1='0000000000000000000000003' OR
	 codestpro1='0000000000000000000000004' OR
	 codestpro1='0000000000000000000000007' OR
	 codestpro1='0000000000000000000000008' OR
	 codestpro1='0000000000000000000000009');

UPDATE spg_cuentas SET
sc_cuenta='1130501028010100001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='402' AND
	(codestpro1='0000000000000000000000005' OR
	 codestpro1='0000000000000000000000006');


--Actualiza sc_cuenta de la partida 403
UPDATE spg_cuentas SET
sc_cuenta='613'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='403';

--Actualiza sc_cuenta de la partida 404
UPDATE spg_cuentas SET
sc_cuenta='1230102000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40403';

UPDATE spg_cuentas SET
sc_cuenta='1230103000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40404';

UPDATE spg_cuentas SET
sc_cuenta='1230104000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40405';

UPDATE spg_cuentas SET
sc_cuenta='1230105000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40406';

UPDATE spg_cuentas SET
sc_cuenta='1230106000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40407';

UPDATE spg_cuentas SET
sc_cuenta='1230108000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40409';

UPDATE spg_cuentas SET
sc_cuenta='1240401000000000000'
WHERE 
	spg_cuenta='404120400';

UPDATE spg_cuentas SET
sc_cuenta='1230119000000000001'
WHERE 
	SUBSTRING(spg_cuenta,1,5)='40499';

UPDATE spg_cuentas SET
sc_cuenta='1230102000000000002'
WHERE 
	spg_cuenta='404010101' OR
	spg_cuenta='404010201';

UPDATE spg_cuentas SET
sc_cuenta='1230103000000000002'
WHERE 
	spg_cuenta='404010102' OR
	spg_cuenta='404010202';

UPDATE spg_cuentas SET
sc_cuenta='1230104000000000002'
WHERE 
	spg_cuenta='404010103' OR
	spg_cuenta='404010203';

UPDATE spg_cuentas SET
sc_cuenta='1230105000000000002'
WHERE 
	spg_cuenta='404010104' OR
	spg_cuenta='404010204';

UPDATE spg_cuentas SET
sc_cuenta='1230106000000000002'
WHERE 
	spg_cuenta='404010105' OR
	spg_cuenta='404010205';

UPDATE spg_cuentas SET
sc_cuenta='1230108000000000002'
WHERE 
	spg_cuenta='404010107' OR
	spg_cuenta='404010207';
	

--Actualiza sc_cuenta de la partida 405
UPDATE spg_cuentas SET
sc_cuenta='000'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='405';

--Actualiza sc_cuenta de la partida 406
UPDATE spg_cuentas SET
sc_cuenta='000'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='406';

--Actualiza sc_cuenta de la partida 407
UPDATE spg_cuentas SET
sc_cuenta='631'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='407';

--Actualiza sc_cuenta de la partida 408
UPDATE spg_cuentas SET
sc_cuenta='614'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='408';

--Actualiza sc_cuenta de la partida 409
UPDATE spg_cuentas SET
sc_cuenta='000'||SUBSTRING(spg_cuenta,4,2)||'0000'||SUBSTRING(codestpro2,22,4)||'000001'
WHERE 
	SUBSTRING(spg_cuenta,1,3)='409';
