package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.TotalParams;

@Repository
public class ComboRepository {

	@PersistenceContext
	private EntityManager em;
	
	private static final String PARAMETER_TOTAL_PARAM = "totalParam";

	public List<Object[]> getComboTotalParams() {

		String sql = "SELECT distinct t.SIGLA_TOTAL, t.NOMBRE_TOTAL "
				+ " FROM estructuras as e, total_params as t " 
				+ " WHERE e.SIGLA_TOTAL = t.SIGLA_TOTAL "
				+ "	AND e.SIGLA_TOTAL != '#'";

		Query query = em.createNativeQuery(sql);
		return (List<Object[]>) query.getResultList();
	}
	
	public List<Object[]> getComboDerivadoParamsByTotal(String totalParam) {

		String sql = "SELECT distinct d.SIGLA_DERIVADO, d. NOMBRE_DERIVADO  "
				+ "FROM  estructuras  as e,  total_params  as t, "
				+ "	 derivado_params  as d,  subderivado_params  as s "
				+ "WHERE e. SIGLA_TOTAL  = t. SIGLA_TOTAL  "
				+ "	and e. SIGLA_DERIVADO  = d. SIGLA_DERIVADO  "
				+ "	and e. SIGLA_SUBDERIVADO  = s. SIGLA_SUBDERIVADO  "
				+ "	and e. SIGLA_TOTAL  = :"+PARAMETER_TOTAL_PARAM;

		Query query = em.createNativeQuery(sql);
		query.setParameter(PARAMETER_TOTAL_PARAM, totalParam);
		return (List<Object[]>) query.getResultList();
	}
}
