select "city" , count("name") from "schools" where "type" = "Public School"  group by "city" having count("name") <= 3 order by count("name")desc , "city" asc;
