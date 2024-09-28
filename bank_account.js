class BankAccount {
    constructor(accountNumber, holderName, balance = 0) {
        this.accountNumber = accountNumber;
        this.holderName = holderName;
        this.balance = balance;
    }

    deposit(amount) {
        if (amount > 0) {
            this.balance += amount;
            return this.balance;
        }else {
            console.log('Error! Nominal yang dimasukkan harus positif dan lebih dari 0!');
        }
        
    }

    withdraw(amount) {
        if (amount <= this.balance) {
            this.balance -= amount;
            return this.balance;
        } else {
            console.log('Error! Saldo tidak cukup. :(');
        }
    }
    
}
module.exports = BankAccount;