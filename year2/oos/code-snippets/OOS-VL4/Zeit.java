import java.io.Serializable;

public class Zeit implements Serializable {

    private int stunde;
    private int minute;
    public Zeit(int stunde, int minute) {
        this.stunde = stunde;
        this.minute = minute;
    }

    public String toString() {
        return stunde + ":" + minute;
    }
}
