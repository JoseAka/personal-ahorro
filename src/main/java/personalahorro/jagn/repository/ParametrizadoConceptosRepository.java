package personalahorro.jagn.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import personalahorro.jagn.entity.ParametrizadoConceptos;

@Repository
public class ParametrizadoConceptosRepository {

	@PersistenceContext
	private EntityManager em;

	public List<ParametrizadoConceptos> getAll() {

		String sql = " SELECT * FROM {h-schema}parametrizado_conceptos ";

		Query query = em.createNativeQuery(sql, ParametrizadoConceptos.class);
		return query.getResultList();
	}
	
	@Transactional
	public void save(ParametrizadoConceptos parametrizadoConceptos) {
		String sql = " INSERT INTO parametrizado_conceptos(NOMBRE_CONCEPTO, TIMESTAMP) VALUES (:concepto, CURRENT_TIMESTAMP) ";
		Query query = em.createNativeQuery(sql);
		query.setParameter("concepto", parametrizadoConceptos.getNombreConcepto());
		
		try {
			
			query.executeUpdate();
		} catch (Exception e) {
			System.out.println("REPETIDO ---> " +parametrizadoConceptos.getNombreConcepto());
		}
//		em.merge(parametrizadoConceptos);
	}
}
