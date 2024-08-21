select "name" from "districts" join "expenditures" on "districts"."id" = "expenditures"."district_id" order by "expenditures"."pupils" limit 1;
