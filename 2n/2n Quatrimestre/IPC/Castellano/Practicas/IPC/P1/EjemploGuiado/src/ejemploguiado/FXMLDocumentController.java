/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemploguiado;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

/**
 *
 * @author Nacho
 */
public class FXMLDocumentController implements Initializable {
    
    private Label label;
    @FXML
    private TextField texto_usuario;
    @FXML
    private Text mensaje_usuario;
    
    private void handleButtonAction(ActionEvent event) {
        System.out.println("You clicked me!");
        label.setText("Hello World!");
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void pulsadoInicial(ActionEvent event) {
        mensaje_usuario.setText("Bienvenido " + texto_usuario.getText());
    }
    
}
