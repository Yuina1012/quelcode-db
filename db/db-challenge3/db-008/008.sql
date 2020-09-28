SELECT  u2.name, c.name, SUBSTRING(joined_at, 1, 10) AS joined_at
FROM users_chat_rooms 
JOIN users AS u2 
ON user_id = u2.id 
JOIN chat_rooms AS c 
ON chat_room_id = c.id
WHERE u2.is_deleted = 0 AND c.is_deleted = 0
ORDER BY joined_at ASC;
