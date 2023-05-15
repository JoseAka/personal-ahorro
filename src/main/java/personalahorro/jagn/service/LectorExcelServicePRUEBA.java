package personalahorro.jagn.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class LectorExcelServicePRUEBA {

	public void entradaFichero(MultipartFile file) {
		try (InputStream ins = file.getInputStream(); XSSFWorkbook workbook = new XSSFWorkbook(ins)) {
			
			//TODO	
			validarNombrePestaniaNumero(1, workbook);
		} catch (IOException e) {
			throw new RuntimeException("fail to parse xlsx file: " + e.getMessage());
		}
	}
	
	private int validarNombrePestaniaNumero(int numberOfSheets, XSSFWorkbook workbook) {
		
		int totalFilas = 0;
		if (numberOfSheets == 1) {
			String[] nombreExcel = new String[numberOfSheets];
		}
		
		return 0;
	}
}
