interface Polygon {
    public String getType();
}

class Triangle implements Polygon {
    @Override
    public String getType() {
        return "Triangle";
    }
}

class Square implements Polygon {
    @Override
    public String getType() {
        return "Square";
    }
}

class Pentagon implements Polygon {
    @Override
    public String getType() {
        return "Pentagon";
    }
}

class PolygonFactory {
    public static Polygon getInstance(int sides) {
        Polygon polygon = null;
        switch (sides) {
            case 3: polygon = new Triangle();
            break;
            case 4: polygon = new Square();
            break;
            case 5: polygon = new Pentagon();
            break;
            default: //throw exception
        }
        return polygon;
    }
}

class MyFactoryClient {
    public static void main (String [] args) {
        // triangle
        Polygon polygon = PolygonFactory.getInstance(3);
        System.out.println(polygon.getType());
        // pentagon
        Polygon pentagon = PolygonFactory.getInstance(5);
        System.out.println(pentagon.getType());
    }
}