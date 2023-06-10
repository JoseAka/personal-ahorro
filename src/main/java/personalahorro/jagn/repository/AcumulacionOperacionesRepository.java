package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.domain.OperacionesRequest;
import personalahorro.jagn.entity.AcumulacionOperaciones;
import personalahorro.jagn.util.Util;

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
	private static final String PARAMETER_START_DATE = "startDate";
	private static final String PARAMETER_END_DATE = "endDate";
	private static final String PARAMETER_MIN_IMPORTE = "minImporte";
	private static final String PARAMETER_MAX_IMPORTE = "maxImporte";

	public List<AcumulacionOperaciones> getAllConceptos() {

		String sql = " SELECT * FROM {h-schema}ACUMULACION_OPERACIONES ";

		Query query = em.createNativeQuery(sql, AcumulacionOperaciones.class);
		return query.getResultList();
	}

	public List<AcumulacionOperaciones> getOperaciones(OperacionesRequest operacionesRequest) {

		String sql = " SELECT *" + " FROM ACUMULACION_OPERACIONES " + getWhereSqlGetOperaciones(operacionesRequest)
				+ " ORDER BY FECHA_VALOR ASC ";

		Query query = em.createNativeQuery(sql, AcumulacionOperaciones.class);

		setParameterGetOperaciones(operacionesRequest, query);

		return query.getResultList();
	}

	private String getWhereSqlGetOperaciones(OperacionesRequest operacionesRequest) {

		StringBuilder whereSql = new StringBuilder(" WHERE ");

		if (!Util.emptyString(operacionesRequest.getPlantilla())) {
			whereSql.append(" PLANTILLA LIKE :" + PARAMETER_PLANTILLA);
		} else {
			whereSql.append(" PLANTILLA LIKE '%%' ");
		}

		if (!Util.emptyString(operacionesRequest.getEntidad())) {
			whereSql.append(" AND ENTIDAD = :" + PARAMETER_ENTIDAD);
		}

		if (!Util.emptyString(operacionesRequest.getEndDate())) {
			whereSql.append(" AND FECHA_VALOR <= STR_TO_DATE(:" + PARAMETER_END_DATE + ", '%Y-%m-%d') ");
		}

		if (!Util.emptyString(operacionesRequest.getStartDate())) {
			whereSql.append(" AND FECHA_VALOR >=  STR_TO_DATE(:" + PARAMETER_START_DATE + ", '%Y-%m-%d') ");
		}

		if (!Util.emptyString(operacionesRequest.getMaxImporte())) {
			whereSql.append(" AND IMPORTE <= :" + PARAMETER_MAX_IMPORTE);
		}

		if (!Util.emptyString(operacionesRequest.getMinImporte())) {
			whereSql.append(" AND IMPORTE >= :" + PARAMETER_MIN_IMPORTE);
		}

		if (!Util.emptyString(operacionesRequest.getNombreConcepto())) {
			whereSql.append(" AND NOMBRE_CONCEPTO = :" + PARAMETER_CONCEPTO);
		}

		return whereSql.toString();
	}

	private void setParameterGetOperaciones(OperacionesRequest operacionesRequest, Query query) {
		if (!Util.emptyString(operacionesRequest.getPlantilla())) {
			query.setParameter(PARAMETER_PLANTILLA, "%" + operacionesRequest.getPlantilla() + "%");
		}

		if (!Util.emptyString(operacionesRequest.getEntidad())) {
			query.setParameter(PARAMETER_ENTIDAD, operacionesRequest.getEntidad());
		}

		if (!Util.emptyString(operacionesRequest.getEndDate())) {
			query.setParameter(PARAMETER_END_DATE, operacionesRequest.getEndDate());
		}

		if (!Util.emptyString(operacionesRequest.getStartDate())) {
			query.setParameter(PARAMETER_START_DATE, operacionesRequest.getStartDate());
		}

		if (!Util.emptyString(operacionesRequest.getMaxImporte())) {
			query.setParameter(PARAMETER_MAX_IMPORTE, Double.parseDouble(operacionesRequest.getMaxImporte()));
		}

		if (!Util.emptyString(operacionesRequest.getMinImporte())) {
			query.setParameter(PARAMETER_MIN_IMPORTE, Double.parseDouble(operacionesRequest.getMinImporte()));
		}

		if (!Util.emptyString(operacionesRequest.getNombreConcepto())) {
			query.setParameter(PARAMETER_CONCEPTO, operacionesRequest.getNombreConcepto());
		}
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
