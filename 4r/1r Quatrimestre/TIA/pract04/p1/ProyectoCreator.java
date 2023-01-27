package proye;

import java.util.Random;

import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Creator;

public class ProyectoCreator implements Creator<IntegerGenotype> {

	@Override
	public IntegerGenotype create() {
		// TODO Auto-generated method stub

		
		IntegerGenotype genotipo = new IntegerGenotype(-1, DatosCloud.NUM_ORDENADORES - 1);
		
		genotipo.init(new Random(), DatosCloud.NUM_PROCESOS);
		
		return genotipo;
	}



}
