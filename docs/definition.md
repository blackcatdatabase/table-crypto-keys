<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – crypto_keys

Local key registry (DEKs, KEKs, HMAC, peppers).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| basename | VARCHAR(100) | NO | — | Logical key basename. |  |
| version | INT | NO | — | Monotonic version per basename. |  |
| filename | VARCHAR(255) | YES | — | Optional filename where stored. |  |
| file_path | VARCHAR(1024) | YES | — | Filesystem path or vault path. |  |
| fingerprint | CHAR(64) | YES | — | Key fingerprint / digest. |  |
| key_meta | JSON | YES | — | JSON metadata (key parameters). |  |
| key_type | ENUM('dek','kek','hmac','pepper') | YES | — | Key purpose type. | enum: dek, kek, hmac, pepper |
| algorithm | VARCHAR(64) | YES | — | Algorithm identifier. |  |
| length_bits | SMALLINT | YES | — | Key length in bits. |  |
| origin | ENUM('local','kms','imported') | YES | — | Key origin. | enum: local, kms, imported |
| usage | SET('encrypt','decrypt','sign','verify','wrap','unwrap') | YES | — | Allowed operations (SET field). | enum: encrypt, decrypt, sign, verify, wrap, unwrap |
| scope | VARCHAR(100) | YES | — | Business scope tag (e.g., orders). |  |
| status | ENUM('active','retired','compromised','archived') | NO | 'active' | Lifecycle state. | enum: active, retired, compromised, archived |
| is_backup_encrypted | BOOLEAN | NO | 0 | Backup blob is encrypted with KEK. |  |
| backup_blob | LONGBLOB | YES | — | Encrypted backup (binary). | PII: encrypted |
| created_by | BIGINT UNSIGNED | YES | — | Admin user who created key (FK users.id). |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| activated_at | DATETIME(6) | YES | — | Activation timestamp. |  |
| retired_at | DATETIME(6) | YES | — | Retirement timestamp. |  |
| replaced_by | BIGINT UNSIGNED | YES | — | Next key id when rotated. |  |
| notes | TEXT | YES | — | Free-form notes. |  |