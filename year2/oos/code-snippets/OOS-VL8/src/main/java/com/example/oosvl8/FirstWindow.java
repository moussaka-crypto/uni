package com.example.oosvl8;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class FirstWindow extends Application {

    public void start (Stage stage) {
        TextField helloWorld = new TextField("Hello FX.");
        Scene scene = new Scene(helloWorld);
        stage.setScene(scene);
        stage.show();
    }
    public static void main (String[] args) {
        launch(args);
    }
}