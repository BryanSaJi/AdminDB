alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE TABLA 

-- SELECT TO_DATE(current_date,'yyyy/mm/dd') from dual;


--CREACION DE TABLA CARRITO

CREATE TABLE TB_CARRITO (
   IDCARRITO INTEGER NOT NULL PRIMARY KEY,
   ESTADO DATE NOT NULL,
   IDCLIENTE INTEGER NOT NULL
   )TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);


--**********************************************************
-- CREACION DE INDICE


--CREACION INDICE TABLA CARRITO

CREATE INDEX PK_IDCARRITO
    ON TB_CARRITO(IDCARRITO)
    STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
    TABLESPACE TBS_FACTURACION_IDX;


--**********************************************************
-- ELIMINACION DE TABLE


/*DDROP TABLE TB_CARRITO;/*
/*DROP INDEX PK_IDCARRITO;*/


--**********************************************************
-- FIN
--**********************************************************