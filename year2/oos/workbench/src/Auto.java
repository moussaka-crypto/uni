public class Auto {
    String Typ, Farbe;
    int baujahr, kmStand=1000, inspektionsIntervall=1500;

    public Auto(String typ, String farbe, int baujahr, int kmStand, int inspektionsIntervall)
    {
        this.Typ = typ;
        this.Farbe=farbe;
        this.baujahr = baujahr;
        this.kmStand=kmStand;
        this.inspektionsIntervall=inspektionsIntervall;
    }
    //public Auto(String farbe) {this.Farbe=farbe;}
    //public Auto(String typ) {this.Typ=typ;}
}
