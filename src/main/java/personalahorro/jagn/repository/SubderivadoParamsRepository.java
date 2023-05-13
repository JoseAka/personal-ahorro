package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.SubderivadoParams;

@Repository
public class SubderivadoParamsRepository {

	@PersistenceContext
	private EntityManager em;

	public List<SubderivadoParams> getAll() {

		String sql = " SELECT * FROM {h-schema}SUBDERIVADO_PARAMS ";

		Query query = em.createNativeQuery(sql, SubderivadoParams.class);
		return query.getResultList();
	}
}
