package personalahorro.jagn.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import personalahorro.jagn.domain.AcumulacionOperacionesResponse;
import personalahorro.jagn.domain.ConceptosEstructuradosResponse;
import personalahorro.jagn.service.AcumulacionOperacionesService;
import personalahorro.jagn.service.LectorCsvService;

@RestController
@RequestMapping("/rest/lectorCsv")
public class LectorCsvController {

	@Autowired
	private AcumulacionOperacionesService acumulacionOperacionesService;
	@Autowired
	private LectorCsvService lectorCsvService;

	@GetMapping("/getAll")
	public ResponseEntity<List<AcumulacionOperacionesResponse>> getAllConceptos() {
		return new ResponseEntity<>(acumulacionOperacionesService.getAll(), HttpStatus.OK);
	}

	//TODO LLEVAR AL CONTROLADOR DE ACUMULACION OPERACIONES
	@PostMapping("/importCsv")
	public ResponseEntity<String> importCsv(MultipartFile file) {
		String message = "";

		if (lectorCsvService.hasCSVFormat(file)) {
			try {
				acumulacionOperacionesService.acumularOperacion(file);

				return ResponseEntity.status(HttpStatus.OK).body("OK");
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("EXPECTATION_FAILED");
			}
		}

		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("BAD_REQUEST");
	}
}
