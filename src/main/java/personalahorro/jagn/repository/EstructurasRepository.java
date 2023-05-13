package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.Estructuras;

@Repository
public class EstructurasRepository {

	@PersistenceContext
	private EntityManager em;

	public List<Estructuras> getAll() {

		String sql = " SELECT * FROM {h-schema}ESTRUCTURAS ";

		Query query = em.createNativeQuery(sql, Estructuras.class);
		return query.getResultList();
	}
}
