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

import personalahorro.jagn.domain.BBVACsv;
import personalahorro.jagn.util.Constantes;

@Service
public class LectorCsvService {

	public boolean hasCSVFormat(MultipartFile file) {

		return Constantes.TYPE_TEXTCSV.equals(file.getContentType());
	}

	public List<BBVACsv> readCsvBBVA(InputStream is) {
		try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
				/* CSVParser csvParser = CSVParser.parse(fileReader, CSVFormat.EXCEL); */
				CSVParser csvParser = new CSVParser(fileReader, CSVFormat.DEFAULT.withDelimiter(';')
						.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());) {

			List<BBVACsv> tutorials = new ArrayList<>();

			Iterable<CSVRecord> csvRecords = csvParser.getRecords();

			for (CSVRecord csvRecord : csvRecords) {
				BBVACsv tutorial = BBVACsv.builder().fechaContable(csvRecord.get(Constantes.FECHA_CONTABLE_BBVA_CSV))
						.fechaValor(csvRecord.get(Constantes.FECHA_VALOR_BBVA_CSV))
						.concepto(csvRecord.get(Constantes.CONCEPTO_BBVA_CSV))
						.movimiento(csvRecord.get(Constantes.MOVIMIENTO_BBVA_CSV))
						.importe(csvRecord.get(Constantes.IMPORTE_BBVA_CSV))
						.divisaImporte(csvRecord.get(Constantes.DIVISA_IMPORTE_BBVA_CSV))
						.disponible(csvRecord.get(Constantes.DISPONIBLE_BBVA_CSV))
						.divisaDisponible(csvRecord.get(Constantes.DIVISA_DISPONIBLE_BBVA_CSV))
						.observaciones(csvRecord.get(Constantes.OBSERVACIONES_BBVA_CSV)).build();
				tutorials.add(tutorial);
			}

			return tutorials;
		} catch (IOException e) {
			throw new RuntimeException("fail to parse CSV file: " + e.getMessage());
		}
	}
}
