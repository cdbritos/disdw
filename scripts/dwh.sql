﻿
-- Database: dwh

-- DROP DATABASE dwh;

CREATE DATABASE dwh
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_UY.UTF-8'
       LC_CTYPE = 'es_UY.UTF-8'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE dwh
  IS 'Base de datos del grupo 5';

--para borrar
truncate table ccz cascade;
truncate table ubicaciongeog_1 cascade;
  
  
CREATE TABLE public.ccz
(
  idccz smallint NOT NULL,
  nombreccz text,
  CONSTRAINT pk_cczubicacion PRIMARY KEY (idccz)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.ccz
  OWNER TO postgres;

  
  
CREATE TABLE public.contaminantes
(
  idcontaminante character varying(4),
  nomcontaminante character varying(26),
  idsubtipo smallint,
  nomsubtipo character varying(59),
  idtipo smallint,
  nomtipo character varying(24)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.contaminantes
  OWNER TO postgres;

  
  CREATE TABLE public.lineas
(
  idlinea character varying(15) NOT NULL,
  nomlinea character varying(50),
  geom text,
  CONSTRAINT "pkeyLineas" PRIMARY KEY (idlinea)
  USING INDEX TABLESPACE tbs_dwh
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.lineas
  OWNER TO postgres;
  
  CREATE TABLE public.metodos
(
  idmetodo integer NOT NULL,
  nommetodo character varying(15),
  CONSTRAINT "pkeyMetodos" PRIMARY KEY (idmetodo)
)
WITH (
  OIDS=FALSE
);



ALTER TABLE public.metodos
  OWNER TO postgres;

  CREATE TABLE public.ubicaciongeog_1
(
  idestacion character varying(23) NOT NULL,
  nomestacion text,
  idbarrio double precision,
  nombarrio character varying(24),
  CONSTRAINT pk_ubicacion1 PRIMARY KEY (idestacion)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.ubicaciongeog_1
  OWNER TO postgres;

CREATE TABLE public.bridge_ccubicacion
(
  idestacion character varying(23) NOT NULL,
  idccz smallint NOT NULL,
  CONSTRAINT pk_bridgecczubicacion PRIMARY KEY (idestacion, idccz),
  CONSTRAINT fk_ccz FOREIGN KEY (idccz)
      REFERENCES public.ccz (idccz) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ubicacion FOREIGN KEY (idestacion)
      REFERENCES public.ubicaciongeog_1 (idestacion) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.bridge_ccubicacion
  OWNER TO postgres;

 
CREATE TABLE public.mediciones
(
  idestacion character varying(22),
  idmetodo character varying(12),
  idcontaminante character varying(4),
  idlinea character varying(8),
  idfecha character varying(19),
  polucion bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.mediciones
  OWNER TO postgres;



-- CESAR --------------------------------------------------------------------------------------------------
-- Table: public.tiempo

-- DROP TABLE public.tiempo;

CREATE TABLE public.tiempo
(
  idfecha character varying(8) NOT NULL,
  fecha date,
  id_estacion_anio smallint,
  id_dia_semana smallint,
  id_mes smallint,
  trimestre smallint,
  semestre smallint,
  nombre_estacion_anio character varying(15),
  nombre_dia_semana character varying(15),
  nombre_mes character varying(15),
  anio smallint,
  CONSTRAINT pkeytiempo PRIMARY KEY (idfecha)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.tiempo
  OWNER TO postgres;
