BEGIN;
UPDATE users
SET is_deleted = 1
WHERE mobile_tel is NULL
AND business_tel is NULL;
COMMIT;