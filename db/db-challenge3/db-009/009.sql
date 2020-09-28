SELECT  c.name, COUNT(p.chat_room_id) AS 投稿数 
FROM chat_rooms AS c 
JOIN posts AS p
ON c.id = p.chat_room_id 
JOIN users AS u 
ON p.posted_by =  u.id 
WHERE p.is_deleted = 0 AND u.is_deleted = 0
GROUP BY p.chat_room_id 
ORDER BY 投稿数 DESC;
