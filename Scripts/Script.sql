
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

CREATE TABLE `ESTRUCTURAS_CONDICIONADAS` (
  	PLANTILLA varchar(255),
  	NOMBRE_CONCEPTO varchar(255) NOT NULL,
  	MASCARA_OBSERVACIONES varchar(255) NOT NULL,
  	IMPORTE_MIN DOUBLE(9,2) NOT NULL,
  	IMPORTE_MAX DOUBLE(9,2) NOT NULL,
  	TIMESTAMP_EXECUTED DATETIME not null, 
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
  	DIVISA_IMPORTE varchar(5) NOT NULL,
  	DISPONIBLE DOUBLE(9,2) NOT NULL,
  	DIVISA_DISPONIBLE varchar(5) NOT NULL,
  	OBSERVACIONES varchar(255) NOT NULL,
  	TIMESTAMP DATETIME not null, 
    FOREIGN KEY (NOMBRE_CONCEPTO) REFERENCES CONCEPTOS_ESTRUCTURADOS(NOMBRE_CONCEPTO) on delete cascade on update cascade,
    FOREIGN KEY (PLANTILLA) REFERENCES ESTRUCTURAS(PLANTILLA) on delete cascade on update cascade
);

-- ------------------------------------------------------

-- ------------------- DROP TABLE ----------------------- 

DROP TABLE tranferencias_estructuras_definidas;

-- ------------------------------------------------------

-- ------------------- INSERTS --------------------------
-- TOTAL_PARAMS
INSERT INTO TOTAL_PARAMS (NOMBRE_TOTAL,SIGLA_TOTAL) VALUES
	 ('#','#'),
	 ('Ahorro','AHR'),
	 ('Gasto fijo','GAS_FIJ'),
	 ('Gasto variable','GAS_VAR'),
	 ('Ingreso fijo','ING_FIJ'),
	 ('Ingreso variable','ING_VAR');

-- DERIVADO_PARAMS
INSERT INTO DERIVADO_PARAMS (NOMBRE_DERIVADO,SIGLA_DERIVADO) VALUES
	 ('#','#'),
	 ('Ahorro negativo','AHR_NEG'),
	 ('Ahorro positivo','AHR_POS'),
	 ('Bizum','BIZ'),
	 ('Bizum entrante','BIZ_ENT'),
	 ('Bizum Saliente','BIZ_SAL'),
	 ('Coche','CCH'),
	 ('Dentista','DEN'),
	 ('Devolucion pretamo movil','DEV_MOV'),
	 ('Farmacia','FAR');
INSERT INTO DERIVADO_PARAMS (NOMBRE_DERIVADO,SIGLA_DERIVADO) VALUES
	 ('Gasolina','GSL'),
	 ('Gimnasio','GYM'),
	 ('Ingreso en efectivo','ING_EFE'),
	 ('Inversion','INV'),
	 ('Inversion obtenida','INV_OBT'),
	 ('Inversion realizada','INV_REA'),
	 ('Nomina','NOM'),
	 ('Ocio','OCI'),
	 ('Otros/Sin categorizar','OSC'),
	 ('Piso','PIS');
INSERT INTO DERIVADO_PARAMS (NOMBRE_DERIVADO,SIGLA_DERIVADO) VALUES
	 ('Retiro en efectivo','RET_EFE'),
	 ('Sanciones administrativas','SAD'),
	 ('Supermercados','SPM'),
	 ('Transferencia entrante','TRN_ENT'),
	 ('Transferencia saliente','TRN_SAL');

