package personalahorro.jagn.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "SUBDERIVADO_PARAMS")
public class SubderivadoParams {

	@Id
	@Column(name = "SIGLA_SUBDERIVADO")
	private String siglaSubderivado;
	
	@Column(name = "NOMBRE_SUBDERIVADO")
	private String nombresubderivado;
	
}
