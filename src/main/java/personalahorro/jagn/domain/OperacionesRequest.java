package personalahorro.jagn.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OperacionesRequest {
	
	private String plantilla;
	
	private String entidad;
	
	private String startDate;
	
	private String endDate;
	
	private String nombreConcepto;
	
	private String minImporte;
	
	private String maxImporte;
	
}
