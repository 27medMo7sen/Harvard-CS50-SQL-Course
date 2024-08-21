select "name","expenditures"."per_pupil_expenditure" from "districts"
full join "expenditures" on "districts"."id" = "expenditures"."district_id" where "districts"."type" = "Public School District"  order by "expenditures"."per_pupil_expenditure" desc limit 10;
