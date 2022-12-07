ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

--------------------------------------------------------------------------------
--NOTAS
--------------------------------------------------------------------------------
--1. Debe revisarse la ruta de los tablespace antes de ejecutar.
--2. Deben crearse las siguientes carpetas en la ruta para datafiles:
--   a) Personas
--   b) Inventario
--   c) Facturacion

--------------------------------------------------------------------------------
--ELIMINAR USUARIOS
--------------------------------------------------------------------------------
DROP USER ADMIN_PERSONA CASCADE;
DROP USER ADMIN_INVENTARIO CASCADE;
DROP USER ADMIN_FACTURA CASCADE;

DROP USER US_GENERICO CASCADE;
DROP USER US_CLIENTE CASCADE;
DROP USER US_EMPLEADO CASCADE;
DROP USER US_SUPERVISOR CASCADE;
DROP USER US_GERENTE CASCADE;
DROP USER US_GERENTE_GENERAL CASCADE;

--------------------------------------------------------------------------------
--ELIMINAR PERFILES
--------------------------------------------------------------------------------
DROP PROFILE PU_EMPLEADO CASCADE;
DROP PROFILE PU_CLIENTE CASCADE;
DROP PROFILE PU_CLIENTE_GENERICO CASCADE;
DROP PROFILE PU_SUPERVISOR CASCADE;
DROP PROFILE PU_ADMINISTRADOR_TABLAS CASCADE;
DROP PROFILE PU_GERENTE CASCADE;
DROP PROFILE PU_GERENTE_GENERAL CASCADE;

--------------------------------------------------------------------------------
--ELIMINAR TABLESPACES
--------------------------------------------------------------------------------
DROP TABLESPACE TBS_PERSONAS_DATA INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE TBS_PERSONAS_IDX INCLUDING CONTENTS AND DATAFILES;

DROP TABLESPACE TBS_INVENTARIO_DATA INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE TBS_INVENTARIO_IDX INCLUDING CONTENTS AND DATAFILES;

DROP TABLESPACE TBS_FACTURACION_DATA INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE TBS_FACTURACION_IDX INCLUDING CONTENTS AND DATAFILES;

--------------------------------------------------------------------------------
--CREAR TABLESPACES
--------------------------------------------------------------------------------
CREATE TABLESPACE TBS_PERSONAS_DATA DATAFILE 
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Personas\Personas_Data01.DBF' SIZE 50M AUTOEXTEND ON,
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Personas\Personas_Data02.DBF' SIZE 50M AUTOEXTEND ON
    DEFAULT STORAGE (INITIAL 50M NEXT 5M PCTINCREASE 0);

CREATE TABLESPACE TBS_PERSONAS_IDX DATAFILE 
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Personas\Personas_Idx01.DBF' SIZE 50M,
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Personas\Personas_Idx02.DBF' SIZE 50M
    DEFAULT STORAGE (INITIAL 50M NEXT 5M PCTINCREASE 0);

CREATE TABLESPACE TBS_INVENTARIO_DATA DATAFILE
      'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Inventario\Inventario_Data01.DBF' SIZE 10M AUTOEXTEND ON,
      'C:\DataBases\Oracle19c\oradata\RESTEXP\DATAFILES\Inventario\Inventario_Data02.DBF' SIZE 10M AUTOEXTEND ON
      DEFAULT STORAGE (INITIAL 10M NEXT 5M PCTINCREASE 0);

CREATE TABLESPACE TBS_INVENTARIO_IDX DATAFILE
      'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Inventario\Inventario_Idx01.DBF' SIZE 10M AUTOEXTEND ON,
      'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Inventario\Inventario_Idx02.DBF' SIZE 10M AUTOEXTEND ON
      DEFAULT STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0);
      
