# 📦 Crypto Keys

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

> Schema package for table **crypto_keys** (repo: $slug).

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
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| basename | VARCHAR(100) | NO | — |  |
| version | INT | NO | — |  |
| filename | VARCHAR(255) | YES | — |  |
| file_path | VARCHAR(1024) | YES | — |  |
| fingerprint | CHAR(64) | YES | — |  |
| key_meta | JSON | YES | — |  |
| key_type | ENUM(''dek'',''kek'',''hmac'',''pepper'') | YES | — |  |
| algorithm | VARCHAR(64) | YES | — |  |
| length_bits | SMALLINT | YES | — |  |
| origin | ENUM(''local'',''kms'',''imported'') | YES | — |  |
| usage | SET(''encrypt'',''decrypt'',''sign'',''verify'',''wrap'',''unwrap'') | YES | — |  |
| scope | VARCHAR(100) | YES | — |  |
| status | ENUM(''active'',''retired'',''compromised'',''archived'') | NO | '' |  |
| is_backup_encrypted | BOOLEAN | NO | 0 |  |
| backup_blob | LONGBLOB | YES | — |  |
| created_by | BIGINT UNSIGNED | YES | — |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |
| activated_at | DATETIME(6) | YES | — |  |
| retired_at | DATETIME(6) | YES | — |  |
| replaced_by | BIGINT UNSIGNED | YES | — |  |
| notes | TEXT | YES | — |  |

## Relationships
- FK → **crypto_keys** via (replaced_by) (ON DELETE SET NULL).
- FK → **users** via (created_by) (ON DELETE SET NULL).

```mermaid
erDiagram
  CRYPTO_KEYS {
    BIGINT id PK
    VARCHAR(100) basename
    INT version
    VARCHAR(255) filename
    VARCHAR(1024) file_path
    CHAR(64) fingerprint
    JSON key_meta
    ENUM(''dek'',''kek'',''hmac'',''pepper'') key_type
    VARCHAR(64) algorithm
    SMALLINT length_bits
    ENUM(''local'',''kms'',''imported'') origin
    SET(''encrypt'',''decrypt'',''sign'',''verify'',''wrap'',''unwrap'') usage
    VARCHAR(100) scope
    ENUM(''active'',''retired'',''compromised'',''archived'') status
    BOOLEAN is_backup_encrypted
    LONGBLOB backup_blob
    BIGINT created_by
    DATETIME(6) created_at
    DATETIME(6) activated_at
    DATETIME(6) retired_at
    BIGINT replaced_by
    TEXT notes
  }
  CRYPTO_KEYS }o--|| CRYPTO_KEYS : (replaced_by)
  CRYPTO_KEYS }o--|| USERS : (created_by)
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.

