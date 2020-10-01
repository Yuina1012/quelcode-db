BEGIN;
UPDATE tasks
SET is_completed = 1, updated_by = 1
WHERE created_at BETWEEN '2020-4-26 09:00:00' AND '2020-4-26 11:30:00'
AND is_deleted = 0;
COMMIT;
