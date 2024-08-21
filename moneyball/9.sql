select "name" , avg("salaries"."salary") as "average salary" from "teams"
join "salaries" on "teams"."id" = "salaries"."team_id"
where "salaries"."year" = 2001 group by "name" order by "average salary" limit 5;
