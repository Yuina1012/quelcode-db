BEGIN;
UPDATE chat_rooms AS a
JOIN users_chat_rooms AS b
ON a.id = b.chat_room_id
SET a.is_attachable = 0, A.updated_by = 1
WHERE b.chat_room_id NOT IN (SELECT chat_room_id FROM  users_chat_rooms
WHERE user_id =1 
GROUP by chat_room_id)
AND a.is_deleted = 0;
COMMIT;
