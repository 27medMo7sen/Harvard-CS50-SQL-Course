select "first_name" , "last_name" from (
select "first_name" , "last_name", "id" from
(
select "first_name" , "last_name", "players"."id"from "players"
join "performances" on "players"."id" = "performances"."player_id"
join "salaries" on "players"."id" = "salaries"."player_id"
where "performances"."year" = "salaries"."year" and "performances"."H" !=0 and "performances"."H" is not null and "performances"."year" = 2001 and "salaries"."year" = 2001
order by "salaries"."salary"/"performances"."H"
limit 10
)
intersect
select "first_name" , "last_name"  , "id" from
(
select "first_name" , "last_name", "players"."id" from "players"
join "performances" on "players"."id" = "performances"."player_id"
join "salaries" on "players"."id" = "salaries"."player_id"
where "performances"."year" = "salaries"."year" and "performances"."RBI" !=0 and "performances"."RBI" is not null and "performances"."year" = 2001 and "salaries"."year" = 2001
order by "salaries"."salary"/"performances"."RBI"
limit 10
)
)order by "id";

