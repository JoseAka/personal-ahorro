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
@Table(name = "CONCEPTOS_ESTRUCTURADOS")
public class ConceptosEstructurados {

	@Id
	@Column(name = "NOMBRE_CONCEPTO")
	private String nombreConcepto;
	
	@Column(name = "PLANTILLA")
	private LocalDateTime plantilla;
	
	@Column(name = "TIMESTAMP")
	private LocalDateTime timeStamp;
}
