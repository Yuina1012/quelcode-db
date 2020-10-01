BEGIN;
UPDATE users
SET is_deleted = 1
WHERE mobile_tel = ' '
AND business_tel = ' ';
COMMIT;
