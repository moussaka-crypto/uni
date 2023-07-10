package com.example.oosvl8;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class BankkontoGUI extends Application {
    private TextField kontostandFeld;
    private Button einzahlenButton;
    private Button abhebenButton;
    private TextField betragFeld;
    private Bankkonto konto;

    @Override
    public void start (Stage stage) throws Exception {
        Label konstostandLabel = new Label("Konstand");
        TextField konstostandField = new TextField();

        //FlowPane Kontostand
        FlowPane kontostandPane = new FlowPane();
        kontostandPane.getChildren().addAll(konstostandLabel,konstostandField);

        //Betrag
        Label betragLabel = new Label ("Betrag");
        TextField betragFeld = new TextField();

        //FlowPane Betrag
        FlowPane betragPane = new FlowPane();
        betragPane.getChildren().addAll(betragLabel,betragFeld);

        EventHandler<ActionEvent> handlingButton = new myHandler();

        //Buttons: Einzahlen und Abheben
        FlowPane buttons = new FlowPane();
        einzahlenButton = new Button();
        abhebenButton = new Button();
        einzahlenButton.setText("einzahlen");
        abhebenButton.setText("abheben");
        buttons.getChildren().addAll(einzahlenButton,abhebenButton);

        konto = new Bankkonto("SVoss");
        konto.deposit(100);

        //einzahlenButton.setOnAction(handlingButton);
        einzahlenButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                konto.deposit((float) Double.parseDouble(betragFeld.getText()));
                konstostandField.setText("" + konto.getBalance());
            }
        });
        //abhebenButton.setOnAction(handlingButton);

        abhebenButton.setOnAction(ereignis -> {
            konto.withdraw((float) Double.parseDouble(betragFeld.getText()));
            konstostandField.setText("" + konto.getBalance());
        });

        //Gesamt-Gridpane
        GridPane fensterInhalt = new GridPane();
        fensterInhalt.setVgap(10);
        fensterInhalt.add(kontostandPane, 0, 0);
        fensterInhalt.add(betragPane, 0,1);
        fensterInhalt.add(buttons,0,2);

        Scene scene = new Scene(fensterInhalt);

        stage.setScene(scene);
        stage.setTitle("Bankkonto");
        stage.show();
    }
}

class myHandler implements EventHandler<ActionEvent> {
    public void handle(ActionEvent ereignis) {
        System.out.println("Es wurde " + ereignis.getSource() + " gedrueckt.");
    }
}