-- SUBDERIVADO_PARAMS
INSERT INTO SUBDERIVADO_PARAMS (NOMBRE_SUBDERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('#','#'),
	 ('Bazares/Pequeño comercio','BAZ_PEC'),
	 ('Cambio de aceite','CAC'),
	 ('Carrefour','CAR'),
	 ('Cine','CIN'),
	 ('Compras online','COM_ONL'),
	 ('Coviran','COV'),
	 ('Devolucion pretamo coche','DEV_CCH'),
	 ('Dia','DIA'),
	 ('Discotecas','DIS');
INSERT INTO SUBDERIVADO_PARAMS (NOMBRE_SUBDERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('Estanco','EST'),
	 ('Gadis','GAD'),
	 ('Gasolina (Otros)','GSL_OTR'),
	 ('Gasolina (Repsol - Waylet)','REP_WAY'),
	 ('Impuesto de circulacion','IMP_CIR'),
	 ('LIDL','LDL'),
	 ('Mercadona','MER'),
	 ('Nomina extra','NOM_EXT'),
	 ('Nomina mensual','NOM_MEN'),
	 ('Restaurantes/Bares','RES_BAR');
INSERT INTO SUBDERIVADO_PARAMS (NOMBRE_SUBDERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('Ropa','ROP'),
	 ('Seguro coche','SEG_CCH'),
	 ('Spar','SPA');

-- ESTRUCTURAS
INSERT INTO ESTRUCTURAS (PLANTILLA,SIGLA_TOTAL,SIGLA_DERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('#','#','#','#'),
	 ('AHR-AHR_NEG','AHR','AHR_NEG','#'),
	 ('AHR-AHR_POS','AHR','AHR_POS','#'),
	 ('BIZ','#','BIZ','#'),
	 ('GAS_FIJ-CCH-CAC','GAS_FIJ','CCH','CAC'),
	 ('GAS_FIJ-CCH-DEV_CCH','GAS_FIJ','CCH','DEV_CCH'),
	 ('GAS_FIJ-CCH-IMP_CIR','GAS_FIJ','CCH','IMP_CIR'),
	 ('GAS_FIJ-CCH-SEG_CCH','GAS_FIJ','CCH','SEG_CCH'),
	 ('GAS_FIJ-DEV_MOV','GAS_FIJ','DEV_MOV','#'),
	 ('GAS_FIJ-PIS','GAS_FIJ','PIS','#');
INSERT INTO ESTRUCTURAS (PLANTILLA,SIGLA_TOTAL,SIGLA_DERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('GAS_VAR-BIZ_SAL','GAS_VAR','BIZ_SAL','#'),
	 ('GAS_VAR-DEN','GAS_VAR','DEN','#'),
	 ('GAS_VAR-FAR','GAS_VAR','FAR','#'),
	 ('GAS_VAR-GSL-GSL_OTR','GAS_VAR','GSL','GSL_OTR'),
	 ('GAS_VAR-GSL-REP_WAY','GAS_VAR','GSL','REP_WAY'),
	 ('GAS_VAR-GYM','GAS_VAR','GYM','#'),
	 ('GAS_VAR-OCI-BAZ_PEC','GAS_VAR','OCI','BAZ_PEC'),
	 ('GAS_VAR-OCI-CIN','GAS_VAR','OCI','CIN'),
	 ('GAS_VAR-OCI-COM_ONL','GAS_VAR','OCI','COM_ONL'),
	 ('GAS_VAR-OCI-DIS','GAS_VAR','OCI','DIS');
INSERT INTO ESTRUCTURAS (PLANTILLA,SIGLA_TOTAL,SIGLA_DERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('GAS_VAR-OCI-EST','GAS_VAR','OCI','EST'),
	 ('GAS_VAR-OCI-RES_BAR','GAS_VAR','OCI','RES_BAR'),
	 ('GAS_VAR-OCI-ROP','GAS_VAR','OCI','ROP'),
	 ('GAS_VAR-OSC','GAS_VAR','OSC','#'),
	 ('GAS_VAR-RET_EFE','GAS_VAR','RET_EFE','#'),
	 ('GAS_VAR-SAD','GAS_VAR','SAD','#'),
	 ('GAS_VAR-SPM-CAR','GAS_VAR','SPM','CAR'),
	 ('GAS_VAR-SPM-COV','GAS_VAR','SPM','COV'),
	 ('GAS_VAR-SPM-DIA','GAS_VAR','SPM','DIA'),
	 ('GAS_VAR-SPM-GAD','GAS_VAR','SPM','GAD');
INSERT INTO ESTRUCTURAS (PLANTILLA,SIGLA_TOTAL,SIGLA_DERIVADO,SIGLA_SUBDERIVADO) VALUES
	 ('GAS_VAR-SPM-LDL','GAS_VAR','SPM','LDL'),
	 ('GAS_VAR-SPM-MER','GAS_VAR','SPM','MER'),
	 ('GAS_VAR-SPM-SPA','GAS_VAR','SPM','SPA'),
	 ('GAS_VAR-TRN_SAL','GAS_VAR','TRN_SAL','#'),
	 ('ING_FIJ-NOM-NOM_EXT','ING_FIJ','NOM','NOM_EXT'),
	 ('ING_FIJ-NOM-NOM_MEN','ING_FIJ','NOM','NOM_MEN'),
	 ('ING_VAR-BIZ_ENT','ING_VAR','BIZ_ENT','#'),
	 ('ING_VAR-ING_EFE','ING_VAR','ING_EFE','#'),
	 ('ING_VAR-TRN_ENT','ING_VAR','TRN_ENT','#'),
	 ('INV','#','INV','#');

-- ESTRUCTURAS_CONDICIONADAS
INSERT INTO ESTRUCTURAS_CONDICIONADAS (PLANTILLA,NOMBRE_CONCEPTO,MASCARA_OBSERVACIONES,IMPORTE_MIN,IMPORTE_MAX,TIMESTAMP_EXECUTED) VALUES
	 ('GAS_FIJ-PIS','Transferencia realizada','PLAZA 8 SEP',167.6,208.14,'2023-05-12 14:04:34'),
	 ('GAS_FIJ-PIS','Transferencia realizada','PLAZA 8 SEPTIEMBRE',167.6,208.14,'2023-05-12 14:04:34'),
	 ('GAS_FIJ-PIS','Transferencia realizada','PLZ 8SEP',167.6,208.14,'2023-05-12 14:04:34'),
	 ('GAS_FIJ-CCH-DEV_CCH','Transferencia realizada','TRANSFERENCIA COCHE',208.33,208.33,'2023-05-12 14:04:26');
INSERT INTO ESTRUCTURAS_CONDICIONADAS (PLANTILLA,NOMBRE_CONCEPTO,MASCARA_OBSERVACIONES,IMPORTE_MIN,IMPORTE_MAX,TIMESTAMP_EXECUTED) VALUES
	 ('GAS_FIJ-CCH-CAC','Bizum','Cambio de aceite',80.0,160.0,'2023-05-13 01:44:46'),
	 ('GAS_FIJ-CCH-IMP_CIR','Bizum','Impuesto de circulacion',35.0,50.0,'2023-05-13 01:44:47'),
	 ('GAS_FIJ-PIS','Bizum','Plaza 8 sep',167.6,208.14,'2023-05-13 01:44:42'),
	 ('GAS_FIJ-PIS','Bizum','Plaza 8 septiembre',167.6,208.14,'2023-05-13 01:44:45'),
	 ('GAS_FIJ-PIS','Bizum','Plaza8 sep',167.6,208.14,'2023-05-13 01:44:44'),
	 ('GAS_FIJ-PIS','Bizum','Plz 8 sep',167.6,208.14,'2023-05-13 01:44:41');
	
-- CONCEPTOS_ESTRUCTURADOS
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('0559-sup.ex.juana de vega','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('100 montaditos','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('369.gadis b.vidal','GAS_VAR-SPM-GAD','2023-05-11 11:53:35'),
	 ('686 gadis menendez pelayo','GAS_VAR-SPM-GAD','2023-05-11 11:53:35'),
	 ('91 salamanca','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Abono de nomina','ING_FIJ-NOM-NOM_MEN','2023-05-11 11:53:35'),
	 ('Acceso rua sl','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Adeudo easy sport fuengirola, s.l.','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Adeudo liberty seguros s.a.','GAS_FIJ-CCH-SEG_CCH','2023-05-11 11:53:35'),
	 ('Alambique','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
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
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Bazar nuevo pekin 2','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Bender','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Bendita zafra','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Bershka','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Bizum','BIZ','2023-05-11 11:53:35'),
	 ('Bk21017 hostelerex s.l.','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Buscalibre espana s.l.','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Cafe bar copacabana','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafe bar copacabana      villaf barroses','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Cafe bar moreno','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
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
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
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
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Copas noray','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Corbacho','GAS_VAR-GYM','2023-05-11 11:53:35'),
	 ('Coviran - ramon de la sag','GAS_VAR-SPM-COV','2023-05-11 11:53:35'),
	 ('Dec ruta de la plata','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Decathlon salamanca','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Delikia alhambra mnmk','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Despazito alimentacion','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Despazito alimentacion, s','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Dgt sanciones internet 2 madrid       es','GAS_VAR-SAD','2023-05-11 11:53:35'),
	 ('Dia merida 454','GAS_VAR-SPM-DIA','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('E.s la coronada','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E.s. caceres ii','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E.s. caceres ii          caceres      es','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E.s. camino blanco','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('E1259/01 - c ceres-la mej','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('El gran cafe','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('El pequeno gin','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('El rivendel','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('El rivendel              salamanca    es','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Estanco c torreiro','GAS_VAR-OCI-EST','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Estanco caceres16','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco calle prior','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco la coronada','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n 1 salamanca','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n 5','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n:7','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Estanco n.35 "autobuses"','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Ev. catering la gran fami','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Expendeduria 31','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Expendeduria num. 32','GAS_VAR-OCI-EST','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Expfiliberto','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Exppintor','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Farmacia  san blas','GAS_VAR-FAR','2023-05-11 11:53:35'),
	 ('Farmacia m jose serrano','GAS_VAR-FAR','2023-05-11 11:53:35'),
	 ('Figon cafeteria','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Fom zafra','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Gasoleos cecebre s.l','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('Genio y figura exp n2 vca','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Gran bazar euroyifa','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Grupo la bodeguita submar','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Hiper euro','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Hnos rubio marcario','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Hotel express','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('House plant','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Ingreso en efectivo','ING_VAR-ING_EFE','2023-05-11 11:53:35'),
	 ('J. del sol sanchez estanc','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('J. del sol sanchez estanccaceres      es','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('J.del sol sanchez estanco','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Jd spain sports fashion 2','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Jomevian','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Joyeriaismaelrodriguez','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Juan burguillos','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Just eat spain, s.l.','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Kashmir donner kebab','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Kindin kandan','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Lacoste com','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Lara farmacia','GAS_VAR-FAR','2023-05-11 11:53:35'),
	 ('Le bistro','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Lidl caceres','GAS_VAR-SPM-LDL','2023-05-11 11:53:35'),
	 ('Lidl caceres ronda','GAS_VAR-SPM-LDL','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Lidl salamanca-la salle','GAS_VAR-SPM-LDL','2023-05-11 11:53:35'),
	 ('Liquidacion de intereses-comisiones-gastos','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Lusitania','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Macdonald carrefour','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Malamadre','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Mecanobra','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Mercadona avda villamayor','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona avda villamayorsalamanca    es','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona c. jesus yuste','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona cc ruta de la p','GAS_VAR-SPM-MER','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Mercadona la mejostilla','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona la mejostilla  caceres      es','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Mercadona salas bajas','GAS_VAR-SPM-MER','2023-05-11 11:53:35'),
	 ('Montealba','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Multicines caceres','GAS_VAR-OCI-CIN','2023-05-11 11:53:35'),
	 ('Multitienda sheng','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Multitienda shewg, s.l','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Ndarenas caceres','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Num 8                    salamanca    es','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Origen','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Pandelino','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Panorama producciones','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Peter''s salamanca','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Peter''s salamanca        salamanca    es','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Petrobierzo restaurant','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pikoteka latarara parq pr','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pintxaki boadilla','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Piper bar','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pizzazafra villafranca','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Pollos villafranca','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Produtos el bici, s.l.','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Pub blues','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pub nuevo darling','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pub parabarap','GAS_VAR-OCI-DIS','2023-05-11 11:53:35'),
	 ('Pull & bear','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Punto 24 estanco 23 s2','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('Regalooriginal.com','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Regalos dandy','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Regalos trotamundos','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Repsol waylet','GAS_VAR-GSL-REP_WAY','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Repsol waylet            madrid       es','GAS_VAR-GSL-REP_WAY','2023-05-11 11:53:35'),
	 ('Restaurante bouquet','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Restaurante nardi cb','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Restaurante rugantino','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Ret. efectivo  a debito con tarj. en cajero. aut.','GAS_VAR-RET_EFE','2023-05-11 11:53:35'),
	 ('Revolut**1154*','GAS_VAR-TRN_SAL','2023-05-11 11:53:35'),
	 ('Ronda oeste s.l.','GAS_VAR-GSL-GSL_OTR','2023-05-11 11:53:35'),
	 ('S punto24 estanco cc23','GAS_VAR-OCI-EST','2023-05-11 11:53:35'),
	 ('S punto24 tienda cc23','GAS_VAR-OCI-BAZ_PEC','2023-05-11 11:53:35'),
	 ('Sala pelicano','GAS_VAR-OCI-DIS','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Salon romero restaurante','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Santagloria salamanca','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Snipes salamanca 0022','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Spar san pedro caceres','GAS_VAR-SPM-SPA','2023-05-11 11:53:35'),
	 ('Sq *otro rollo chipiona','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Supermercado dia','GAS_VAR-SPM-DIA','2023-05-11 11:53:35'),
	 ('Supermercados hercas ii','GAS_VAR-SPM-SPA','2023-05-11 11:53:35'),
	 ('T551 harry ruta de la pla','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Taperia la maja','GAS_VAR-OCI-RES_BAR','2023-05-11 11:53:35'),
	 ('Tezenis c/toro t535','GAS_VAR-OCI-ROP','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('The entertainer','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Trading212uk','INV','2023-05-11 11:53:35'),
	 ('Transferencia realizada','GAS_VAR-TRN_SAL','2023-05-11 11:53:35'),
	 ('Transferencia recibida','ING_VAR-TRN_ENT','2023-05-11 11:53:35'),
	 ('Traspaso a cuenta','AHR-AHR_POS','2023-05-11 11:53:35'),
	 ('Traspaso desde cuenta','AHR-AHR_NEG','2023-05-11 11:53:35'),
	 ('Underground','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Villafranca barros','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Visionlab 227','GAS_VAR-OSC','2023-05-11 11:53:35'),
	 ('Women secret','GAS_VAR-OCI-ROP','2023-05-11 11:53:35');
INSERT INTO CONCEPTOS_ESTRUCTURADOS (NOMBRE_CONCEPTO,PLANTILLA,TIMESTAMP_EXECUTED) VALUES
	 ('Www zalando es','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
	 ('Zalando payments','GAS_VAR-OCI-ROP','2023-05-11 11:53:35'),
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
from ESTRUCTURAS_CONDICIONADAS;

select *
from CONCEPTOS_ESTRUCTURADOS;
-- where NOMBRE_CONCEPTO like '%Adeudo easy sport fuengirola%';

-- delete
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


-- ACUMULACION DE GASTOS FIJOS GASTOS FIJOS AGRUPADOS POR PLANTILLAS DE 2022
select PLANTILLA, abs(sum(IMPORTE)), count(*), abs(sum(IMPORTE))/count(*) as media
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%GAS_FIJ%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d') )
group by PLANTILLA;

-- ACUMULACION DE GASTOS FIJOS VARIABLES FIJOS AGRUPADOS POR PLANTILLAS DE 2022
select PLANTILLA, abs(sum(IMPORTE)), count(*), abs(sum(IMPORTE))/count(*) as media
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%GAS_VAR%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d') )
group by PLANTILLA;

-- ACUMULACION INGRESOS FIJOS AGRUPADOS POR PLANTILLAS DE 2022
select PLANTILLA, abs(sum(IMPORTE)), count(*), abs(sum(IMPORTE))/count(*) as media
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%ING_FIJ%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d') )
group by PLANTILLA;

-- ACUMULACION DE INGRESOS VARIABLES AGRUPADOS POR PLANTILLAS DE 2022
select PLANTILLA, abs(sum(IMPORTE)), count(*), abs(sum(IMPORTE))/count(*) as media
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%ING_VAR%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d') )
group by PLANTILLA;

-- ACUMULACION DE INGRESOS VARIABLES AGRUPADOS POR PLANTILLAS DE 2022
select PLANTILLA, abs(sum(IMPORTE)), count(*), abs(sum(IMPORTE))/count(*) as media
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%ING_VAR%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d') )
group by PLANTILLA;

-- ACUMULACION DE AHORROS AGRUPADOS POR PLANTILLAS DE 2022
select PLANTILLA, abs(sum(IMPORTE)), count(*), abs(sum(IMPORTE))/count(*) as media
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%AHR%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d') )
group by PLANTILLA;

-- ACUMULACION DE INVERSIONES AGRUPADOS POR PLANTILLAS DE 2022
select sum(IMPORTE) 
from ACUMULACION_OPERACIONES
where PLANTILLA LIKE '%INV%'
	and (FECHA_VALOR <= STR_TO_DATE('2022-12-31', '%Y-%m-%d') 
		or FECHA_VALOR >=  STR_TO_DATE('2022-01-01', '%Y-%m-%d'));

	
-- ------------------------------- 
-- ------------------------------- 
-- COMBOS SELECTS
-- ------------------------------- 
-- ------------------------------- 
	
SELECT distinct t.NOMBRE_TOTAL, t.SIGLA_TOTAL
FROM estructuras as e, total_params as t
WHERE e.SIGLA_TOTAL = t.SIGLA_TOTAL
	AND e.SIGLA_TOTAL != '#';
	
	
SELECT distinct d.SIGLA_DERIVADO, d.`NOMBRE_DERIVADO`
FROM `estructuras` as e, `total_params` as t,
	`derivado_params` as d, `subderivado_params` as s
WHERE e.`SIGLA_TOTAL` = t.`SIGLA_TOTAL`
	and e.`SIGLA_DERIVADO` = d.`SIGLA_DERIVADO`
	and e.`SIGLA_SUBDERIVADO` = s.`SIGLA_SUBDERIVADO`
	and e.`SIGLA_TOTAL` = :totalParam; 
	
	
SELECT -- e.`PLANTILLA`,
	-- t.`NOMBRE_TOTAL`, t.SIGLA_TOTAL,
	distinct d.`NOMBRE_DERIVADO`, d.SIGLA_DERIVADO
	-- s.`NOMBRE_SUBDERIVADO`, s.SIGLA_SUBDERIVADO 
FROM `estructuras` as e, `total_params` as t,
	`derivado_params` as d, `subderivado_params` as s
WHERE e.`SIGLA_TOTAL` = t.`SIGLA_TOTAL`
	and e.`SIGLA_DERIVADO` = d.`SIGLA_DERIVADO`
	and e.`SIGLA_SUBDERIVADO` = s.`SIGLA_SUBDERIVADO`
	and e.`SIGLA_TOTAL` = 'GAS_VAR';


