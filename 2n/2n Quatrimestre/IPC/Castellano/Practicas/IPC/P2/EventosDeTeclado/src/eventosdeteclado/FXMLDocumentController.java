/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eventosdeteclado;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.GridPane;
import javafx.scene.shape.Circle;

/**
 *
 * @author Nacho
 */
public class FXMLDocumentController implements Initializable {
    protected final int numFilas = 5;
    protected final int numColumnas = 5;

    @FXML
    private GridPane g;
    @FXML
    private Circle c;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        ChangeListener<? super Number> listenerAnchura = new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> arg0, Number antiguo, Number nuevo) {
                double anchura = (nuevo.doubleValue()/numColumnas)/2;
                double alurarejilla = (g.getHeight()/numFilas)/2;
                double min = (anchura < alturarejilla) ? anchura : alturarejilla;
                c.setRadius(min);
            }
        }
                
        ChangeListener<? super Number> listenerAltura = new ChangeListener<Number>() {
            @Override
            public void changed(ObservableValue<? extends Number> arg0, Number antiguo, Number nuevo) {
                double altura = (nuevo.doubleValue()/numFilas)/2;
                double anchurarejilla = (g.getWidth()/numColumnas)/2;
                double min = (altura < anchurarejilla) ? altura : anchurarejilla;
                c.setRadius(min);
            }
        }
        
        g.widthProperty().addListener(listenerAnchura);
        g.heightProperty().addListener(listenerAltura);
    }
        
        
    }    

    @FXML
    private void menejarCercle(KeyEvent e) {
        switch (e.getCode()) {
            case RIGHT:
                if (g.getColumnIndex(c) + 1 <= 4) {
                    g.setColumnIndex(c, g.getColumnIndex(c) + 1);
                }
                break;
            case LEFT:
                g.setColumnIndex(c, g.getColumnIndex(c) - 1);
                break;
            case UP:
                g.setRowIndex(c, g.getRowIndex(c) - 1);
                break;
            case DOWN:
                if (g.getRowIndex(c) + 1 <= 4) {
                    g.setRowIndex(c, g.getRowIndex(c) + 1);
                }
                break;
        }
    }
}
