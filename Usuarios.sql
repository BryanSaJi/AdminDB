alter session set "_ORACLE_SCRIPT" = TRUE;
 
 
--**********************************************************
-- INICIO
--**********************************************************


--**********************************************************
-- CREACION DE USUARIOS PARA ADMINISTRACION DE TABLAS


-- TABLA FACTURA
CREATE USER US_ADMIN_FACTURA IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_ADMIN_FACTURA;
GRANT RESOURCE TO US_ADMIN_FACTURA;
ALTER USER US_ADMIN_FACTURA QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO US_ADMIN_FACTURA;

-- TABLA ENVIO
CREATE USER US_ADMIN_ENVIO IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_ADMIN_ENVIO;
GRANT RESOURCE TO US_ADMIN_ENVIO;
ALTER USER US_ADMIN_ENVIO QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO US_ADMIN_ENVIO;

-- TABLA CARRITO
CREATE USER US_ADMIN_CARRITO IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_ADMIN_CARRITO;
GRANT RESOURCE TO US_ADMIN_CARRITO;
ALTER USER US_ADMIN_CARRITO QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO US_ADMIN_CARRITO;

-- TABLA CARRITOPRODUCTO
CREATE USER US_ADMIN_CARRITOPRODUCTO IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_ADMIN_CARRITOPRODUCTO;
GRANT RESOURCE TO US_ADMIN_CARRITOPRODUCTO;
ALTER USER US_ADMIN_CARRITOPRODUCTO QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO US_ADMIN_CARRITOPRODUCTO;

-- TABLA DETALLEVENTAS
CREATE USER US_ADMIN_DETALLEVENTAS IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_ADMIN_DETALLEVENTAS;
GRANT RESOURCE TO US_ADMIN_DETALLEVENTAS;
ALTER USER US_ADMIN_DETALLEVENTAS QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO US_ADMIN_DETALLEVENTAS;

-- TABLA FORMAPAGO
CREATE USER US_ADMIN_FORMAPAGO IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_ADMIN_FORMAPAGO;
GRANT RESOURCE TO US_ADMIN_FORMAPAGO;
ALTER USER US_ADMIN_FORMAPAGO QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO US_ADMIN_FORMAPAGO;


--**********************************************************
-- CREACION DE USUARIOS DE SISTEMA


-- USUARIO GENERICO
CREATE USER US_GENERICO IDENTIFIED BY Oracle02 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_GENERICO;
ALTER USER US_GENERICO QUOTA UNLIMITED ON TBS_FACTURACION_DATA;

-- USUARIO CLIENTE
CREATE USER US_CLIENTE IDENTIFIED BY Oracle02 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_CLIENTE;
ALTER USER US_CLIENTE QUOTA UNLIMITED ON TBS_FACTURACION_DATA;

-- USUARIO EMPLEADO
CREATE USER US_EMPLEADO IDENTIFIED BY Oracle02 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_EMPLEADO;
ALTER USER US_EMPLEADO QUOTA UNLIMITED ON TBS_FACTURACION_DATA;

-- USUARIO PU_SUPERVISOR
CREATE USER US_SUPERVISOR IDENTIFIED BY Oracle02 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_SUPERVISOR;
ALTER USER US_SUPERVISOR QUOTA UNLIMITED ON TBS_FACTURACION_DATA;

-- USUARIO PU_GERENTE
CREATE USER US_GERENTE IDENTIFIED BY Oracle02 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_GERENTE;
ALTER USER US_GERENTE QUOTA UNLIMITED ON TBS_FACTURACION_DATA;

-- USUARIO PU_GERENTE_GENERAL
CREATE USER US_GERENTE_GENERAL IDENTIFIED BY Oracle02 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO US_GERENTE_GENERAL;
ALTER USER US_GERENTE_GENERAL QUOTA UNLIMITED ON TBS_FACTURACION_DATA;


--**********************************************************
-- FIN
--**********************************************************