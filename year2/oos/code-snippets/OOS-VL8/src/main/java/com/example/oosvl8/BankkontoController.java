package com.example.oosvl8;

import javafx.event.Event;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class BankkontoController {
    @FXML TextField kontoStandFeld;
    @FXML Button einzahlenButton;
    @FXML Button abhebenButton;
    @FXML TextField betragFeld;

    @FXML
    public void einzahlen(Event event) {
        Bankkonto myAccount = new Bankkonto("SVoss");
        myAccount.deposit(100);
        kontoStandFeld.setText(Double.toString(myAccount.getBalance() + Double.parseDouble(betragFeld.getText())));
    }
}
