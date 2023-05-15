package personalahorro.jagn.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "ESTRUCTURAS_CONDICIONADAS")
public class EstructuradasCondicionadas {

	@Id
	@Column(name = "PLANTILLA")
	private String plantilla;
	
	@Column(name = "NOMBRE_CONCEPTO")
	private String nombreConcepto;
	
	@Column(name = "MASCARA_OBSERVACIONES")
	private String mascaraObservaciones;
	
	@Column(name = "IMPORTE_MIN")
	private double importeMin;
	
	@Column(name = "IMPORTE_MAX")
	private double importeMax;
	
	@Column(name = "TIMESTAMP_EXECUTED")
	private LocalDateTime timeStampExecuted;
	
	
}
