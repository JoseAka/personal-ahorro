package personalahorro.jagn.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import personalahorro.jagn.domain.ConceptoCsv;
import personalahorro.jagn.util.Constantes;

@Service
public class LectorCsvService {

	public boolean hasCSVFormat(MultipartFile file) {

		return Constantes.TYPE_TEXTCSV.equals(file.getContentType());
	}

	public List<ConceptoCsv> csvToTutorials(InputStream is) {
		try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
				CSVParser csvParser = new CSVParser(fileReader,
						CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());) {

			List<ConceptoCsv> tutorials = new ArrayList<>();

			Iterable<CSVRecord> csvRecords = csvParser.getRecords();

			for (CSVRecord csvRecord : csvRecords) {
				ConceptoCsv tutorial = new ConceptoCsv(csvRecord.get(Constantes.CONCEPTO));

				tutorials.add(tutorial);
			}

			return tutorials;
		} catch (IOException e) {
			throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
		}
	}
}
