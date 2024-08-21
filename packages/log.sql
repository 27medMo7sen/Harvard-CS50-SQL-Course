
-- *** The Lost Letter ***
select * from "addresses" where "id" = (
         select "address_id" from "scans" where "package_id" = (
              select "id" from "packages" where "from_address_id" =(
                  select "id" from "addresses" where "address" = "900 Somerville Avenue"
              ) and "to_address_id" = (
                   select "id" from "addresses" where "address" = (
                      select "address" from "addresses" where "address" like "2 F_______ street"
                   )
               )
          ) and "action" = "Drop"
     );
-- *** The Devious Delivery ***
select * from "addresses" where "id" = ( -- this is the query that ment by showwing the address's information
       select "address_id" from "scans" where "package_id" = ( -- this is a subquery i use to get the id of the desired address
            select "id" from "packages" where "from_address_id" is null -- here's another subquery the purpose of it to the id of the package using the infromation there's no "From address"
             ) and "action" = "Drop"
         );

-- *** The Forgotten Gift ***
select "name" from "drivers" where "id" = (
         select "driver_id" from "scans" where "package_id" = (
             select "id" from "packages" where "from_address_id" =(
                 select "id" from "addresses"  where "address" = "109 Tileston Street"
             ) and "to_address_id" = (
                 select "id" from "addresses"  where "address"= "728 Maple Place"
             )
         ) order by "timestamp" desc
 );
