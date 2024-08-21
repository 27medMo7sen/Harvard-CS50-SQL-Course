select "schools"."name" from "schools" join "districts" on "schools"."district_id" = "districts"."id" where "districts"."name" like "Cambridge%";
