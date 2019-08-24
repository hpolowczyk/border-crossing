-- Create border_db 
CREATE DATABASE border_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Canada.1252'
    LC_CTYPE = 'English_Canada.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Create table to hold FX rates
CREATE TABLE public.fx_rates
(
    ID SERIAL NOT NULL,
    "Date" VARCHAR,
    "Closing_Rate" NUMERIC(6, 4),
    PRIMARY KEY (ID)
);

-- Create table to hold US border entry data
CREATE TABLE public.border_entry (
    "ID" SERIAL   NOT NULL,
    "Date" VARCHAR   NOT NULL,
    "Transportation Type" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "State" VARCHAR   NOT NULL,
    "Number of Passengers" INT   NOT NULL,
    CONSTRAINT "pk_border_entry" PRIMARY KEY (
        "ID"
     )
);

-- Create table to hold monthly CPI data
CREATE TABLE public.cpi (
    "ID" SERIAL   NOT NULL,
    "Date" VARCHAR   NOT NULL,
    "CPI" Float   NOT NULL,
    CONSTRAINT "pk_cpi" PRIMARY KEY (
        "ID"
     )
);

-- Join tables
SELECT 