CREATE TABLESPACE TBS_FACTURACION_DATA DATAFILE 
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Facturacion\Facturacion_Data01.DBF' SIZE 20M AUTOEXTEND ON,
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Facturacion\Facturacion_Data02.DBF' SIZE 20M AUTOEXTEND ON
    DEFAULT STORAGE (INITIAL 6M NEXT 4M PCTINCREASE 0);

CREATE TABLESPACE TBS_FACTURACION_IDX DATAFILE 
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Facturacion\Facturacion_Idx01.DBF' SIZE 20M AUTOEXTEND ON,
    'C:\Databases\Oracle19c\oradata\RESTEXP\DATAFILES\Facturacion\Facturacion_Idx02.DBF' SIZE 20M AUTOEXTEND ON
    DEFAULT STORAGE (INITIAL 6M NEXT 4M PCTINCREASE 0);
    
--------------------------------------------------------------------------------
--CREAR USUARIOS
--------------------------------------------------------------------------------
CREATE USER ADMIN_PERSONA IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_PERSONAS_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO ADMIN_PERSONA;
GRANT RESOURCE TO ADMIN_PERSONA;
GRANT CREATE TABLE TO ADMIN_PERSONA;
ALTER USER ADMIN_PERSONA QUOTA UNLIMITED ON TBS_PERSONAS_DATA;
GRANT DBA TO ADMIN_PERSONA;

CREATE USER ADMIN_INVENTARIO IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_INVENTARIO_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO ADMIN_INVENTARIO;
GRANT RESOURCE TO ADMIN_INVENTARIO;
GRANT CREATE TABLE TO ADMIN_INVENTARIO;
ALTER USER ADMIN_INVENTARIO QUOTA UNLIMITED ON TBS_INVENTARIO_DATA;
GRANT DBA TO ADMIN_INVENTARIO;

CREATE USER ADMIN_FACTURA IDENTIFIED BY Oracle01 DEFAULT TABLESPACE TBS_FACTURACION_DATA TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO ADMIN_FACTURA;
GRANT RESOURCE TO ADMIN_FACTURA;
GRANT CREATE TABLE TO ADMIN_FACTURA; 
ALTER USER ADMIN_FACTURA QUOTA UNLIMITED ON TBS_FACTURACION_DATA;
GRANT DBA TO ADMIN_FACTURA;

--------------------------------------------------------------------------------
--CREACION TABLAS TBS_PERSONAS_DATA
--------------------------------------------------------------------------------
CREATE TABLE ADMIN_PERSONA.TB_PERSONA(
    IDPERSONA INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 5M PCTINCREASE 0),
    NOMBRE VARCHAR2(20) NOT NULL ENABLE,
    APELLIDO1 VARCHAR2(20) NOT NULL ENABLE,
    APELLIDO2 VARCHAR2(20) NOT NULL ENABLE,
    CEDULA VARCHAR2(10) NOT NULL ENABLE,
    TELEFONO VARCHAR2(20) NOT NULL ENABLE,
    NOMBREUSUARIO VARCHAR2(20) NOT NULL ENABLE,
    CLAVEUSUARIO VARCHAR2(20) NOT NULL ENABLE,
    IDDIRECCION INTEGER NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 5M PCTINCREASE 0);

