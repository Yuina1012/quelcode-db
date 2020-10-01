BEGIN;
DELETE a FROM users_chat_rooms AS a
JOIN users AS b
ON a.user_id = b.id
WHERE b.is_deleted = 1;
COMMIT;
