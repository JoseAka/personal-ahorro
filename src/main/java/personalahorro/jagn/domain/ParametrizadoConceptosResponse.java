package personalahorro.jagn.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ParametrizadoConceptosResponse {

	private String nombreConcepto;
	private String timestamp;
}
