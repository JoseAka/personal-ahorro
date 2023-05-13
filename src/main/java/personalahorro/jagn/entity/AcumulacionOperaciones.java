package personalahorro.jagn.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;

@Data
@Entity
@Builder
@Table(name = "ACUMULACION_OPERACIONES")
public class AcumulacionOperaciones {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_OPERACION")
	private String idOperacion;

	@Column(name = "ENTIDAD")
	private String entidad;
	
	@Column(name = "FECHA_CONTABLE")
	private LocalDateTime fechaContable;
	
	@Column(name = "FECHA_VALOR")
	private LocalDateTime fechaValor;
	
	@Column(name = "NOMBRE_CONCEPTO")
	private String nombreConcepto;
	
	@Column(name = "IMPORTE")
	private double importe;
	
	@Column(name = "DIVISA")
	private String divisa;
	
	@Column(name = "OBSERVACIONES")
	private String observaciones;
	
	@Column(name = "TIMESTAMP")
	private LocalDateTime timeStamp;
	
	
}
