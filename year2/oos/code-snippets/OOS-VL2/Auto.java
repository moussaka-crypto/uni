public class Auto {
    String farbe;
    String myAutoType;
    int Preis;
    int baujahr;
    int kmStand = 10000;
    int inspektionsIntervall = 15000;

    /*
    public Auto(String farbe) {
        this.Preis = 10000;
        this.farbe = farbe;
    }*/

    public Auto(String typ, String farbe, int baujahr, int kmStand, int inspektionsIntervall) {
        this.myAutoType = typ;
        this.farbe = farbe;
        this.baujahr = baujahr;
        this.kmStand = kmStand;
        this.inspektionsIntervall = inspektionsIntervall;
    }

    public String toString() { //overriding the toString() method
        return ("typ: "+ this.myAutoType.toString() +
                " farbe: " + this.farbe.toString() +
                " bauJahr: " + this.baujahr +
                " kmStand: " + this.kmStand +
                " inspektionsIntervall: " + this.inspektionsIntervall);
    }

    public static void main (String[] args) {
        Auto myAuto = new Auto("pkw", "blau", 2010, 10000, 50000);
        System.out.println(myAuto);
    }
}
