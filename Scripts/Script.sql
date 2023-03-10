
-- ------------------- CREACION DE TABLAS --------------------- 

CREATE TABLE `TOTAL_PARAMS` (
    NOMBRE_TOTAL varchar(255) NOT null,
    SIGLA_TOTAL varchar(255) NOT NULL,
    PRIMARY KEY (SIGLA_TOTAL),
    unique (NOMBRE_TOTAL)
);

CREATE TABLE `DERIVADO_PARAMS` (
    NOMBRE_DERIVADO varchar(255) NOT NULL,
    SIGLA_DERIVADO varchar(255) NOT NULL,
    PRIMARY KEY (SIGLA_DERIVADO),
    unique (NOMBRE_DERIVADO)
);

CREATE TABLE `SUBDERIVADO_PARAMS` (
    NOMBRE_SUBDERIVADO varchar(255) NOT NULL,
    SIGLA_SUBDERIVADO varchar(255) NOT NULL,
    PRIMARY KEY (SIGLA_SUBDERIVADO),
    unique (NOMBRE_SUBDERIVADO)
);

CREATE TABLE `ESTRUCTURAS` (
    PLANTILLA varchar(255) NOT NULL,
  	SIGLA_TOTAL varchar(255) NOT NULL,
    SIGLA_DERIVADO varchar(255) NOT NULL,
   	SIGLA_SUBDERIVADO varchar(255) not NULL,
    PRIMARY KEY (PLANTILLA),
    FOREIGN KEY (SIGLA_TOTAL) REFERENCES TOTAL_PARAMS(SIGLA_TOTAL) on delete cascade on update cascade,
    FOREIGN KEY (SIGLA_DERIVADO) REFERENCES DERIVADO_PARAMS(SIGLA_DERIVADO) on delete cascade on update cascade,
    FOREIGN KEY (SIGLA_SUBDERIVADO) REFERENCES SUBDERIVADO_PARAMS(SIGLA_SUBDERIVADO) on delete cascade on update cascade
);

CREATE TABLE `CONCEPTOS_ESTRUCTURADOS` (
    NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	PLANTILLA varchar(255) NOT NULL,
    PRIMARY KEY (NOMBRE_CONCEPTO),
    FOREIGN KEY (PLANTILLA) REFERENCES ESTRUCTURAS(PLANTILLA) on delete cascade on update cascade
);

CREATE TABLE `ACUMULACION_OPERACIONES` (
 	ID_OPERACION bigint unsigned not null primary key auto_increment,
 	ENTIDAD varchar(255) NOT NULL,
    FECHA_CONTABLE DATETIME not null,
    FECHA_VALOR DATETIME not NULL,
  	NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	IMPORTE DOUBLE(9,2) NOT NULL,
  	DIVISA varchar(5) NOT NULL,
  	OBSERVACIONES varchar(255) NOT NULL,
    FOREIGN KEY (NOMBRE_CONCEPTO) REFERENCES CONCEPTOS_ESTRUCTURADOS(NOMBRE_CONCEPTO) on delete cascade on update cascade
);

-- ------------------------------------------------------

-- ------------------- DROP TABLE ----------------------- 

DROP TABLE ESTRUCTURAS;

-- ------------------------------------------------------

-- ------------------- INSERTS --------------------------
-- TOTAL_PARAMS
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Ingreso fijo','ING_FIJ');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Ingreso variable','ING_VAR');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Gasto fijo','GAS_FIJ');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Gasto variable','GAS_VAR');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Inversion','INV');

-- DERIVADO_PARAMS
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Nomina','NOM');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Bizum entrante','BIZ_ENT');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Transferencia entrante','TRN_ENT');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Ingreso en efectivo','ING_EFE');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Coche','CCH');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Devolucion pretamo movil','DEV_MOV');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Piso','PIS');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Ocio','OCI');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Gasolina','GSL');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Supermercados','SPM');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Retiro en efectivo','RET_EFE');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Bizum Saliente','BIZ_SAL');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Otros/Sin categorizar','OSC');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Sanciones administrativas','SAD');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Farmacia','FAR');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Gimnasio','GYM');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Inversion realizada','INV_REA');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Inversion obtenida','INV_OBT');

