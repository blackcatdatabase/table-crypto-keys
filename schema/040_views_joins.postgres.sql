-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   crypto_keys_latest

-- Latest version per basename
CREATE OR REPLACE VIEW vw_crypto_keys_latest AS
SELECT DISTINCT ON (basename)
  basename, id, version, status, algorithm, key_type, activated_at, retired_at
FROM crypto_keys
ORDER BY basename, version DESC;

-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   crypto_keys_inventory

-- Inventory of keys by type/status
CREATE OR REPLACE VIEW vw_crypto_keys_inventory AS
SELECT
  key_type,
  status,
  COUNT(*) AS total
FROM crypto_keys
GROUP BY key_type, status
ORDER BY key_type, status;

