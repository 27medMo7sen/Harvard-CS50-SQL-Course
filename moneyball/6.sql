select "name" , sum("performances"."H") as "total hits" from "teams"
join "performances" on "teams"."id" = "performances"."team_id"
where "performances"."year"=2001
group by "name"
order by "total hits" desc
limit 5;
