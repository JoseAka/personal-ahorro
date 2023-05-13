package personalahorro.jagn.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import personalahorro.jagn.domain.ConceptosEstructuradosResponse;
import personalahorro.jagn.entity.ConceptosEstructurados;
import personalahorro.jagn.repository.ConceptosEstructuradosRepository;

@Service
public class ConceptosEstructuradosService {

	@Autowired
	private ConceptosEstructuradosRepository conceptosEstructuradosRepository;

	@Autowired
	private LectorCsvService lectorCsvService;

	public List<ConceptosEstructuradosResponse> getAll() {

		List<ConceptosEstructuradosResponse> listResponse = new ArrayList<>();

		conceptosEstructuradosRepository.getAll().forEach(item -> {
			listResponse.add(ConceptosEstructuradosResponse.builder().nombreConcepto(item.getNombreConcepto()).build());
		});

		return listResponse;
	}

	@Transactional
	public void save(MultipartFile file) {
		try {
			List<ConceptosEstructurados> listParametrizadoConceptos = new ArrayList<>();

			lectorCsvService.csvToTutorials(file.getInputStream()).stream().distinct().collect(Collectors.toList())
					.forEach(item -> {
						listParametrizadoConceptos.add(ConceptosEstructurados.builder()
								.nombreConcepto(item.getConcepto()).timeStamp(LocalDateTime.now()).build());
					});

			listParametrizadoConceptos.forEach(item -> {
				conceptosEstructuradosRepository.save(item);
				System.out.println(item);
			});

		} catch (IOException e) {
			throw new RuntimeException("fail to store csv data: " + e.getMessage());
		}
	}
}
