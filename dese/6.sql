select "name" from "schools" join "graduation_rates" on "schools"."id" = "graduation_rates"."school_id" where "graduation_rates"."graduated" = 100;
