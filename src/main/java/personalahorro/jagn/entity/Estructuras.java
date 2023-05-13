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
	private String plantilla;
	
	@Column(name = "SIGLA_TOTAL")
	private String sigleTotal;
	
	@Column(name = "SIGLA_DERIVADO")
	private String siglaDerivado;
	
	@Column(name = "SIGLA_SUBDERIVADO")
	private String siglaSubderivado;
}
