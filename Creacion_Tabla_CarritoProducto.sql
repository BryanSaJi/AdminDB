alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE TABLA 

-- SELECT TO_DATE(current_date,'yyyy/mm/dd') from dual;


--CREACION DE TABLA CARRITOPRODUCTO 

CREATE TABLE TB_CARRITOPRODUCTO (
   IDCARRITO INTEGER NOT NULL PRIMARY KEY,
   IDPRODUCTO INTEGER NOT NULL PRIMARY KEY,
   ESTADOCOMPRA VARCHAR2(20 BYTE) NOT NULL,
   CANTIDAD INTEGER NOT NULL
   )TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);


--**********************************************************
-- CREACION DE INDICE


--CREACION INDICE TABLA CARRITOPRODUCTO 

CREATE INDEX PK_IDCARRITOPRODUCTO
    ON TB_CARRITOPRODUCTO(IDCARRITOPRODUCTO)
    STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
    TABLESPACE TBS_FACTURACION_IDX;


--**********************************************************
-- ELIMINACION DE TABLE


/*DDROP TABLE TB_CARRITOPRODUCTO;/*
/*DROP INDEX PK_IDCARRITOPRODUCTO;*/


--**********************************************************
-- FIN
--**********************************************************