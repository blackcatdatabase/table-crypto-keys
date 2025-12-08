# crypto_keys

Local key registry (DEKs, KEKs, HMAC, peppers).

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| activated_at | TIMESTAMPTZ(6) | YES |  | Activation timestamp. |
| algorithm | VARCHAR(64) | YES |  | Algorithm identifier. |
| backup_blob | BYTEA | YES |  | Encrypted backup (binary). |
| basename | VARCHAR(100) | NO |  | Logical key basename. |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| created_by | BIGINT | YES |  | Admin user who created key (FK users.id). |
| file_path | VARCHAR(1024) | YES |  | Filesystem path or vault path. |
| filename | VARCHAR(255) | YES |  | Optional filename where stored. |
| fingerprint | CHAR(64) | YES |  | Key fingerprint / digest. |
| id | BIGINT | NO |  | Surrogate primary key. |
| is_backup_encrypted | BOOLEAN | NO | FALSE | Backup blob is encrypted with KEK. |
| key_meta | JSONB | YES |  | JSON metadata (key parameters). |
| key_type | TEXT | YES |  | Key purpose type. (enum: dek, kek, hmac, pepper) |
| length_bits | SMALLINT | YES |  | Key length in bits. |
| notes | TEXT | YES |  | Free-form notes. |
| origin | TEXT | YES |  | Key origin. (enum: local, kms, imported) |
| replaced_by | BIGINT | YES |  | Next key id when rotated. |
| retired_at | TIMESTAMPTZ(6) | YES |  | Retirement timestamp. |
| scope | VARCHAR(100) | YES |  | Business scope tag (e.g., orders). |
| status | TEXT | NO | active | Lifecycle state. (enum: active, retired, compromised, archived) |
| usage | TEXT[] | YES |  | Allowed operations (set/array of values: encrypt,decrypt,sign,verify,wrap,unwrap). (enum: encrypt, decrypt, sign, verify, wrap, unwrap) |
| version | INTEGER | NO |  | Monotonic version per basename. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_keys_basename_version | basename, version |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| uq_keys_basename_version | basename,version | CONSTRAINT uq_keys_basename_version UNIQUE (basename, version) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_keys_created_by | created_by | users(id) | ON DELETE SET |
| fk_keys_replaced_by | replaced_by | crypto_keys(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_keys_basename_version | basename, version |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| uq_keys_basename_version | basename,version | CONSTRAINT uq_keys_basename_version UNIQUE (basename, version) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_keys_created_by | created_by | users(id) | ON DELETE SET |
| fk_keys_replaced_by | replaced_by | crypto_keys(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_crypto_keys | mysql | algorithm=MERGE, security=INVOKER | [packages\crypto-keys\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/crypto-keys/schema/040_views.mysql.sql) |
| vw_crypto_keys_inventory | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\crypto-keys\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/crypto-keys/schema/040_views_joins.mysql.sql) |
| vw_crypto_keys_latest | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\crypto-keys\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/crypto-keys/schema/040_views_joins.mysql.sql) |
| vw_crypto_keys | postgres |  | [packages\crypto-keys\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/crypto-keys/schema/040_views.postgres.sql) |
| vw_crypto_keys_inventory | postgres |  | [packages\crypto-keys\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/crypto-keys/schema/040_views_joins.postgres.sql) |
| vw_crypto_keys_latest | postgres |  | [packages\crypto-keys\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/crypto-keys/schema/040_views_joins.postgres.sql) |
