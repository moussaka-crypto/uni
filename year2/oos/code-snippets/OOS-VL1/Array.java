public class Array {
    public static void main (String [] args) {
        int [][] dreieck = new int [4][];
        int fuellung = 0;

        //int [][] altDreieck = {{0},{1,2},{3,4,5},{6,7,8,9,}};

        //Füllzähler
        for (int i = 0; i < dreieck.length; i++) {

            //Erzeugung der i-ten Zeile der Länge i
            dreieck[i] = new int[i+1];

            //Belegung der Felder und anschließend Ausgabe
            for (int j = 0; j < i+1; j++) {
                dreieck[i][j] = fuellung++;
                System.out.print(dreieck[i][j]);
                //System.out.print(altDreieck[i][j]);
            }
            System.out.println();
        }
    }
}
