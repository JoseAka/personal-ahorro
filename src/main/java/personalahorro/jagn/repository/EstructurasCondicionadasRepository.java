package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.domain.BBVACsv;
import personalahorro.jagn.util.Util;

@Repository
public class EstructurasCondicionadasRepository {

	@PersistenceContext
	private EntityManager em;

	private static final String PARAMETER_CONCEPTO = "concepto";
	private static final String PARAMETER_OBSERVACION = "observacion";
	private static final String PARAMETER_IMPORTE = "importe";

	public List<String> getPlantilla(BBVACsv bbvaCsv) {

		String sql = " SELECT PLANTILLA " + " FROM {h-schema}ESTRUCTURAS_CONDICIONADAS" + " WHERE NOMBRE_CONCEPTO = :"
				+ PARAMETER_CONCEPTO + "	AND INSTR(UPPER(:" + PARAMETER_OBSERVACION
				+ "), UPPER(MASCARA_OBSERVACIONES)) " + " AND (IMPORTE_MAX >= :" + PARAMETER_IMPORTE
				+ " OR IMPORTE_MIN <= :" + PARAMETER_IMPORTE + ")";

		Query query = em.createNativeQuery(sql);

		query.setParameter(PARAMETER_CONCEPTO, bbvaCsv.getConcepto());
		query.setParameter(PARAMETER_OBSERVACION, bbvaCsv.getObservaciones());
		query.setParameter(PARAMETER_IMPORTE, Math.abs(Util.stringToDouble(bbvaCsv.getImporte())));

		return (List<String>) query.getResultList();
	}
}