--CREACION DE TABLA EMPLEADO
CREATE TABLE ADMIN_PERSONA.TB_EMPLEADO(
    IDEMPLEADO NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    IDROL NUMBER(*,0) NOT NULL ENABLE, 
    IDPERSONA NUMBER(*,0) NOT NULL ENABLE, 
    ESTADO NUMBER(*,0) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA ROLEMPLEADO
CREATE TABLE ADMIN_PERSONA.TB_ROLEMPLEADO(
    IDROLEMPLEADO NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0),
    ROLEMPLEADO VARCHAR2(20 BYTE) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA PROVINCIA
CREATE TABLE ADMIN_PERSONA.TB_PROVINCIA(
    IDPROVINCIA NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    NOMBREPROVINCIA VARCHAR2(20 BYTE) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA CANTON
CREATE TABLE ADMIN_PERSONA.TB_CANTON(
    IDCANTON NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0),
    NOMBRECANTON VARCHAR2(20 BYTE) NOT NULL ENABLE,
    IDPROVINCIA NUMBER(*,0) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA DISTRITO
CREATE TABLE ADMIN_PERSONA.TB_DISTRITO(
    IDDISTRITO NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    NOMBREDISTRITO VARCHAR2(20 BYTE) NOT NULL ENABLE, 
    IDCANTON NUMBER(*,0) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA DIRECCION
CREATE TABLE ADMIN_PERSONA.TB_DIRECCION(
    IDDIRECCION NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    DETALLEDIRECCION VARCHAR2(150 BYTE) NOT NULL ENABLE, 
    IDDISTRITO NUMBER(*,0) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA CLIENTE
CREATE TABLE ADMIN_PERSONA.TB_CLIENTE(
    IDCLIENTE NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 5M PCTINCREASE 0), 
    IDPERSONA NUMBER(*,0) NOT NULL ENABLE, 
    IDMEMBRESIA NUMBER(*,0) NOT NULL ENABLE, 
    ESTADO NUMBER(*,0) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 5M PCTINCREASE 0);

--CREACION DE TABLA MEMBRESIA
CREATE TABLE ADMIN_PERSONA.TB_MEMBRESIA(
    IDMENBRESIA NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    TIPOMEMBRESIA VARCHAR2(20 BYTE) NOT NULL ENABLE, 
    ESTADO NUMBER(*,0) NOT NULL ENABLE,
    ESTADOPAGO VARCHAR2(20 BYTE) NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA COMENTARIOS
CREATE TABLE ADMIN_PERSONA.TB_COMENTARIOS(
    IDCOMENTARIO NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_PERSONAS_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    DETALLECOMENTARIO VARCHAR2(100 BYTE) NOT NULL ENABLE, 
    IDCLIENTE NUMBER(*,0) NOT NULL ENABLE, 
    FECHACOMENTARIO DATE  NOT NULL ENABLE
) TABLESPACE TBS_PERSONAS_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--------------------------------------------------------------------------------
--CREACION TABLAS TBS_FACTURACION_DATA
--------------------------------------------------------------------------------
--CREACION DE TABLA CARRITO
CREATE TABLE ADMIN_FACTURA.TB_CARRITO (
   IDCARRITO INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_FACTURACION_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0),
   ESTADO DATE NOT NULL ENABLE,
   IDCLIENTE INTEGER NOT NULL ENABLE
) TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);
    
--CREACION DE TABLA FORMAPAGO 
CREATE TABLE ADMIN_FACTURA.TB_FORMAPAGO(
   IDFORMADEPAGO INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_FACTURACION_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0),
   NOMBREFORMAPAGO VARCHAR2(20 BYTE) NOT NULL ENABLE
) TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA FACTURA
CREATE TABLE ADMIN_FACTURA.TB_FACTURA (
    IDFACTURA INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_FACTURACION_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    IDCARRITO INTEGER NOT NULL ENABLE, 	
    IDEMPLEADO INTEGER NOT NULL ENABLE, 
    FECHAFACTURA DATE NOT NULL ENABLE, 
    SUBTOTAL INTEGER NOT NULL ENABLE, 	
    IVA INTEGER NOT NULL ENABLE, 	
    TOTALFACTURA INTEGER NOT NULL ENABLE, 	
    IDFORMAPAGO VARCHAR2(18) NOT NULL ENABLE
) TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
   PARTITION BY RANGE (FECHAFACTURA) (
     PARTITION MVM_BEFORE_202201 VALUES LESS THAN (TO_DATE('2022/01/01','yyyy/mm/dd')),
     PARTITION MVM_202201_202202 VALUES LESS THAN (TO_DATE('2022/03/01','yyyy/mm/dd')),
     PARTITION MVM_202203_202204 VALUES LESS THAN (TO_DATE('2022/05/01','yyyy/mm/dd')),
     PARTITION MVM_202205_202206 VALUES LESS THAN (TO_DATE('2022/07/01','yyyy/mm/dd')),
     PARTITION MVM_202207_202208 VALUES LESS THAN (TO_DATE('2022/09/01','yyyy/mm/dd')),
     PARTITION MVM_202209_202210 VALUES LESS THAN (TO_DATE('2022/11/01','yyyy/mm/dd')),
     PARTITION MVM_202211_202212 VALUES LESS THAN (TO_DATE('2023/01/01','yyyy/mm/dd')),
     PARTITION MVM_202301_202302 VALUES LESS THAN (TO_DATE('2023/03/01','yyyy/mm/dd')),
     PARTITION MVM_202303_202304 VALUES LESS THAN (TO_DATE('2023/05/01','yyyy/mm/dd')),
     PARTITION MVM_202305_202306 VALUES LESS THAN (TO_DATE('2023/07/01','yyyy/mm/dd')),
     PARTITION MVM_202307_202308 VALUES LESS THAN (TO_DATE('2023/09/01','yyyy/mm/dd')),
     PARTITION MVM_202309_202310 VALUES LESS THAN (TO_DATE('2023/11/01','yyyy/mm/dd')),
     PARTITION MVM_202311_202312 VALUES LESS THAN (MAXVALUE)
   );
    
--CREACION DE TABLA ENVIO
CREATE TABLE ADMIN_FACTURA.TB_ENVIO (
    IDENVIO INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_FACTURACION_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0), 
    IDDETALLEVENTA INTEGER NOT NULL ENABLE, 	
    IDCLIENTE INTEGER NOT NULL ENABLE, 
    ESTADOENVIO VARCHAR2(20 BYTE) NOT NULL ENABLE,
    FECHA         DATE NOT NULL ENABLE
) TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
   PARTITION BY RANGE (FECHA) (
     PARTITION MVM_BEFORE_202201 VALUES LESS THAN (TO_DATE('2022/01/01','yyyy/mm/dd')),
     PARTITION MVM_202201_202202 VALUES LESS THAN (TO_DATE('2022/03/01','yyyy/mm/dd')),
     PARTITION MVM_202203_202204 VALUES LESS THAN (TO_DATE('2022/05/01','yyyy/mm/dd')),
     PARTITION MVM_202205_202206 VALUES LESS THAN (TO_DATE('2022/07/01','yyyy/mm/dd')),
     PARTITION MVM_202207_202208 VALUES LESS THAN (TO_DATE('2022/09/01','yyyy/mm/dd')),
     PARTITION MVM_202209_202210 VALUES LESS THAN (TO_DATE('2022/11/01','yyyy/mm/dd')),
     PARTITION MVM_202211_202212 VALUES LESS THAN (TO_DATE('2023/01/01','yyyy/mm/dd')),
     PARTITION MVM_202301_202302 VALUES LESS THAN (TO_DATE('2023/03/01','yyyy/mm/dd')),
     PARTITION MVM_202303_202304 VALUES LESS THAN (TO_DATE('2023/05/01','yyyy/mm/dd')),
     PARTITION MVM_202305_202306 VALUES LESS THAN (TO_DATE('2023/07/01','yyyy/mm/dd')),
     PARTITION MVM_202307_202308 VALUES LESS THAN (TO_DATE('2023/09/01','yyyy/mm/dd')),
     PARTITION MVM_202309_202310 VALUES LESS THAN (TO_DATE('2023/11/01','yyyy/mm/dd')),
     PARTITION MVM_202311_202312 VALUES LESS THAN (MAXVALUE)
   );
    
