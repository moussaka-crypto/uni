package com.example.oosvl8;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class BankkontoFXML extends Application {

private TextField kontstandFeld;
private Button einzahlenButton;
private Button abhebenButton;
private TextField betragFeld;
private Bankkonto konto;

public static void main(String[] args) { launch(args); }

    @Override
    public void start(Stage stage) throws Exception {

    Parent anwendung = FXMLLoader.load(getClass().getResource("Bankkonto.fxml"));
    Scene scene = new Scene(anwendung);
    stage.setScene(scene);
    stage.setTitle("Bankkonto");
    stage.show();
    }
}
