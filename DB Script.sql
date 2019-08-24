-- Create border_db 
CREATE DATABASE border_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_Canada.1252'
    LC_CTYPE = 'English_Canada.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

--- CONNECT TO border_db AND THEN RUN THE FOLLOWING
--- RUN ALL CREATE DDLS BEFORE INSERTING VALUES INTO border_etl

-- Create table to hold FX rates
CREATE TABLE public.fx_rates
(
    "ID" SERIAL NOT NULL,
    "Date" VARCHAR,
    "Average_FX" NUMERIC(8, 6),
    PRIMARY KEY ("ID")
);

-- Create table to hold US border entry data
CREATE TABLE public.border_entry (
    "ID" SERIAL   NOT NULL,
    "Date" VARCHAR   NOT NULL,
    "Transportation_Type" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "State" VARCHAR   NOT NULL,
    "Number_of_Passengers" INT   NOT NULL,
    CONSTRAINT "pk_border_entry" PRIMARY KEY (
        "ID"
     )
);

-- Create table to hold monthly CPI data
CREATE TABLE public.cpi (
    "ID" SERIAL   NOT NULL,
    "Date" VARCHAR   NOT NULL,
    "CPI" FLOAT   NOT NULL,
    CONSTRAINT "pk_cpi" PRIMARY KEY (
        "ID"
     )
);

-- Create table to hold all merged tables
CREATE TABLE public.border_etl (
    "ID" SERIAL NOT NULL,
    "Date" VARCHAR NOT NULL,
	"FoM" DATE NOT NULL,
    "State" VARCHAR NOT NULL,
    "Total_Passengers" INT NOT NULL,
    "Average_FX" NUMERIC(8, 6) NOT NULL,
    "CPI" FLOAT NOT NULL,
    CONSTRAINT "pk_border_etl" PRIMARY KEY (
        "ID"
     )
);

--- DO NOT RUN THIS UNTIL AFTER PYTHON LOAD HAS BEEN COMPLETED

-- Insert into border_etl
INSERT INTO border_etl (
	 "Date","FoM", "State", "Total_Passengers", "Average_FX","CPI"
)
SELECT be."Date", to_date(be."Date",'Mon YYYY') AS FoM,be."State", SUM(be."Number_of_Passengers") AS "Total_Passengers", fx."Average_FX", cpi."CPI"
FROM border_entry AS be
LEFT JOIN fx_rates AS fx ON be."Date" = fx."Date"
LEFT JOIN cpi on be."Date" = cpi."Date" 
GROUP BY be."Date", be."State", fx."Average_FX", cpi."CPI"
ORDER BY FoM,be."State";

-- Column need for sorting; not necessary since Date column is clearer
ALTER TABLE border_etl DROP "FoM";

-- Check table
SELECT * FROM border_etl;