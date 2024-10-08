CREATE OR REPLACE procedure withdraw(
    account_id  INT, 
    type VARCHAR(20), 
    amount DECIMAL(12,2))
LANGUAGE plpgsql
AS $$
BEGIN
    IF (SELECT saldo FROM akun WHERE no_akun = account_id) >= amount THEN
        UPDATE akun
        SET saldo = saldo - amount
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
            'penarikan saldo',
            amount,
            CURRENT_DATE,
            CURRENT_TIME);
    ELSE
        RAISE EXCEPTION 'saldo tidak cukup!';
    END IF;
END;
$$