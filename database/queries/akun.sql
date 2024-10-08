INSERT INTO akun (
    id_nasabah, 
    jenis_akun, 
    saldo
) VALUES 
  (1, 'tabungan', 0.00),
  (2, 'deposito', 5000.00),
  (1, 'deposito', 2000.00),
  (3, 'deposito', 3000.00);
  (12, 'deposito', 1800.00),
  (3, 'tabungan', 4000.00),
  (7, 'deposito', 1500.00),
  (4, 'tabungan', 2500.00),
  (10, 'tabungan', 1000.00),
  (5, 'deposito', 3500.00),
  (13, 'tabungan', 2800.00),
  (6, 'tabungan', 3100.00),
  (11, 'deposito', 2000.00),
  (8, 'tabungan', 400.00),
  (9, 'tabungan', 900.00);

--untuk melihat saldo dengan no_akun tertentu
SELECT 
    a.no_akun, 
    a.saldo,
    nasabah.first_name || ' ' || nasabah.last_name AS nama_nasabah
FROM 
    akun a
INNER JOIN
    nasabah n ON a.id_nasabah = n.id_nasabah
WHERE 
    a.no_akun = 2;

--update untuk mengganti jenis_akun
UPDATE akun
SET jenis_akun = 'deposito'
WHERE no_akun = 9;

--delete sebuah akun
DELETE FROM akun
WHERE no_akun = 1 AND jenis_akun = 'tabungan';
