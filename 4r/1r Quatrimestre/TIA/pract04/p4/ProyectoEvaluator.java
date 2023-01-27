package proye;

import java.util.ArrayList;

import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;


public class ProyectoEvaluator implements Evaluator<ArrayList<Integer>>{

	@Override
	public Objectives evaluate(ArrayList<Integer> phenotype) {
		
		double beneficioTotal = 0;
		//double ramTotal = 0;
		double consumoTotal = 0;
		int numProcesosSobrecalentamientoTotal = 0;
		
		for (int i = 0; i < phenotype.size(); i++) { //La i es el numero del proces
			double beneficioProceso = DatosCloud.beneficio[i];
			double ramProceso = DatosCloud.RAM[i];
			int ordenador = phenotype.get(i);
			
			if(ordenador != -1) {
				
				beneficioTotal += beneficioProceso;
				//ramTotal += ramProceso;
				if (ordenador % 2 == 0) // Par
					consumoTotal += 2;
				else // Impar
					consumoTotal += 1;
				
				if (i == 6 - 1|| i == 9 - 1 || i == 10 - 1)
					numProcesosSobrecalentamientoTotal++;
			} 
		}
		
		if (numProcesosSobrecalentamientoTotal == 3)
			consumoTotal = consumoTotal * 1.02;
		else if (numProcesosSobrecalentamientoTotal > 0)
			consumoTotal = consumoTotal * 1.05;
		
		Objectives objectives = new Objectives();
		objectives.add("Beneficio: ", Sign.MAX, beneficioTotal);
		//objectives.add("Ram: ", Sign.MIN, ramTotal);
		objectives.add("Consumo: ", Sign.MIN, consumoTotal);
		
		return objectives;
	}

}
