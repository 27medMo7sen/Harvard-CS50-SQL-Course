select "salary" from "salaries"
 join "performances" on "salaries"."player_id" = "performances"."player_id"
 where "salaries"."year" = 2001
 order by "performances"."HR" desc limit 1;