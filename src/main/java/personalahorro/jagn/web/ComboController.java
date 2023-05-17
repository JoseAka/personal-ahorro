package personalahorro.jagn.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import personalahorro.jagn.domain.ComboKV;
import personalahorro.jagn.service.ComboService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/rest/initApp")
public class ComboController {

	@Autowired
    private ComboService comboService;

	@GetMapping("/searchCombos")
	public ResponseEntity<Map<String, List<ComboKV>>> searchCombos() {
		return new ResponseEntity<>(comboService.searchCombos(), HttpStatus.OK);
	}

}
