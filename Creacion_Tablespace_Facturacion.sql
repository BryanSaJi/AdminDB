alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE TABLESPACES Y DATAFILES


-- TBS_FACTURACION_DATA PARA TABLAS

CREATE TABLESPACE TBS_FACTURACION_DATA
    DATAFILE 
    'C:\OracleDataBase\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\FACTURACION\DF_DATA_FACTURACION_01.DBF' SIZE 20M AUTOEXTEND ON,
    'C:\OracleDataBase\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\FACTURACION\DF_DATA_FACTURACION_02.DBF' SIZE 20M AUTOEXTEND ON
    DEFAULT STORAGE ( INITIAL 6M NEXT 4M PCTINCREASE 0 );

-- TBS_FACTURACION_IDX PARA INDICES

CREATE TABLESPACE TBS_FACTURACION_IDX
    DATAFILE 
    'C:\OracleDataBase\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\FACTURACION\DF_FACTURACION_IDX_01.DBF' SIZE 20M AUTOEXTEND ON,
    'C:\OracleDataBase\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\FACTURACION\DF_FACTURACION_IDX_02.DBF' SIZE 20M AUTOEXTEND ON
    DEFAULT STORAGE ( INITIAL 6M NEXT 4M PCTINCREASE 0 );


--**********************************************************
-- ELIMINACION DE TABLESPACES Y DATAFILES


/*DROP TABLESPACE TBS_FACTURACION_DATA INCLUDING CONTENTS CASCADE CONSTRAINTS;*/
/*DROP TABLESPACE TBS_FACTURACION_IDX INCLUDING CONTENTS CASCADE CONSTRAINTS;*/


--**********************************************************
-- FIN
--**********************************************************