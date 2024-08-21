select "first_name" , "last_name" , "salary" from "players"
join "salaries" on "players"."id" = "salaries"."player_id"
where "year" = 2001 order by "salary" , "first_name" , "last_name" , "players"."id" limit 50;

