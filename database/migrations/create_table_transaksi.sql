CREATE TABLE IF NOT EXISTS transaksi (
	id_transaksi SERIAL PRIMARY KEY NOT NULL,
	no_akun INT NOT NULL,
	id_nasabah INT NOT NULL,
	jenis_transaksi VARCHAR(20) NOT NULL CHECK (jenis_transaksi IN ('deposit', 'penarikan saldo')),
	nominal DECIMAL(12, 2) NOT NULL,
	tanggal DATE NOT NULL,
	
	FOREIGN KEY (no_akun) REFERENCES akun(no_akun),
	FOREIGN KEY (id_nasabah) REFERENCES nasabah(id_nasabah)
);

ALTER TABLE transaksi
ADD COLUMN waktu TIME NOT NULL;

CREATE INDEX idx_id_transaksi ON transaksi(id_transaksi);
DROP INDEX idx_id_transaksi;

DROP TABLE IF EXISTS transaksi;
