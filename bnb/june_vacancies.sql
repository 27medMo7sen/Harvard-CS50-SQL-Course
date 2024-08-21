CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "property_type" , "host_name" , COUNT("availabilities"."id") AS "days_vacant"
FROM "listings"
JOIN "availabilities"
ON "listings"."id" = "availabilities"."listing_id"
WHERE "availabilities"."date" LIKE "2023-06%" AND "availabilities"."available" = "TRUE"
GROUP BY "listings"."id";
