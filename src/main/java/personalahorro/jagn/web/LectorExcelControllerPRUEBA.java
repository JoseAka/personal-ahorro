package personalahorro.jagn.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import personalahorro.jagn.service.LectorExcelServicePRUEBA;
import personalahorro.jagn.util.Util;

@RestController
@RequestMapping("/rest/files")
public class LectorExcelControllerPRUEBA {

	@Autowired
	private LectorExcelServicePRUEBA lectorExcelService;


	@PostMapping("/importExcel")
	public ResponseEntity<String> uploadFile(MultipartFile file) {
		String message = "";

		if (Util.hasXlsxFormat(file)) {
			try {
				lectorExcelService.entradaFichero(file);

				return ResponseEntity.status(HttpStatus.OK).body("OK");
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("EXPECTATION_FAILED");
			}
		}

		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("BAD_REQUEST");
	}
}
