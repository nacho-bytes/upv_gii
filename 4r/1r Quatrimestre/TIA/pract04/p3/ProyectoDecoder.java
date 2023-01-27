package proye;



import java.util.ArrayList;

import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Decoder;

public class ProyectoDecoder implements Decoder<IntegerGenotype, ArrayList<Integer>>{

	@Override
	public ArrayList<Integer> decode(IntegerGenotype genotype) {
		
		
		ArrayList<Integer> fenotipo = new ArrayList<Integer>();
		int[] capacidadActual = new int[DatosCloud.NUM_ORDENADORES];
		double[] memoriaActual = new double[DatosCloud.NUM_ORDENADORES];

		for (int i = 0; i < genotype.size(); i++) {
			
			double ramProceso = DatosCloud.RAM[i];
			int ordenador = genotype.get(i);
			
			if(ordenador != -1) {
				if (capacidadActual[ordenador] + 1 <= DatosCloud.capacidad[ordenador] &&
					ramProceso + memoriaActual[ordenador] <= DatosCloud.memoria[ordenador]) {
				
					capacidadActual[ordenador] += 1;
					memoriaActual[ordenador] += ramProceso;
					
					fenotipo.add(ordenador);
				}else {
					fenotipo.add(-1);	
				}
			} 
		}

		return fenotipo;
	}

}
