import java.util.Scanner;

public class A4 {
    public static void main(String [] args)
    {
        //         Aufgabe 4
        System.out.print("Welche Fibonacci Zahl? : ");
        final int limit;
        Scanner userInput = new Scanner(System.in);
        limit = userInput.nextInt();
        long ergebnis = 1;

        for(int i=2; i<=limit; i++) {
            ergebnis*=i;
        }
        System.out.print(limit+"! = " + ergebnis);
        // Wert = -70609262346240000 wegen Überlauf
    }

}
