-- If table already exists
DROP TABLE border_entry;

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
