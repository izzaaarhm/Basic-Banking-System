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
            throw new Error("Nominal yang dimasukkan harus positif dan lebih dari 0!");
        }
        
    }

}
module.exports = BankAccount;