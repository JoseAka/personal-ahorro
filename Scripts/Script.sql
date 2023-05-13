
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

CREATE TABLE `TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS` (
  	PLANTILLA varchar(255),
  	NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	MASCARA_OBSERVACIONES varchar(255) NOT NULL,
  	IMPORTE_MIN DOUBLE(9,2) NOT NULL,
  	IMPORTE_MAX DOUBLE(9,2) NOT NULL,
  	TIMESTAMP DATETIME not null, 
    PRIMARY KEY (NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX),
    FOREIGN KEY (PLANTILLA) REFERENCES ESTRUCTURAS(PLANTILLA) on delete cascade on update cascade
);

CREATE TABLE `BIZUM_ESTRUCTURAS_DEFINIDAS` (
  	PLANTILLA varchar(255),
  	NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	MASCARA_OBSERVACIONES varchar(255) NOT NULL,
  	IMPORTE_MIN DOUBLE(9,2) NOT NULL,
  	IMPORTE_MAX DOUBLE(9,2) NOT NULL,
  	TIMESTAMP DATETIME not null, 
    PRIMARY KEY (NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX),
    FOREIGN KEY (PLANTILLA) REFERENCES ESTRUCTURAS(PLANTILLA) on delete cascade on update cascade
);


CREATE TABLE `CONCEPTOS_ESTRUCTURADOS` (
    NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	PLANTILLA varchar(255),
  	TIMESTAMP DATETIME not null, 
    PRIMARY KEY (NOMBRE_CONCEPTO),
    FOREIGN KEY (PLANTILLA) REFERENCES ESTRUCTURAS(PLANTILLA) on delete cascade on update cascade
);

CREATE TABLE `ACUMULACION_OPERACIONES` (
 	ID_OPERACION bigint unsigned not null primary key auto_increment,
 	PLANTILLA varchar(255) NOT NULL,
 	ENTIDAD varchar(255) NOT NULL,
    FECHA_CONTABLE DATETIME not null,
    FECHA_VALOR DATETIME not NULL,
  	NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	IMPORTE DOUBLE(9,2) NOT NULL,
  	DIVISA varchar(5) NOT NULL,
  	OBSERVACIONES varchar(255) NOT NULL,
  	TIMESTAMP DATETIME not null, 
    FOREIGN KEY (NOMBRE_CONCEPTO) REFERENCES CONCEPTOS_ESTRUCTURADOS(NOMBRE_CONCEPTO) on delete cascade on update cascade,
    FOREIGN KEY (PLANTILLA) REFERENCES ESTRUCTURAS(PLANTILLA) on delete cascade on update cascade
);

-- ------------------------------------------------------

-- ------------------- DROP TABLE ----------------------- 

DROP TABLE BIZUM_ESTRUCTURAS_DEFINIDAS;

-- ------------------------------------------------------

-- ------------------- INSERTS --------------------------
-- TOTAL_PARAMS
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Ingreso fijo','ING_FIJ');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Ingreso variable','ING_VAR');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Gasto fijo','GAS_FIJ');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Gasto variable','GAS_VAR');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('Ahorro','AHR');
INSERT INTO TOTAL_PARAMS(NOMBRE_TOTAL, SIGLA_TOTAL) VALUES ('#','#');

