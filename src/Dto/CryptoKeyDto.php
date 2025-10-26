<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\CryptoKeys\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class CryptoKeyDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $basename,
        public readonly int $version,
        public readonly ?string $filename,
        public readonly ?string $filePath,
        public readonly ?string $fingerprint,
        public readonly array|null $keyMeta,
        public readonly ?string $keyType,
        public readonly ?string $algorithm,
        public readonly ?int $lengthBits,
        public readonly ?string $origin,
        public readonly ?string $usage,
        public readonly ?string $scope,
        public readonly string $status,
        public readonly bool $isBackupEncrypted,
        public readonly ?string $backupBlob,
        public readonly ?int $createdBy,
        public readonly \DateTimeImmutable $createdAt,
        public readonly ?\DateTimeImmutable $activatedAt,
        public readonly ?\DateTimeImmutable $retiredAt,
        public readonly ?int $replacedBy,
        public readonly ?string $notes
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
