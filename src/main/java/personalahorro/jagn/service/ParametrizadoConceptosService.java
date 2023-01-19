package personalahorro.jagn.service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import personalahorro.jagn.domain.ParametrizadoConceptosResponse;
import personalahorro.jagn.entity.ParametrizadoConceptos;
import personalahorro.jagn.repository.ParametrizadoConceptosRepository;

@Service
public class ParametrizadoConceptosService {

	@Autowired
	private ParametrizadoConceptosRepository parametrizadoConceptosRepository;

	@Autowired
	private LectorCsvService lectorCsvService;

	public List<ParametrizadoConceptosResponse> getAll() {

		List<ParametrizadoConceptosResponse> listResponse = new ArrayList<>();

		parametrizadoConceptosRepository.getAll().forEach(item -> {
			listResponse.add(ParametrizadoConceptosResponse.builder().nombreConcepto(item.getNombreConcepto())
					.timestamp(item.getTimestamp().toLocalDate().toString()).build());
		});

		return listResponse;
	}

	public void save(MultipartFile file) {
		try {
			List<ParametrizadoConceptos> listParametrizadoConceptos = new ArrayList<>();
			
			lectorCsvService.csvToTutorials(file.getInputStream()).stream().distinct().collect(Collectors.toList())
					.forEach(item -> {
						listParametrizadoConceptos.add(ParametrizadoConceptos.builder()
								.nombreConcepto(item.getConcepto()).timestamp(LocalDateTime.now()).build());
					});

			listParametrizadoConceptos.forEach(item -> {
				parametrizadoConceptosRepository.save(item);
			});

		} catch (IOException e) {
			throw new RuntimeException("fail to store csv data: " + e.getMessage());
		}
	}
}
