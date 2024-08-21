CREATE TABLE "users"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "schools"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "foundation_year" INTEGER,
     PRIMARY KEY("id")
);
CREATE TABLE "companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "industry" INTEGER,
     PRIMARY KEY("id")
);
CREATE TABLE "connections_with_peoples"(
    "id" INTEGER,
    "first_user_id" INTEGER,
    "second_user_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("first_user_id") REFERENCES "users"("id"),
    FOREIGN KEY("second_user_id") REFERENCES "users"("id")
);
CREATE TABLE "connections_with_schools"(
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "joining_date" NUMERIC,
    "graduation_date" NUMERIC,
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);
CREATE TABLE "connections_with_companies"(
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "joining_date" NUMERIC,
    "retirement_date" NUMERIC,
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
