select "first_name" , "last_name" , "salaries"."salary"/"performances"."H" as "dollars per hit" from "players"
join "performances" on "players"."id" = "performances"."player_id"
join "salaries" on "players"."id" = "salaries"."player_id"
where "performances"."year" = "salaries"."year" and "performances"."H" !=0 and "performances"."H" is not null and "performances"."year" = 2001 and "salaries"."year" = 2001
order by "dollars per hit" , "first_name" , "last_name"
limit 10 ;
