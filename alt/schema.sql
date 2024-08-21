CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);
CREATE TABLE "check-ins"(
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
);
CREATE TABLE "airlines"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "flights"(
    "id" INTEGER,
    "airline_id" INTEGER,
    "from_airline_code" TEXT NOT NULL,
    "to_airline_code" TEXT NOT NULL,
    "departure_date" NUMERIC NOT NULL,
    "arrival_date" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airline"("id")
);
