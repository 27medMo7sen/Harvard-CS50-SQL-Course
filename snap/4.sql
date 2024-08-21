SELECT "username" FROM
(
SELECT "username", COUNT("messages"."to_user_id") FROM "users"
JOIN "messages" ON "users"."id" = "to_user_id"
GROUP BY "username"
ORDER BY COUNT("messages"."to_user_id") DESC
LIMIT 1
);

