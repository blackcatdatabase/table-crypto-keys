<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\CryptoKeys;

final class Definitions {
    // --- základní metadata ---
    public static function table(): string { return 'crypto_keys'; }
    public static function contractView(): string { return 'v_crypto_keys_contract'; }
    /** @return string[] */
    public static function columns(): array { return [ 'id', 'basename', 'version', 'filename', 'file_path', 'fingerprint', 'key_meta', 'key_type', 'algorithm', 'length_bits', 'origin', 'usage', 'scope', 'status', 'is_backup_encrypted', 'backup_blob', 'created_by', 'created_at', 'activated_at', 'retired_at', 'replaced_by', 'notes' ]; }
    public static function pk(): string { return 'id'; }

    // --- volitelná metadata (mohou být prázdná) ---
    public static function softDeleteColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function updatedAtColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function versionColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null; // pro optimistic locking
    }
    /** např. "created_at DESC, id DESC" */
    public static function defaultOrder(): ?string {
        $c = 'created_at DESC, id DESC'; return $c !== '' ? $c : null;
    }
    /** @return array<int,array<int,string>> seznam unikátních klíčů (sloupcových kombinací) */
    public static function uniqueKeys(): array { return []; }
    /** @return string[] JSON sloupce kvůli castům/operacím */
    public static function jsonColumns(): array { return [ 'key_meta' ]; }

    // --- pomocníci ---
    public static function hasColumn(string $col): bool {
        static $set = null;
        if ($set === null) { $set = array_fill_keys(self::columns(), true); }
        return isset($set[$col]);
    }
}
