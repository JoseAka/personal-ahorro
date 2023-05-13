package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.ConceptosEstructurados;

@Repository
public class ConceptosEstructuradosRepository {

	@PersistenceContext
	private EntityManager em;

	public List<ConceptosEstructurados> getAll() {

		String sql = " SELECT * FROM {h-schema}CONCEPTOS_ESTRUCTURADOS ";

		Query query = em.createNativeQuery(sql, ConceptosEstructurados.class);
		return query.getResultList();
	}

	public void save(ConceptosEstructurados conceptosEstructuradosEntity) {

		em.persist(conceptosEstructuradosEntity);
	}
}
