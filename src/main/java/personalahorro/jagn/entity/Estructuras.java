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
@Table(name = "ESTRUCTURAS")
public class Estructuras {

	@Id
	@Column(name = "PLANTILLA")
	private String siglaTotal;
	
	@Column(name = "SIGLA_TOTAL")
	private String nombreTotal;
}
