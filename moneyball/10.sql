select "first_name" , "last_name" , "salaries"."salary" , "performances"."HR","performances"."year" from "players"
join "salaries" on "players"."id" = "salaries"."player_id" join "performances" on "players"."id" = "performances"."player_id"
where "performances"."year" = "salaries"."year"
order by "players"."id" , "performances"."year" desc ,"performances"."HR" desc , "salaries"."salary" ;
