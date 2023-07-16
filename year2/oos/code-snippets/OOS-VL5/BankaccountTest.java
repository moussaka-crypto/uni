import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.*;

public class BankaccountTest {
    Bankaccount myAccount = new Bankaccount("Sebastian Voss");

    @Test
    public void testBalanceZero() {
        assertNotNull(myAccount);
        assertEquals(0, myAccount.getBalance());
        assertTrue(myAccount.getBankAccId()>0);
    }
    @BeforeEach
    public void setUp() {
        myAccount = new Bankaccount("Sebastian Voss");
    }
    @RepeatedTest(10)
    public void testIDPositive() {
        assertTrue(myAccount.getBankAccId()>0);
    }

    @Test
    public void testonDev() {
        System.setProperty("ENV", "DEV");
        assumeTrue("DEV".equals(System.getProperty("ENV")));
    }

    @ParameterizedTest
    @ValueSource(ints = {2,5,2})
    void testNewBalance(int arg) {
        myAccount.deposit(arg);
        assertTrue(myAccount.getBalance() > 0);
    }
}


