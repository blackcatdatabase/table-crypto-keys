-- Auto-generated from schema-map-postgres.yaml (map@sha1:F0EE237771FBA8DD7C4E886FF276F91A862C3718)
-- engine: postgres
-- table:  crypto_keys

ALTER TABLE crypto_keys ADD CONSTRAINT fk_keys_created_by FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE crypto_keys ADD CONSTRAINT fk_keys_replaced_by FOREIGN KEY (replaced_by) REFERENCES crypto_keys(id) ON DELETE SET NULL;
