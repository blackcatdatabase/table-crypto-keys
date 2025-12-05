-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
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

-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
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

