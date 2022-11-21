alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE TABLA 

-- SELECT TO_DATE(current_date,'yyyy/mm/dd') from dual;


--CREACION DE TABLA ENVIO

CREATE TABLE TB_ENVIO (
    IDENVIO INTEGER NOT NULL ENABLE, 
    IDDETALLEVENTA INTEGER NOT NULL ENABLE, 	
    IDCLIENTE INTEGER NOT NULL ENABLE, 
    ESTADOENVIO VARCHAR2(20 BYTE) NOT NULL ENABLE
    )TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
   PARTITION BY RANGE (MVM_FECHA) (
     PARTITION MVM_BEFORE_202201 VALUES LESS THAN (TO_DATE('2022/01/01','yyyy/mm/dd')),
     PARTITION MVM_202201_202202 VALUES LESS THAN (TO_DATE('2022/03/01','yyyy/mm/dd')),
     PARTITION MVM_202203_202204 VALUES LESS THAN (TO_DATE('2022/05/01','yyyy/mm/dd')),
     PARTITION MVM_202205_202206 VALUES LESS THAN (TO_DATE('2022/07/01','yyyy/mm/dd')),
     PARTITION MVM_202207_202208 VALUES LESS THAN (TO_DATE('2022/09/01','yyyy/mm/dd')),
     PARTITION MVM_202209_202210 VALUES LESS THAN (TO_DATE('2022/11/01','yyyy/mm/dd')),
     PARTITION MVM_202211_202212 VALUES LESS THAN (TO_DATE('20213/01/01','yyyy/mm/dd')),
     PARTITION MVM_202301_202302 VALUES LESS THAN (TO_DATE('2023/03/01','yyyy/mm/dd')),
     PARTITION MVM_202303_202304 VALUES LESS THAN (TO_DATE('2023/05/01','yyyy/mm/dd')),
     PARTITION MVM_202305_202306 VALUES LESS THAN (TO_DATE('2023/07/01','yyyy/mm/dd')),
     PARTITION MVM_202307_202308 VALUES LESS THAN (TO_DATE('2023/09/01','yyyy/mm/dd')),
     PARTITION MVM_202309_202310 VALUES LESS THAN (TO_DATE('2023/11/01','yyyy/mm/dd')),
     PARTITION MVM_202311_202312 VALUES LESS THAN (MAXVALUE)
   );


--**********************************************************
-- CREACION DE INDICE


--CREACION INDICE TABLA FACTURA

CREATE INDEX PK_IDENVIO
    ON TB_ENVIO(IDENVIO)
    STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
    TABLESPACE TBS_FACTURACION_IDX;


--**********************************************************
-- ELIMINACION DE TABLESPACES Y DATAFILES


/*DDROP TABLE TB_ENVIO;/*
/*DROP INDEX PK_IDENVIO;*/


--**********************************************************
-- FIN
--**********************************************************