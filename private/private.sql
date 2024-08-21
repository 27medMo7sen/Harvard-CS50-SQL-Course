CREATE TABLE "triplets" (
    "sentence_id" INTEGER,
    "starting_char" INTEGER,
    "length" INTEGER
);
INSERT INTO "triplets" ("sentence_id" , "starting_char", "length")
VALUES
(14	,98,	4),
(114,	3,	5),
(618	,72	,9),
(630	,7,	3),
(932	,12,	5),
(2230	,50	,7),
(2346	,44	,10),
(3041	,14,	5);
create view "message" as
select substr("sentence" , "triplets"."starting_char" , "triplets"."length" ) as "phrase" from "sentences"
join   "triplets" on "triplets"."sentence_id" = "sentences"."id";
