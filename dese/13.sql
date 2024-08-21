 select "name","expenditures"."per_pupil_expenditure","staff_evaluations"."exemplary"  from "districts"
  join "expenditures" on "districts"."id" = "expenditures"."district_id"
  join "staff_evaluations" on "districts"."id" = "staff_evaluations"."district_id"
   where "expenditures"."per_pupil_expenditure" > (
    select avg("per_pupil_expenditure ") from "expenditures"
    ) and "staff_evaluations"."exemplary" > (
        select avg("exemplary") from "staff_evaluations"
        )
        order by "staff_evaluations"."exemplary" desc , "expenditures"."per_pupil_expenditure" desc ;
