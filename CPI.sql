
CREATE TABLE "CPI" (
    "ID" SERIAL   NOT NULL,
    "Date" DATE   NOT NULL,
    "CPI" Float   NOT NULL,
    CONSTRAINT "pk_CPI" PRIMARY KEY (
        "ID"
     )
);

