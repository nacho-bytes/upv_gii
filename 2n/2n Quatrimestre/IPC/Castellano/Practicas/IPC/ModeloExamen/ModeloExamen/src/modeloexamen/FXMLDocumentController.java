/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloexamen;

import java.net.URL;
import java.text.DecimalFormat;
import java.util.ResourceBundle;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.Menu;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;

/**
 *
 * @author Nacho
 */
public class FXMLDocumentController implements Initializable {
    
    @FXML
    private ToggleGroup menu;
    @FXML
    private TextField cantidad;
    @FXML
    private TextField resultado;
    
    private double ratio;
    @FXML
    private Menu salir;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        //((Stage)cantidad.getScene().getWindow()).close();

    }    

    @FXML
    private void calcularConversión(KeyEvent event) {
        String s = cantidad.getText();
        DecimalFormat df = new DecimalFormat("#.000");
        Double res;
        if(event.getCode().equals(KeyCode.ENTER)) {
            if (s.matches("[0-9]+,*[0-9]+")) {
                s = s.replace(",", ".");
                res = Double.parseDouble(s);
                res = ratio * res;
                s = df.format(res);
                resultado.setText(s);
            }
            else { resultado.setText("Error en formato de número"); }
        }
        else { resultado.setText(""); }
    }

    @FXML
    private void libra(ActionEvent event) {
        ratio = 0.88;
    }

    @FXML
    private void dolar(ActionEvent event) {
        ratio = 1.19;
    }

    @FXML
    private void rupia(ActionEvent event) {
        ratio = 80.22;
    }

    @FXML
    private void yuan(ActionEvent event) {
        ratio = 7.5;
    }

    @FXML
    private void salir(ActionEvent event) {
        System.out.println("modeloexamen.FXMLDocumentController.salir()");
    }
}
