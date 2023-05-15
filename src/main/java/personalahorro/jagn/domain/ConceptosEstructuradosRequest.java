package personalahorro.jagn.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ConceptosEstructuradosRequest {

	private String nombreConcepto;
	private String plantilla;
}
