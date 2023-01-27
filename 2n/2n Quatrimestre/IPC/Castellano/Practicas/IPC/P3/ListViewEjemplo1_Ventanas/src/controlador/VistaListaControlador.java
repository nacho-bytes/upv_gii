package controlador;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.beans.binding.Bindings;

import modelo.Persona;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.ListCell;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class VistaListaControlador implements Initializable {

    private ObservableList<Persona> datos = null; // Colecci�n vinculada a la vista.

    @FXML
    private ListView<Persona> listaLV;
    private TextField nombreTextF;
    private TextField apellidoTextF;
    @FXML
    private Button addB;
    @FXML
    private Button borrarB;
    @FXML
    private Button modificarB;

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        //---------------------------------------------------
        //creamos dos personas inicialmente
        ArrayList<Persona> misdatos = new ArrayList<Persona>();
        misdatos.add(new Persona("Pepe", "García"));
        misdatos.add(new Persona("María", "Pérez"));
        //----------------------------------------------------------------
        //  crear la listaobservable datos a partir del arraylist misdatos
        datos= FXCollections.observableList(misdatos);
        
        //----------------------------------------------------------------
        //asociar la listaobservable datos al listview listaLV           
        listaLV.setItems(datos);
        //----------------------------------------------------------------
        // asignar aqui el nuevo estilo de la celda*/
        listaLV.setCellFactory(c -> new MiCeldaPersona());

        //----------------------------------------------------------------
        // inhabilitar botones al arrancar y bindings que los habilitan.

    }

    @FXML
    void addAccion(ActionEvent event) throws IOException {
        //--------------------------------------------------------------------
        // anadir aqui el codigo para mostrar la nueva ventana
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/vista/FXMLPersona.fxml"));
        Parent root = loader.load();
        FXMLPersonaController controlador = loader.getController();
        
        Persona nP = new Persona("", "");
        controlador.setPersona(nP);
        
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setScene(scene);
        stage.setTitle("Demo vista añadir persona");
        stage.setMinWidth(400);
        stage.setMinHeight(500);
        stage.showAndWait();
        
        if(controlador.isOK()) {
            datos.add(nP);
            listaLV.refresh();
        }
    }

    @FXML
    void borrarAccion(ActionEvent event) {
        //--------------------------------------------------------------------
        // anadir aqui el codigo para borrar la persona seleccionada
        datos.remove(listaLV.getSelectionModel().getSelectedIndex());
        listaLV.refresh();
        
        
    }

    @FXML
    private void modificarAccion(ActionEvent event) throws IOException {
        //--------------------------------------------------------------------
        // anadir aqui el codigo para mostrar la nueva ventana
//        Parent root = FXMLLoader.load(getClass().getResource("/vista/FXMLPersona.fxml"));
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/vista/FXMLPersona.fxml"));
        Parent root = loader.load();
        FXMLPersonaController controlador = loader.getController();
        controlador.setPersona(listaLV.getSelectionModel().getSelectedItem());
        
        Scene scene = new Scene(root);
        Stage stage = new Stage();
        stage.initModality(Modality.APPLICATION_MODAL);
        stage.setScene(scene);
        stage.setTitle("Demo vista modificar persona");
        stage.setMinWidth(400);
        stage.setMinHeight(500);
        stage.showAndWait();
        listaLV.refresh();
        
    }
}
/*-------------------------------------------------------*/
 /* crear aqui la nueva clase que extiende a ListCell     */


class MiCeldaPersona extends ListCell<Persona> {

    @Override
    protected void updateItem(Persona item, boolean empty) {
        super.updateItem(item, empty); //To change body of generated methods, choose Tools | Templates.
        if (item==null||empty   ){
            setText("");
        }
        else {
            setText(item.getNombre()+" "+item.getApellidos());
        }
    }
    
}


 /*-------------------------------------------------------*/
