select "name" , "expenditures"."per_pupil_expenditure" , "graduation_rates"."graduated" from "schools" join "expenditures" on "expenditures"."district_id" = "schools"."district_id"
 join "graduation_rates" on "schools"."id" = "graduation_rates"."school_id" order by "per_pupil_expenditure" desc , "name" asc;
