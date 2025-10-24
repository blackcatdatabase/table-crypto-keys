-- Auto-generated from schema-views-postgres.psd1 (map@mtime:2025-10-24T09:45:40Z)
-- engine: postgres
-- table:  crypto_keys
-- Contract view for [crypto_keys]
-- Hides backup_blob (encrypted backup payload). Keeps metadata for inventory.
CREATE OR REPLACE VIEW vw_crypto_keys AS
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
  "usage",
  scope,
  status,
  is_backup_encrypted,
  created_by,
  created_at,
  activated_at,
  retired_at,
  replaced_by,
  notes
FROM crypto_keys;
