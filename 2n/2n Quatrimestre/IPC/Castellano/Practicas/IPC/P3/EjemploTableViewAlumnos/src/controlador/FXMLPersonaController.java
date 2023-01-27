/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.beans.binding.Bindings;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import modelo.Persona;

/**
 * FXML Controller class
 *
 * @author jsoler
 */
public class FXMLPersonaController implements Initializable {

    @FXML
    private TextField nombreText;
    @FXML
    private TextField apellidosText;

    private boolean isOK = false;
    private Persona persona_local;
    @FXML
    private Button okButton;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        okButton.disableProperty().bind(Bindings.or(Bindings.isEmpty(nombreText.textProperty()), Bindings.isEmpty(apellidosText.textProperty())));
    }


    @FXML
    private void okPersona(ActionEvent event) {
        isOK = true;
        if(persona_local == null) { persona_local = new Persona(); }
        persona_local.setNombre(nombreText.getText());
        persona_local.setApellidos(apellidosText.getText());
        ((Stage)nombreText.getScene().getWindow()).close();
    }

    @FXML
    private void cancel(ActionEvent event) {
        ((Stage)nombreText.getScene().getWindow()).close();
    }

    public boolean isOKPulado() {
        return isOK;
    }
    
    public Persona getPersonaNueva() {
        return persona_local;
    }

    public void setPersonaModificar(Persona persona) {
        persona_local = persona;
        apellidosText.setText(persona_local.getApellidos());
        nombreText.setText(persona_local.getNombre());
    }
    
    
}
