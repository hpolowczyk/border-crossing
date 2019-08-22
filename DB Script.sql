CREATE DATABASE border_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Canada.1252'
    LC_CTYPE = 'English_Canada.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


CREATE TABLE public.fx_rates
(
    ID serial NOT NULL,
    "Date" date,
    "Closing_Rate" numeric(6, 4),
    PRIMARY KEY (id)
)




CREATE TABLE "border_entry" (
    "ID" SERIAL   NOT NULL,
    "Date" DATE   NOT NULL,
    "Transportation Type" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "State" VARCHAR   NOT NULL,
    "Number of Passengers" INT   NOT NULL,
    CONSTRAINT "pk_border_entry" PRIMARY KEY (
        "ID"
     )
);