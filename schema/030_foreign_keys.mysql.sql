-- Auto-generated from schema-map-mysql.psd1 (map@734a489)
-- engine: mysql
-- table:  crypto_keys
ALTER TABLE crypto_keys ADD CONSTRAINT fk_keys_created_by FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL;

ALTER TABLE crypto_keys ADD CONSTRAINT fk_keys_replaced_by FOREIGN KEY (replaced_by) REFERENCES crypto_keys(id) ON DELETE SET NULL;
