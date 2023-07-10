public class Adapter {
    public static void main (String [] args) {
        Movable bmw = new BMW();
        MovableAdapter bmwAdapter = new MovableAdapterImpl(bmw);
        System.out.println("BMW Adapter: " + bmwAdapter.getSpeed());
    }
}

interface Movable {
    //returns speed in MPH
    double getSpeed();
}
class BMW implements Movable {
    @Override
    public double getSpeed() {
        return 180;
    }
}
interface MovableAdapter {
    //returns speed in KMH
    double getSpeed();
}

class MovableAdapterImpl implements MovableAdapter {
    private Movable cars;
    MovableAdapterImpl(Movable mover) {
        this.cars = mover;
    }
    @Override
    public double getSpeed() {
        return convertMPHtoMKH(cars.getSpeed());
        }
        private double convertMPHtoMKH(double mph) {
        return mph*1.60934;
    }
}