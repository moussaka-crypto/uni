import org.junit.jupiter.api.*;

import java.util.concurrent.ThreadLocalRandom;

import static org.junit.jupiter.api.Assertions.*;

class BankAccountTest {

    BankAccount myAcc = new BankAccount("A");
    BankAccount targetAcc = new BankAccount("B");
    int transfer;


    public void setAccountUp()
    {
        myAcc.deposit(100);
        targetAcc.deposit(100);
    }

    @Test
    @DisplayName("Transfer Money")
    public void checkTransfer(){
        setAccountUp();
        assertNotNull(myAcc); assertNotNull(targetAcc); //b

        float myAccBalance = myAcc.getBalance(),
                targetAccBalance = targetAcc.getBalance();

        assertEquals(200, myAccBalance);
        assertEquals(200, targetAccBalance); //c

        int transferMoney = 50;
        myAcc.transfer(targetAcc, transferMoney);
        assertEquals(myAccBalance-transferMoney, myAcc.getBalance());
        assertEquals(targetAccBalance+transferMoney, targetAcc.getBalance());
    }


    @BeforeEach
    public void setUpTransferTests()
    {
        myAcc = new BankAccount("A");
        myAcc.deposit(200);
        targetAcc = new BankAccount("B");
        targetAcc.deposit(200);
        transfer = ThreadLocalRandom.current().nextInt(0, 50);
    }

    @RepeatedTest(10)
    @DisplayName("Test Transfer with random values.")
    public void transferTest()
    {
        float currBalance = myAcc.getBalance();
        float currTargetBalance = targetAcc.getBalance();
        myAcc.transfer(targetAcc,transfer);
        assertEquals(currBalance-transfer,myAcc.getBalance());
        assertEquals(currTargetBalance+transfer, targetAcc.getBalance());
    }
}