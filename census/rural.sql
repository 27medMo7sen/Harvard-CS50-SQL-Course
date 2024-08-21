CREATE VIEW "rural" AS
SELECT * FROM "census"
WHERE "locality" like "% rural %";