--CREACION DE TABLA DETALLEVENTA 
CREATE TABLE ADMIN_FACTURA.TB_DETALLEVENTA(
   IDDETALLEVENTA INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_FACTURACION_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0),
   IDPRODUCTO INTEGER NOT NULL ENABLE,
   CANTIDAD INTEGER NOT NULL ENABLE,
   TOTALlINEA INTEGER NOT NULL ENABLE,
   IDFACTURA INTEGER NOT NULL ENABLE,
   FECHA         DATE NOT NULL ENABLE
) TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0)
   PARTITION BY RANGE (FECHA) (
     PARTITION MVM_BEFORE_202201 VALUES LESS THAN (TO_DATE('2022/01/01','yyyy/mm/dd')),
     PARTITION MVM_202201_202202 VALUES LESS THAN (TO_DATE('2022/03/01','yyyy/mm/dd')),
     PARTITION MVM_202203_202204 VALUES LESS THAN (TO_DATE('2022/05/01','yyyy/mm/dd')),
     PARTITION MVM_202205_202206 VALUES LESS THAN (TO_DATE('2022/07/01','yyyy/mm/dd')),
     PARTITION MVM_202207_202208 VALUES LESS THAN (TO_DATE('2022/09/01','yyyy/mm/dd')),
     PARTITION MVM_202209_202210 VALUES LESS THAN (TO_DATE('2022/11/01','yyyy/mm/dd')),
     PARTITION MVM_202211_202212 VALUES LESS THAN (TO_DATE('2023/01/01','yyyy/mm/dd')),
     PARTITION MVM_202301_202302 VALUES LESS THAN (TO_DATE('2023/03/01','yyyy/mm/dd')),
     PARTITION MVM_202303_202304 VALUES LESS THAN (TO_DATE('2023/05/01','yyyy/mm/dd')),
     PARTITION MVM_202305_202306 VALUES LESS THAN (TO_DATE('2023/07/01','yyyy/mm/dd')),
     PARTITION MVM_202307_202308 VALUES LESS THAN (TO_DATE('2023/09/01','yyyy/mm/dd')),
     PARTITION MVM_202309_202310 VALUES LESS THAN (TO_DATE('2023/11/01','yyyy/mm/dd')),
     PARTITION MVM_202311_202312 VALUES LESS THAN (MAXVALUE)
   );
    
