-- Database: mlb_db
-- DROP DATABASE mlb_db;


-- Table: public.attendance
-- DROP TABLE public.attendance;
CREATE TABLE public.attendance
(
    team_key integer NOT NULL,
    team_abrv character varying(25) COLLATE pg_catalog."default" NOT NULL,
    gms_h integer NOT NULL,
    total_h integer NOT NULL,
    avg_h integer NOT NULL,
    pct_h bit(1) NOT NULL,
    gms_r integer NOT NULL,
    avg_r integer NOT NULL,
    pct_r bit(1) NOT NULL,
    gms_t integer NOT NULL,
    avg_t integer NOT NULL,
    pct_t bit(1) NOT NULL,
    CONSTRAINT attendance_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.attendance
    OWNER to postgres;



-- Table: public.avgticketprice
-- DROP TABLE public.avgticketprice;
CREATE TABLE public.avgticketprice
(
    team_key integer NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    avg_ticket_price integer NOT NULL,
    team_cityname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_abrv character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE public.avgticketprice
    OWNER to postgres;

-- Index: ix_avgticketprice_team_key
-- DROP INDEX public.ix_avgticketprice_team_key;

CREATE INDEX ix_avgticketprice_team_key
    ON public.avgticketprice USING btree
    (team_key)
    TABLESPACE pg_default;



-- Table: public.capacity
-- DROP TABLE public.capacity;
CREATE TABLE public.capacity
(
    team_key integer,
    team_longname character varying(25) COLLATE pg_catalog."default",
    stadium_name character varying(50) COLLATE pg_catalog."default",
    stadium_capacity integer,
    team_cityname character varying(50) COLLATE pg_catalog."default",
    team_abrv character varying(25) COLLATE pg_catalog."default",
    team_shortname character varying(25) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.capacity
    OWNER to postgres;

-- Index: ix_capacity_team_key
-- DROP INDEX public.ix_capacity_team_key;

CREATE INDEX ix_capacity_team_key
    ON public.capacity USING btree
    (team_key)
    TABLESPACE pg_default;



-- Table: public.capacityattendance
-- DROP TABLE public.capacityattendance;
CREATE TABLE public.capacityattendance
(
    team_key integer NOT NULL,
    team_cityname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
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



-- Table: public.payroll
-- DROP TABLE public.payroll;
CREATE TABLE public.payroll
(
    team_key integer NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    payroll_openingday numeric(6,2),
    CONSTRAINT payroll_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.payroll
    OWNER to postgres;



-- Table: public.revenue
-- DROP TABLE public.revenue;
CREATE TABLE public.revenue
(
    team_key integer NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    revenue integer NOT NULL,
    CONSTRAINT revenue_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.revenue
    OWNER to postgres;



-- Table: public.revenueprice
-- DROP TABLE public.revenueprice;
CREATE TABLE public.revenueprice
(
    team_key integer NOT NULL,
    team_cityname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
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



-- Table: public.salary
-- DROP TABLE public.salary;
CREATE TABLE public.salary
(
    team_key integer NOT NULL,
    rank integer NOT NULL,
    team_shortname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    opening_day integer NOT NULL,
    current integer NOT NULL,
    diff character varying(2) COLLATE pg_catalog."default" NOT NULL,
    avg_salary integer NOT NULL,
    median integer NOT NULL,
    CONSTRAINT salary_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.salary
    OWNER to postgres;



-- Table: public.teamsalary
-- DROP TABLE public.teamsalary;
CREATE TABLE public.teamsalary
(
    team_key integer NOT NULL,
    team_shortname character varying(25) COLLATE pg_catalog."default" NOT NULL,
    current_salary integer NOT NULL,
    avg_salary integer NOT NULL,
    median_salary integer NOT NULL,
    team_longname character varying(25) COLLATE pg_catalog."default" NOT NULL,
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
    gb character varying(4) COLLATE pg_catalog."default" NOT NULL,
    home character varying(5) COLLATE pg_catalog."default" NOT NULL,
    away character varying(5) COLLATE pg_catalog."default" NOT NULL,
    rs integer NOT NULL,
    ra integer NOT NULL,
    diff integer NOT NULL,
    CONSTRAINT winslosses_pkey PRIMARY KEY (team_key)
)

TABLESPACE pg_default;

ALTER TABLE public.winslosses
    OWNER to postgres;
