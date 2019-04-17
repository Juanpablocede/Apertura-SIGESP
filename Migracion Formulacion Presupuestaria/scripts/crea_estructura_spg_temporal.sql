CREATE TABLE spg_temporal
(
  codemp character(4),
  codestpro1 character(25),
  denestpro1 text,
  codestpro2 character(25),
  denestpro2 text,
  codestpro3 character(25),
  denestpro3 text,
  codestpro4 character(25),
  denestpro4 text,
  codestpro5 character(25),
  denestpro5 text,
  estcla character(1),
  spg_cuenta character varying(25) NOT NULL,
  denominacion character varying(254) NOT NULL,
  status character varying(1) NOT NULL,
  sc_cuenta character varying(25) NOT NULL,
  asignado double precision NOT NULL DEFAULT (0)::double precision,
  precomprometido double precision NOT NULL DEFAULT (0)::double precision,
  comprometido double precision NOT NULL DEFAULT (0)::double precision,
  causado double precision NOT NULL DEFAULT (0)::double precision,
  pagado double precision NOT NULL DEFAULT (0)::double precision,
  aumento double precision NOT NULL DEFAULT (0)::double precision,
  disminucion double precision NOT NULL DEFAULT (0)::double precision,
  distribuir smallint NOT NULL,
  enero double precision NOT NULL DEFAULT (0)::double precision,
  febrero double precision NOT NULL DEFAULT (0)::double precision,
  marzo double precision NOT NULL DEFAULT (0)::double precision,
  abril double precision NOT NULL DEFAULT (0)::double precision,
  mayo double precision NOT NULL DEFAULT (0)::double precision,
  junio double precision NOT NULL DEFAULT (0)::double precision,
  julio double precision NOT NULL DEFAULT (0)::double precision,
  agosto double precision NOT NULL DEFAULT (0)::double precision,
  septiembre double precision NOT NULL DEFAULT (0)::double precision,
  octubre double precision NOT NULL DEFAULT (0)::double precision,
  noviembre double precision NOT NULL DEFAULT (0)::double precision,
  diciembre double precision NOT NULL DEFAULT (0)::double precision,
  nivel smallint NOT NULL,
  referencia character varying(25) NOT NULL,
  scgctaint character varying(25) NOT NULL DEFAULT '-'::character varying,
  sc_cuenta_art character varying(25) DEFAULT '-'::character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE spg_temporal
  OWNER TO postgres;
