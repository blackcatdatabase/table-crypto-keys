# 📦 Crypto Keys

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **crypto_keys** (repo: `crypto-keys`).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT | — | AS | PK |
| basename | VARCHAR(100) | NO | — |  |
| version | INTEGER | NO | — |  |
| filename | VARCHAR(255) | YES | — |  |
| file_path | VARCHAR(1024) | YES | — |  |
| fingerprint | CHAR(64) | YES | — |  |
| key_meta | JSONB | YES | — |  |
| key_type | TEXT | YES | — |  |
| algorithm | VARCHAR(64) | YES | — |  |
| length_bits | SMALLINT | YES | — |  |
| origin | TEXT | YES | — |  |
| usage | TEXT[] | YES | — |  |
| scope | VARCHAR(100) | YES | — |  |
| status | TEXT | NO | 'active' |  |
| is_backup_encrypted | BOOLEAN | NO | FALSE |  |
| backup_blob | BYTEA | YES | — |  |
| created_by | BIGINT | YES | — |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |
| activated_at | TIMESTAMPTZ(6) | YES | — |  |
| retired_at | TIMESTAMPTZ(6) | YES | — |  |
| replaced_by | BIGINT | YES | — |  |
| notes | TEXT | YES | — |  |

## Relationships
- FK → **crypto_keys** via (replaced_by) (ON DELETE SET NULL).
- FK → **users** via (created_by) (ON DELETE SET NULL).

```mermaid
erDiagram
  CRYPTO_KEYS {
    INT id PK
    VARCHAR basename
    INTEGER version
    VARCHAR filename
    VARCHAR file_path
    VARCHAR fingerprint
    JSONB key_meta
    VARCHAR key_type
    VARCHAR algorithm
    INT length_bits
    VARCHAR origin
    VARCHAR usage
    VARCHAR scope
    VARCHAR status
    BOOLEAN is_backup_encrypted
    BYTEA backup_blob
    INT created_by
    TIMESTAMPTZ created_at
    TIMESTAMPTZ activated_at
    TIMESTAMPTZ retired_at
    INT replaced_by
    VARCHAR notes
  }
  CRYPTO_KEYS }o--|| CRYPTO_KEYS : "replaced_by"
  CRYPTO_KEYS }o--|| USERS : "created_by"
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
