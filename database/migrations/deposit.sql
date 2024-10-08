CREATE OR REPLACE procedure deposit(
    account_id  INT, 
    type VARCHAR(20), 
    amount DECIMAL(12,2))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE akun
    SET saldo = saldo + amount
    WHERE no_akun = account_id;

    INSERT INTO transaksi (
        no_akun,
        id_nasabah,
        jenis_transaksi,
        nominal,
        tanggal,
        waktu)
    VALUES (
        account_id, 
        (SELECT id_nasabah FROM akun WHERE no_akun = account_id),
        'deposit',
        amount,
        CURRENT_DATE,
        CURRENT_TIME);

END;
$$;