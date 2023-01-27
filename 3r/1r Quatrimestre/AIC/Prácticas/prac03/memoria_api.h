 void mem_rango ( 
	dword dir,
	tipo_t tipo,
	dword *m_from,
	dword *m_to
	 );
 void mem_etiqueta ( 
	dword dir,
	tipo_t tipo,
	boolean activar_dirty
	 );
 valor_t lee_mem_datos ( 
	dword direccion,
	tipo_t tipo_dato,
	boolean *dirty
	 );
 void escribe_mem_datos ( 
	dword direccion,
	valor_t valor,
	tipo_t tipo_dato,
	boolean activar_dirty
	 );
 instruccion_t lee_mem_instruc ( 
	dword direccion
	 );
 void escribe_mem_instruc ( 
	dword direccion,
	instruccion_t instruccion
	 );
