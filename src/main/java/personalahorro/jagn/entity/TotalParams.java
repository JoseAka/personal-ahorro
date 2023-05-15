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
@Table(name = "TOTAL_PARAMS")
public class TotalParams {

	@Id
	@Column(name = "SIGLA_TOTAL")
	private String siglaTotal;
	
	@Column(name = "NOMBRE_TOTAL")
	private String nombreTotal;
}
