package personalahorro.jagn.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;

@Data
@Entity
@Builder
@Table(name = "parametrizado_conceptos")
public class ParametrizadoConceptos {

	@Id
	@Column(name = "NOMBRE_CONCEPTO")
	private String nombreConcepto;
	
	@Column(name = "TIMESTAMP")
	private LocalDateTime timestamp;
}
