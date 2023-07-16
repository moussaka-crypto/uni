import java.util.ArrayList;
import java.util.List;

interface Department {
    void printDepartmentName();
}

class FinancialDepartment implements Department {
    private int id;
    private String name;

    public FinancialDepartment(int id, String name) {
        this.id = id;
        this.name = name;
    }
    @Override
    public void printDepartmentName() {
        System.out.println(this.name);
    }
}

class HeadDepartment implements Department {
    private int id;
    private String name;
    private List<Department> childDepartments;

    public HeadDepartment(int id, String name) {
        this.id = id;
        this.name = name;
        this.childDepartments = new ArrayList<>();
    }
    @Override
    public void printDepartmentName() {
        childDepartments.forEach(Department::printDepartmentName);
    }
    public void addDepartment (Department department) {
        childDepartments.add(department);
    }
}

public class CompositePattern {
    public static void main (String [] args) {
        Department finDep = new FinancialDepartment(1,"Financial Department 1");
        Department finDep2 = new FinancialDepartment(2,"Financial Department 2");

        HeadDepartment headDep = new HeadDepartment(3, "Head Department");
        headDep.addDepartment(finDep);
        headDep.addDepartment(finDep2);
        headDep.printDepartmentName();
    }
}