
CREATE TABLE IF NOT EXISTS rekening (
	no_akun SERIAL PRIMARY KEY NOT NULL,
	id_nasabah INT NOT NULL,
	jenis_akun VARCHAR(20) NOT NULL CHECK (jenis_akun IN ('tabungan', 'deposito')),
	saldo DECIMAL(12, 2) NOT NULL,

	FOREIGN KEY (id_nasabah) REFERENCES nasabah(id_nasabah)
);

ALTER TABLE rekening
RENAME TO akun;

CREATE INDEX idx_id_nasabah ON akun(id_nasabah);
DROP INDEX idx_id_nasabah;

DROP TABLE IF EXISTS akun;
