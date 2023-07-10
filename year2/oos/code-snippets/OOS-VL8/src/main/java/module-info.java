module com.example.oosvl8 {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.oosvl8 to javafx.fxml;
    exports com.example.oosvl8;
}