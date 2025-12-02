-- Auto-generated from joins-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- view:   crypto_keys_latest

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_crypto_keys_latest AS
SELECT
  basename,
  id,
  version,
  status,
  algorithm,
  key_type,
  activated_at,
  retired_at
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY basename ORDER BY version DESC) AS rn
  FROM crypto_keys
) ranked
WHERE rn = 1
ORDER BY basename;

-- Auto-generated from joins-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- view:   crypto_keys_inventory

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_crypto_keys_inventory AS
SELECT
  key_type,
  status,
  COUNT(*) AS total
FROM crypto_keys
GROUP BY key_type, status
ORDER BY key_type, status;

