
let saldo = 0;

function tambahSaldo() {
   
    let jumlah = parseFloat(window.prompt('Masukkan jumlah saldo yang ingin ditambahkan:'));

    saldo += jumlah;
    alert(`Saldo berhasil ditambahkan. Saldo akhir: Rp${saldo}`);
}

function kurangiSaldo() {
    
    let jumlah = parseFloat(window.prompt('Masukkan jumlah saldo yang ingin dikurangi:'));

    if (jumlah <= saldo) {
        saldo -= jumlah;
        alert(`Saldo berhasil dikurangi. Saldo akhir: Rp${saldo}`);
    } else {
        alert('Saldo tidak cukup! :(');
    }
}

function pilihMenu() {
    let pilihan = parseFloat(window.prompt('Masukkan pilihan menu:'))
    
    if (pilihan == 1)
        alert(`Saldo Anda saat ini: Rp${saldo}`);
    
    else if (pilihan == 2) 
        tambahSaldo()
        
    else if (pilihan == 3)
        kurangiSaldo()
    else 
        alert('Input tidak valid');
}

pilihMenu()
