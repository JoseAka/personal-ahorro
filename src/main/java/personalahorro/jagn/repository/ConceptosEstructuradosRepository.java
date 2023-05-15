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

	private static final String PARAMETER_CONCEPTO = "concepto";

	public List<ConceptosEstructurados> getAll() {

		String sql = " SELECT * FROM {h-schema}CONCEPTOS_ESTRUCTURADOS ";

		Query query = em.createNativeQuery(sql, ConceptosEstructurados.class);
		return query.getResultList();
	}

	public List<ConceptosEstructurados> getByConcepto(String concepto) {

		String sql = " SELECT * " + " FROM {h-schema}CONCEPTOS_ESTRUCTURADOS " + " WHERE NOMBRE_CONCEPTO = :"
				+ PARAMETER_CONCEPTO;

		Query query = em.createNativeQuery(sql, ConceptosEstructurados.class);
		query.setParameter(PARAMETER_CONCEPTO, concepto);
		return query.getResultList();
	}

	public void save(ConceptosEstructurados conceptosEstructuradosEntity) {

		em.persist(conceptosEstructuradosEntity);
	}

}
