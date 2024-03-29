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
@Table(name = "CONCEPTOS_ESTRUCTURADOS")
public class ConceptosEstructurados {

	@Id
	@Column(name = "NOMBRE_CONCEPTO")
	private String nombreConcepto;
	
	@Column(name = "PLANTILLA")
	private String plantilla;
	
	@Column(name = "TIMESTAMP_EXECUTED")
	private LocalDateTime timeStampExecuted;
}
