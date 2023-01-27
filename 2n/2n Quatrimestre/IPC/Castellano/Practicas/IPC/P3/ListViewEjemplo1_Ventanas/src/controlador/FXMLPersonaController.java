/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import modelo.Persona;

/**
 * FXML Controller class
 *
 * @author jsole
 */
public class FXMLPersonaController implements Initializable {

    @FXML
    private TextField nombreTextF;
    @FXML
    private TextField apellidoTextF;
    
    private Persona mipersona;
    private boolean ok_polsat = false;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void okCambios(ActionEvent event) {
        mipersona.setNombre(nombreTextF.getText());
        mipersona.setApellidos(apellidoTextF.getText());
        ok_polsat = true;
        ((Stage)apellidoTextF.getScene().getWindow()).close();
    }

    @FXML
    private void cancelCambios(ActionEvent event) {
        ((Stage)apellidoTextF.getScene().getWindow()).close();
    }

    void setPersona(Persona selectedItem) {
        nombreTextF.setText(selectedItem.getNombre());
        apellidoTextF.setText(selectedItem.getApellidos());
        mipersona = selectedItem;
    }

    boolean isOK() {
        return ok_polsat;
    }
    
}
