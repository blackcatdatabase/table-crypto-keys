-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  crypto_keys_latest
-- Latest version per basename
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_crypto_keys_latest AS
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

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  crypto_keys
-- Contract view for [crypto_keys]
-- Hides backup_blob (encrypted backup payload). Keeps metadata for inventory.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_crypto_keys AS
SELECT
  id,
  basename,
  version,
  filename,
  file_path,
  fingerprint,
  key_meta,
  key_type,
  algorithm,
  length_bits,
  origin,
  `usage`,
  scope,
  status,
  is_backup_encrypted,
  created_by,
  created_at,
  activated_at,
  retired_at,
  replaced_by,
  notes,
  backup_blob,
  CAST(LPAD(HEX(backup_blob), 64, '0') AS CHAR(64)) AS backup_blob_hex
FROM crypto_keys;


-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  crypto_keys_inventory
-- Inventory of keys by type/status
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_crypto_keys_inventory AS
SELECT
  key_type,
  status,
  COUNT(*) AS total
FROM crypto_keys
GROUP BY key_type, status
ORDER BY key_type, status;

