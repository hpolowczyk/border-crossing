
-- If table already present
DROP TABLE "border_entry"

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

