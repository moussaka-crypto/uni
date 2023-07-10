interface Subject {
    void request();
}

class RealSubject implements Subject {
    public RealSubject() {
        heavyInitialConfiguration();
    }
    @Override
    public void request() {
        System.out.println("processing complete");
    }
    private void heavyInitialConfiguration() {
        System.out.println("Loading initial configuration...");
    }
}

public class Proxy implements Subject {
    private static RealSubject object;
    @Override
    public void request() {
        if (object == null) {
            object = new RealSubject();
        }
        object.request();
    }
}
class Client {
    public static void main (String [] args) {
        Subject obj = new Proxy();
        obj.request();
        obj.request();
    }
}