package personalahorro.jagn.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import personalahorro.jagn.domain.ConceptosEstructuradosRequest;
import personalahorro.jagn.domain.ConceptosEstructuradosResponse;
import personalahorro.jagn.entity.ConceptosEstructurados;
import personalahorro.jagn.exception.PersonalAhorroException;
import personalahorro.jagn.repository.ConceptosEstructuradosRepository;
import personalahorro.jagn.util.Constantes;
import personalahorro.jagn.util.Util;

@Service
public class ConceptosEstructuradosService {

	@Autowired
	private ConceptosEstructuradosRepository conceptosEstructuradosRepository;

	public List<ConceptosEstructuradosResponse> getAll() {

		List<ConceptosEstructuradosResponse> listResponse = new ArrayList<>();

		conceptosEstructuradosRepository.getAll().forEach(item -> {
			listResponse.add(ConceptosEstructuradosResponse.builder().nombreConcepto(item.getNombreConcepto())
					.plantilla(item.getPlantilla()).build());
		});

		return listResponse;
	}

	@Transactional
	public void save(ConceptosEstructuradosRequest conceptosEstructuradosRequest) throws PersonalAhorroException {

		if (Util.emptyList(
				conceptosEstructuradosRepository.getByConcepto(conceptosEstructuradosRequest.getNombreConcepto()))) {
			conceptosEstructuradosRepository.save(
					ConceptosEstructurados.builder().nombreConcepto(conceptosEstructuradosRequest.getNombreConcepto())
							.plantilla(conceptosEstructuradosRequest.getPlantilla()).build());
		} else {
			throw new PersonalAhorroException("Ya existe CONCEPTO: " + conceptosEstructuradosRequest.getNombreConcepto()
					+ Constantes.SALTO_LINEA + "en la tabla CONCEPTOS_ESTRUCTURADOS");
		}

	}
}