-- DERIVADO_PARAMS
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Nomina','NOM');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Bizum','BIZ');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Bizum entrante','BIZ_ENT');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Transferencia entrante','TRN_ENT');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Transferencia saliente','TRN_SAL');
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
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Dentista','DEN');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Gimnasio','GYM');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Inversion realizada','INV_REA');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Inversion obtenida','INV_OBT');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Inversion','INV');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Ahorro negativo','AHR_NEG');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('Ahorro positivo','AHR_POS');
INSERT INTO DERIVADO_PARAMS(NOMBRE_DERIVADO, SIGLA_DERIVADO) VALUES ('#','#');

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
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Bazares/Pequeño comercio', 'BAZ_PEC');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Cine', 'CIN');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Compras online', 'COM_ONL');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Gasolina (Repsol - Waylet)', 'REP_WAY');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Gasolina (Otros)', 'GSL_OTR');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Mercadona', 'MER');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Carrefour', 'CAR');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Spar', 'SPA');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('LIDL', 'LDL');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Gadis', 'GAD');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Dia', 'DIA');
INSERT INTO SUBDERIVADO_PARAMS(NOMBRE_SUBDERIVADO, SIGLA_SUBDERIVADO) VALUES ('Coviran', 'COV');
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
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-DIA', 'GAS_VAR', 'SPM', 'DIA');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SPM-COV', 'GAS_VAR', 'SPM', 'COV');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-RET_EFE', 'GAS_VAR', 'RET_EFE', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-BIZ_SAL', 'GAS_VAR', 'BIZ_SAL', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-OSC', 'GAS_VAR', 'OSC', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-SAD', 'GAS_VAR', 'SAD', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-FAR', 'GAS_VAR', 'FAR', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-DEN', 'GAS_VAR', 'DEN', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-GYM', 'GAS_VAR', 'GYM', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('GAS_VAR-TRN_SAL', 'GAS_VAR', 'TRN_SAL', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('INV-INV_REA', 'INV', 'INV_REA', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('INV', '#', 'INV', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('INV-INV_OBT', 'INV', 'INV_OBT', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('AHR-AHR_NEG', 'AHR', 'AHR_NEG', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('AHR-AHR_POS', 'AHR', 'AHR_POS', '#');
INSERT INTO ESTRUCTURAS(PLANTILLA, SIGLA_TOTAL, SIGLA_DERIVADO, SIGLA_SUBDERIVADO) VALUES ('BIZ', '#', 'BIZ', '#');

-- TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS
INSERT INTO TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-CCH-DEV_CCH','Transferencia realizada', 'TRANSFERENCIA COCHE', 208.33,208.33,CURRENT_TIMESTAMP);
INSERT INTO TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Transferencia realizada', 'PLAZA 8 SEPTIEMBRE',174.84, 183.82,CURRENT_TIMESTAMP);
INSERT INTO TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Transferencia realizada', 'PLZ 8SEP',174.84, 183.82, CURRENT_TIMESTAMP);
INSERT INTO TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Transferencia realizada', 'PLAZA 8 SEP', 174.84, 183.82,CURRENT_TIMESTAMP);

-- BIZUM_ESTRUCTURAS_DEFINIDAS
INSERT INTO BIZUM_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Bizum', 'Plz 8 sep', 167.6, 208.14,CURRENT_TIMESTAMP);
INSERT INTO BIZUM_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Bizum', 'Plaza 8 sep', 167.6, 208.14,CURRENT_TIMESTAMP);
INSERT INTO BIZUM_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Bizum', 'Plaza8 sep', 167.6, 208.14,CURRENT_TIMESTAMP);
INSERT INTO BIZUM_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-PIS','Bizum', 'Plaza 8 septiembre', 167.6, 208.14,CURRENT_TIMESTAMP);
INSERT INTO BIZUM_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-CCH-CAC','Bizum', 'Cambio de aceite', 80, 160,CURRENT_TIMESTAMP);
INSERT INTO BIZUM_ESTRUCTURAS_DEFINIDAS(PLANTILLA, NOMBRE_CONCEPTO, MASCARA_OBSERVACIONES, IMPORTE_MIN, IMPORTE_MAX, TIMESTAMP) VALUES ('GAS_FIJ-CCH-IMP_CIR','Bizum', 'Impuesto de circulacion', 35, 50,CURRENT_TIMESTAMP);

