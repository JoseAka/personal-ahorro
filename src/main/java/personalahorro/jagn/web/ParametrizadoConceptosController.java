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

import personalahorro.jagn.domain.ParametrizadoConceptosResponse;
import personalahorro.jagn.service.LectorCsvService;
import personalahorro.jagn.service.ParametrizadoConceptosService;

@RestController
@RequestMapping("/rest/paramConcepts")
public class ParametrizadoConceptosController {

	@Autowired
	private ParametrizadoConceptosService parametrizadoConceptosService;
	@Autowired
	private LectorCsvService lectorCsvService;

	@GetMapping("/getAll")
	public ResponseEntity<List<ParametrizadoConceptosResponse>> getAllConceptos() {
		return new ResponseEntity<>(parametrizadoConceptosService.getAll(), HttpStatus.OK);
	}

	@PostMapping("/importCsv")
	public ResponseEntity<String> uploadFile(/* @RequestParam("file") */ MultipartFile file) {
		String message = "";

		if (lectorCsvService.hasCSVFormat(file)) {
			try {
				parametrizadoConceptosService.save(file);

				return ResponseEntity.status(HttpStatus.OK).body("OK");
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("EXPECTATION_FAILED");
			}
		}

		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("BAD_REQUEST");
	}
}
