package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.AcumulacionOperaciones;
import personalahorro.jagn.entity.ConceptosEstructurados;

@Repository
public class AcumulacionOperacionesRepository {

	@PersistenceContext
	private EntityManager em;

	private static final String PARAMETER_PLANTILLA = "plantilla";
	private static final String PARAMETER_ENTIDAD = "entidad";
	private static final String PARAMETER_FECHA_CONTABLE = "fechaContable";
	private static final String PARAMETER_FECHA_VALOR = "fechaValor";
	private static final String PARAMETER_CONCEPTO = "concepto";
	private static final String PARAMETER_IMPORTE = "importe";
	private static final String PARAMETER_DIVISA_IMPORTE = "divisaImporte";
	private static final String PARAMETER_DISPONIBLE = "disponible";
	private static final String PARAMETER_DIVISA_DISPONIBLE = "divisaDisponible";
	private static final String PARAMETER_OBSERVACIONES = "observaciones";
	private static final String PARAMETER_TIMESTAMP = "timestamp";

	public List<AcumulacionOperaciones> getAll() {

		String sql = " SELECT * FROM {h-schema}ACUMULACION_OPERACIONES ";

		Query query = em.createNativeQuery(sql, AcumulacionOperaciones.class);
		return query.getResultList();
	}

	public void save(AcumulacionOperaciones acumulacionOperacionesEntity) {

		try {
			Query queryAdd = em.createNativeQuery(
					" INSERT INTO {h-schema}ACUMULACION_OPERACIONES (PLANTILLA, ENTIDAD, FECHA_CONTABLE, FECHA_VALOR, NOMBRE_CONCEPTO, IMPORTE, DIVISA_IMPORTE, "
							+ " DISPONIBLE, DIVISA_DISPONIBLE, OBSERVACIONES, TIMESTAMP_EXECUTED) " + " VALUES(:"
							+ PARAMETER_PLANTILLA + ", :" + PARAMETER_ENTIDAD + ", :" + PARAMETER_FECHA_CONTABLE + ", :"
							+ PARAMETER_FECHA_VALOR + ", :" + PARAMETER_CONCEPTO + ", :" + PARAMETER_IMPORTE + ", :"
							+ PARAMETER_DIVISA_IMPORTE + ", :" + PARAMETER_DISPONIBLE + ", :"
							+ PARAMETER_DIVISA_DISPONIBLE + ", :" + PARAMETER_OBSERVACIONES + ", :"
							+ PARAMETER_TIMESTAMP + ") ");

			queryAdd.setParameter(PARAMETER_PLANTILLA, acumulacionOperacionesEntity.getPlantilla());
			queryAdd.setParameter(PARAMETER_ENTIDAD, acumulacionOperacionesEntity.getEntidad());
			queryAdd.setParameter(PARAMETER_FECHA_CONTABLE, acumulacionOperacionesEntity.getFechaContable());
			queryAdd.setParameter(PARAMETER_FECHA_VALOR, acumulacionOperacionesEntity.getFechaValor());
			queryAdd.setParameter(PARAMETER_CONCEPTO, acumulacionOperacionesEntity.getNombreConcepto());
			queryAdd.setParameter(PARAMETER_IMPORTE, acumulacionOperacionesEntity.getImporte());
			queryAdd.setParameter(PARAMETER_DIVISA_IMPORTE, acumulacionOperacionesEntity.getDivisaImporte());
			queryAdd.setParameter(PARAMETER_DISPONIBLE, acumulacionOperacionesEntity.getDisponible());
			queryAdd.setParameter(PARAMETER_DIVISA_DISPONIBLE, acumulacionOperacionesEntity.getDivisaDisponible());
			queryAdd.setParameter(PARAMETER_OBSERVACIONES, acumulacionOperacionesEntity.getObservaciones());
			queryAdd.setParameter(PARAMETER_TIMESTAMP, acumulacionOperacionesEntity.getTimeStampExecuted());

			queryAdd.executeUpdate();
		} catch (Exception e) {
			System.out.println("CATCH - OPERACION: " + acumulacionOperacionesEntity);
			e.printStackTrace();
		}
	}
}