-- CONCEPTOS_ESTRUCTURADOS
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('0559-sup.ex.juana de vega','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('100 montaditos','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('369.gadis b.vidal','GAS_VAR-SPM-GAD','2023-05-11 11:53:35'),
	 ('686 gadis menendez pelayo','GAS_VAR-SPM-GAD','2023-05-11 11:53:35'),
	 ('91 salamanca','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Abono de n?mina','ING_FIJ-NOM-NOM_MEN','2023-05-11 11:53:35'),
	 ('Acceso rua sl','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Adeudo easy sport fuengirola','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Adeudo liberty seguros s.a.','GAS_FIJ-CCH-SEG_CCH','2023-05-11 11:53:35'),
	 ('Alambique','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Alimentacion de fresno','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Alimentacion wenzhou','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Arte y souvenirs','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Asador mariscal','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Autoservicios marin art','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Bache urban wear','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Bar capitan hadock','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Bar piper','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Barvel','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Bazar flo','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Bazar nuevo pekin 2','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Bender','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Bendita zafra','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Bershka','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Bizum','BIZ','2023-05-11 11:53:35'),
	 ('Bk21017 hostelerex s.l.','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Buscalibre espa?a s.l.','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Cafe bar copacabana','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafe bar copacabana      villaf barroses','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafe bar moreno','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Cafebarcopacabana','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafeteria casa cultura','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafeteria delcampo','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafeteria europa','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafeteria joy','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafeteria los portales','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Caramelo y sal c.b','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Carref caceres','GAS_VAR-SPM-CAR','2023-05-11 11:53:35'),
	 ('Carrefour rosal','GAS_VAR-SPM-CAR','2023-05-11 11:53:35'),
	 ('Casa del libro','GAS_VAR-OSC','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Catarsis','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Cervezas la virgen','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Charro rock              salamanca    es','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Chiringuito lalo','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Chocolateria valor','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Chocolats','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cine victoria','GAS_VAR-OCI-CIN','2023-05-11 11:53:35'),
	 ('Cines el foro','GAS_VAR-OCI-CIN','2023-05-11 11:53:35'),
	 ('Clinica dental i.a.g','GAS_VAR-DEN','2023-05-11 11:53:35'),
	 ('Comedor universitario','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Copas noray','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Corbacho','GAS_VAR-GYM','2023-05-11 11:53:35'),
	 ('Coviran - ramon de la sag','GAS_VAR-SPM-COV','2023-05-11 11:53:35'),
	 ('Dec ruta de la plata','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Decathlon salamanca','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Delikia alhambra mnmk','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Despazito alimentacion','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Dgt sanciones internet 2 madrid       es','GAS_VAR-SAD','2023-05-11 11:53:35'),
	 ('Dia merida 454','GAS_VAR-SPM-DIA','2023-05-11 11:53:35'),
	 ('E.s la coronada','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('E.s. caceres ii','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E.s. caceres ii          caceres      es','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E.s. camino blanco','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E1259/01 - c ceres-la mej','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('El gran cafe','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('El pequeno gin','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('El rivendel','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('El rivendel              salamanca    es','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Estanco c torreiro','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco caceres16','GAS_VAR-OCI-EST','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Estanco calle prior','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco la coronada','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n:7','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n? 1 salamanca','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n? 5','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n.35 "autobuses"','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Ev. catering la gran fami','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Expendeduria 31','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Expendeduria num. 32','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Expfiliberto','GAS_VAR-OCI-EST','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Exppintor','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Farmacia  san blas','GAS_VAR-FAR','2023-05-11 11:53:35'),
	 ('Farmacia m jose serrano','GAS_VAR-FAR','2023-05-11 11:53:35'),
	 ('Figon cafeteria','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Fom zafra','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Gasoleos cecebre s.l','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('Genio y figura exp n2 vca','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Gran bazar euroyifa','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Grupo la bodeguita submar','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Hiper euro','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Hnos rubio marcario','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Hotel express','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('House plant','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Ingreso en efectivo','ING_VAR-ING_EFE','2023-05-11 11:53:35'),
	 ('J. del sol sanchez estanc','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('J. del sol sanchez estanccaceres      es','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('J.del sol sanchez estanco','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Jd spain sports fashion 2','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Jomevian','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Joyeriaismaelrodriguez','GAS_VAR-OSC','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Juan burguillos','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Just eat spain','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Kashmir donner kebab','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Kindin kandan','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Lacoste com','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Lara farmacia','GAS_VAR-FAR','2023-05-11 11:53:35'),
	 ('Le bistro','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Lidl caceres','GAS_VAR-SPM-LDL','2023-05-11 11:53:35'),
	 ('Lidl caceres ronda','GAS_VAR-SPM-LDL','2023-05-11 11:53:35'),
	 ('Lidl salamanca-la salle','GAS_VAR-SPM-LDL','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Liquidacion de intereses-comisiones-gastos','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Lusitania','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Macdonald carrefour','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Malamadre','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Mecanobra','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Mercadona avda villamayor','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona avda villamayorsalamanca    es','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona c. jesus yuste','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona cc ruta de la p','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona la mejostilla','GAS_VAR-SPM-MER','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Mercadona la mejostilla  caceres      es','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona salas bajas','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Montealba','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Multicines caceres','GAS_VAR-OCI-CIN','2023-05-11 11:53:35'),
	 ('Multitienda sheng','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Multitienda shewg','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Ndarenas caceres','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Num 8                    salamanca    es','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Origen','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pandelino','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Panorama producciones','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Peter''s salamanca','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Peter''s salamanca        salamanca    es','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Petrobierzo restaurant','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pikoteka latarara parq pr','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pintxaki boadilla','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Piper bar','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pizzazafra villafranca','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pollos villafranca','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Produtos el bici','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Pub blues','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pub nuevo darling','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pub parabarap','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pull & bear','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Punto 24 estanco 23 s2','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Regalooriginal.com','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Regalos dandy','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Regalos trotamundos','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Repsol waylet','GAS_VAR-GSL-REP_WAY','2023-05-11 11:53:35'),
	 ('Repsol waylet            madrid       es','GAS_VAR-GSL-REP_WAY','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Restaurante bouquet','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Restaurante nardi cb','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Restaurante rugantino','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Ret. efectivo  a debito con tarj. en cajero. aut.','GAS_VAR-RET_EFE','2023-05-11 11:53:35'),
	 ('Revolut**1154*','GAS_VAR-TRN_SAL','2023-05-11 11:53:35'),
	 ('Ronda oeste s.l.','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('S punto24 estanco cc23','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('S punto24 tienda cc23','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Sala pelicano','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Salon romero restaurante','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Santagloria salamanca','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Snipes salamanca 0022','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Spar san pedro caceres','GAS_VAR-SPM-SPA','2023-05-11 11:53:35'),
	 ('Sq *otro rollo chipiona','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Supermercado dia','GAS_VAR-SPM-DIA','2023-05-11 11:53:35'),
	 ('Supermercados hercas ii','GAS_VAR-SPM-SPA','2023-05-11 11:53:35'),
	 ('T551 harry ruta de la pla','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Taperia la maja','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Tezenis c/toro t535','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('The entertainer','GAS_VAR-OSC','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Trading212uk','INV','2023-05-11 11:53:35'),
	 ('Transferencia recibida','ING_VAR-TRN_ENT','2023-05-11 11:53:35'),
	 ('Traspaso a cuenta','AHR-AHR_POS','2023-05-11 11:53:35'),
	 ('Traspaso desde cuenta','AHR-AHR_NEG','2023-05-11 11:53:35'),
	 ('Underground','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Villafranca barros','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Visionlab 227','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Women secret','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Www zalando es','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Zalando payments','GAS_VAR-OCI-ROP','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,`TIMESTAMP`) VALUES
	 ('Zara internet espana','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Zara salamanca toro 28','GAS_VAR-OCI-ROP','2023-05-11 11:53:35');
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
from TRANFERENCIAS_ESTRUCTURAS_DEFINIDAS;

select *
from BIZUM_ESTRUCTURAS_DEFINIDAS;

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



-- --
-- --
-- COPIAR DE li-front excelFileToCreateRequest() --> leerExcel()






