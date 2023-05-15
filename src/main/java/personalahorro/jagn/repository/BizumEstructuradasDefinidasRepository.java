package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.domain.BBVACsv;
import personalahorro.jagn.entity.AcumulacionOperaciones;
import personalahorro.jagn.entity.ConceptosEstructurados;

@Repository
public class BizumEstructuradasDefinidasRepository {

	@PersistenceContext
	private EntityManager em;
	
	private static final String PARAMETER_CONCEPTO = "concepto";
	private static final String PARAMETER_OBSERVACION = "observacion";
	private static final String PARAMETER_IMPORTE = "importe";

	public List<String> getPlantilla(BBVACsv bbvaCsv) {

		String sql = " SELECT PLANTILLA "
				+ " FROM {h-schema}BIZUM_ESTRUCTURAS_DEFINIDAS"
				+ " WHERE NOMBRE_CONCEPTO = :concepto "
				+ "		AND INSTR(UPPER(:observacion), UPPER(MASCARA_OBSERVACIONES)) "
				+ "		AND IMPORTE_MAX <= :importe "
				+ "		AND IMPORTE_MIN <= :importe ";

		Query query = em.createNativeQuery(sql);
		
		query.setParameter(PARAMETER_CONCEPTO, bbvaCsv.getConcepto());
		query.setParameter(PARAMETER_OBSERVACION, bbvaCsv.getObservaciones());
		query.setParameter(PARAMETER_IMPORTE, bbvaCsv.getObservaciones());
		
		return (List<String>)query.getResultList();
	}
}
