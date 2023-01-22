package personalahorro.jagn.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;

@Data
@Entity
@Builder
@Table(name = "TOTAL_PARAMS")
public class TotalParams {

	@Id
	@Column(name = "SIGLA_TOTAL")
	private String siglaTotal;
	
	@Column(name = "NOMBRE_TOTAL")
	private String nombreTotal;
}
