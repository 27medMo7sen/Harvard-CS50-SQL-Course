--  select "districts"."name","expenditures"."per_pupil_expenditure","staff_evaluations"."exemplary"  from "districts"
--   join "expenditures" on "districts"."id" = "expenditures"."district_id"
--   join "staff_evaluations" on "districts"."id" = "staff_evaluations"."district_id"
--    where "districts"."type" = "Public School District" and  "per_pupil_expenditure" >= (
--     select avg("per_pupil_expenditure ") from "expenditures"
--     ) and "exemplary" >= (
--         select avg("exemplary") from "staff_evaluations"
--         )
--         order by  "exemplary" desc , "per_pupil_expenditure" desc ;
SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary FROM districts
JOIN
expenditures ON expenditures.district_id = districts. id
JOIN
staff_evaluations ON staff_evaluations.district_id = districts.id
WHERE districts. type = "Public School District" AND per_pupil_expenditure >= (
SELECT AVG (per_pupil_expenditure) FROM expenditures
)AND
exemplary >=(
SELECT AVG (exemplary)
FROM staff_evaluations
)
ORDER BY exemplary DESC, per_pupil_expenditure DESC
