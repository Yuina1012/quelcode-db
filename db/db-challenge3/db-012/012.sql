BEGIN;
UPDATE chat_rooms AS a
JOIN users_chat_rooms AS b
ON a.id = b.chat_room_id
SET a.is_attachable = 0
WHERE b.chat_room_id not in (SELECT chat_room_id FROM  users_chat_rooms
WHERE user_id =1 
GROUP by chat_room_id);
COMMIT;
