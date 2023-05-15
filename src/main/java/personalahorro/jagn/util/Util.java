package personalahorro.jagn.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Util {

	private static final String DATE_FORMART = "dd-MM-yyyy";

	private Util() {

	}

	public static boolean hasXlsxFormat(MultipartFile file) {
		return Constantes.TYPE_XLXS.equalsIgnoreCase(file.getContentType());
	}

	public static boolean emptyString(String in) {
		return in == null || in.trim().isEmpty();
	}

	public static boolean emptyList(List<?> in) {
		return in == null || in.isEmpty();
	}

	public static double stringToDouble(String number) {
		return Double.parseDouble(number.replace(",", "."));
	}

	public static LocalDate strignToLocalDate(String dateStr) {
		if (emptyString(dateStr)) {
			return null;
		} else {
			String[] fechatroceada = dateStr.split("/");
			int dia = Integer.parseInt(fechatroceada[0]);
			int mes = Integer.parseInt(fechatroceada[1]);
			int anio = Integer.parseInt(fechatroceada[2]);
			return LocalDate.of(anio, mes, dia);
		}
	}

	public static String localDateToString(LocalDate fecha) {
		if (fecha != null) {
			return fecha.format(DateTimeFormatter.ofPattern(DATE_FORMART));
		}
		return null;
	}

}
