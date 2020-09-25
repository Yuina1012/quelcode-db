SELECT `id`, `name`, `information`, `is_deleted`, `is_direct_chat_room`, CASE `is_attachable` WHEN 0 THEN '許可' WHEN 1 THEN '削除' END, `created_at`, `created_by`, `updated_at`, `updated_by` FROM `chat_rooms` WHERE `is_deleted` = 0 AND `information` LIKE '%ダイレクトチャット' ORDER BY id;