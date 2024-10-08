--halo kak mughie! nanti klo mau run file di migration berurutan ya kakk;
--dari nasabah (run ALTER nya dulu ya kak)> akun (janlup run ALTER nya kak)> transaksi > procedure
--semangatt kak nilainya^^

CREATE DATABASE IF NOT EXISTS Challenge3;

CREATE TABLE IF NOT EXISTS nasabah (
	id_nasabah SERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL
);

ALTER TABLE nasabah 
ADD COLUMN alamat_nasabah VARCHAR(255) NOT NULL;

CREATE INDEX idx_id_nasabah ON nasabah(id_nasabah);
DROP INDEX idx_id_nasabah;

DROP TABLE IF EXISTS nasabah;
