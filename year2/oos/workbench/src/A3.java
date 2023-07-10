import java.util.Scanner;

public class A3 {
    public static void main(String[] args)
    {
        //         Aufgabe 3
        System.out.print("Die Zahl eingeben: ");
        final int input;
        Scanner userInput = new Scanner(System.in);
        input = userInput.nextInt();

        int i = input;
        int div = 2;
        boolean firstTime = true;
        System.out.print("Primfaktorzerlegung von " + i + ": ");

        while(i>1)
        {
            if(i % div!=0) {
                div++;
            }
            else {
                i /= div;
                if(firstTime) {
                    System.out.print(div);
                    firstTime = false;
                }
                else {
                    System.out.print("*"+div);
                }
            }
        }
    }
}
