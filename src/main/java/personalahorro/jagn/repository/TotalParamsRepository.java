package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.TotalParams;

@Repository
public class TotalParamsRepository {

	@PersistenceContext
	private EntityManager em;

	public List<TotalParams> getAll() {

		String sql = " SELECT * FROM {h-schema}TOTAL_PARAMS ";

		Query query = em.createNativeQuery(sql, TotalParams.class);
		return query.getResultList();
	}
}
