public class ConfigParameter {

    int a;
    int b;

    private static ConfigParameter instance;
    private ConfigParameter() {
        a = 1;
        b = 2;
    }

    public static ConfigParameter getInstance() {
        if (instance == null) {
            instance = new ConfigParameter();
        } return instance;
    }
}

class Main {
    public static void main (String [] args) {
        ConfigParameter cp1;
        cp1 = ConfigParameter.getInstance();
        System.out.println("Value a"+cp1.a);
    }
}