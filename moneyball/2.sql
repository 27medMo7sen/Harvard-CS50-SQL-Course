select "year" , "salary" from "salaries" join "players" on "players"."id" = "salaries"."player_id" where "players"."first_name" = "Cal" and "players"."last_name" = "Ripken" order by "year" desc;
