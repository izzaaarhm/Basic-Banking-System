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
                let depositAmount = parseFloat(await question(`Masukkan nominal uang yang ingin di deposit: `));
                if (isNaN(depositAmount)) {
                    throw new Error("Nominal invalid!");

                }else {
                    console.log(`\nMenambahkan saldo sebesar Rp${depositAmount} pada rekening milik ${account.holderName} ~\n`);
                    
                    setTimeout(() => {
                        account.deposit(depositAmount);

                        console.log(`Rp${depositAmount} telah ditambahkan ke rekening Anda. Saldo Akhir: Rp${account.balance}`);
                        resolve(account.balance);
                    }, 2000);
                }

            } catch (error) {
                reject(`Transaksi Eror pada akun dengan nomor ${account.accountNumber} (a.n. ${account.holderName}): ${error.message}`);
            }
        
    })
}

async function main() {
    try {
            console.log('Selamat Datang! Silahkan pilih menu:\n 1. Cek saldo \n 2. Deposit \n 3. Tarik saldo');
            let pilihMenu = parseInt(await question(`Pilihan Menu: `));

            if (pilihMenu == 1) {
                console.log(`Saldo Anda saat ini: Rp${account.balance}`);
            } else if (pilihMenu == 2) {
                await depositProcess(account);
            } else {
                console.log('Input tidak valid!');
            }
    } catch (error) {
        console.error(error.message);
    }

    rl.close();
}

main();