package personalahorro.jagn.entity;

import java.time.LocalDate;
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
@Table(name = "ACUMULACION_OPERACIONES")
public class AcumulacionOperaciones {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_OPERACION")
	private String idOperacion;

	@Column(name = "PLANTILLA")
	private String plantilla;
	
	@Column(name = "ENTIDAD")
	private String entidad;
	
	@Column(name = "FECHA_CONTABLE")
	private LocalDate fechaContable;
	
	@Column(name = "FECHA_VALOR")
	private LocalDate fechaValor;
	
	@Column(name = "NOMBRE_CONCEPTO")
	private String nombreConcepto;
	
	@Column(name = "IMPORTE")
	private double importe;
	
	@Column(name = "DIVISA_IMPORTE")
	private String divisaImporte;
	
	@Column(name = "DISPONIBLE")
	private double disponible;
	
	@Column(name = "DIVISA_DISPONIBLE")
	private String divisaDisponible;
	
	@Column(name = "OBSERVACIONES")
	private String observaciones;
	
	@Column(name = "TIMESTAMP_EXECUTED")
	private LocalDateTime timeStampExecuted;
	
	
}
