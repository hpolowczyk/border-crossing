-- If table already exists
DROP TABLE border_entry

-- Create table to hold US border entry data
CREATE TABLE public.border_entry (
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
