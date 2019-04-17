--Actualiza los niveles
UPDATE spg_cuentas SET
nivel=1
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)='00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00';
UPDATE spg_cuentas SET
nivel=2
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00';
UPDATE spg_cuentas SET
nivel=3
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00';
UPDATE spg_cuentas SET
nivel=4
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)<>'00';
--Actualiza las referencias
UPDATE spg_cuentas SET
referencia=SUBSTRING(spg_cuentas.spg_cuenta,1,3)||'000000'
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND 
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)='00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00';
UPDATE spg_cuentas SET
referencia=SUBSTRING(spg_cuentas.spg_cuenta,1,5)||'0000'
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)='00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00';
UPDATE spg_cuentas SET
referencia=SUBSTRING(spg_cuentas.spg_cuenta,1,7)||'00'
WHERE
	SUBSTRING(spg_cuentas.spg_cuenta,2,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,4,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,6,2)<>'00' AND
	SUBSTRING(spg_cuentas.spg_cuenta,8,2)='00';

