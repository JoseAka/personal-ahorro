package personalahorro.jagn.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AcumulacionOperacionesResponse {

	private String idOperacion;
	private String plantilla;
	private String entidad;
	private String fechaContable;
	private String fechaValor;
	private String nombreConcepto;
	private String importe;
	private String divisa;
	private String observaciones;
	private String timeStamp;
	
}