--CREACION DE TABLA CARRITOPRODUCTO 
CREATE TABLE ADMIN_FACTURA.TB_CARRITOPRODUCTO (
   IDCARRITOPRODUCTO INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_FACTURACION_IDX STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0),
   IDPRODUCTO INTEGER NOT NULL ENABLE,
   ESTADOCOMPRA VARCHAR2(20 BYTE) NOT NULL ENABLE,
   CANTIDAD INTEGER NOT NULL
) TABLESPACE TBS_FACTURACION_DATA STORAGE (INITIAL 1M NEXT 1M PCTINCREASE 0);
    
--------------------------------------------------------------------------------
--CREACION TABLAS TBS_INVENTARIO_DATA
--------------------------------------------------------------------------------
--CREACION DE TABLA INVENTARIO
CREATE TABLE ADMIN_INVENTARIO.TB_INVENTARIO (
	IDINVENTARIO NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_INVENTARIO_IDX STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0),
	IDPROVEEDOR NUMBER(*,0) NOT NULL ENABLE, 
	IDINGREDIENTE NUMBER(*,0) NOT NULL ENABLE, 
	CANTIDAD NUMBER(*,0), 
	ESTADO VARCHAR2(20 BYTE)
) TABLESPACE TBS_INVENTARIO_DATA STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0)
	PARTITION BY RANGE (IDPROVEEDOR) (
     PARTITION Part_Inv_Prov_1 VALUES LESS THAN (5),
	 PARTITION Part_Inv_Prov_2 VALUES LESS THAN (10),
     PARTITION Part_Inv_Prov_3 VALUES LESS THAN (15),
     PARTITION Part_Inv_Prov_4 VALUES LESS THAN (20),
     PARTITION Part_Inv_Prov_5 VALUES LESS THAN (25),
     PARTITION Part_Inv_Prov_6 VALUES LESS THAN (30),
     PARTITION Part_Inv_Prov_7 VALUES LESS THAN (35)
   );

