-- Database: mlb_db
-- DROP DATABASE mlb_db;


-- Table: public.capacityattendance
-- DROP TABLE public.capacityattendance;
CREATE TABLE public.capacityattendance
(
    team_key integer NOT NULL,
    team_cityname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_abrv character varying(25) COLLATE pg_catalog."default" NOT NULL,
    stadium_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    stadium_capacity integer NOT NULL,
    home_games integer NOT NULL,
    tot_home_game_att integer NOT NULL,
    avg_home_game_att integer NOT NULL,
    CONSTRAINT capacityattendance_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.capacityattendance
    OWNER to postgres;

-- Index: ix_capacityattendance_team_key
-- DROP INDEX public.ix_capacityattendance_team_key;

CREATE INDEX ix_capacityattendance_team_key
    ON public.capacityattendance USING btree
    (team_key)
    TABLESPACE pg_default;



-- Table: public.looktable
-- DROP TABLE public.looktable;
CREATE TABLE public.looktable
(
    team_key integer NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_cityname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_abrv character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT looktable_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.looktable
    OWNER to postgres;



-- Table: public.revenueprice
-- DROP TABLE public.revenueprice;
CREATE TABLE public.revenueprice
(
    team_key integer NOT NULL,
    team_cityname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    revenue integer NOT NULL,
    avg_ticket_price integer NOT NULL,
    CONSTRAINT revenueprice_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.revenueprice
    OWNER to postgres;

-- Index: ix_revenueprice_team_key
-- DROP INDEX public.ix_revenueprice_team_key;

CREATE INDEX ix_revenueprice_team_key
    ON public.revenueprice USING btree
    (team_key)
    TABLESPACE pg_default;



-- Table: public.teamsalary
-- DROP TABLE public.teamsalary;
CREATE TABLE public.teamsalary
(
    team_key integer NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    current_salary integer NOT NULL,
    avg_salary integer NOT NULL,
    median_salary integer NOT NULL,
    payroll_openingday double precision NOT NULL,
    CONSTRAINT teamsalary_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.teamsalary
    OWNER to postgres;

-- Index: ix_teamsalary_team_key
-- DROP INDEX public.ix_teamsalary_team_key;

CREATE INDEX ix_teamsalary_team_key
    ON public.teamsalary USING btree
    (team_key)
    TABLESPACE pg_default;



-- Table: public.winslosses
-- DROP TABLE public.winslosses;
CREATE TABLE public.winslosses
(
    team_key integer NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    pct numeric(5,3) NOT NULL,
    rs integer NOT NULL,
    ra integer NOT NULL,
    CONSTRAINT winslosses_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.winslosses
    OWNER to postgres;
