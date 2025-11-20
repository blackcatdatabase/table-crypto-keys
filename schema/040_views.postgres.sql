-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
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
  notes,
  backup_blob,
  UPPER(encode(backup_blob,'hex')) AS backup_blob_hex
FROM crypto_keys;

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  crypto_keys_inventory
-- Inventory of keys by type/status
CREATE OR REPLACE VIEW vw_crypto_keys_inventory AS
SELECT
  key_type,
  status,
  COUNT(*) AS total
FROM crypto_keys
GROUP BY key_type, status
ORDER BY key_type, status;


-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  crypto_keys_latest
-- Latest version per basename
CREATE OR REPLACE VIEW vw_crypto_keys_latest AS
SELECT DISTINCT ON (basename)
  basename, id, version, status, algorithm, key_type, activated_at, retired_at
FROM crypto_keys
ORDER BY basename, version DESC;