--CREACION DE TABLA PRODUCTO
CREATE TABLE ADMIN_INVENTARIO.TB_PRODUCTO (
	IDPRODUCTO NUMBER(*,0) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_INVENTARIO_IDX STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0),
	NOMBREPRODUCTO VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	PRECIOPRODUCTO NUMBER(*,0) NOT NULL ENABLE, 
	DESCRIPCIONPRODUCTO VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	ESTADO NUMBER(*,0) NOT NULL ENABLE, 
	CANTIDADDISPONIBLE NUMBER(*,0) NOT NULL ENABLE, 
	IMAGENPRODUCTO VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	IDCATEGORIA NUMBER(*,0)
) TABLESPACE TBS_INVENTARIO_DATA STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA PROVEEDOR
CREATE TABLE ADMIN_INVENTARIO.TB_PROVEDOR (
	IDPROVEDOR CHAR(18 BYTE) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_INVENTARIO_IDX STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0), 
	NOMBREPROVEDOR VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	CORREO VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	TELEFONO NUMBER(*,0) NOT NULL ENABLE, 
	CEDULAJURIDICA NUMBER(*,0) NOT NULL ENABLE
) TABLESPACE TBS_INVENTARIO_DATA STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA INGREDIENTES
CREATE TABLE ADMIN_INVENTARIO.TB_INGREDIENTES (
	IDINGREDIENTE CHAR(18) NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_INVENTARIO_IDX STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0), 
	PRECIO NUMBER(*,0) NOT NULL ENABLE,
	NOMBREINGREDIENTE VARCHAR2(20) NOT NULL ENABLE,
	TIPO VARCHAR2(20) NOT NULL ENABLE
) TABLESPACE TBS_INVENTARIO_DATA STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0);

--CREACION DE TABLA PRODUCTOINGREDIENTE
CREATE TABLE ADMIN_INVENTARIO.TB_PRODUCTOINGREDIENTE (
	IDPRODUCTOINGREDIENTE INTEGER NOT NULL ENABLE PRIMARY KEY USING INDEX TABLESPACE TBS_INVENTARIO_IDX STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0), 
	IDINGREDIENTE CHAR(18) NOT NULL ENABLE,
	ESTADO VARCHAR2(20) NOT NULL ENABLE,
	CANTIDAD INTEGER NOT NULL ENABLE 
) TABLESPACE TBS_INVENTARIO_DATA STORAGE (INITIAL 2M NEXT 1M PCTINCREASE 0);

--------------------------------------------------------------------------------
--VISTAS MATERIALIZADAS
--------------------------------------------------------------------------------
CREATE MATERIALIZED VIEW LOG ON ADMIN_INVENTARIO.TB_INVENTARIO 
    WITH PRIMARY KEY INCLUDING NEW VALUES;
  
CREATE MATERIALIZED VIEW ADMIN_INVENTARIO.TB_INVENTARIO_VWM02
    TABLESPACE TBS_INVENTARIO_DATA
    BUILD IMMEDIATE
    REFRESH START WITH to_date('06/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') NEXT  to_date('07/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') + 1 
    AS
        SELECT  IDINVENTARIO,
                IDINGREDIENTE,
                CANTIDAD,
                ESTADO
        FROM ADMIN_INVENTARIO.TB_INVENTARIO;

CREATE MATERIALIZED VIEW LOG ON ADMIN_FACTURA.TB_DETALLEVENTA
  WITH PRIMARY KEY INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW ADMIN_FACTURA.TB_DETALLEVENTA_VWM01
       TABLESPACE TBS_FACTURACION_DATA
       BUILD IMMEDIATE
        REFRESH START WITH to_date('06/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') NEXT  to_date('07/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') + 1 AS
          select IDDETALLEVENTA,
                 IDPRODUCTO,
                 CANTIDAD,
                 TOTALlINEA,
                 IDFACTURA,
                 FECHA
            from ADMIN_FACTURA.TB_DETALLEVENTA;
            
