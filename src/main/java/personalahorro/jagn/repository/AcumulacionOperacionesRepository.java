package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.AcumulacionOperaciones;

@Repository
public class AcumulacionOperacionesRepository {

	@PersistenceContext
	private EntityManager em;

	public List<AcumulacionOperaciones> getAll() {

		String sql = " SELECT * FROM {h-schema}ACUMULACION_OPERACIONES ";

		Query query = em.createNativeQuery(sql, AcumulacionOperaciones.class);
		return query.getResultList();
	}
}
