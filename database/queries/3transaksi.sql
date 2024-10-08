--create/insert data
INSERT INTO transaksi(
    no_akun,
    id_nasabah,
    jenis_transaksi,
    nominal,
    tanggal,
    waktu
) VALUES
(1, 1, 'deposit', 1500.00, '2024-10-01', '10:15:00'),
(2, 2, 'deposit', 2000.00, '2024-10-03', '12:30:00'),
(2, 2, 'withdraw', 700.00, '2024-10-04', '13:45:00'),
(3, 1, 'deposit', 1800.00, '2024-10-05', '14:00:00'),
(6, 3, 'withdraw', 400.00, '2024-10-06', '15:20:00'),
(4, 3, 'deposit', 2500.00, '2024-10-07', '09:40:00'),
(5, 12, 'withdraw', 1200.00, '2024-10-08', '10:50:00'),
(8, 4, 'withdraw', 1000.00, '2024-10-09', '11:25:00'),
(11, 5, 'deposit', 3200.00, '2024-10-10', '12:05:00');

--read data(menampilkan transaksi dengan jenis withdraw saja, pake pagination)
SELECT *
FROM transaksi
WHERE jenis_transaksi = 'withdraw'
ORDER BY id_transaksi
LIMIT 3 OFFSET 0;

--update data pada tabel transaksi dengan memanggil procedure deposit
CALL deposit(1, 'deposit', 500.00);

--update data pada tabel transaksi dengan memanggil procedure withdraw
CALL withdraw(2, 'withdraw', 1000.00);