CREATE MATERIALIZED VIEW LOG ON ADMIN_FACTURA.TB_ENVIO
  WITH PRIMARY KEY INCLUDING NEW VALUES;
  
  
CREATE MATERIALIZED VIEW ADMIN_FACTURA.TB_ENVIO_VWM01
       TABLESPACE TBS_FACTURACION_DATA
       BUILD IMMEDIATE
        REFRESH START WITH to_date('06/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') NEXT  to_date('07/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') + 1 AS
          select IDENVIO,
                 IDDETALLEVENTA,
                 IDCLIENTE,
                 ESTADOENVIO,
                 FECHA
            from ADMIN_FACTURA.TB_ENVIO;
            

CREATE MATERIALIZED VIEW LOG ON ADMIN_FACTURA.TB_FACTURA
  WITH PRIMARY KEY INCLUDING NEW VALUES;
  
  
CREATE MATERIALIZED VIEW ADMIN_FACTURA.TB_FACTURA_VWM01
       TABLESPACE TBS_FACTURACION_DATA
       BUILD IMMEDIATE
        REFRESH START WITH to_date('06/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') NEXT  to_date('07/12/2022 03:00:00','dd/mm/yyyy HH24:mi:ss') + 1 AS
          select IDFACTURA,
                 FECHAFACTURA,
                 SUBTOTAL,
                 IVA,
                 TOTALFACTURA,
                 IDFORMAPAGO
            from ADMIN_FACTURA.TB_FACTURA;
            
            
--------------------------------------------------------------------------------
--CREACION PERFILES
--------------------------------------------------------------------------------
CREATE PROFILE PU_EMPLEADO LIMIT
   IDLE_TIME                60 -- MINUTOS.
   PASSWORD_LIFE_TIME       30 -- D?AS.
   PASSWORD_GRACE_TIME      3 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    2;

CREATE PROFILE PU_CLIENTE LIMIT
   IDLE_TIME                30 -- MINUTOS.
   PASSWORD_LIFE_TIME       30 -- D?AS.
   PASSWORD_GRACE_TIME      3 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    2;

CREATE PROFILE PU_CLIENTE_GENERICO LIMIT
   IDLE_TIME                30 -- MINUTOS.
   PASSWORD_LIFE_TIME       30 -- D?AS.
   PASSWORD_GRACE_TIME      3 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    2;

CREATE PROFILE PU_SUPERVISOR LIMIT
   IDLE_TIME                15 -- MINUTOS.
   PASSWORD_LIFE_TIME       15 -- D?AS.
   PASSWORD_GRACE_TIME      1 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    3;

CREATE PROFILE PU_ADMINISTRADOR_TABLAS LIMIT
   IDLE_TIME                15 -- MINUTOS.
   PASSWORD_LIFE_TIME       15 -- D?AS.
   PASSWORD_GRACE_TIME      1 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    3;
   
CREATE PROFILE PU_GERENTE LIMIT
   IDLE_TIME                15 -- MINUTOS.
   PASSWORD_LIFE_TIME       15 -- D?AS.
   PASSWORD_GRACE_TIME      1 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    3;
   
CREATE PROFILE PU_GERENTE_GENERAL LIMIT
   IDLE_TIME                15 -- MINUTOS.
   PASSWORD_LIFE_TIME       15 -- D?AS.
   PASSWORD_GRACE_TIME      1 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    3;

--------------------------------------------------------------------------------
--CREACION ROLES USUARIO
--------------------------------------------------------------------------------
--RolesUsuario.sql
--------------------------------------------------------------------------------
--CREACION USUARIOS
--------------------------------------------------------------------------------
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

