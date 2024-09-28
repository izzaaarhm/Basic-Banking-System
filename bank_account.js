class BankAccount {
    constructor(accountNumber, holderName, balance = 0) {
        this.accountNumber = accountNumber;
        this.holderName = holderName;
        this.balance = balance;
    }

    deposit(amount) {
        this.balance += amount;
        return this.balance;
    }

    withdraw(amount) {
        this.balance -= amount;
        return this.balance;
    }
    
}
module.exports = BankAccount;