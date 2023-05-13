package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.DerivadoParams;

@Repository
public class DerivadoParamsRepository {

	@PersistenceContext
	private EntityManager em;

	public List<DerivadoParams> getAll() {

		String sql = " SELECT * FROM {h-schema}DERIVADO_PARAMS ";

		Query query = em.createNativeQuery(sql, DerivadoParams.class);
		return query.getResultList();
	}
}
