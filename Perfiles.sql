
--**********************************************************
-- INICIO
--**********************************************************



--**********************************************************
-- PERFILES DE USUARIO


CREATE PROFILE PU_EMPLEADO LIMIT
   IDLE_TIME                60 -- MINUTOS.
   PASSWORD_LIFE_TIME       30 -- D?AS.
   PASSWORD_GRACE_TIME      3 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    2;
--

CREATE PROFILE PU_CLIENTE LIMIT
   IDLE_TIME                30 -- MINUTOS.
   PASSWORD_LIFE_TIME       30 -- D?AS.
   PASSWORD_GRACE_TIME      3 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    2;
--

CREATE PROFILE PU_CLIENTE_GENERICO LIMIT
   IDLE_TIME                30 -- MINUTOS.
   PASSWORD_LIFE_TIME       30 -- D?AS.
   PASSWORD_GRACE_TIME      3 -- D?AS.
   FAILED_LOGIN_ATTEMPTS    2;
--

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

--**********************************************************
-- FIN
--**********************************************************

