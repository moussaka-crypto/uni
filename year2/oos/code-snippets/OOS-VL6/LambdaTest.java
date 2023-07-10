public class LambdaTest {
    interface PrintLambda { int printSum(int n, int m); }

    public static void main (String [] args) {
        PrintLambda pL = (n,m) -> {return n+m;};
    System.out.println("Lambda-Wert: " + pL.printSum(5,4));
    }
}
