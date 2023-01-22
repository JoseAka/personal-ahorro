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
@Table(name = "DERIVADO_PARAMS")
public class DerivadoParams {

	@Id
	@Column(name = "SIGLA_DERIVADO")
	private String siglaDerivado;
	
	@Column(name = "NOMBRE_DERIVADO")
	private String nombreDerivado;
	
}
