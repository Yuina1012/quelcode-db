SELECT c.name, d.`最新投稿日`, u.name
FROM (SELECT p.chat_room_id AS `チャットルームID`,MAX(p.posted_at) AS `最新投稿日` 
      FROM posts AS p 
      JOIN users AS u 
      ON p.posted_by = u.id 
      WHERE u.is_deleted =0 AND p.is_deleted =0 
      GROUP BY p.chat_room_id) AS d
INNER JOIN posts p
ON p.chat_room_id=d.`チャットルームID`AND p.posted_at = d.`最新投稿日`
JOIN chat_rooms AS c
ON p.chat_room_id = c.id
JOIN users AS u
ON p.posted_by = u.id
ORDER BY p.chat_room_id;