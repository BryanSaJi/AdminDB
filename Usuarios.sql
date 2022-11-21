alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE USUARIOS PARA TABLES


CREATE USER ADMIN_KB IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_PERSONAS_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO ADMIN_KB;
GRANT RESOURCE TO ADMIN_KB;
ALTER USER ADMIN_KB QUOTA UNLIMITED ON TBS_PERSONAS_DATA;
GRANT DBA TO ADMIN_KB;






--**********************************************************
-- FIN
--**********************************************************