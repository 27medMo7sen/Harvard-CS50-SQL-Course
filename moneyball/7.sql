select "first_name" , "last_name" from "players"
join "salaries" on "players"."id" = "salaries"."player_id"
order by "salaries"."salary" desc limit 1;
