-- select "year" , "HR" from "performances" where "player_id" = (
--     select "id" from "players" where "first_name" = "Ken" and "last_name" = "Griffey" and "birth_year" = 1969
-- ) order by "year" desc ;

select "year" , "HR" from "performances"
 join
 "players" on "performances"."player_id" = "players"."id"
  where
  "players"."first_name" = "Ken" and "players"."last_name" = "Griffey" and "players"."birth_year" = 1969
  order by "year" desc;
