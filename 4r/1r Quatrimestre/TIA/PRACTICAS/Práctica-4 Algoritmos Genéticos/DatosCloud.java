package proyecto;

public class DatosCloud 
{	
	public static final int NUM_ORDENADORES	= 10;
	public static final int NUM_PROCESOS	= 40;
	
	// numero procesos que puede atender por hora cada ordenador
	public static final int[] capacidad =
		{
			3, 2, 4, 5, 2, 1, 3, 2, 4, 3
		};
	
	// memoria RAM de cada ordenador
	public static final int[] memoria =
		{
			4, 6, 8, 8, 6, 2, 4, 16, 32, 8
		};

	// RAM requerida por cada proceso
	public static final double[] RAM =
		{
			2.9, 3.1, 3.0, 1.7, 1.5, 2.3, 4.2, 2.6, 2.3, 3.2, 8.5, 4.2, 2.7, 8.9, 3.5, 4.7, 7.3, 5.5, 6.2, 3.3,
			1.5, 2.3, 4.2, 3.2, 3.2, 1.9, 3.5, 6.3, 4.5, 3.3, 2.2, 2.1, 3.3, 5.1, 6.0, 3.3, 8.4, 3.7, 10.2, 4.7
		};
	
	// beneficio por cada proceso
	public static final double[] beneficio =
		{
			0.5, 1.26, 1.18, 2.13, 1.9, 3.5, 4.3, 1.5, 3.0, 4.3, 1.5, 3.16, 2.18, 2.1, 1.7, 2.5, 1.25, 2.8, 2.3, 1.6,
			3.2, 2.3, 2.5, 2.0, 2.3, 3.5, 1.27, 1.28, 3.3, 2.9, 3.3, 2.55, 3.05, 4.6, 1.8, 3.25, 3.5, 4.2, 5.3, 6.2
		};
	
}