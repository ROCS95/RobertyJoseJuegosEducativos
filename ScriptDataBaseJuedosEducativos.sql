﻿CREATE DATABASE juegos_educativos;

CREATE TABLE foto
(
  id integer NOT NULL DEFAULT nextval('foto_id_seq'::regclass),
  foto bytea,
  CONSTRAINT pk_foto PRIMARY KEY (id)
);

CREATE TABLE victorias
(
  id integer NOT NULL DEFAULT nextval('victorias_id_seq'::regclass),
  victorias integer,
  tiempo_promedio integer,
  CONSTRAINT pk_puntuacion PRIMARY KEY (id)
);

CREATE TABLE usuario
(
  id integer NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  name text,
  correo text,
  id_foto integer,
  id_victorias integer,
  contrasena text,
  "user" text,
  CONSTRAINT pk_user PRIMARY KEY (id),
  CONSTRAINT fk_user_foto FOREIGN KEY (id_foto)
      REFERENCES public.foto (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_user_victorias FOREIGN KEY (id_victorias)
      REFERENCES public.victorias (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT unq_user UNIQUE ("user")
);