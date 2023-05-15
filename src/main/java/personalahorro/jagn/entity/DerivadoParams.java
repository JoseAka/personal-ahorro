package personalahorro.jagn.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "DERIVADO_PARAMS")
public class DerivadoParams {

	@Id
	@Column(name = "SIGLA_DERIVADO")
	private String siglaDerivado;
	
	@Column(name = "NOMBRE_DERIVADO")
	private String nombreDerivado;
	
}
