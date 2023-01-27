/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.BorderPane;
import javafx.scene.web.WebView;

/**
 *
 * @author Nacho
 */
public class FXMLDocumentController implements Initializable {
    
    private Label label;
    @FXML
    private ToggleGroup compras;
    @FXML
    private BorderPane borderP;
    private WebView webView;
    
    private void handleButtonAction(ActionEvent event) {
        System.out.println("You clicked me!");
        label.setText("Hello World!");
    }


    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        webView = new WebView();
    }    

    @FXML
    private void mostrarAmazon(ActionEvent event) {
        webView.getEngine().load("http://amazon.es");
        borderP.setCenter(webView);
    }

    @FXML
    private void mostrarEbay(ActionEvent event) {
        webView.getEngine().load("http://ebay.es");
        borderP.setCenter(webView);
    }
    
}
