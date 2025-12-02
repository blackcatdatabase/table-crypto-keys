-- Auto-generated from schema-views-mysql.yaml (map@94ebe6c)
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
