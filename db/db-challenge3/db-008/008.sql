SELECT  u2.name, c.name, date_format(joined_at, '%Y %m %d') AS joined_at
FROM users_chat_rooms 
JOIN users AS u2 
ON user_id = u2.id 
JOIN chat_rooms AS c 
ON chat_room_id = c.id
WHERE u2.is_deleted = 0 AND c.is_deleted = 0
ORDER BY joined_at ASC;
