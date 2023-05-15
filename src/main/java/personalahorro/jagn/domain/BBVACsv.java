package personalahorro.jagn.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BBVACsv {

	private String fechaContable;
	private String fechaValor;
	private String concepto;
	private String movimiento;
	private String importe;
	private String divisaImporte;
	private String disponible;
	private String divisaDisponible;
	private String observaciones;
}
