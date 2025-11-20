<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – crypto_keys

Local key registry (DEKs, KEKs, HMAC, peppers).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| basename | VARCHAR(100) | NO | — | Logical key basename. |  |
| version | INTEGER | NO | — | Monotonic version per basename. |  |
| filename | VARCHAR(255) | YES | — | Optional filename where stored. |  |
| file_path | VARCHAR(1024) | YES | — | Filesystem path or vault path. |  |
| fingerprint | CHAR(64) | YES | — | Key fingerprint / digest. |  |
| key_meta | JSONB | YES | — | JSON metadata (key parameters). |  |
| key_type | TEXT | YES | — | Key purpose type. | enum: dek, kek, hmac, pepper |
| algorithm | VARCHAR(64) | YES | — | Algorithm identifier. |  |
| length_bits | SMALLINT | YES | — | Key length in bits. |  |
| origin | TEXT | YES | — | Key origin. | enum: local, kms, imported |
| usage | TEXT[] | YES | — | Allowed operations (set/array of values: encrypt,decrypt,sign,verify,wrap,unwrap). | enum: encrypt, decrypt, sign, verify, wrap, unwrap |
| scope | VARCHAR(100) | YES | — | Business scope tag (e.g., orders). |  |
| status | TEXT | NO | 'active' | Lifecycle state. | enum: active, retired, compromised, archived |
| is_backup_encrypted | BOOLEAN | NO | FALSE | Backup blob is encrypted with KEK. |  |
| backup_blob | BYTEA | YES | — | Encrypted backup (binary). | PII: encrypted |
| created_by | BIGINT | YES | — | Admin user who created key (FK users.id). |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| activated_at | TIMESTAMPTZ(6) | YES | — | Activation timestamp. |  |
| retired_at | TIMESTAMPTZ(6) | YES | — | Retirement timestamp. |  |
| replaced_by | BIGINT | YES | — | Next key id when rotated. |  |
| notes | TEXT | YES | — | Free-form notes. |  |