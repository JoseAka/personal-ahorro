package personalahorro.jagn.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Builder;
import lombok.Data;

@Data
@Entity
@Builder
@Table(name = "SUBDERIVADO_PARAMS")
public class SubderivadoParams {

	@Id
	@Column(name = "SIGLA_SUBDERIVADO")
	private String siglaSubderivado;
	
	@Column(name = "NOMBRE_SUBDERIVADO")
	private String nombresubderivado;
	
}
