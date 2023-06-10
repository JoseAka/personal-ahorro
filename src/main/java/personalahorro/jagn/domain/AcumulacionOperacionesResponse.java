package personalahorro.jagn.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AcumulacionOperacionesResponse {

	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String idOperacion;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String plantilla;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String entidad;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String fechaContable;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String fechaValor;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String nombreConcepto;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String importe;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String divisa;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String observaciones;
	
	@JsonInclude(JsonInclude.Include.NON_NULL)
	private String timeStamp;
	
}
