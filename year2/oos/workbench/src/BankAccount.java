import java.util.concurrent.ThreadLocalRandom;

public class BankAccount {
    private float balance;
    private String name;
    private final long bankAccId;
    public BankAccount(String name) {
        this.name = name;
        this.balance = 0;
        this.bankAccId = ThreadLocalRandom.current().nextLong(0,
                Long.MAX_VALUE);
    }
    public void deposit (float amount){
        balance += amount;
    }
    public void withdraw (float amount){
        balance -= amount;
        //if(balance-amount<0) throw new NegativeDepositException();
    }
    public float getBalance (){
        return balance;
    }
    public long getBankAccId(){
        return bankAccId;
    }
    public void transfer(BankAccount target, float amount)
    {
        this.withdraw(amount);
        target.deposit(amount);
    }
}