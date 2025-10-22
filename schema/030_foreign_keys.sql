-- Auto-generated from schema-map.psd1 (map@6cefe8e)
-- table: crypto_keys
ALTER TABLE crypto_keys ADD CONSTRAINT fk_keys_created_by FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE crypto_keys ADD CONSTRAINT fk_keys_replaced_by FOREIGN KEY (replaced_by) REFERENCES crypto_keys(id) ON DELETE SET NULL;
