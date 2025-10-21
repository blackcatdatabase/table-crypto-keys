-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: crypto_keys
CREATE TABLE IF NOT EXISTS crypto_keys (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  basename VARCHAR(100) NOT NULL,
  version INT NOT NULL,
  filename VARCHAR(255) NULL,
  file_path VARCHAR(1024) NULL,
  fingerprint CHAR(64) NULL,
  key_meta JSON NULL,
  key_type ENUM(''dek'',''kek'',''hmac'',''pepper'') NULL,
  algorithm VARCHAR(64) NULL,
  length_bits SMALLINT NULL,
  origin ENUM(''local'',''kms'',''imported'') NULL,
  usage SET(''encrypt'',''decrypt'',''sign'',''verify'',''wrap'',''unwrap'') NULL,
  scope VARCHAR(100) NULL,
  status ENUM(''active'',''retired'',''compromised'',''archived'') NOT NULL DEFAULT ''active'',
  is_backup_encrypted BOOLEAN NOT NULL DEFAULT 0,
  backup_blob LONGBLOB NULL,
  created_by BIGINT UNSIGNED NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  activated_at DATETIME(6) NULL,
  retired_at DATETIME(6) NULL,
  replaced_by BIGINT UNSIGNED NULL,
  notes TEXT NULL,
  CONSTRAINT uq_keys_basename_version UNIQUE (basename, version)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
