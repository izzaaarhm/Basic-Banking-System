const readline = require('readline');//import module readline di Node.js
const BankAccount = require('./bank_account');//import file

//bikin interface
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function question(query) {
    return new Promise((resolve) => rl.question(query, resolve));
}

let account = new BankAccount(2207421050, 'Wonwoo', 500);

function depositProcess(account) {
    return new Promise(async (resolve, reject) => {
            try {
                let j = true;

                while (j) {
                    let depositAmount = parseFloat(await question(`Masukkan nominal uang yang ingin dideposit: `));
                    if (isNaN(depositAmount)) {
                        console.error('Nominal invalid!');

                    } else if (depositAmount <= 0) {
                        console.error('Error! Nominal yang dimasukkan harus lebih dari 0!\n');
                        
                    } else {
                        j = false;
                        console.log(`\nMenambahkan saldo sebesar Rp${depositAmount} pada rekening milik ${account.holderName} ~\n`);
                    
                        setTimeout(() => {
                            account.deposit(depositAmount);

                            console.log(`Rp${depositAmount} berhasil ditambahkan ke rekening Anda. Saldo Akhir: Rp${account.balance}\n`);
                            resolve(account.balance);
                        }, 2000);
                    }
                }

            } catch (error) {
                reject(`Transaksi Eror pada akun dengan nomor ${account.accountNumber} (a.n. ${account.holderName}): ${error.message}`);
            }
    })
}

function withdrawProcess(account) {
    return new Promise(async (resolve, reject) => {
            try {
                let k = true;

                while (k) {
                    let withdrawAmount = parseFloat(await question(`Masukkan nominal uang yang ingin ditarik: `));
                    if (isNaN(withdrawAmount)) {
                        console.error("Nominal invalid!\n");

                    } else if (withdrawAmount > account.balance) {
                        console.error(`Saldo tidak cukup. Saldo Anda: Rp${account.balance}\n`);

                    } else {
                        k = false;    
                        console.log(`\nMenarik saldo sebesar Rp${withdrawAmount} pada rekening milik ${account.holderName} ~\n`);
                    
                        setTimeout(() => {
                            account.withdraw(withdrawAmount);

                            console.log(`Rp${withdrawAmount} berhasil diambil dari rekening Anda. Saldo Akhir: Rp${account.balance}\n`);
                            resolve(account.balance);
                        }, 2000);
                    }
                }

            } catch (error) {
                reject(`Transaksi Eror pada akun dengan nomor ${account.accountNumber} (a.n. ${account.holderName}): ${error.message}`);
            }
    })
}

async function main() {
    try {
        let i = true;

        while (i) {
            console.log('\nSelamat Datang! Pilihan menu:\n 1. Cek saldo \n 2. Deposit \n 3. Tarik saldo');
            let pilihMenu = parseInt(await question(`Pilih Menu (masukkan nomor menu): `));

            if (pilihMenu == 1) {
                console.log(`Saldo Anda saat ini: Rp${account.balance}`);
            } else if (pilihMenu == 2) {
                await depositProcess(account);
            } else if (pilihMenu == 3) {
                await withdrawProcess(account);
            } else {
                console.log('Input tidak valid!');
            }

            let pilihLanjut = await question(`Ingin pilih menu lain? (y/n): `);
            if (pilihLanjut.toLowerCase() !== 'y') {
                console.log('\nTerima Kasih!');
                i = false;
            }
        }      

    } catch (error) {
        console.error(error.message);
    }

    rl.close();
}

main();