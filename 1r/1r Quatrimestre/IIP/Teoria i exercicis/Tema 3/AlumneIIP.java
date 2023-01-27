/**
 * Classe AlumneIIP: representa a un alumne matriculat 
 * en un grup d'IIP de l'ETSInf  
 * 
 * @author (el vostre nom) 
 * @version Curs 2019/20
 */
public class AlumneIIP {
    // Atributs: nom, dni, any de naixement, nota del Parcial 1, grup de teoria, amb dispensa?  
    private String nom;
    private String dni;
    private int any;
    private double notaP1;
    private char grup;
    private boolean dispensa;    
    
    // Mètode constructor per defecte
    /** Crea un alumne de nom Pau Gasol, DNI 123456Y, 
     *  nascut l’any 1980, matriculat en el grup A, 
     *  amb un 9.8 en el primer parcial i que, per motius obvis,  
     *  té dispensa d’assistència a classe
     */  
    public AlumneIIP() {
        nom = "Pau Gasol";
        dni = "123456Y";
        any = 1980;
        grup = 'A';
        notaP1 = 9.8;
        dispensa = true;
    }
}
