import java.util.Scanner;

public class A5 {
    public static void main(String [] args)
    {
        //Aufgabe 5a
        System.out.print("Wie viele Fibonacci-Zahlen möchten Sie haben: ");
        final int limit;
        Scanner userInput = new Scanner(System.in);
        limit = userInput.nextInt();

        long fib[] = new long[limit]; // long => kein Überlauf für 50 Zahlen
        fib[0]=1;
        fib[1]=1;
        System.out.println("1 -> 1");
        System.out.println("2 -> 1");

        for(int i=2; i < limit; i++)
        {
            fib[i] = fib[i-1]+fib[i-2];
            System.out.println(i+1 + " -> " + fib[i]);
        }

        new java.util.Scanner(System.in).nextLine();
        //Aufgabe 5b

        // Konstanten zu Definition der Matrizendimensionen:
        // I = Zeilen von a; J = Spalten von a = Zeilen von b; K = Spalten von b
        final int I = 3, J = 2, K = 3;

        // Definition der Felder:
        int a[][] = new int[I][J];
        int b[][] = new int[J][K];
        int c[][] = new int[I][K];

        // Initialisierung von a:
        for (int zeile = 0; zeile < I; zeile++) {
            for (int spalte = 0; spalte < J; spalte++) {
                a[zeile][spalte] = 10 * (zeile) + spalte;
            }
        }
        // Ausgabe von a:
        System.out.println("a:");
        for (int zeile = 0; zeile < I; zeile++) {
            for (int spalte = 0; spalte < J; spalte++) {
                System.out.print(a[zeile][spalte] + " ");
            }
            System.out.println();
        }
        // Initialisierung von b:
        for (int zeile = 0; zeile < J; zeile++) {
            for (int spalte = 0; spalte < K; spalte++) {
                b[zeile][spalte] = zeile + 10 * (spalte);
            }
        }
        // Ausgabe von b:
        System.out.println("b:");
        for (int zeile = 0; zeile < J; zeile++) {
            for (int spalte = 0; spalte < K; spalte++) {
                System.out.print(b[zeile][spalte] + " ");
            }
            System.out.println();
        }
        // Multiplikation:
        for (int zeile = 0; zeile < I; zeile++) {
            for (int spalte = 0; spalte < K; spalte++) {
                c[zeile][spalte] = 0;
                for (int index = 0; index < J; index++) {
                    c[zeile][spalte] = c[zeile][spalte] + (a[zeile][index] * b[index][spalte]);
                }
            }
        }
        // Ausgabe der Ergebnismatrix:
        System.out.println("a * b:");
        for (int zeile = 0; zeile < I; zeile++) {
            for (int spalte = 0; spalte < K; spalte++) {
                System.out.print(c[zeile][spalte] + " ");
            }
            System.out.println();
        }
    }
}