-- SUBDERIVADO_PARAMS
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Nomina mensual', 'NOM_MEN');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Nomina extra', 'NOM_EXT');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Devolucion pretamo coche', 'DEV_CCH');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Seguro coche', 'SEG_CCH');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Cambio de aceite', 'CAC');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Impuesto de circulacion', 'IMP_CIR');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Ropa', 'ROP');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Estanco', 'EST');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Restaurantes/Bares', 'RES_BAR');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Discotecas', 'DIS');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Bazares/Peque??o comercio', 'BAZ_PEC');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Cine', 'CIN');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Compras online', 'COM_ONL');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Gasolina (Repsol - Waylet)', 'REP_WAY');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Gasolina (Otros)', 'GSL_OTR');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Mercadona', 'MER');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Carrefour', 'CAR');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Spar', 'SPA');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('LIDL', 'LDL');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Gadis', 'GAD');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('#', '#');

-- ESTRUCTURAS
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('ING_FIJ-NOM-NOM_MEN', 'ING_FIJ', 'NOM', 'NOM_MEN');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('ING_FIJ-NOM-NOM_EXT', 'ING_FIJ', 'NOM', 'NOM_EXT');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('ING_VAR-BIZ_ENT', 'ING_VAR', 'BIZ_ENT', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('ING_VAR-TRN_ENT', 'ING_VAR', 'TRN_ENT', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('ING_VAR-ING_EFE', 'ING_VAR', 'ING_EFE', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_FIJ-CCH-DEV_CCH', 'GAS_FIJ', 'CCH', 'DEV_CCH');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_FIJ-CCH-SEG_CCH', 'GAS_FIJ', 'CCH', 'SEG_CCH');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_FIJ-CCH-CAC', 'GAS_FIJ', 'CCH', 'CAC');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_FIJ-CCH-IMP_CIR', 'GAS_FIJ', 'CCH', 'IMP_CIR');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_FIJ-DEV_MOV', 'GAS_FIJ', 'DEV_MOV', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_FIJ-PIS', 'GAS_FIJ', 'PIS', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-ROP', 'GAS_VAR', 'OCI', 'ROP');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-EST', 'GAS_VAR', 'OCI', 'EST');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-RES_BAR', 'GAS_VAR', 'OCI', 'RES_BAR');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-DIS', 'GAS_VAR', 'OCI', 'DIS');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-BAZ_PEC', 'GAS_VAR', 'OCI', 'BAZ_PEC');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-CIN', 'GAS_VAR', 'OCI', 'CIN');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OCI-COM_ONL', 'GAS_VAR', 'OCI', 'COM_ONL');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-GSL-REP_WAY', 'GAS_VAR', 'GSL', 'REP_WAY');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-GSL-GSL_OTR', 'GAS_VAR', 'GSL', 'GSL_OTR');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-MER', 'GAS_VAR', 'SPM', 'MER');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-CAR', 'GAS_VAR', 'SPM', 'CAR');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-SPA', 'GAS_VAR', 'SPM', 'SPA');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-LDL', 'GAS_VAR', 'SPM', 'LDL');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-GAD', 'GAS_VAR', 'SPM', 'GAD');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-RET_EFE', 'GAS_VAR', 'RET_EFE', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-BIZ_SAL', 'GAS_VAR', 'BIZ_SAL', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OSC', 'GAS_VAR', 'OSC', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SAD', 'GAS_VAR', 'SAD', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-FAR', 'GAS_VAR', 'FAR', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-GYM', 'GAS_VAR', 'GYM', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('INV-INV_REA', 'INV', 'INV_REA', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('INV-INV_OBT', 'INV', 'INV_OBT', '#');
-- ------------------------------------------------------

select *
from TOTAL_PARAMS;

select *
from DERIVADO_PARAMS; 

select *
from SUBDERIVADO_PARAMS;

select *
from ESTRUCTURAS;

select *
from CONCEPTOS_ESTRUCTURADOS;

select *
from ACUMULACION_OPERACIONES;

-- ------------------------------------------------------

SELECT e.`PLANTILLA`, t.`NOMBRE_TOTAL`, d.`NOMBRE_DERIVADO`,
	s.`NOMBRE_SUBDERIVADO`
FROM `estructuras` as e, `total_params` as t,
	`derivado_params` as d, `subderivado_params` as s
WHERE e.`SIGLA_TOTAL` = t.`SIGLA_TOTAL`
	and e.`SIGLA_DERIVADO` = d.`SIGLA_DERIVADO`
	and e.`SIGLA_SUBDERIVADO` = s.`SIGLA_SUBDERIVADO`;







