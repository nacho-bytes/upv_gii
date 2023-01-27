/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.beans.binding.Bindings;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Modality;
import javafx.stage.Stage;
import modelo.Persona;

/**
 * FXML Controller class
 *
 * @author jsoler
 */
public class FXMLPersonasTableController implements Initializable {

    
    private ObservableList<Persona> datos = null; // Colecci�n vinculada a la vista.
    
    @FXML
    private Button addButton;
    @FXML
    private Button modButton;
    @FXML
    private Button delButton;
    @FXML
    private TableView<Persona> personasTable;
    @FXML
    private TableColumn<Persona, String> nomColum;
    @FXML
    private TableColumn<Persona, String> apellidoColumn;


    
    private void inicializaModelo() {
        ArrayList<Persona> misdatos = new ArrayList<Persona>();
        misdatos.add(new Persona("Pepe", "García"));
        misdatos.add(new Persona("María", "Pérez"));
        
        datos = FXCollections.observableList(misdatos);
    }

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO

        inicializaModelo();

        // inicializa la tabla y las columnas
        personasTable.setItems(datos);
        nomColum.setCellValueFactory(persona -> persona.getValue().NombreProperty());
        apellidoColumn.setCellValueFactory(persona -> persona.getValue().ApellidosProperty());
        apellidoColumn.setCellFactory(c -> new ApellidosColumn());
        
        delButton.disableProperty().bind(Bindings.equal(-1, personasTable.getSelectionModel().selectedIndexProperty()));
        modButton.disableProperty().bind(Bindings.equal(-1, personasTable.getSelectionModel().selectedIndexProperty()));
    }

    @FXML
    private void addPersona(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/vista/FXMLPersona.fxml"));
        Parent root = loader.load();
        FXMLPersonaController controladorFinestra2 = loader.getController();
        
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.setTitle("Añadir persona");
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setScene(scene);
        stage.showAndWait();
        
        if(controladorFinestra2.isOKPulado()) {
            datos.add(controladorFinestra2.getPersonaNueva());
        }
    }

    @FXML
    private void modPersona(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/vista/FXMLPersona.fxml"));
        Parent root = loader.load();
        FXMLPersonaController controladorFinestra2 = loader.getController();
        
        controladorFinestra2.setPersonaModificar(personasTable.getSelectionModel().getSelectedItem());
        
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.setTitle("Modificar persona");
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setScene(scene);
        stage.show();
    }

    @FXML
    private void borPersona(ActionEvent event) {
        datos.remove(personasTable.getSelectionModel().getSelectedIndex());
    }
    
}

class ApellidosColumn extends TableCell<Persona, String> {
    @Override
    protected void updateItem(String item, boolean empty) {
        super.updateItem(item, empty);
        if (empty || item == null) {
            setText("");
        }
        else {
            setText(item.toUpperCase());
        }
    }
}