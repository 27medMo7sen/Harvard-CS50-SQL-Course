-- select distinct("teams"."name") from "salaries"
-- join "teams" on "teams"."id" = "salaries"."team_id"
-- join "players" on  "salaries"."player_id" = "players"."id"
-- where "players"."first_name" = "Satchel" and "players"."last_name" = "Paige";
select distinct("teams"."name") from "performances"
join "teams" on "teams"."id" = "performances"."team_id"
join "players" on  "performances"."player_id" = "players"."id"
where "players"."first_name" = "Satchel" and "players"."last_name" = "Paige";
