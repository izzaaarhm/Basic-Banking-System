class BankAccount {
    constructor(owner, saldo) {
        this.owner = owner;
        this.saldo = saldo;
    }

    deposit(amount) {
        if (amount > 0) {
            this.saldo += amount;
            return this.saldo;
        }else {
            throw new Error("Nominal yang dimasukkan harus positif dan lebih dari 0!");
        }
        
    }
}