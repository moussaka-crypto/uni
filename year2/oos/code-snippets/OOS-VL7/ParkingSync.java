class Counter {
    private int count = 50;
    private int limit = 100;

    public synchronized void inc() {
        if(this.count<limit) {
            count++;
            System.out.println("Cap++"+this.count);
        }
    }
    public synchronized void dec() {
        if(this.count>0) {
            count--;
            System.out.println("Cap++"+this.count);
        }
    }
}

class inGate implements Runnable {
    Counter count;
    inGate(Counter c) {
        count = c;
    }
    @Override
    public void run() {
        count.dec();
    }
}

class outGate implements Runnable {
    Counter count;
    outGate(Counter c) {
        count = c;
    }
    @Override
    public void run() {
        count.inc();
    }
}

public class ParkingSync {
    private static Counter x = new Counter();
    public static void main (String [] args) {
        new Thread(new outGate(x)).start();
        new Thread(new outGate(x)).start();
        new Thread(new inGate(x)).start();
        new Thread(new inGate(x)).start();
        new Thread(new inGate(x)).start();
    }
}
