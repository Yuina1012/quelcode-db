BEGIN;
UPDATE users
SET is_deleted = 1
WHERE (mobile_tel = '' AND business_tel = '' )
OR ( mobile_tel is NULL AND business_tel is NULL)
OR ( mobile_tel = '' AND business_tel is NULL)
OR ( mobile_tel is NULL AND business_tel = '');
COMMIT;
