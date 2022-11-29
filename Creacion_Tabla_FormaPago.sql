alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE TABLA 

-- SELECT TO_DATE(current_date,'yyyy/mm/dd') from dual;


--CREACION DE TABLA FORMAPAGO 

CREATE TABLE TB_FORMAPAGO(
   IDFORMADEPAGO INTEGER NOT NULL PRIMARY KEY,
   NOMBREFORMAPAGO VARCHAR2(20 BYTE) NOT NULL
   )TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);


--**********************************************************
-- CREACION DE INDICE


--CREACION INDICE TABLA CARRITOPRODUCTO 

CREATE INDEX PK_IDFORMAPAGO
    ON TB_FORMAPAGO(IDFORMAPAGO)
    STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
    TABLESPACE TBS_FACTURACION_IDX;


--**********************************************************
-- ELIMINACION DE TABLE 


/*DDROP TABLE TB_FORMAPAGO;/*
/*DROP INDEX PK_IDFORMAPAGO;*/


--**********************************************************
-- FIN
--**********************************************************